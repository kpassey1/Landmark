     F/TITLE PGRN Goods Received Note
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PGRN
     F*  Application ID      -    PGRN
     F*  Application Name    -    Goods Received Note
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  GRNHIS      - (I/DISK   ) G.R.N. History              GR
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  IPSTXTH     - (I/DISK   ) Purchase Order Text header  TH
     F*  IPSTXTD     - (I/DISK   ) Purchase Order Detail Text  TD
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  PGRNO       - (O/PRINTER) Generated printer file
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SPBACT - Performs all the program begin actions.
     F* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     F* SDMC - Convert date into Day_month_cenyr form.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.GRNHIS,F.GRNHIS,PRM001
     F* S002   - GETREC D.GRNHIS,F.GRNHIS,*NX
     F* S003   - Process To Reset File Pointer(EOF) - GRNHIS
     F* S004   - GETREC D.SUPLIER,F.SUPLIER,*EQ,PRM001,GRSUPPN,GRBRNBR
     F* S005   - SETLL D.IPSTXTH,F.IPSTXTH,PRM001,GRPORD
     F* S006   - GETREC D.IPSTXTH,F.IPSTXTH,*NE,prm001,grpord
     F* S007   - Process To Reset File Pointer(EOF) - IPSTXTH
     F* S008   - SETLL D.IPSTXTD,F.IPSTXTD,PRM001,GRPORD,GRSEQ
     F* S009   - GETREC D.IPSTXTD,F.IPSTXTD,*NE,PRM001,GRPORD,GRSEQ
     F* S010   - Process To Reset File Pointer(EOF) - IPSTXTD
     F* S011   - GETREC D.IPSITEM,F.IPSITEM,*EQ,GRCOYNO,GRSUPPN,GRBRNBR,GRITEM
     F* S012   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FGRNHIS    IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIPSTXTH   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIPSTXTD   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FPGRNO     O    E             PRINTER
     F                                     INFDS(FIDS07)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S             30    DIM(5)
     D G1              S              1    DIM(999)                             GRP STS
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D*
     D* PURDS1
     D*
     D PURDS1          DS
     D  CMP1                   1      3
     D  PUR1                   4     13
     D*
     D* PURDS2
     D*
     D PURDS2          DS
     D  CMP2                   1      3
     D  PUR2                   4     13
     D*
     D* PURDS3
     D*
     D PURDS3          DS
     D  CMP3                   1      3
     D  PUR3                   4     13
     D  SEQ3                  14     18  0
     D*
     D* PURDS4
     D*
     D PURDS4          DS
     D  CMP4                   1      3
     D  PUR4                   4     13
     D  SEQ4                  14     18  0
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
     I              CYCOYNO                     RN0002
     I              CYEMPCOL                    RN0003
     I              CYEMPHEAD                   RN0004
     I              CYPRDHEAD                   RN0005
     I              CYREFHEAD                   RN0006
     I              CYSDESC                     RN0007
     IGRNHISF
     I              GRBRNBR                     RN0008
     I              GRCOYNO                     RN0009
     I              GRDLVDT                     RN0010
     I              GRGRNPR                     RN0011
     I              GRIDESC                     RN0012
     I              GRINVNUM                    RN0013
     I              GRNLALL                     RN0014
     I              GRPRICE                     RN0015
     I              GRQRCYC                     RN0016
     I              GRRCAUD                     RN0017
     I              GRRECBY                     RN0018
     I              GRRECPR                     RN0019
     I              GRSUPPN                     RN0020
     I              GRWNAME                     RN0021
     IIPSITEMF
     I              PIBRNBR                     RN0022
     I              PICNVCDE                    RN0023
     I              PICOYNO                     RN0024
     I              PIPBRK1                     RN0025
     I              PIPBRK2                     RN0026
     I              PIPBRK3                     RN0027
     I              PIPBRK4                     RN0028
     I              PIPRCOD                     RN0029
     I              PIQBRK1                     RN0030
     I              PIQBRK2                     RN0031
     I              PIQBRK3                     RN0032
     I              PIQBRK4                     RN0033
     I              PISDESC                     RN0034
     I              PISPITM                     RN0035
     I              PISUPPN                     RN0036
     IIPSTXTDF
     I              TDCOYNO                     RN0037
     I              TDPOSEQ                     RN0038
     IIPSTXTHF
     I              THCOYNO                     RN0039
     ISUPLIERF
     I              SUALPHA                     RN0040
     I              SUBRNBR                     RN0041
     I              SUCONNAM                    RN0042
     I              SUCOYNO                     RN0043
     I              SUPSTCD                     RN0044
     I              SUSUPPN                     RN0045
     I              SUTELEPH                    RN0046
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
     C                   KFLD                    KRCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRRC02
     C                   KFLD                    KRPO03
     C                   KFLD                    KRSE04
     C*
     C     K0003         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0005         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDPO02
     C                   KFLD                    KDPO03
     C*
     C     K0006         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0007         KLIST
     C                   KFLD                    KYCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0002        WK0001                         Company number
     C     *LIKE         DEFINE    GRCCDE        WRCCDE                         Conversion Code
     C     *LIKE         DEFINE    GRCONV        WRCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0009        WK0003                         Company number
     C     *LIKE         DEFINE    RN0010        WK0004                         Delivery Date
     C     *LIKE         DEFINE    RN0011        WK0005                         Grn Printed Y/N
     C     *LIKE         DEFINE    RN0012        WK0006                         Item Description
     C     *LIKE         DEFINE    GRPCDE        WRPCDE                         Pricing code
     C     *LIKE         DEFINE    RN0015        WK0009                         Price
     C     *LIKE         DEFINE    RN0019        WK0013                         Yes no
     C     *LIKE         DEFINE    RN0022        WK0016                         Branch Number
     C     *LIKE         DEFINE    RN0024        WK0017                         Company number
     C     *LIKE         DEFINE    PIDESC        WIDESC                         Description
     C     *LIKE         DEFINE    PIITEM        WIITEM                         Item Number
     C     *LIKE         DEFINE    RN0036        WK0019                         Supplier Number
     C     *LIKE         DEFINE    RN0037        WK0020                         Company number
     C     *LIKE         DEFINE    TDPORD        WDPORD                         P.O. Number
     C     *LIKE         DEFINE    RN0038        WK0021                         Purchase order line
     C     *LIKE         DEFINE    TDSEQ         WDSEQ                          Sequence
     C     *LIKE         DEFINE    TDTCDE        WDTCDE                         Print text code
     C     *LIKE         DEFINE    TDTEXT        WDTEXT                         Text
     C     *LIKE         DEFINE    RN0039        WK0022                         Company number
     C     *LIKE         DEFINE    THPORD        WHPORD                         P.O. Number
     C     *LIKE         DEFINE    THSEQ         WHSEQ                          Sequence
     C     *LIKE         DEFINE    THTCDE        WHTCDE                         Print text code
     C     *LIKE         DEFINE    THTEXT        WHTEXT                         Text
     C     *LIKE         DEFINE    RN0041        WK0023                         Branch Number
     C     *LIKE         DEFINE    RN0043        WK0024                         Company number
     C     *LIKE         DEFINE    RN0045        WK0026                         Supplier Number
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0009        HD0002
     C     *LIKE         DEFINE    RN0017        HD0003
     C     *LIKE         DEFINE    GRPORD        HRPORD
     C     *LIKE         DEFINE    GRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0024        HD0005
     C     *LIKE         DEFINE    RN0036        HD0006
     C     *LIKE         DEFINE    RN0022        HD0004
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0037        HD0007
     C     *LIKE         DEFINE    TDPORD        HDPORD
     C     *LIKE         DEFINE    RN0038        HD0008
     C     *LIKE         DEFINE    TDSEQ         HDSEQ
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0039        HD0009
     C     *LIKE         DEFINE    THPORD        HHPORD
     C     *LIKE         DEFINE    THSEQ         HHSEQ
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0043        HD0011
     C     *LIKE         DEFINE    RN0045        HD0012
     C     *LIKE         DEFINE    RN0041        HD0010
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
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        SVDY              4 0          Save days
     C                   MOVE      *ZEROS        SVCY              4 0          Save century
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *BLANKS       AST               2
     C                   MOVE      *ZEROS        DATREC            8 0
     C                   MOVE      *ZEROS        GRNPAG            3 0
     C                   MOVE      *BLANKS       IDSC             30
     C                   MOVE      *BLANKS       LEDG              1
     C                   MOVE      *ZEROS        RN0001           13 2          RECEIPT
     C                   MOVE      *ZEROS        SAVGRN            9 0
     C                   MOVE      *BLANKS       TXT1             30
     C                   MOVE      *BLANKS       TXT2             30
     C                   MOVE      *BLANKS       TXT3             30
     C                   MOVE      *BLANKS       TXT4             30
     C                   MOVE      *BLANKS       TXT5             30
     C                   MOVE      *ZEROS        X                 1 0
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *BLANKS       RN0047            3            Company number
     C                   MOVE      *BLANKS       POPORD           10            Purchase Order Numbe
     C                   MOVE      *ZEROS        POSEQ             5 0          Sequence
     C                   MOVE      *BLANKS       POUOM             5            Unit of Measure
     C                   MOVE      *ZEROS        SEQ3                           Init DS/*DTA flds
     C                   MOVE      *ZEROS        SEQ4                           Init DS/*DTA flds
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KRCO01            3            GRCOYNO
     C                   MOVE      *ZEROS        KRRC02            9 0          GRRCAUD
     C                   MOVE      *BLANKS       KRPO03           10            GRPORD
     C                   MOVE      *ZEROS        KRSE04            5 0          GRSEQ
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            THCOYNO
     C                   MOVE      *BLANKS       KHPO02           10            THPORD
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          0030
     C                   MOVE      *BLANKS       KDCO01            3            TDCOYNO
     C                   MOVE      *BLANKS       KDPO02           10            TDPORD
     C                   MOVE      *ZEROS        KDPO03            5 0          TDPOSEQ
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          0030
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SAVIN            99            Save Indord
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0048           30 9
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
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
     C                   EXSR      SPBACT
     C*                                                               *
     C* *** Get the first GRN record
     C* SETLL D.GRNHIS,F.GRNHIS,PRM001
     C*
     C                   EXSR      S001
     C* GETREC D.GRNHIS,F.GRNHIS,*NX
     C*
     C                   EXSR      S002
     C* *** Set program control loop read flag
     C*                                                               *
     C* DOW %sts(d.grnhis,f.grnhis)=*YES
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
     C*                                                               *
     C* IF GRGRNPR='N'
     C     WK0005        IFEQ      'N'
     C*                                                               *
     C* IF %OVERFLOW(LAYOUT1)=*YES
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
     C* *** Change of GRN
     C* IF SAVGRN=GRRCAUD
     C     SAVGRN        IFEQ      WK0011
     C* PRINT LAYOUT1,DD9
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0012                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* IF SAVGRN=GRRCAUD
     C     SAVGRN        IFEQ      WK0011
     C* GRNPAG = GRNPAG + 1
     C     GRNPAG        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        GRNPAG
     C* PRINT LAYOUT1,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C* *** Change of GRN
     C* END                                                           *
     C                   END
     C* *** Change of GRN
     C* IF SAVGRN<>GRRCAUD
     C     SAVGRN        IFNE      WK0011
     C*                                                               *
     C* IF %OVERFLOW(LAYOUT1)=*NO
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT LAYOUT1,AH1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0001                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GRNPAG = 1
     C                   Z-ADD     1             GRNPAG
     C* PRINT LAYOUT1,AH2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0002                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* GETREC D.SUPLIER,F.SUPLIER,*EQ,PRM001,GRSUPPN,GRBRNBR
     C*
     C                   EXSR      S004
     C* IF %STS(D.SUPLIER,F.SUPLIER)=*NO
     C*  Status of last file I/O
     C     STS03         IFNE      *ZERO
     C* LEDG = 'P'
     C                   MOVE      'P'           LEDG
     C* GETREC D.accnam,F.accnam,*EQ,ledg,PRM001,GRSUPPN,GRBRNBR
     C* IF %STS(D.accnam,F.accnam)=*NO
     C* SUNAME '** Supplier not found **'
     C* ELSE                                                          *
     C* SUCOYNO coynr
     C* SUSUPPN aconr
     C* SUBRNBR brnbr
     C* SUNAME aconm
     C* SULIN1 acca1
     C* SULIN2 acca2
     C* SULIN3 acca3
     C* SULIN4 acca4
     C* SULIN5 acca5
     C* SULIN6 acca6
     C* SUPSTCD accpc
     C* END                                                           *
     C* END                                                           *
     C                   END
     C* *** Look for first text record
     C* X = 1
     C                   Z-ADD     1             X
     C* TEXT = ' '
     C                   MOVEA     *BLANKS       A01
     C* SETLL D.IPSTXTH,F.IPSTXTH,PRM001,GRPORD
     C*
     C                   EXSR      S005
     C* *** Look for the text records
     C* DOU X > 5
     C     X             DOUGT     5
     C* GETREC D.IPSTXTH,F.IPSTXTH,*NE,prm001,grpord
     C*
     C                   EXSR      S006
     C*                                                               *
     C* IF %STS(D.IPSTXTH,F.IPSTXTH)=*NO
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* X = 6
     C                   Z-ADD     6             X
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF THTCDE='B' *or THTCDE='R'
     C     WHTCDE        IFEQ      'B'
     C     WHTCDE        OREQ      'R'
     C* TEXT(X) = THTEXT
     C                   MOVE      *BLANKS       A01(X)
     C                   MOVEL     WHTEXT        A01(X)
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* X = X + 1
     C     X             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        X
     C*                                                               *
     C* END                                                           *
     C                   END
     C* *** Load the message text output fields
     C* TXT1 = TEXT(1)
     C                   MOVE      A01(1)        TXT1
     C* TXT2 = TEXT(2)
     C                   MOVE      A01(2)        TXT2
     C* TXT3 = TEXT(3)
     C                   MOVE      A01(3)        TXT3
     C* TXT4 = TEXT(4)
     C                   MOVE      A01(4)        TXT4
     C* TXT5 = TEXT(5)
     C                   MOVE      A01(5)        TXT5
     C*                                                               *
     C* DATREC = %DMC(GRDLVDT)
     C*  Day Month Cenyr
     C                   Z-ADD     WK0004        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SDMC
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        DATREC
     C*                                                               *
     C* PRINT LAYOUT1,AH3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0003                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
     C* END                                                           *
     C                   END
     C* *** Detail Line Headings
     C* IF SAVGRN<>GRRCAUD *or %OVERFLOW(LAYOUT1)=*YES
     C     SAVGRN        IFNE      WK0011
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Over flow on printer file.
     C     *INOA         IFEQ      '1'
     C                   Z-ADD     1             RN0048
     C                   ELSE
     C                   Z-ADD     0             RN0048
     C                   END
     C     RN0048        IFEQ      XYES
     C                   Z-ADD     1             RN0048
     C                   ELSE
     C                   Z-ADD     0             RN0048
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0048        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* PRINT LAYOUT1,AH4
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0004                               OA
     C                   MOVEA     SAVIN         *IN
     C* SAVGRN = GRRCAUD
     C                   Z-ADD     WK0011        SAVGRN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Detail Lines
     C* RECEIPT = GRPRICE * GRQRCYC
     C     WK0009        MULT      WK0010        RN0048
     C                   Z-ADD     RN0048        RN0001
     C* IDSC = GRIDESC
     C                   MOVE      *BLANKS       IDSC
     C                   MOVEL     WK0006        IDSC
     C* PRINT LAYOUT1,DD1
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0005                               OA
     C                   MOVEA     SAVIN         *IN
     C* *** Look for first text record
     C* X = 1
     C                   Z-ADD     1             X
     C* TEXT = ' '
     C                   MOVEA     *BLANKS       A01
     C* CMP3 = PRM001
     C                   MOVE      PRM001        CMP3
     C* PUR3 = GRPORD
     C                   MOVE      WRPORD        PUR3
     C* SEQ3 = GRSEQ
     C                   Z-ADD     WRSEQ         SEQ3
     C* SETLL D.IPSTXTD,F.IPSTXTD,PRM001,GRPORD,GRSEQ
     C*
     C                   EXSR      S008
     C* *** Look for the text records
     C* DOU X > 5
     C     X             DOUGT     5
     C* GETREC D.IPSTXTD,F.IPSTXTD,*NE,PRM001,GRPORD,GRSEQ
     C*
     C                   EXSR      S009
     C*                                                               *
     C* IF %STS(D.IPSTXTD,F.IPSTXTD)=*NO
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* X = 6
     C                   Z-ADD     6             X
     C* ELSE                                                          *
     C                   ELSE
     C* *** First header text record found
     C* IF TDTCDE='B' *or TDTCDE='R'
     C     WDTCDE        IFEQ      'B'
     C     WDTCDE        OREQ      'R'
     C* TEXT(X) = TDTEXT
     C                   MOVE      *BLANKS       A01(X)
     C                   MOVEL     WDTEXT        A01(X)
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* X = X + 1
     C     X             ADD       1             RN0048
     C                   Z-ADD     RN0048        X
     C*                                                               *
     C* END                                                           *
     C                   END
     C* *** Load the message text output fields
     C* TXT1 = TEXT(1)
     C                   MOVE      A01(1)        TXT1
     C* TXT2 = TEXT(2)
     C                   MOVE      A01(2)        TXT2
     C* TXT3 = TEXT(3)
     C                   MOVE      A01(3)        TXT3
     C* TXT4 = TEXT(4)
     C                   MOVE      A01(4)        TXT4
     C* TXT5 = TEXT(5)
     C                   MOVE      A01(5)        TXT5
     C*                                                               *
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,GRCOYNO,GRSUPPN,GRBRNBR,GRITEM
     C*
     C                   EXSR      S011
     C* IF %STS(D.IPSITEM,F.IPSITEM)=*NO
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
     C* PISPITM = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TXT1<>' ' *or PISPITM<>' '
     C     TXT1          IFNE      *BLANKS
     C     WK0018        ORNE      *BLANKS
     C* PRINT LAYOUT1,DD2
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0006                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TXT2<>' '
     C     TXT2          IFNE      *BLANKS
     C* PRINT LAYOUT1,DD3
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0007                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TXT3<>' '
     C     TXT3          IFNE      *BLANKS
     C* PRINT LAYOUT1,DD4
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0008                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TXT4<>' '
     C     TXT4          IFNE      *BLANKS
     C* PRINT LAYOUT1,DD5
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0009                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF TXT5<>' '
     C     TXT5          IFNE      *BLANKS
     C* PRINT LAYOUT1,DD6
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0010                               OA
     C                   MOVEA     SAVIN         *IN
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END  ; GRNPR='N'
     C                   END
     C*                                                               *
     C* GETREC D.GRNHIS,F.GRNHIS,*NX
     C*
     C                   EXSR      S002
     C* END                                                           *
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0048
     C                   ELSE
     C                   Z-ADD     0             RN0048
     C                   END
     C     RN0048        IFEQ      XYES
     C                   Z-ADD     1             RN0048
     C                   ELSE
     C                   Z-ADD     0             RN0048
     C                   END
     C                   Z-ADD     RN0048        RSLT01
     C                   END
     C*                                                               *
     C* PRINT LAYOUT1,DD8
     C                   MOVE      '0'           *INOA
     C                   MOVEA     *IN           SAVIN
     C                   WRITE     XD0011                               OA
     C                   MOVEA     SAVIN         *IN
     C*                                                               *
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
     C* SPBACT - Performs all the program begin actions.
     C*****************************************************************
     C     SPBACT        BEGSR
     C*
     C* PGMBEGACT                                                     *
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C*
     C                   EXSR      S012
     C* AST = '**'
     C                   MOVE      '**'          AST
     C* SAVGRN = 0
     C                   Z-ADD     *ZERO         SAVGRN
     C* END                                                           *
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     C*          Accepts numeric argument (DATE) and a format
     C*          (DATFMT) and breaks it into YEAR, MONTH, and DAYS.
     C*****************************************************************
     C     SBRDAT        BEGSR
     C*
     C                   Z-ADD     *ZERO         SVCY
     C                   Z-ADD     *ZERO         SVCC
     C                   Z-ADD     *ZERO         NRSLT
     C     NARG1         IFEQ      *HIVAL
     C                   MOVE      *HIVAL        NRSLT
     C                   ELSE
     C*
     C     DATFMT        IFNE      'JUL'
     C     DATFMT        ANDNE     'CJL'
     C*
     C     DATFMT        IFEQ      'YMD'
     C     DATFMT        OREQ      'MDY'
     C     DATFMT        OREQ      'DMY'
     C                   Z-ADD     NARG1         X1DATE
     C* Year_Month_Day
     C     DATFMT        IFEQ      'YMD'
     C                   Z-ADD     X12           SVYY
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVDD
     C                   ELSE
     C*
     C* Month_Day_Year
     C     DATFMT        IFEQ      'MDY'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   Z-ADD     X56           SVYY
     C                   ELSE
     C*
     C* Day_Month_Year
     C     DATFMT        IFEQ      'DMY'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVYY
     C                   END
     C                   END
     C                   END
     C                   ELSE
     C*
     C                   Z-ADD     NARG1         X1CDAT                         CCYY
     C     DATFMT        IFEQ      'CMD'
     C                   Z-ADD     X12           SVCC
     C                   Z-ADD     X34           SVYY
     C                   Z-ADD     X56           SVMM
     C                   Z-ADD     X78           SVDD
     C                   ELSE
     C*
     C                   Z-ADD     X56           SVCC
     C                   Z-ADD     X78           SVYY
     C     DATFMT        IFEQ      'MDC'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   ELSE
     C*
     C     DATFMT        IFEQ      'DMC'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   END
     C                   END
     C                   END
     C                   END
     C                   MOVEL     SVCC          SVCY
     C                   MOVE      SVYY          SVCY
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVYY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C                   Z-ADD     29            FEB
     C                   ELSE
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C* Process julian date.
     C                   ELSE
     C     NARG1         IFGT      99366
     C     DATFMT        ANDEQ     'JUL'
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C     NARG1         IFGT      9999366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Get the year.
     C     DATFMT        IFEQ      'JUL'
     C     NARG1         DIV       1000          SVYY
     C                   MVR                     SVDAYS
     C                   MOVE      SVYY          SVCY
     C                   ELSE
     C     NARG1         DIV       1000          SVCY                           CCYY
     C                   MVR                     SVDAYS
     C                   MOVEL     SVCY          SVCC
     C                   MOVE      SVCY          SVYY
     C                   END
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVCY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C*
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C     SVDAYS        IFGT      366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     29            FEB
     C                   ELSE
     C     SVDAYS        IFGT      365
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C                   END
     C                   END
     C*
     C* Change SVDAYS into month and days.
     C*
     C     NRSLT         IFNE      *HIVAL
     C*
     C                   MOVE      '0'           *IN92
     C                   DO        12            C1
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     C1            IFEQ      1
     C     C1            OREQ      3
     C     C1            OREQ      5
     C     C1            OREQ      7
     C     C1            OREQ      8
     C     C1            OREQ      10
     C     C1            OREQ      12
     C     SVDAYS        IFGT      31
     C                   SUB       31            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* apr, jun, sept, or nov.
     C     C1            IFEQ      4
     C     C1            OREQ      6
     C     C1            OREQ      9
     C     C1            OREQ      11
     C     SVDAYS        IFGT      30
     C                   SUB       30            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* feb
     C     C1            IFEQ      2
     C     SVDAYS        IFGT      FEB
     C                   SUB       FEB           SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C*
     C  N92              END
     C*
     C                   Z-ADD     C1            SVMM
     C                   Z-ADD     SVDAYS        SVDD
     C*
     C                   END
     C                   END
     C*
     C     SVMM          IFGT      12
     C     SVMM          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     SVDD          IFGT      31
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* apr, jun, sept, or nov.
     C     SVMM          IFEQ      4
     C     SVMM          OREQ      6
     C     SVMM          OREQ      9
     C     SVMM          OREQ      11
     C     SVDD          IFGT      30
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C* feb
     C     SVMM          IFEQ      2
     C     SVDD          IFGT      FEB
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SDMC - Convert date into Day_month_cenyr form.
     C*        Argument with value of zero results in zero.
     C*
     C* FUNCTION:    DMC(DATE)
     C*****************************************************************
     C     SDMC          BEGSR
     C*
     C     NARG1         IFEQ      *ZERO
     C                   Z-ADD     *ZERO         NRSLT
     C                   ELSE
     C*
     C* Break Date in MONTH, DAY, and YEAR.
     C                   EXSR      SBRDAT
     C     NRSLT         IFNE      *HIVAL
     C* Get result in DMC format.
     C                   Z-ADD     SVDD          X12
     C                   Z-ADD     SVMM          X34
     C                   Z-ADD     SVCC          X56
     C                   Z-ADD     SVYY          X78
     C                   Z-ADD     X1CDAT        NRSLT
     C                   END
     C                   END
     C                   ENDSR
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
     C* S001   - SETLL D.GRNHIS,F.GRNHIS,PRM001
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.GRNHIS
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   Z-ADD     *LOVAL        HD0003                         Goods Received Note
     C                   MOVEL     *LOVAL        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     *LOVAL        HRSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     PRM001        HD0002                         Company number
     C                   MOVEL     PRM001        RN0009                         Company number
     C*
     C     K0001         SETLL     GRNHIS                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.GRNHIS,F.GRNHIS,*NX
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   READ      GRNHIS                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.GRNHIS
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.GRNHIS
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - GRNHIS
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.GRNHIS
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.GRNHIS
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0009        KRCO01
     C                   Z-ADD     RN0017        KRRC02                         Goods Received Note
     C                   MOVEL     *BLANK        KRPO03                         Purchase Order Numbe
     C                   MOVEL     GRPORD        KRPO03
     C                   Z-ADD     GRSEQ         KRSE04                         Sequence
     C     K0002         SETGT     GRNHIS
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.SUPLIER,F.SUPLIER,*EQ,PRM001,GRSUPPN,GRBRNBR
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM001        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     WK0014        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     WK0002        KUBR03
     C     K0003         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.IPSTXTH,F.IPSTXTH,PRM001,GRPORD
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTH
     C                   MOVEL     *LOVAL        HD0009                         Company number
     C                   MOVEL     *LOVAL        HHPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HHSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0009                         Company number
     C                   MOVEL     PRM001        RN0039                         Company number
     C                   MOVEL     WRPORD        KHPO02
     C                   MOVEL     WRPORD        HHPORD                         P.O. Number
     C                   MOVEL     WRPORD        THPORD                         P.O. Number
     C*
     C     K0004         SETLL     IPSTXTH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.IPSTXTH,F.IPSTXTH,*NE,prm001,grpord
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     WRPORD        KHPO02
     C     K0004         READE     IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IPSTXTH
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTH
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
     C     SWRD04        IFNE      'Y'                                          RD.SW.IPSTXTH
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.IPSTXTH
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0039        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         P.O. Number
     C                   MOVEL     THPORD        KHPO02
     C     K0004         SETGT     IPSTXTH
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETLL D.IPSTXTD,F.IPSTXTD,PRM001,GRPORD,GRSEQ
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0007                         Company number
     C                   MOVEL     *LOVAL        HDPORD                         P.O. Number
     C                   Z-ADD     *LOVAL        HD0008                         Purchase order line
     C                   Z-ADD     *LOVAL        HDSEQ                          Sequence
     C*
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     PRM001        HD0007                         Company number
     C                   MOVEL     PRM001        RN0037                         Company number
     C                   MOVEL     WRPORD        KDPO02
     C                   MOVEL     WRPORD        HDPORD                         P.O. Number
     C                   MOVEL     WRPORD        TDPORD                         P.O. Number
     C                   Z-ADD     WRSEQ         KDPO03
     C                   Z-ADD     WRSEQ         HD0008                         Purchase order line
     C                   Z-ADD     WRSEQ         RN0038                         Purchase order line
     C*
     C     K0005         SETLL     IPSTXTD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.IPSTXTD,F.IPSTXTD,*NE,PRM001,GRPORD,GRSEQ
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM001        KDCO01
     C                   MOVEL     *BLANK        KDPO02
     C                   MOVEL     WRPORD        KDPO02
     C                   Z-ADD     WRSEQ         KDPO03
     C     K0005         READE     IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S010                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(EOF) - IPSTXTD
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSTXTD
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0037        KDCO01
     C                   MOVEL     *BLANK        KDPO02                         P.O. Number
     C                   MOVEL     TDPORD        KDPO02
     C                   Z-ADD     RN0038        KDPO03                         Purchase order line
     C     K0005         SETGT     IPSTXTD
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.IPSITEM,F.IPSITEM,*EQ,GRCOYNO,GRSUPPN,GRBRNBR,GRITEM
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0003        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     WK0014        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0002        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     WRITEM        KIIT04
     C     K0006         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0007         CHAIN     COMPANY                            9091
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
     C     WFILE#        IFEQ      2                                            GRNHIS
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            SUPLIER
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            IPSTXTH
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            IPSTXTD
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            IPSITEM
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
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0002        WK0001                         Company number
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - GRNHIS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0008        WK0002                         Branch Number
     C                   MOVEL     GRCCDE        WRCCDE                         Conversion Code
     C                   Z-ADD     GRCONV        WRCONV                         Conversion Qty
     C                   MOVEL     RN0009        WK0003                         Company number
     C                   Z-ADD     RN0010        WK0004                         Delivery Date
     C                   MOVEL     RN0011        WK0005                         Grn Printed Y/N
     C                   MOVEL     RN0012        WK0006                         Item Description
     C                   MOVEL     RN0013        WK0007                         Invoice number
     C                   MOVEL     GRITEM        WRITEM                         Item Number
     C                   MOVEL     RN0014        WK0008                         Allocated account
     C                   MOVEL     GRPCDE        WRPCDE                         Pricing code
     C                   MOVEL     GRPORD        WRPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0015        WK0009                         Price
     C                   Z-ADD     GRQORD        WRQORD                         Quantity Ordered
     C                   Z-ADD     RN0016        WK0010                         Received this cycle
     C                   Z-ADD     RN0017        WK0011                         Goods Received Note
     C                   MOVEL     RN0018        WK0012                         Received By
     C                   MOVEL     RN0019        WK0013                         Yes no
     C                   Z-ADD     GRSEQ         WRSEQ                          Sequence
     C                   MOVEL     RN0020        WK0014                         Supplier Number
     C                   MOVEL     GRUOM         WRUOM                          Unit of Measure
     C                   MOVEL     GRWHSE        WRWHSE                         Warehouse Number
     C                   MOVEL     RN0021        WK0015                         Wharehouse name
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0009        HD0002                         Company number
     C                   Z-ADD     RN0017        HD0003                         Goods Received Note
     C                   MOVEL     GRPORD        HRPORD                         Purchase Order Numbe
     C                   Z-ADD     GRSEQ         HRSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0041        WK0023                         Branch Number
     C                   MOVEL     RN0043        WK0024                         Company number
     C                   MOVEL     SULIN1        WULIN1                         Address
     C                   MOVEL     SULIN2        WULIN2                         Line 2
     C                   MOVEL     SULIN3        WULIN3                         Line 3
     C                   MOVEL     SULIN4        WULIN4                         Line 4
     C                   MOVEL     SULIN5        WULIN5                         Line 5
     C                   MOVEL     SULIN6        WULIN6                         Line 6
     C                   MOVEL     SUNAME        WUNAME                         Supplier name
     C                   MOVEL     RN0044        WK0025                         Post code
     C                   MOVEL     RN0045        WK0026                         Supplier Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0043        HD0011                         Company number
     C                   MOVEL     RN0045        HD0012                         Supplier Number
     C                   MOVEL     RN0041        HD0010                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0039        WK0022                         Company number
     C                   MOVEL     THPORD        WHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         WHSEQ                          Sequence
     C                   MOVEL     THTCDE        WHTCDE                         Print text code
     C                   MOVEL     THTEXT        WHTEXT                         Text
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0039        HD0009                         Company number
     C                   MOVEL     THPORD        HHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         HHSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0037        WK0020                         Company number
     C                   MOVEL     TDPORD        WDPORD                         P.O. Number
     C                   Z-ADD     RN0038        WK0021                         Purchase order line
     C                   Z-ADD     TDSEQ         WDSEQ                          Sequence
     C                   MOVEL     TDTCDE        WDTCDE                         Print text code
     C                   MOVEL     TDTEXT        WDTEXT                         Text
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0037        HD0007                         Company number
     C                   MOVEL     TDPORD        HDPORD                         P.O. Number
     C                   Z-ADD     RN0038        HD0008                         Purchase order line
     C                   Z-ADD     TDSEQ         HDSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0022        WK0016                         Branch Number
     C                   MOVEL     RN0024        WK0017                         Company number
     C                   MOVEL     PIDESC        WIDESC                         Description
     C                   MOVEL     PIITEM        WIITEM                         Item Number
     C                   MOVEL     RN0035        WK0018                         Item Number
     C                   MOVEL     RN0036        WK0019                         Supplier Number
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0024        HD0005                         Company number
     C                   MOVEL     RN0036        HD0006                         Supplier Number
     C                   MOVEL     RN0022        HD0004                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
