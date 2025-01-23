     F/TITLE PPORDH Print Purchase Orders
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PPORDH
     F*  Application ID      -    PPORDH
     F*  Application Name    -    Print Purchase Orders
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PORDH       - (U/DISK   ) Purchase Order header       PH
     F*  IPSTXTH     - (I/DISK   ) Purchase Order Text header  TH
     F*  PORDD       - (I/DISK   ) Purchase Order Header       PO
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  IPSTXTD     - (I/DISK   ) Purchase Order Detail Text  TD
     F*  PPORDHO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRMCOYNO
     F* S002   - SETLL d.pordh,f.pordh,prmcoyno
     F* S003   - GETREC d.pordh,*ne,prmcoyno
     F* S004   - Process To Reset File Pointer(EOF) - PORDH
     F* S005   - SETLL D.IPSTXTH,F.IPSTXTH,PRMCOYNO,PHPORD,DTSEQ
     F* S006   - GETREC d.ipstxth,*ne,prmcoyno,phpord
     F* S007   - Process To Reset File Pointer(EOF) - IPSTXTH
     F* S008   - UPDATE d.pordh,f.pordh
     F* S009   - SETLL D.pordd,F.pordd,PRMCOYNO,PHPORD,DTSEQ
     F* S010   - GETREC d.pordd,*ne,prmcoyno,phpord
     F* S011   - Process To Reset File Pointer(EOF) - PORDD
     F* S012   - GETREC D.IPSITEM,*EQ,PRMCOYNO,PHSUPPN,PHBRNBR,POITEM
     F* S013   - SETLL D.IPSTXTD,F.IPSTXTD,PRMCOYNO,PHPORD,POSEQ,DTSEQ
     F* S014   - GETREC d.ipstxtd,*ne,prmcoyno,phpord,poseq
     F* S015   - Process To Reset File Pointer(EOF) - IPSTXTD
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FIPSTXTH   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPORDD     IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FIPSTXTD   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FPPORDHO   O    E             PRINTER
     F                                     INFDS(FIDS07)
     FPORDH     UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                367    368B 0
     D  OLN07                188    189B 0
     D*
     D* Date Manipulation Data Struct.
     D*
     D                 DS
     D  X1CDAT                 1      8  0
     D  X1DATE                 1      6  0
     D  X12                    1      2  0
     D  X34                    3      4  0
     D  X56                    5      6  0
     D  X78                    7      8  0
     D @DS001          DS
     D  TXT                    1    200    DIM(5)
     D  TXT001                 1     40
     D  TXT002                41     80
     D  TXT003                81    120
     D  TXT004               121    160
     D  TXT005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0010
     I              CYEMPCOL                    RN0011
     I              CYEMPHEAD                   RN0012
     I              CYPRDHEAD                   RN0013
     I              CYREFHEAD                   RN0014
     I              CYSDESC                     RN0015
     IIPSITEMF
     I              PIBRNBR                     RN0016
     I              PICNVCDE                    RN0017
     I              PICOYNO                     RN0018
     I              PIPBRK1                     RN0019
     I              PIPBRK2                     RN0020
     I              PIPBRK3                     RN0021
     I              PIPBRK4                     RN0022
     I              PIPRCOD                     RN0023
     I              PIQBRK1                     RN0024
     I              PIQBRK2                     RN0025
     I              PIQBRK3                     RN0026
     I              PIQBRK4                     RN0027
     I              PISDESC                     RN0028
     I              PISPITM                     RN0029
     I              PISUPPN                     RN0030
     IIPSTXTDF
     I              TDCOYNO                     RN0031
     I              TDPOSEQ                     RN0032
     IIPSTXTHF
     I              THCOYNO                     RN0033
     IPORDDF
     I              POCOYNO                     RN0034
     I              PODLVDT                     RN0035
     I              POIDESC                     RN0036
     I              PONLALL                     RN0037
     I              POPRICE                     RN0038
     I              POQRCVD                     RN0039
     I              POQRCYC                     RN0040
     IPORDHF
     I              PHBRNBR                     RN0041
     I              PHBUYER                     RN0042
     I              PHCMPDT                     RN0043
     I              PHCONNAM                    RN0044
     I              PHCOYNO                     RN0045
     I              PHCUSORD                    RN0046
     I              PHDLVDT                     RN0047
     I              PHENTDT                     RN0048
     I              PHLRCVDT                    RN0049
     I              PHNLALL                     RN0050
     I              PHNOPOS                     RN0051
     I              PHRLAUD                     RN0052
     I              PHSHIPV                     RN0053
     I              PHSLIN1                     RN0054
     I              PHSLIN2                     RN0055
     I              PHSLIN3                     RN0056
     I              PHSLIN4                     RN0057
     I              PHSLIN5                     RN0058
     I              PHSLIN6                     RN0059
     I              PHSNAME                     RN0060
     I              PHSPSTCD                    RN0061
     I              PHSUPPN                     RN0062
     I              PHWLIN1                     RN0063
     I              PHWLIN2                     RN0064
     I              PHWLIN3                     RN0065
     I              PHWLIN4                     RN0066
     I              PHWLIN5                     RN0067
     I              PHWLIN6                     RN0068
     I              PHWNAME                     RN0069
     I              PHWPSTCD                    RN0070
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID             7
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA          132
     C********************************************************************
     C*                   K e y      L i s t
     C********************************************************************
     C*
     C     K0001         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHPO03
     C                   KFLD                    KHSE04
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHPO03
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0006         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0007         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0008         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0009         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C                   KFLD                    KDPO03
     C                   KFLD                    KDSE04
     C*
     C     K0010         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C                   KFLD                    KDPO03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDESC        WYDESC                         Company description
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0028        WK0001                         Description
     C     *LIKE         DEFINE    RN0029        WK0002                         Item Number
     C     *LIKE         DEFINE    TDPORD        WDPORD                         P.O. Number
     C     *LIKE         DEFINE    RN0032        WK0003                         Purchase order line
     C     *LIKE         DEFINE    TDSEQ         WDSEQ                          Sequence
     C     *LIKE         DEFINE    TDTCDE        WDTCDE                         Print text code
     C     *LIKE         DEFINE    RN0033        WK0004                         Company number
     C     *LIKE         DEFINE    THPORD        WHPORD                         P.O. Number
     C     *LIKE         DEFINE    THSEQ         WHSEQ                          Sequence
     C     *LIKE         DEFINE    THTCDE        WHTCDE                         Print text code
     C     *LIKE         DEFINE    THTEXT        WHTEXT                         Text
     C     *LIKE         DEFINE    POCCDE        WOCCDE                         Conversion Code
     C     *LIKE         DEFINE    POCONV        WOCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0035        WK0005                         Delivery Date
     C     *LIKE         DEFINE    RN0036        WK0006                         Item Description
     C     *LIKE         DEFINE    POPCDE        WOPCDE                         Pricing code
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    POWHSE        WOWHSE                         Warehouse
     C     *LIKE         DEFINE    RN0041        WK0009                         Branch Number
     C     *LIKE         DEFINE    RN0046        WK0012                         Our customers ref
     C     *LIKE         DEFINE    RN0047        WK0013                         Delivery Date
     C     *LIKE         DEFINE    RN0048        WK0014                         Entered Date
     C     *LIKE         DEFINE    RN0051        WK0015                         Purchase oprders pri
     C     *LIKE         DEFINE    PHOS01        WHOS01                         New Order
     C     *LIKE         DEFINE    PHOS02        WHOS02                         Updated Order/Line s
     C     *LIKE         DEFINE    PHOS04        WHOS04                         P.O. Pending
     C     *LIKE         DEFINE    PHOS06        WHOS06                         Print P.O.Requested
     C     *LIKE         DEFINE    PHOS09        WHOS09                         special order attent
     C     *LIKE         DEFINE    PHOS10        WHOS10                         P.O. has been printe
     C     *LIKE         DEFINE    PHOS11        WHOS11                         P.O. has been adjust
     C     *LIKE         DEFINE    RN0058        WK0021                         Line 5
     C     *LIKE         DEFINE    RN0059        WK0022                         Line 6
     C     *LIKE         DEFINE    RN0062        WK0025                         Supplier Account
     C     *LIKE         DEFINE    PHWHSE        WHWHSE                         Warehouse
     C     *LIKE         DEFINE    RN0063        WK0026                         Address
     C     *LIKE         DEFINE    RN0064        WK0027                         Line 2
     C     *LIKE         DEFINE    RN0065        WK0028                         Line 3
     C     *LIKE         DEFINE    RN0066        WK0029                         Line 4
     C     *LIKE         DEFINE    RN0067        WK0030                         Line 5
     C     *LIKE         DEFINE    RN0068        WK0031                         Line 6
     C     *LIKE         DEFINE    RN0069        WK0032                         Wharehouse Name
     C     *LIKE         DEFINE    RN0070        WK0033                         Post code
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0010        HD0001
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0018        HD0003
     C     *LIKE         DEFINE    RN0030        HD0004
     C     *LIKE         DEFINE    RN0016        HD0002
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0031        HD0005
     C     *LIKE         DEFINE    TDPORD        HDPORD
     C     *LIKE         DEFINE    RN0032        HD0006
     C     *LIKE         DEFINE    TDSEQ         HDSEQ
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0033        HD0007
     C     *LIKE         DEFINE    THPORD        HHPORD
     C     *LIKE         DEFINE    THSEQ         HHSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0034        HD0008
     C     *LIKE         DEFINE    POPORD        HOPORD
     C     *LIKE         DEFINE    POSEQ         HOSEQ
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0045        HD0009
     C     *LIKE         DEFINE    PHPORD        HD0010
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        NARG1            30 9          Numer argument1
     C                   MOVE      *ZEROS        NRSLT            30 9          Numeric result
     C                   MOVE      *BLANKS       DATFMT            3            Date format
     C                   MOVE      *ZEROS        SVDAT             6 0          Save date
     C                   MOVE      *ZEROS        SVYY              2 0          Save year
     C                   MOVE      *ZEROS        SVMM              2 0          Save month
     C                   MOVE      *ZEROS        SVDD              2 0          Save days
     C                   MOVE      *ZEROS        SVDAYS            3 0          Save days
     C                   MOVE      *ZEROS        SVLEAP            1 0          If leap year
     C                   MOVE      *ZEROS        FEB               2 0          NOD in feb/Leap
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        COUNT             3 0
     C                   MOVE      *BLANKS       RN0001           35            DTIDESC
     C                   MOVE      *ZEROS        DTSEQ             5 0
     C                   MOVE      *ZEROS        DTVAL             9 2
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        L1VAL             9 2
     C                   MOVE      *ZEROS        PAGES             4 0
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0002            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0003            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0004           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0005            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0006            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0007            4            SYMMDDA
     C                   MOVE      *BLANKS       WAD1             35
     C                   MOVE      *BLANKS       WAD2             35
     C                   MOVE      *BLANKS       WAD3             35
     C                   MOVE      *BLANKS       WAD4             35
     C                   MOVE      *BLANKS       WAD5             35
     C                   MOVE      *BLANKS       WAD6             35
     C                   MOVE      *BLANKS       RN0008           10            WSDLVDT
     C                   MOVE      *BLANKS       RN0009           10            WSENTDT
     C                   MOVE      *ZEROS        X                 3 0
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO02            3            THCOYNO
     C                   MOVE      *BLANKS       KHPO03           10            THPORD
     C                   MOVE      *ZEROS        KHSE04            5 0          THSEQ
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            TDCOYNO
     C                   MOVE      *BLANKS       KDPO02           10            TDPORD
     C                   MOVE      *ZEROS        KDPO03            5 0          TDPOSEQ
     C                   MOVE      *ZEROS        KDSE04            5 0          TDSEQ
     C                   MOVE      *BLANKS       RN0071           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       SAVIN            99            Save Indord
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        RSLT02            1 0
     C                   MOVE      *ZEROS        RSLT03            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C*
     C/EJECT
     C********************************************************************
     C*        M a i n l i n e      R o u t i n e
     C********************************************************************
     C                   EXSR      SMAIN
     C*
     C/EJECT
     C*****************************************************************
     C* SMAIN - Main flow of the program.
     C*****************************************************************
     C     SMAIN         BEGSR
     C*
     C* *** Get company name.
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRMCOYNO
     C*
     C                   EXSR      S001
     C* SYDFMT = cydfmt
     C                   MOVE      WYDFMT        RN0005
     C* SYDSEP = cydsep
     C                   MOVE      WYDSEP        RN0006
     C* *** read purchase order header
     C* SETLL d.pordh,f.pordh,prmcoyno
     C*
     C                   EXSR      S002
     C* DOU %sts(d.pordh,f.pordh)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.pordh,*ne,prmcoyno
     C*
     C                   EXSR      S003
     C* IF %sts(d.pordh,f.pordh)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* ***  Ignore if pending order
     C* IF phos04 = 'N'
     C     WHOS04        IFEQ      'N'
     C* ***  Print requested
     C* IF phos06 = 'Y' | Phos10 = 'N'
     C     WHOS06        IFEQ      'Y'
     C     WHOS10        OREQ      'N'
     C* ***  reverse entered date
     C* SYDATI = phentdt
     C                   Z-ADD     WK0014        RN0003
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* WSENTDT = SYDATO
     C                   MOVE      RN0004        RN0009
     C* *** Move text to array for header
     C* DTSEQ = 0
     C                   Z-ADD     *ZERO         DTSEQ
     C* TXT(1) = ' '
     C                   MOVEL     *BLANKS       TXT(1)
     C* TXT(2) = ' '
     C                   MOVEL     *BLANKS       TXT(2)
     C* TXT(3) = ' '
     C                   MOVEL     *BLANKS       TXT(3)
     C* TXT(4) = ' '
     C                   MOVEL     *BLANKS       TXT(4)
     C* TXT(5) = ' '
     C                   MOVEL     *BLANKS       TXT(5)
     C* SETLL D.IPSTXTH,F.IPSTXTH,PRMCOYNO,PHPORD,DTSEQ
     C*
     C                   EXSR      S005
     C* X = 0
     C                   Z-ADD     *ZERO         X
     C* DOU x = 5
     C     X             DOUEQ     5
     C* GETREC d.ipstxth,*ne,prmcoyno,phpord
     C*
     C                   EXSR      S006
     C* IF %sts(d.ipstxth,f.ipstxth)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* IF thtcde='B' | thtcde='O'
     C     WHTCDE        IFEQ      'B'
     C     WHTCDE        OREQ      'O'
     C* X = x + 1
     C     X             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        X
     C* TXT(X) = thtext
     C                   MOVE      *BLANKS       TXT(X)
     C                   MOVE      WHTEXT        TXT(X)
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* X = 5
     C                   Z-ADD     5             X
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** reset figures
     C* PAGES = 1
     C                   Z-ADD     1             PAGES
     C* L1VAL = 0
     C                   Z-ADD     *ZERO         L1VAL
     C* COUNT = 1
     C                   Z-ADD     1             COUNT
     C* ***  Update details for header
     C* IF phos10 = 'Y' & phos11 = 'Y'
     C     WHOS10        IFEQ      'Y'
     C     WHOS11        ANDEQ     'Y'
     C* PHNOPOS = phnopos + 1
     C     WK0015        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WK0015
     C* END                                                           *
     C                   END
     C* PHOS10 = 'Y'
     C                   MOVE      'Y'           WHOS10
     C* PHOS11 = 'Y'
     C                   MOVE      'Y'           WHOS11
     C* PHOS06 = 'N'
     C                   MOVE      'N'           WHOS06
     C* UPDATE d.pordh,f.pordh
     C*
     C                   EXSR      S008
     C* ***  order required print headings
     C* WAD1 = :26
     C                   MOVE      *BLANKS       WAD1
     C                   MOVEL     WK0032        WAD1
     C* WAD2 = :27
     C                   MOVE      *BLANKS       WAD2
     C                   MOVEL     WK0026        WAD2
     C* WAD3 = :28
     C                   MOVE      *BLANKS       WAD3
     C                   MOVEL     WK0027        WAD3
     C* WAD4 = :29
     C                   MOVE      *BLANKS       WAD4
     C                   MOVEL     WK0028        WAD4
     C* WAD5 = :30
     C                   MOVE      *BLANKS       WAD5
     C                   MOVEL     WK0029        WAD5
     C* WAD6 = :33
     C                   MOVE      *BLANKS       WAD6
     C                   MOVEL     WK0033        WAD6
     C* IF first=' '
     C     FIRST         IFEQ      *BLANKS
     C* PRINT porder,aaa
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* PRINT porder,abb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** Find order details and print
     C* DTSEQ = 0
     C                   Z-ADD     *ZERO         DTSEQ
     C* SETLL D.pordd,F.pordd,PRMCOYNO,PHPORD,DTSEQ
     C*
     C                   EXSR      S009
     C* DOU %sts(d.pordd,f.pordd)=*no
     C     RSLT02        DOUEQ     1
     C* GETREC d.pordd,*ne,prmcoyno,phpord
     C*
     C                   EXSR      S010
     C* IF %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* ***  calculate line value
     C* DTVAL = poprice * poqord
     C     WK0008        MULT      WOQORD        NRSLT0
     C                   Z-ADD     NRSLT0        DTVAL
     C* ***  Check for conversion price
     C* IF poconv <> 0
     C     WOCONV        IFNE      *ZERO
     C* *** price code by purch unit
     C* IF popcde = '0'
     C     WOPCDE        IFEQ      '0'
     C* *** multiply or divide by conversion
     C* IF poccde = '0'
     C     WOCCDE        IFEQ      '0'
     C* DTVAL = dtval * poconv
     C     DTVAL         MULT      WOCONV        NRSLT0
     C                   Z-ADD     NRSLT0        DTVAL
     C* POPRICE = poprice * poconv
     C     WK0008        MULT      WOCONV        NRSLT0
     C                   Z-ADD     NRSLT0        WK0008
     C* ELSE                                                          *
     C                   ELSE
     C* DTVAL = dtval / poconv
     C     WOCONV        IFEQ      *ZERO
     C                   MOVE      *HIVAL        NRSLT0
     C                   ELSE
     C     DTVAL         DIV       WOCONV        NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        DTVAL
     C* POPRICE = poprice / poconv
     C     WOCONV        IFEQ      *ZERO
     C                   MOVE      *HIVAL        NRSLT0
     C                   ELSE
     C     WK0008        DIV       WOCONV        NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        WK0008
     C* END                                                           *
     C                   END
     C* *** price code by purch unit
     C* END                                                           *
     C                   END
     C* ***  Check for conversion price
     C* END                                                           *
     C                   END
     C* *** Total for order
     C* L1VAL = l1val + dtval
     C     L1VAL         ADD       DTVAL         NRSLT0
     C                   Z-ADD     NRSLT0        L1VAL
     C* *** reverse required date
     C* SYDATI = phentdt
     C                   Z-ADD     WK0014        RN0003
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0004        RN0008
     C* *** find supplier item number
     C* GETREC D.IPSITEM,*EQ,PRMCOYNO,PHSUPPN,PHBRNBR,POITEM
     C*
     C                   EXSR      S012
     C* IF %sts(d.ipsitem,f.ipsitem)=*yes
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* IF pispitm <> ' '
     C     WK0002        IFNE      *BLANKS
     C* POITEM = pispitm
     C                   MOVE      WK0002        WOITEM
     C* END                                                           *
     C                   END
     C* IF pisdesc <> ' '
     C     WK0001        IFNE      *BLANKS
     C* POIDESC = pisdesc
     C                   MOVE      WK0001        WK0006
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** reduce size of description
     C* DTIDESC = poidesc
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     WK0006        RN0001
     C* *** Print Detail line
     C* IF count > 26
     C     COUNT         IFGT      26
     C* PRINT porder,dl1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT porder,fl1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0008                               OA
     C                   MOVEA     SAVIN         *IN
     C* PAGES = pages + 1
     C     PAGES         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        PAGES
     C* COUNT = 1
     C                   Z-ADD     1             COUNT
     C* PRINT porder,abb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF podlvdt <> 0
     C     WK0005        IFNE      *ZERO
     C* PRINT porder,btl
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* ELSE                                                          *
     C                   ELSE
     C* PRINT porder,btm
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* COUNT = count + 2
     C     COUNT         ADD       2             NRSLT0
     C                   Z-ADD     NRSLT0        COUNT
     C* *** print messages
     C* SETLL D.IPSTXTD,F.IPSTXTD,PRMCOYNO,PHPORD,POSEQ,DTSEQ
     C*
     C                   EXSR      S013
     C* DOU %sts(d.ipstxtd,f.ipstxtd)=*no
     C     RSLT03        DOUEQ     1
     C* GETREC d.ipstxtd,*ne,prmcoyno,phpord,poseq
     C*
     C                   EXSR      S014
     C* IF %sts(d.ipstxtd,f.ipstxtd)=*yes
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* IF tdtcde='B' | tdtcde='O'
     C     WDTCDE        IFEQ      'B'
     C     WDTCDE        OREQ      'O'
     C* *** Print Message
     C* IF count > 26
     C     COUNT         IFGT      26
     C* PRINT porder,dl1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT porder,fl1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0008                               OA
     C                   MOVEA     SAVIN         *IN
     C* PAGES = pages + 1
     C     PAGES         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        PAGES
     C* COUNT = 1
     C                   Z-ADD     1             COUNT
     C* PRINT porder,abb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* PRINT porder,ctx
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* COUNT = count + 1
     C     COUNT         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        COUNT
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT03
     C                   END
     C* All order details printed
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** Print total for purchase order
     C* PRINT porder,el1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0007                               OA
     C                   MOVEA     SAVIN         *IN
     C* PRINT porder,fl1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0008                               OA
     C                   MOVEA     SAVIN         *IN
     C* ***   Order not required to print
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Status invalid end of file
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C                   EXSR      SEND
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEND - END of program.
     C*****************************************************************
     C     SEND          BEGSR
     C*
     C     LRFLAG        IFEQ      'Y'
     C     LRFLAG        OREQ      *BLANK
     C                   MOVE      '1'           *INLR
     C                   END                                                    LRFLAG EQ 'Y'
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SY0010 - Format Date
     C*****************************************************************
     C     SY0010        BEGSR
     C*
     C* *** INPUT PARAMETER = SYDATI - CYMD field 8N CMD
     C* ***                 = SYDSEP - date seperator
     C* ***                 = SYDFMT - date format
     C* ***                                                           *
     C* *** OUTPUT PARAMETER = SYDATO - Char date field 10A
     C* *** Split date components
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0006        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0006
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0003        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0003        SYMMDD
     C* SYMM = %ljf(SYMMDD) ; Month 2
     C*  Left Justify field into result field
     C                   MOVEL     SYMMDD        SYMM
     C* SYDD = %rjf(SYMMDD) ; Days  2
     C*  Right Justify field into result field
     C                   MOVE      SYMMDD        SYDD
     C*                                                               *
     C* *** Convert elements to Char
     C*                                                               *
     C* SYCCYYA = %CTC(SYCCYY)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0002
     C                   MOVEL     SYCCYY        RN0002
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0007
     C                   MOVEL     SYMMDD        RN0007
     C* SYMMA = %CTC(SYMM)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYMMA
     C                   MOVEL     SYMM          SYMMA
     C* SYDDA = %CTC(SYDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        SYDDA
     C                   MOVEL     SYDD          SYDDA
     C*                                                               *
     C* IF SYDFMT = '1'
     C     RN0005        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0005        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0003        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0003        RN0003
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0006        RN0006
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0005        RN0005
     C*
     C     $SY001        ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - Error messages to job log.
     C*        calls message handling program to add error
     C*        messages to job log or extract message from message file
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C                   CALL      'CLMSG'       PMSGCL
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRMCOYNO
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - SETLL d.pordh,f.pordh,prmcoyno
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   MOVEL     *LOVAL        HD0009                         Company number
     C                   MOVEL     *LOVAL        HD0010                         Purchase Order Numbe
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0009                         Company number
     C                   MOVEL     PRM001        RN0045                         Company number
     C*
     C     K0002         SETLL     PORDH                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC d.pordh,*ne,prmcoyno
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C     K0002         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - PORDH
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDH
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0045        KHCO01
     C     K0002         SETGT     PORDH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.IPSTXTH,F.IPSTXTH,PRMCOYNO,PHPORD,DTSEQ
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   MOVEL     *LOVAL        HD0007                         Company number
     C                   MOVEL     *LOVAL        HHPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HHSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     PRM001        HD0007                         Company number
     C                   MOVEL     PRM001        RN0033                         Company number
     C                   MOVEL     WK0016        KHPO03
     C                   MOVEL     WK0016        HHPORD                         P.O. Number
     C                   MOVEL     WK0016        THPORD                         P.O. Number
     C                   Z-ADD     DTSEQ         KHSE04
     C                   Z-ADD     DTSEQ         HHSEQ                          Sequence
     C                   Z-ADD     DTSEQ         THSEQ                          Sequence
     C*
     C     K0003         SETLL     IPSTXTH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC d.ipstxth,*ne,prmcoyno,phpord
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     *BLANK        KHPO03
     C                   MOVEL     WK0016        KHPO03
     C     K0004         READE     IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.IPSTXTH
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S007                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - Process To Reset File Pointer(EOF) - IPSTXTH
     C**************************************************************************
     C     S007          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.IPSTXTH
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSTXTH
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO02                         Company number
     C                   MOVEL     RN0033        KHCO02
     C                   MOVEL     *BLANK        KHPO03                         P.O. Number
     C                   MOVEL     THPORD        KHPO03
     C     K0004         SETGT     IPSTXTH
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - UPDATE d.pordh,f.pordh
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0009        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     HD0010        KHPO02
     C     K0005         CHAIN     PORDH                              9091      CHAIN  PORDH
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0041        IFEQ      WK0009
     C     RN0042        ANDEQ     WK0010
     C     RN0044        ANDEQ     WK0011
     C     RN0046        ANDEQ     WK0012
     C     RN0047        ANDEQ     WK0013
     C     RN0048        ANDEQ     WK0014
     C     RN0051        ANDEQ     WK0015
     C     PHOS01        ANDEQ     WHOS01
     C     PHOS02        ANDEQ     WHOS02
     C     PHOS04        ANDEQ     WHOS04
     C     PHOS06        ANDEQ     WHOS06
     C     PHOS09        ANDEQ     WHOS09
     C     PHOS10        ANDEQ     WHOS10
     C     PHOS11        ANDEQ     WHOS11
     C     PHPORD        ANDEQ     WK0016
     C     RN0054        ANDEQ     WK0017
     C     RN0055        ANDEQ     WK0018
     C     RN0056        ANDEQ     WK0019
     C     RN0057        ANDEQ     WK0020
     C     RN0058        ANDEQ     WK0021
     C     RN0059        ANDEQ     WK0022
     C     RN0060        ANDEQ     WK0023
     C     RN0061        ANDEQ     WK0024
     C     RN0062        ANDEQ     WK0025
     C     PHWHSE        ANDEQ     WHWHSE
     C     RN0063        ANDEQ     WK0026
     C     RN0064        ANDEQ     WK0027
     C     RN0065        ANDEQ     WK0028
     C     RN0066        ANDEQ     WK0029
     C     RN0067        ANDEQ     WK0030
     C     RN0068        ANDEQ     WK0031
     C     RN0069        ANDEQ     WK0032
     C     RN0070        ANDEQ     WK0033
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDHF                               90      UPDATE PORDH
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - SETLL D.pordd,F.pordd,PRMCOYNO,PHPORD,DTSEQ
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0008                         Company number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     PRM001        HD0008                         Company number
     C                   MOVEL     PRM001        RN0034                         Company number
     C                   MOVEL     WK0016        KOPO02
     C                   MOVEL     WK0016        HOPORD                         Purchase Order Numbe
     C                   MOVEL     WK0016        POPORD                         Purchase Order Numbe
     C                   Z-ADD     DTSEQ         KOSE03
     C                   Z-ADD     DTSEQ         HOSEQ                          Sequence
     C                   Z-ADD     DTSEQ         POSEQ                          Sequence
     C*
     C     K0006         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC d.pordd,*ne,prmcoyno,phpord
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WK0016        KOPO02
     C     K0007         READE     PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S011                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.PORDD
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.PORDD
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0034        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0007         SETGT     PORDD
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.IPSITEM,*EQ,PRMCOYNO,PHSUPPN,PHBRNBR,POITEM
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     WK0025        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0009        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     WOITEM        KIIT04
     C     K0008         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - SETLL D.IPSTXTD,F.IPSTXTD,PRMCOYNO,PHPORD,POSEQ,DTSEQ
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0005                         Company number
     C                   MOVEL     *LOVAL        HDPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HD0006                         Purchase order line
     C                   Z-ADD     *LOVAL        HDSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     PRM001        HD0005                         Company number
     C                   MOVEL     PRM001        RN0031                         Company number
     C                   MOVEL     WK0016        KDPO02
     C                   MOVEL     WK0016        HDPORD                         P.O. Number
     C                   MOVEL     WK0016        TDPORD                         P.O. Number
     C                   Z-ADD     WOSEQ         KDPO03
     C                   Z-ADD     WOSEQ         HD0006                         Purchase order line
     C                   Z-ADD     WOSEQ         RN0032                         Purchase order line
     C                   Z-ADD     DTSEQ         KDSE04
     C                   Z-ADD     DTSEQ         HDSEQ                          Sequence
     C                   Z-ADD     DTSEQ         TDSEQ                          Sequence
     C*
     C     K0009         SETLL     IPSTXTD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC d.ipstxtd,*ne,prmcoyno,phpord,poseq
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDPO02
     C                   MOVEL     WK0016        KDPO02
     C                   Z-ADD     WOSEQ         KDPO03
     C     K0010         READE     IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S015                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - Process To Reset File Pointer(EOF) - IPSTXTD
     C**************************************************************************
     C     S015          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0031        KDCO01
     C                   MOVEL     *BLANK        KDPO02                         P.O. Number
     C                   MOVEL     TDPORD        KDPO02
     C                   Z-ADD     RN0032        KDPO03                         Purchase order line
     C     K0010         SETGT     IPSTXTD
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            COMPANY
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            PORDH
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            IPSTXTH
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            PORDD
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            IPSITEM
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            IPSTXTD
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0009        RN0041                         Branch Number
     C                   MOVEL     WK0010        RN0042                         Buyers Code
     C                   MOVEL     WK0011        RN0044                         Contact name
     C                   MOVEL     WK0012        RN0046                         Our customers ref
     C                   Z-ADD     WK0013        RN0047                         Delivery Date
     C                   Z-ADD     WK0014        RN0048                         Entered Date
     C                   Z-ADD     WK0015        RN0051                         Purchase oprders pri
     C                   MOVEL     WHOS01        PHOS01                         New Order
     C                   MOVEL     WHOS02        PHOS02                         Updated Order/Line s
     C                   MOVEL     WHOS04        PHOS04                         P.O. Pending
     C                   MOVEL     WHOS06        PHOS06                         Print P.O.Requested
     C                   MOVEL     WHOS09        PHOS09                         special order attent
     C                   MOVEL     WHOS10        PHOS10                         P.O. has been printe
     C                   MOVEL     WHOS11        PHOS11                         P.O. has been adjust
     C                   MOVEL     WK0016        PHPORD                         Purchase Order Numbe
     C                   MOVEL     WK0017        RN0054                         Supplier Address
     C                   MOVEL     WK0018        RN0055                         Line 2
     C                   MOVEL     WK0019        RN0056                         Line 3
     C                   MOVEL     WK0020        RN0057                         Line 4
     C                   MOVEL     WK0021        RN0058                         Line 5
     C                   MOVEL     WK0022        RN0059                         Line 6
     C                   MOVEL     WK0023        RN0060                         Supplier name
     C                   MOVEL     WK0024        RN0061                         Post code
     C                   MOVEL     WK0025        RN0062                         Supplier Account
     C                   MOVEL     WHWHSE        PHWHSE                         Warehouse
     C                   MOVEL     WK0026        RN0063                         Address
     C                   MOVEL     WK0027        RN0064                         Line 2
     C                   MOVEL     WK0028        RN0065                         Line 3
     C                   MOVEL     WK0029        RN0066                         Line 4
     C                   MOVEL     WK0030        RN0067                         Line 5
     C                   MOVEL     WK0031        RN0068                         Line 6
     C                   MOVEL     WK0032        RN0069                         Wharehouse Name
     C                   MOVEL     WK0033        RN0070                         Post code
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0010        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0041        WK0009                         Branch Number
     C                   MOVEL     RN0042        WK0010                         Buyers Code
     C                   MOVEL     RN0044        WK0011                         Contact name
     C                   MOVEL     RN0046        WK0012                         Our customers ref
     C                   Z-ADD     RN0047        WK0013                         Delivery Date
     C                   Z-ADD     RN0048        WK0014                         Entered Date
     C                   Z-ADD     RN0051        WK0015                         Purchase oprders pri
     C                   MOVEL     PHOS01        WHOS01                         New Order
     C                   MOVEL     PHOS02        WHOS02                         Updated Order/Line s
     C                   MOVEL     PHOS04        WHOS04                         P.O. Pending
     C                   MOVEL     PHOS06        WHOS06                         Print P.O.Requested
     C                   MOVEL     PHOS09        WHOS09                         special order attent
     C                   MOVEL     PHOS10        WHOS10                         P.O. has been printe
     C                   MOVEL     PHOS11        WHOS11                         P.O. has been adjust
     C                   MOVEL     PHPORD        WK0016                         Purchase Order Numbe
     C                   MOVEL     RN0054        WK0017                         Supplier Address
     C                   MOVEL     RN0055        WK0018                         Line 2
     C                   MOVEL     RN0056        WK0019                         Line 3
     C                   MOVEL     RN0057        WK0020                         Line 4
     C                   MOVEL     RN0058        WK0021                         Line 5
     C                   MOVEL     RN0059        WK0022                         Line 6
     C                   MOVEL     RN0060        WK0023                         Supplier name
     C                   MOVEL     RN0061        WK0024                         Post code
     C                   MOVEL     RN0062        WK0025                         Supplier Account
     C                   MOVEL     PHWHSE        WHWHSE                         Warehouse
     C                   MOVEL     RN0063        WK0026                         Address
     C                   MOVEL     RN0064        WK0027                         Line 2
     C                   MOVEL     RN0065        WK0028                         Line 3
     C                   MOVEL     RN0066        WK0029                         Line 4
     C                   MOVEL     RN0067        WK0030                         Line 5
     C                   MOVEL     RN0068        WK0031                         Line 6
     C                   MOVEL     RN0069        WK0032                         Wharehouse Name
     C                   MOVEL     RN0070        WK0033                         Post code
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0045        HD0009                         Company number
     C                   MOVEL     PHPORD        HD0010                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0033        WK0004                         Company number
     C                   MOVEL     THPORD        WHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         WHSEQ                          Sequence
     C                   MOVEL     THTCDE        WHTCDE                         Print text code
     C                   MOVEL     THTEXT        WHTEXT                         Text
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0033        HD0007                         Company number
     C                   MOVEL     THPORD        HHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         HHSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     POCCDE        WOCCDE                         Conversion Code
     C                   Z-ADD     POCONV        WOCONV                         Conversion Qty
     C                   Z-ADD     RN0035        WK0005                         Delivery Date
     C                   MOVEL     RN0036        WK0006                         Item Description
     C                   MOVEL     POITEM        WOITEM                         Item Number
     C                   MOVEL     RN0037        WK0007                         Allocated account
     C                   MOVEL     POPCDE        WOPCDE                         Pricing code
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0038        WK0008                         Price
     C                   Z-ADD     POQORD        WOQORD                         Quantity ordered
     C                   Z-ADD     POSEQ         WOSEQ                          Sequence
     C                   MOVEL     POUOM         WOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        WOWHSE                         Warehouse
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0034        HD0008                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0028        WK0001                         Description
     C                   MOVEL     RN0029        WK0002                         Item Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0018        HD0003                         Company number
     C                   MOVEL     RN0030        HD0004                         Supplier Number
     C                   MOVEL     RN0016        HD0002                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     TDPORD        WDPORD                         P.O. Number
     C                   Z-ADD     RN0032        WK0003                         Purchase order line
     C                   Z-ADD     TDSEQ         WDSEQ                          Sequence
     C                   MOVEL     TDTCDE        WDTCDE                         Print text code
     C                   MOVEL     TDTEXT        WDTEXT                         Text
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0031        HD0005                         Company number
     C                   MOVEL     TDPORD        HDPORD                         P.O. Number
     C                   Z-ADD     RN0032        HD0006                         Purchase order line
     C                   Z-ADD     TDSEQ         HDSEQ                          Sequence
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
