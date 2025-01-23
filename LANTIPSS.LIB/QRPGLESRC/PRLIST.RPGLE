     F/TITLE PRLIST Print Receiving Lists
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PRLIST
     F*  Application ID      -    PRLIST
     F*  Application Name    -    Print Receiving Lists
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PORDHWH     - (I/DISK   ) Purchase order header by W/h
     F*  PORDD       - (I/DISK   ) Purchase Order Header       PO
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  IPSTXTD     - (I/DISK   ) Purchase Order Detail Text  TD
     F*  IPSTXTH     - (I/DISK   ) Purchase Order Text header  TH
     F*  PORDHWHX    - (U/DISK   ) Purchase order header by W/h
     F*  PRLISTO     - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SY0010 - Format Date
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     F* S002   - SETLL D.IPSHWH,F.PORDHWH,PRM001
     F* S003   - GETREC D.IPSHWH,F.PORDHWH,*NE,PRM001
     F* S004   - Process To Reset File Pointer(EOF) - PORDHWH
     F* S005   - SETLL D.PORDD,F.PORDD,PRM001,PHPORD
     F* S006   - GETREC D.PORDD,F.PORDD,*NE,PRM001,PHPORD
     F* S007   - Process To Reset File Pointer(EOF) - PORDD
     F* S008   - GETREC D.IPSITEM,F.IPSITEM,*EQ,PRM001,PHSUPPN,PHBRNbr,poitem
     F* S009   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRM001,poitem
     F* S010   - SETLL D.IPSTXTD,F.IPSTXTD,PRM001,PHPORD,POSEQ
     F* S011   - GETREC D.IPSTXTD,F.IPSTXTD,*ne,PRM001,PHPORD,POSEQ
     F* S012   - Process To Reset File Pointer(EOF) - IPSTXTD
     F* S013   - SETLL D.IPSTXTH,F.IPSTXTH,PRM001,phpord
     F* S014   - GETREC D.IPSTXTH,F.IPSTXTH,*ne,PRM001,PHPORD
     F* S015   - Process To Reset File Pointer(EOF) - IPSTXTH
     F* S016   - UPDATE D.IPSHWH,F.PORDHWH
     F* SEXCP - Dummy EXCPT(s) and Read(s)
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
     FPORDHWH   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPORDD     IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FIPSTXTD   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FIPSTXTH   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FPRLISTO   O    E             PRINTER
     F                                     INFDS(FIDS09)
     FPORDHWHX  UF   E             DISK
     F                                     INFDS(FIDS08)
     F                                     RENAME(PORDHF:PORDHFX)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D*
     D* our unit of measure
     D*
     D PRTUOM          DS
     D  CNVQ                   1      5  0
     D  BL1                    6      6
     D  PER                    7      9
     D  BL2                   10     10
     D  IUOM                  11     15
     D  BL21                  16     17
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                367    368B 0
     D  OLN09                188    189B 0
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
     D*
     D* Program status data structure
     D*
     D SDS            SDS
     D  PGM              *PROC
     D  USTAT                 11     15  0
     D  USRCLN                21     28
     D  UROUTN                29     36
     D  MSGID                 40     46
     D  ULIB                  81     90
     D  UMSGTX                91    170
     D  UFILE                201    208
     D  UFSTAT               209    213
     D  UFSRCL               228    235
     D  UJOBN                264    269  0
     D  UCDAT                288    293  0
     D  UCTIM                294    299  0
     ICOMPANYF
     I              CYCOYNO                     RN0009
     I              CYEMPCOL                    RN0010
     I              CYEMPHEAD                   RN0011
     I              CYPRDHEAD                   RN0012
     I              CYREFHEAD                   RN0013
     I              CYSDESC                     RN0014
     IIPSITEMF
     I              PIBRNBR                     RN0015
     I              PICNVCDE                    RN0016
     I              PICOYNO                     RN0017
     I              PIPBRK1                     RN0018
     I              PIPBRK2                     RN0019
     I              PIPBRK3                     RN0020
     I              PIPBRK4                     RN0021
     I              PIPRCOD                     RN0022
     I              PIQBRK1                     RN0023
     I              PIQBRK2                     RN0024
     I              PIQBRK3                     RN0025
     I              PIQBRK4                     RN0026
     I              PISDESC                     RN0027
     I              PISPITM                     RN0028
     I              PISUPPN                     RN0029
     IIPSTXTDF
     I              TDCOYNO                     RN0030
     I              TDPOSEQ                     RN0031
     IIPSTXTHF
     I              THCOYNO                     RN0032
     IITMSTRF
     I              ITALPHA                     RN0033
     I              ITCOYNO                     RN0034
     I              ITIDESC                     RN0035
     IPORDDF
     I              POCOYNO                     RN0036
     I              PODLVDT                     RN0037
     I              POIDESC                     RN0038
     I              PONLALL                     RN0039
     I              POPRICE                     RN0040
     I              POQRCVD                     RN0041
     I              POQRCYC                     RN0042
     IPORDHF
     I              PHBRNBR                     RN0043
     I              PHBUYER                     RN0044
     I              PHCMPDT                     RN0045
     I              PHCONNAM                    RN0046
     I              PHCOYNO                     RN0047
     I              PHCUSORD                    RN0048
     I              PHDLVDT                     RN0049
     I              PHENTDT                     RN0050
     I              PHLRCVDT                    RN0051
     I              PHNLALL                     RN0052
     I              PHNOPOS                     RN0053
     I              PHRLAUD                     RN0054
     I              PHSHIPV                     RN0055
     I              PHSLIN1                     RN0056
     I              PHSLIN2                     RN0057
     I              PHSLIN3                     RN0058
     I              PHSLIN4                     RN0059
     I              PHSLIN5                     RN0060
     I              PHSLIN6                     RN0061
     I              PHSNAME                     RN0062
     I              PHSPSTCD                    RN0063
     I              PHSUPPN                     RN0064
     I              PHWLIN1                     RN0065
     I              PHWLIN2                     RN0066
     I              PHWLIN3                     RN0067
     I              PHWLIN4                     RN0068
     I              PHWLIN5                     RN0069
     I              PHWLIN6                     RN0070
     I              PHWNAME                     RN0071
     I              PHWPSTCD                    RN0072
     IPORDHFX
     I              PHBRNBR                     RN0043
     I              PHBUYER                     RN0044
     I              PHCMPDT                     RN0045
     I              PHCONNAM                    RN0046
     I              PHCOYNO                     RN0047
     I              PHCUSORD                    RN0048
     I              PHDLVDT                     RN0049
     I              PHENTDT                     RN0050
     I              PHLRCVDT                    RN0051
     I              PHNLALL                     RN0052
     I              PHNOPOS                     RN0053
     I              PHRLAUD                     RN0054
     I              PHSHIPV                     RN0055
     I              PHSLIN1                     RN0056
     I              PHSLIN2                     RN0057
     I              PHSLIN3                     RN0058
     I              PHSLIN4                     RN0059
     I              PHSLIN5                     RN0060
     I              PHSLIN6                     RN0061
     I              PHSNAME                     RN0062
     I              PHSPSTCD                    RN0063
     I              PHSUPPN                     RN0064
     I              PHWLIN1                     RN0065
     I              PHWLIN2                     RN0066
     I              PHWLIN3                     RN0067
     I              PHWLIN4                     RN0068
     I              PHWLIN5                     RN0069
     I              PHWLIN6                     RN0070
     I              PHWNAME                     RN0071
     I              PHWPSTCD                    RN0072
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    XDMY              6 0
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
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0004         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0005         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0006         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C                   KFLD                    KDPO03
     C*
     C     K0007         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHPO03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0015        WK0001                         Branch Number
     C     *LIKE         DEFINE    PICNV         WICNV                          Conversion Qty
     C     *LIKE         DEFINE    RN0016        WK0002                         Conversion Code
     C     *LIKE         DEFINE    PICOST        WICOST                         Cost Price
     C     *LIKE         DEFINE    RN0017        WK0003                         Company number
     C     *LIKE         DEFINE    PIDESC        WIDESC                         Description
     C     *LIKE         DEFINE    PIITEM        WIITEM                         Item Number
     C     *LIKE         DEFINE    RN0027        WK0004                         Description
     C     *LIKE         DEFINE    RN0029        WK0006                         Supplier Number
     C     *LIKE         DEFINE    PIUOM         WIUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0030        WK0007                         Company number
     C     *LIKE         DEFINE    TDPORD        WDPORD                         P.O. Number
     C     *LIKE         DEFINE    RN0031        WK0008                         Purchase order line
     C     *LIKE         DEFINE    TDSEQ         WDSEQ                          Sequence
     C     *LIKE         DEFINE    TDTCDE        WDTCDE                         Print text code
     C     *LIKE         DEFINE    RN0032        WK0009                         Company number
     C     *LIKE         DEFINE    THPORD        WHPORD                         P.O. Number
     C     *LIKE         DEFINE    THSEQ         WHSEQ                          Sequence
     C     *LIKE         DEFINE    THTCDE        WHTCDE                         Print text code
     C     *LIKE         DEFINE    ITUOM         WTUOM                          Unit of Measure
     C     *LIKE         DEFINE    POCONV        WOCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0036        WK0010                         Company number
     C     *LIKE         DEFINE    RN0037        WK0011                         Delivery Date
     C     *LIKE         DEFINE    POPORD        WOPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0040        WK0013                         Price
     C     *LIKE         DEFINE    POQORD        WOQORD                         Quantity ordered
     C     *LIKE         DEFINE    RN0041        WK0014                         Quantity received
     C     *LIKE         DEFINE    RN0042        WK0015                         Received this cycle
     C     *LIKE         DEFINE    POSEQ         WOSEQ                          Sequence
     C     *LIKE         DEFINE    RN0047        WK0018                         Company number
     C     *LIKE         DEFINE    RN0050        WK0019                         Entered Date
     C     *LIKE         DEFINE    PHOS04        WHOS04                         P.O. Pending
     C     *LIKE         DEFINE    PHOS07        WHOS07                         Print Receiving List
     C     *LIKE         DEFINE    PHOS08        WHOS08                         Order fully recd
     C     *LIKE         DEFINE    PHWHSE        WHWHSE                         Warehouse Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0009        HD0001
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0047        HD0010
     C     *LIKE         DEFINE    PHWHSE        HHWHSE
     C     *LIKE         DEFINE    PHPORD        HD0011
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0017        HD0003
     C     *LIKE         DEFINE    RN0029        HD0004
     C     *LIKE         DEFINE    RN0015        HD0002
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0030        HD0005
     C     *LIKE         DEFINE    TDPORD        HDPORD
     C     *LIKE         DEFINE    RN0031        HD0006
     C     *LIKE         DEFINE    TDSEQ         HDSEQ
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0032        HD0007
     C     *LIKE         DEFINE    THPORD        HHPORD
     C     *LIKE         DEFINE    THSEQ         HHSEQ
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0034        HD0008
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0036        HD0009
     C     *LIKE         DEFINE    POPORD        HOPORD
     C     *LIKE         DEFINE    POSEQ         HOSEQ
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
     C                   MOVE      *BLANKS       RN0001           10            ##DELVDT
     C                   MOVE      *BLANKS       RN0002           10            ##ENTDT
     C                   MOVE      *ZEROS        OPENL             5 0
     C                   MOVE      *ZEROS        QTYDU             7 0
     C                   MOVE      *BLANKS       RUOM              5
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0003            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0004            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0005           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0006            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0007            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0008            4            SYMMDDA
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        CNVQ                           Init DS/*DTA flds
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            TDCOYNO
     C                   MOVE      *BLANKS       KDPO02           10            TDPORD
     C                   MOVE      *ZEROS        KDPO03            5 0          TDPOSEQ
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO02            3            THCOYNO
     C                   MOVE      *BLANKS       KHPO03           10            THPORD
     C                   MOVE      *BLANKS       RN0073           99
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
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS07             5 0          SV STS
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
     C* *** GET COMPANY DETAILS
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C*
     C                   EXSR      S001
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0006
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0007
     C*                                                               *
     C* *** Get P/o Header Records ***
     C* SETLL D.IPSHWH,F.PORDHWH,PRM001
     C*
     C                   EXSR      S002
     C* GETREC D.IPSHWH,F.PORDHWH,*NE,PRM001
     C*
     C                   EXSR      S003
     C* DOW %sts(d.ipshwh,f.pordhwh)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* *** only process requested Receiving Lists
     C* *** only process open p/o
     C* *** only process orders not fully recvd
     C* IF PHOS07='Y' *AND PHOS04='N' *AND PHOS08='N'
     C     WHOS07        IFEQ      'Y'
     C     WHOS04        ANDEQ     'N'
     C     WHOS08        ANDEQ     'N'
     C* *** print headings
     C* *** Format Date
     C* SYDATI = PHENTDT
     C                   Z-ADD     WK0019        RN0004
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ##ENTDT = SYDATO
     C                   MOVE      RN0005        RN0002
     C*                                                               *
     C* PRINT REPORT,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** get details
     C* SETLL D.PORDD,F.PORDD,PRM001,PHPORD
     C*
     C                   EXSR      S005
     C* OPENL = 0
     C                   Z-ADD     *ZERO         OPENL
     C* GETREC D.PORDD,F.PORDD,*NE,PRM001,PHPORD
     C*
     C                   EXSR      S006
     C* DOW %sts(d.pordd,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* QTYDU = poqord-poqrcvd
     C     WOQORD        SUB       WK0014        NRSLT0
     C                   Z-ADD     NRSLT0        QTYDU
     C* IF qtydu>0
     C     QTYDU         IFGT      *ZERO
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,PRM001,PHSUPPN,PHBRNbr,poitem
     C*
     C                   EXSR      S008
     C* IF %sts(d.ipsitem,f.ipsitem)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* PISPITM = *blanks
     C                   MOVEL     *BLANKS       WK0005
     C* PIUOM = *blanks
     C                   MOVEL     *BLANKS       WIUOM
     C* END                                                           *
     C                   END
     C* *** UOM Details
     C* IF poconv>0
     C     WOCONV        IFGT      *ZERO
     C* GETREC D.ITMMAST,F.ITMMAST,*EQ,PRM001,poitem
     C*
     C                   EXSR      S009
     C*                                                               *
     C* IF %sts(d.itmmast,f.itmmast)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* ITUOM = ' '
     C                   MOVEL     *BLANKS       WTUOM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* CNVQ = POCONV
     C                   Z-ADD     WOCONV        CNVQ
     C* PER = 'Per'
     C                   MOVE      'Per'         PER
     C* RUOM = PIUOM
     C                   MOVE      WIUOM         RUOM
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* RUOM = PIUOM
     C                   MOVE      WIUOM         RUOM
     C* END                                                           *
     C                   END
     C* *** Format Date
     C* SYDATI = podlvdt
     C                   Z-ADD     WK0011        RN0004
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C* ##DELVDT = SYDATO
     C                   MOVE      RN0005        RN0001
     C*                                                               *
     C* OPENL = openl+1
     C     OPENL         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        OPENL
     C* *** test overflow
     C* IF %ovf(REPORT)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT REPORT,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT REPORT,ccc
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** get line messages + print ***
     C* SETLL D.IPSTXTD,F.IPSTXTD,PRM001,PHPORD,POSEQ
     C*
     C                   EXSR      S010
     C* GETREC D.IPSTXTD,F.IPSTXTD,*ne,PRM001,PHPORD,POSEQ
     C*
     C                   EXSR      S011
     C* DOW %sts(d.ipstxtd,f.ipstxtd)=*yes
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT03
     C     RSLT03        DOWEQ     1
     C* IF tdtcde='R' | tdtcde='B'
     C     WDTCDE        IFEQ      'R'
     C     WDTCDE        OREQ      'B'
     C* *** test overflow
     C* IF %ovf(REPORT)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT REPORT,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* PRINT REPORT,ccd
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* GETREC D.IPSTXTD,F.IPSTXTD,*ne,PRM001,PHPORD,POSEQ
     C*
     C                   EXSR      S011
     C* END                                                           *
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT03
     C                   END
     C*                                                               *
     C* GETREC D.PORDD,F.PORDD,*NE,PRM001,PHPORD
     C*
     C                   EXSR      S006
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C* *** test overflow
     C* IF %ovf(REPORT)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT REPORT,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** print footing ***
     C* PRINT REPORT,ddd
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** print existing text
     C* SETLL D.IPSTXTH,F.IPSTXTH,PRM001,phpord
     C*
     C                   EXSR      S013
     C* GETREC D.IPSTXTH,F.IPSTXTH,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S014
     C* DOW %sts(d.ipstxth,f.ipstxth)=*yes
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C     RSLT02        DOWEQ     1
     C* IF thtcde='R' | thtcde='B'
     C     WHTCDE        IFEQ      'R'
     C     WHTCDE        OREQ      'B'
     C* *** test overflow
     C* IF %ovf(REPORT)=*yes
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT REPORT,bbb
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** print footing line
     C* PRINT REPORT,eee
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GETREC D.IPSTXTH,F.IPSTXTH,*ne,PRM001,PHPORD
     C*
     C                   EXSR      S014
     C* END                                                           *
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT02
     C                   END
     C*                                                               *
     C* PRINT REPORT,fff
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* ***
     C* *** update p/o header - rl printed
     C* PHOS07 = 'N'
     C                   MOVE      'N'           WHOS07
     C* UPDATE D.IPSHWH,F.PORDHWH
     C*
     C                   EXSR      S016
     C*                                                               *
     C* END                                                           *
     C                   END
     C* GETREC D.IPSHWH,F.PORDHWH,*NE,PRM001
     C*
     C                   EXSR      S003
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
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
     C                   MOVEL     *BLANKS       RN0005
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0007        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0004        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0004        SYMMDD
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
     C                   MOVE      *BLANK        RN0003
     C                   MOVEL     SYCCYY        RN0003
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0008
     C                   MOVEL     SYMMDD        RN0008
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
     C     RN0006        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0005        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0007:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0005        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0007:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0003:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0006        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0005        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0007:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0005        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0007:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0005        CAT(P)    RN0003:0      ARSLT0
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     ARSLT0        RN0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0004        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0005
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0004        RN0004
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0007        RN0007
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0006        RN0006
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
     C* S001   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
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
     C* S002   - SETLL D.IPSHWH,F.PORDHWH,PRM001
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHWH
     C                   MOVEL     *LOVAL        HD0010                         Company number
     C                   MOVEL     *LOVAL        HHWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0011                         Purchase Order Numbe
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0010                         Company number
     C                   MOVEL     PRM001        RN0047                         Company number
     C*
     C     K0002         SETLL     PORDHWH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - GETREC D.IPSHWH,F.PORDHWH,*NE,PRM001
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C     K0002         READE     PORDHWH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDHWH
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHWH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S004                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - Process To Reset File Pointer(EOF) - PORDHWH
     C**************************************************************************
     C     S004          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDHWH
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDHWH
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0047        KHCO01
     C     K0002         SETGT     PORDHWH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.PORDD,F.PORDD,PRM001,PHPORD
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   MOVEL     *LOVAL        HD0009                         Company number
     C                   MOVEL     *LOVAL        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     PRM001        HD0009                         Company number
     C                   MOVEL     PRM001        RN0036                         Company number
     C                   MOVEL     WK0020        KOPO02
     C                   MOVEL     WK0020        HOPORD                         Purchase Order Numbe
     C                   MOVEL     WK0020        POPORD                         Purchase Order Numbe
     C*
     C     K0003         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.PORDD,F.PORDD,*NE,PRM001,PHPORD
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     PRM001        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     WK0020        KOPO02
     C     K0003         READE     PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S007                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S007          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0036        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0003         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.IPSITEM,F.IPSITEM,*EQ,PRM001,PHSUPPN,PHBRNbr,poitem
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     PRM001        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     WK0022        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0016        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     WOITEM        KIIT04
     C     K0004         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRM001,poitem
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTIT02
     C                   MOVEL     WOITEM        KTIT02
     C     K0005         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - SETLL D.IPSTXTD,F.IPSTXTD,PRM001,PHPORD,POSEQ
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0005                         Company number
     C                   MOVEL     *LOVAL        HDPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HD0006                         Purchase order line
     C                   Z-ADD     *LOVAL        HDSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     PRM001        HD0005                         Company number
     C                   MOVEL     PRM001        RN0030                         Company number
     C                   MOVEL     WK0020        KDPO02
     C                   MOVEL     WK0020        HDPORD                         P.O. Number
     C                   MOVEL     WK0020        TDPORD                         P.O. Number
     C                   Z-ADD     WOSEQ         KDPO03
     C                   Z-ADD     WOSEQ         HD0006                         Purchase order line
     C                   Z-ADD     WOSEQ         RN0031                         Purchase order line
     C*
     C     K0006         SETLL     IPSTXTD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.IPSTXTD,F.IPSTXTD,*ne,PRM001,PHPORD,POSEQ
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDPO02
     C                   MOVEL     WK0020        KDPO02
     C                   Z-ADD     WOSEQ         KDPO03
     C     K0006         READE     IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S012                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - Process To Reset File Pointer(EOF) - IPSTXTD
     C**************************************************************************
     C     S012          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSTXTD
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0030        KDCO01
     C                   MOVEL     *BLANK        KDPO02                         P.O. Number
     C                   MOVEL     TDPORD        KDPO02
     C                   Z-ADD     RN0031        KDPO03                         Purchase order line
     C     K0006         SETGT     IPSTXTD
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - SETLL D.IPSTXTH,F.IPSTXTH,PRM001,phpord
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSTXTH
     C                   MOVEL     *LOVAL        HD0007                         Company number
     C                   MOVEL     *LOVAL        HHPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HHSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     PRM001        HD0007                         Company number
     C                   MOVEL     PRM001        RN0032                         Company number
     C                   MOVEL     WK0020        KHPO03
     C                   MOVEL     WK0020        HHPORD                         P.O. Number
     C                   MOVEL     WK0020        THPORD                         P.O. Number
     C*
     C     K0007         SETLL     IPSTXTH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC D.IPSTXTH,F.IPSTXTH,*ne,PRM001,PHPORD
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     PRM001        KHCO02
     C                   MOVEL     *BLANK        KHPO03
     C                   MOVEL     WK0020        KHPO03
     C     K0007         READE     IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.IPSTXTH
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSTXTH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S015                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - Process To Reset File Pointer(EOF) - IPSTXTH
     C**************************************************************************
     C     S015          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.IPSTXTH
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.IPSTXTH
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO02                         Company number
     C                   MOVEL     RN0032        KHCO02
     C                   MOVEL     *BLANK        KHPO03                         P.O. Number
     C                   MOVEL     THPORD        KHPO03
     C     K0007         SETGT     IPSTXTH
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - UPDATE D.IPSHWH,F.PORDHWH
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   Z-ADD     HRC02         REC02
     C     HRC02         CHAIN     PORDHWHX                           9091
     C                   Z-ADD     STS08         STS02                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0043        IFEQ      WK0016
     C     RN0044        ANDEQ     WK0017
     C     RN0047        ANDEQ     WK0018
     C     RN0050        ANDEQ     WK0019
     C     PHOS04        ANDEQ     WHOS04
     C     PHOS07        ANDEQ     WHOS07
     C     PHOS08        ANDEQ     WHOS08
     C     PHPORD        ANDEQ     WK0020
     C     RN0062        ANDEQ     WK0021
     C     RN0064        ANDEQ     WK0022
     C     PHWHSE        ANDEQ     WHWHSE
     C     RN0071        ANDEQ     WK0023
     C                   UNLOCK    PORDHWHX                             91      RLS LCK PORDHWHX
     C                   ELSE
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDHFX                              90      UPDATE PORDHWH
     C                   Z-ADD     STS08         STS02                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
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
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    PORDHWHX                             91      PORDHWHX  PRLISTO
     C                   READ      PORDHWHX                               90
     C                   ENDSR
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
     C     WFILE#        IFEQ      2                                            PORDHWH
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            PORDD
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            IPSITEM
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            ITMMAST
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
     C     WFILE#        IFEQ      7                                            IPSTXTH
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            PORDHWHX
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - PORDHWH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0016        RN0043                         Branch Number
     C                   MOVEL     WK0017        RN0044                         Buyers Code
     C                   MOVEL     WK0018        RN0047                         Company number
     C                   Z-ADD     WK0019        RN0050                         Entered Date
     C                   MOVEL     WHOS04        PHOS04                         P.O. Pending
     C                   MOVEL     WHOS07        PHOS07                         Print Receiving List
     C                   MOVEL     WHOS08        PHOS08                         Order fully recd
     C                   MOVEL     WK0020        PHPORD                         Purchase Order Numbe
     C                   MOVEL     WK0021        RN0062                         Supplier name
     C                   MOVEL     WK0022        RN0064                         Supplier Number
     C                   MOVEL     WHWHSE        PHWHSE                         Warehouse Number
     C                   MOVEL     WK0023        RN0071                         Wharehouse Name
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
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0009        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDHWH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0043        WK0016                         Branch Number
     C                   MOVEL     RN0044        WK0017                         Buyers Code
     C                   MOVEL     RN0047        WK0018                         Company number
     C                   Z-ADD     RN0050        WK0019                         Entered Date
     C                   MOVEL     PHOS04        WHOS04                         P.O. Pending
     C                   MOVEL     PHOS07        WHOS07                         Print Receiving List
     C                   MOVEL     PHOS08        WHOS08                         Order fully recd
     C                   MOVEL     PHPORD        WK0020                         Purchase Order Numbe
     C                   MOVEL     RN0062        WK0021                         Supplier name
     C                   MOVEL     RN0064        WK0022                         Supplier Number
     C                   MOVEL     PHWHSE        WHWHSE                         Warehouse Number
     C                   MOVEL     RN0071        WK0023                         Wharehouse Name
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0047        HD0010                         Company number
     C                   MOVEL     PHWHSE        HHWHSE                         Warehouse Number
     C                   MOVEL     PHPORD        HD0011                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     POCONV        WOCONV                         Conversion Qty
     C                   MOVEL     RN0036        WK0010                         Company number
     C                   Z-ADD     RN0037        WK0011                         Delivery Date
     C                   MOVEL     RN0038        WK0012                         Item Description
     C                   MOVEL     POITEM        WOITEM                         Item Number
     C                   MOVEL     POPORD        WOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0040        WK0013                         Price
     C                   Z-ADD     POQORD        WOQORD                         Quantity ordered
     C                   Z-ADD     RN0041        WK0014                         Quantity received
     C                   Z-ADD     RN0042        WK0015                         Received this cycle
     C                   Z-ADD     POSEQ         WOSEQ                          Sequence
     C                   MOVEL     POUOM         WOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        WOWHSE                         Warehouse
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0036        HD0009                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0015        WK0001                         Branch Number
     C                   Z-ADD     PICNV         WICNV                          Conversion Qty
     C                   MOVEL     RN0016        WK0002                         Conversion Code
     C                   Z-ADD     PICOST        WICOST                         Cost Price
     C                   MOVEL     RN0017        WK0003                         Company number
     C                   MOVEL     PIDESC        WIDESC                         Description
     C                   MOVEL     PIITEM        WIITEM                         Item Number
     C                   MOVEL     RN0027        WK0004                         Description
     C                   MOVEL     RN0028        WK0005                         Item Number
     C                   MOVEL     RN0029        WK0006                         Supplier Number
     C                   MOVEL     PIUOM         WIUOM                          Unit of Measure
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0017        HD0003                         Company number
     C                   MOVEL     RN0029        HD0004                         Supplier Number
     C                   MOVEL     RN0015        HD0002                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     ITUOM         WTUOM                          Unit of Measure
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0034        HD0008                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0030        WK0007                         Company number
     C                   MOVEL     TDPORD        WDPORD                         P.O. Number
     C                   Z-ADD     RN0031        WK0008                         Purchase order line
     C                   Z-ADD     TDSEQ         WDSEQ                          Sequence
     C                   MOVEL     TDTCDE        WDTCDE                         Print text code
     C                   MOVEL     TDTEXT        WDTEXT                         Text
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0030        HD0005                         Company number
     C                   MOVEL     TDPORD        HDPORD                         P.O. Number
     C                   Z-ADD     RN0031        HD0006                         Purchase order line
     C                   Z-ADD     TDSEQ         HDSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     RN0032        WK0009                         Company number
     C                   MOVEL     THPORD        WHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         WHSEQ                          Sequence
     C                   MOVEL     THTCDE        WHTCDE                         Print text code
     C                   MOVEL     THTEXT        WHTEXT                         Text
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0032        HD0007                         Company number
     C                   MOVEL     THPORD        HHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         HHSEQ                          Sequence
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
