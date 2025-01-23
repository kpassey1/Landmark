     F/TITLE BSTOKSEL   Stock Take On Hand Update
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BSTOKSEL
     F*  Application ID      -    BSTOKSEL
     F*  Application Name    -      Stock Take On Hand Update
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKSEL     - (U/DISK   ) IMS Stocktake items rqustd  SS
     F*  WLOCITM     - (U/DISK   ) IMS Warehouse Location Item WI
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  STOKMOV     - (I/DISK   ) IMS Stock movement history  ST
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  WAREHED     - (U/DISK   ) IMS Warehouse Header        WH
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  STOKMOVX    - (U/DISK   ) IMS Stock movement history  ST
     F*  STOKREQX    - (U/DISK   ) IMS Stock take request      SR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SYSDAT - System Date
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.STOKREQ,F.STOKSEL,prcoyno,prseq
     F* S002   - GETREC D.STOKrEQ,F.STOKSEL,*NE,PRcoyno,prseq
     F* S003   - Process To Reset File Pointer(EOF) - STOKSEL
     F* S004   - GETREC D.WAREHED,F.WLOCITM,*EQ,SSCOYNO,SSWHSE,SSLOCN,SSITEM
     F* S005   - UPDATE D.WAREHED,F.WLOCITM
     F* S006   - Referential Integrity Check (Update) For File WLOCITM
     F* S007   - GETREC D.WAREHED,F.WAREDET,*EQ,SSCOYNO,SSWHSE,SSITEM
     F* S008   - UPDATE D.WAREHED,F.WAREDET
     F* S009   - Referential Integrity Check (Update) For File WAREDET
     F* S010   - WRITE d.stokmov,f.stokmov
     F* S011   - GETREC D.WAREHED,F.WRITtyp,*EQ,PRCOYNO,SSWHSE,SSITEM,STTTYP
     F* S012   - WRITE d.warehed,f.writtyp
     F* S013   - UPDATE d.warehed,f.writtyp
     F* S014   - GETREC D.WAREHED,F.WAREHED,*EQ,SSCOYNO,SSWHSE
     F* S015   - UPDATE D.WAREHED,F.WAREHED
     F* S016   - DELETE D.STOKreq,F.STOKSEL
     F* S017   - GETREC D.STOKREQ,F.STOKREQ,*EQ,prcoyno,prseq
     F* S018   - DELETE D.STOKREQ,F.STOKREQ
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FSTOKMOV   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FSTOKREQ   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     RENAME(WLOCITMF:FMT001)
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FSTOKSEL   UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWLOCITM   UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREHED   UF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FSTOKREQX  UF   E             DISK
     F                                     INFDS(FIDS12)
     F                                     RENAME(STOKREQF:FMT003)
     F                                     INFSR(SFERR)
     FWRITTYP   UF A E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSTOKMOVX  UF A E             DISK
     F                                     INFDS(FIDS11)
     F                                     RENAME(STOKMOVF:FMT002)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(21) CTDATA PERRCD(1)             Alpha constants i
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('Stock take')
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
     IITMSTRF
     I              ITALPHA                     RN0001
     I              ITCOYNO                     RN0002
     I              ITIDESC                     RN0003
     ISTOKMOVF
     I              STBRNBR                     RN0004
     I              STCOYNO                     RN0005
     I              STSUPPN                     RN0006
     ISTOKREQF
     I              SRBFLAG                     RN0007
     I              SRCOYNO                     RN0008
     I              SRFCLAS                     RN0009
     I              SRFITEM                     RN0010
     I              SRFLOCN                     RN0011
     I              SRFSBRN                     RN0012
     I              SRFSGRP                     RN0013
     I              SRFSTIG                     RN0014
     I              SRFSUPPN                    RN0015
     I              SRFWHSE                     RN0016
     I              SRTCLAS                     RN0017
     I              SRTITEM                     RN0018
     I              SRTLOCN                     RN0019
     I              SRTSBRN                     RN0020
     I              SRTSGRP                     RN0021
     I              SRTSTIG                     RN0022
     I              SRTSUPPN                    RN0023
     I              SRTWHSE                     RN0024
     ISTOKSELF
     I              SSCOYNO                     RN0025
     I              SSQUANT                     RN0026
     IWDETAILF
     I              WDCOYNO                     RN0027
     I              WDSUPPN                     RN0028
     IWAREHEDF
     I              WHCOYNO                     RN0029
     I              WHWDESC                     RN0030
     IWARELOCF
     I              WLCOYNO                     RN0031
     IWLOCITMF
     I              WICOYNO                     RN0032
     IFMT001
     I              WICOYNO                     RN0033
     IWRITTYPF
     I              WTCOYNO                     RN0034
     IFMT002
     I              STBRNBR                     RN0004
     I              STCOYNO                     RN0005
     I              STSUPPN                     RN0006
     IFMT003
     I              SRBFLAG                     RN0007
     I              SRCOYNO                     RN0008
     I              SRFCLAS                     RN0009
     I              SRFITEM                     RN0010
     I              SRFLOCN                     RN0011
     I              SRFSBRN                     RN0012
     I              SRFSGRP                     RN0013
     I              SRFSTIG                     RN0014
     I              SRFSUPPN                    RN0015
     I              SRFWHSE                     RN0016
     I              SRTCLAS                     RN0017
     I              SRTITEM                     RN0018
     I              SRTLOCN                     RN0019
     I              SRTSBRN                     RN0020
     I              SRTSGRP                     RN0021
     I              SRTSTIG                     RN0022
     I              SRTSUPPN                    RN0023
     I              SRTWHSE                     RN0024
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ             5 0
     C                   PARM                    XYMD              6 0
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
     C                   KFLD                    KRSE02
     C*
     C     K0002         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C                   KFLD                    KDIT04
     C*
     C     K0003         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0004         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0006         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C     K0007         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDIT02
     C*
     C     K0008         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C                   KFLD                    KTTR04
     C*
     C     K0009         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0010         KLIST
     C                   KFLD                    KRCO01
     C                   KFLD                    KRSE02
     C                   KFLD                    KSWH03
     C                   KFLD                    KSPC04
     C                   KFLD                    KSLO05
     C                   KFLD                    KSIT06
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0004        WK0001                         Branch Number
     C     *LIKE         DEFINE    RN0005        WK0002                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual Date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STITEM        WK0003                         Item Number
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STLOCT        WTLOCT                         Other Location
     C     *LIKE         DEFINE    STPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    RN0006        WK0004                         Supplier Number
     C     *LIKE         DEFINE    STTIME        WTTIME                         Expected Time
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    STTREF        WTTREF                         Transaction Referenc
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STUCST        WTUCST                         Unit Cost
     C     *LIKE         DEFINE    STWEIG        WTWEIG                         Weight
     C     *LIKE         DEFINE    STWHSE        WK0005                         Warehouse Number
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    RN0025        WK0006                         Company number
     C     *LIKE         DEFINE    SSITEM        WSITEM                         Item Number
     C     *LIKE         DEFINE    SSLOCN        WSLOCN                         Location
     C     *LIKE         DEFINE    RN0026        WK0007                         Quantity counted
     C     *LIKE         DEFINE    SSWHSE        WSWHSE                         Warehouse Number
     C     *LIKE         DEFINE    RN0027        WK0008                         Company number
     C     *LIKE         DEFINE    WDPHYC        WK0009                         Physical Count
     C     *LIKE         DEFINE    WDQOH         WK0010                         Quantity on hand
     C     *LIKE         DEFINE    WDQOR         WK0011                         Quantity on reserve
     C     *LIKE         DEFINE    WHDTLC        WK0012                         Date Of Last Count
     C     *LIKE         DEFINE    RN0032        WK0013                         Company number
     C     *LIKE         DEFINE    WIPHYC        WK0014                         Physical Count
     C     *LIKE         DEFINE    WIQOH         WK0015                         Quantity on hand
     C     *LIKE         DEFINE    WIQOR         WK0016                         Quantity on reserve
     C     *LIKE         DEFINE    RN0034        WK0017                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0018                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0019                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0020                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0021                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0022                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0023                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0024                         Warehouse Number
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0031        HD0007
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0033        HD0009
     C     *LIKE         DEFINE    WIWHSE        HD0012
     C     *LIKE         DEFINE    WIITEM        HD0010
     C     *LIKE         DEFINE    WILOCN        HD0011
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0005        HD0002
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0008        HD0003
     C     *LIKE         DEFINE    SRSEQ         HRSEQ
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0025        HD0004
     C     *LIKE         DEFINE    SSSEQ         HSSEQ
     C     *LIKE         DEFINE    SSWHSE        HSWHSE
     C     *LIKE         DEFINE    SSPCKR        HSPCKR
     C     *LIKE         DEFINE    SSLOCN        HSLOCN
     C     *LIKE         DEFINE    SSITEM        HSITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0027        HD0005
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0029        HD0006
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0032        HD0008
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0034        HD0013
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HD0014
     C     *LIKE         DEFINE    WTTRNC        HTTRNC
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
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        ##DATE            8 0
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *ZEROS        WKQOH             9 0
     C                   MOVE      *ZEROS        WKQOR             9 0
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD07            1            RD STS
     C                   MOVE      *BLANKS       SWRD09            1            RD STS
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       SWRD10            1            RD STS
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      *BLANKS       SWRD03            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD08            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD05            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD02            1            RD STS ed
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       SWRD04            1            RD STS ile IMS Wareh
     C                   MOVE      *BLANKS       KTTR04            2            WTTRNC
     C                   MOVE      *BLANKS       KSWH03            3            SSWHSE
     C                   MOVE      *BLANKS       KSPC04            5            SSPCKR
     C                   MOVE      *BLANKS       KSLO05           10            SSLOCN
     C                   MOVE      *BLANKS       KSIT06           20            SSITEM
     C                   MOVE      *BLANKS       RN0035           99
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS07             5 0          SV STS          0030
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
     C* ** Read all selected stock records
     C* SETLL D.STOKREQ,F.STOKSEL,prcoyno,prseq
     C*
     C                   EXSR      S001
     C* GETREC D.STOKrEQ,F.STOKSEL,*NE,PRcoyno,prseq
     C*
     C                   EXSR      S002
     C*                                                               *
     C* DOW %STS(D.STOKrEQ,F.STOKSEL)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
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
     C* *** Warehouse Detail
     C* GETREC D.WAREHED,F.WLOCITM,*EQ,SSCOYNO,SSWHSE,SSLOCN,SSITEM
     C*
     C                   EXSR      S004
     C* IF %STS(D.WAREhed,F.Wlocitm)=*YES
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* ** CAlculate difference
     C* STTQTY = ssquant - (wiqor + wiqoh)
     C     WK0016        ADD       WK0015        NRSLT0
     C     WK0007        SUB       NRSLT0        NRSLT0
     C                   Z-ADD     NRSLT0        WTTQTY
     C* ** If no difference no updates needed
     C* IF sttqty <> 0
     C     WTTQTY        IFNE      *ZERO
     C* *** Physical Count
     C* WIPHYC = SSQUANT
     C                   Z-ADD     WK0007        WK0014
     C*                                                               *
     C* *** If On Reserve is > Count set ON Reserve to Count
     C* *** set On Hand to zero.
     C* IF WIQOR >= SSQUANT
     C     WK0016        IFGE      WK0007
     C* WKQOR = wiqor - ssquant
     C     WK0016        SUB       WK0007        NRSLT0
     C                   Z-ADD     NRSLT0        WKQOR
     C* WKQOH = wiqoh
     C                   Z-ADD     WK0015        WKQOH
     C* WIQOR = SSQUANT
     C                   Z-ADD     WK0007        WK0016
     C* WIQOH = 0
     C                   Z-ADD     *ZERO         WK0015
     C* ELSE                                                          *
     C                   ELSE
     C* ELSE On Hand = Count - On Reserve
     C* WKQOR = 0
     C                   Z-ADD     *ZERO         WKQOR
     C* WKQOH = wiqoh + wiqor - ssquant
     C     WK0015        ADD       WK0016        NRSLT0
     C                   SUB       WK0007        NRSLT0
     C                   Z-ADD     NRSLT0        WKQOH
     C* WIQOH = SSQUANT - WIQOR
     C     WK0007        SUB       WK0016        NRSLT0
     C                   Z-ADD     NRSLT0        WK0015
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Update balances for Item Location.
     C* UPDATE D.WAREHED,F.WLOCITM
     C*
     C                   EXSR      S005
     C*                                                               *
     C* *** Warehouse balances.
     C* GETREC D.WAREHED,F.WAREDET,*EQ,SSCOYNO,SSWHSE,SSITEM
     C*
     C                   EXSR      S007
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* *** Adjust on reserve and on hand the same as loctation
     C* WDQOR = WDQOR - Wkqor
     C     WK0011        SUB       WKQOR         NRSLT0
     C                   Z-ADD     NRSLT0        WK0011
     C* WDQOH = WDQOH - wkqoh
     C     WK0010        SUB       WKQOH         NRSLT0
     C                   Z-ADD     NRSLT0        WK0010
     C* *** Update balance file
     C* UPDATE D.WAREHED,F.WAREDET
     C*
     C                   EXSR      S008
     C* END ;status of waredet no
     C                   END
     C* add to stock movements
     C* STCOYNO = prcoyno
     C                   MOVE      PRM001        WK0002
     C* STWHSE = sswhse
     C                   MOVE      WSWHSE        WK0005
     C* STLOCN = sslocn
     C                   MOVE      WSLOCN        WTLOCN
     C* STITEM = ssitem
     C                   MOVE      WSITEM        WK0003
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C* STDTTR = ##DATE
     C                   Z-ADD     ##DATE        WTDTTR
     C* STTTYP = 'ST'
     C                   MOVE      'ST'          WTTTYP
     C* STDTAC = ##DATE
     C                   Z-ADD     ##DATE        WTDTAC
     C* STTREF = 'Stock take'
     C                   MOVE      *BLANKS       WTTREF
     C                   MOVEL     C0001         WTTREF
     C* STUCST = 0
     C                   Z-ADD     *ZERO         WTUCST
     C* STPCKL = 'N'
     C                   MOVE      'N'           WTPCKL
     C* STSEQ = 0
     C                   Z-ADD     *ZERO         WTSEQ
     C* STWHST = *blank
     C                   MOVE      *BLANKS       WTWHST
     C                   MOVEL     *BLANK        WTWHST
     C* STLOCT = *blank
     C                   MOVE      *BLANKS       WTLOCT
     C                   MOVEL     *BLANK        WTLOCT
     C* STTIME = 0
     C                   Z-ADD     *ZERO         WTTIME
     C* STSUPPN = *blank
     C                   MOVE      *BLANKS       WK0004
     C                   MOVEL     *BLANK        WK0004
     C* STBRNBR = *blank
     C                   MOVE      *BLANKS       WK0001
     C                   MOVEL     *BLANK        WK0001
     C* STWEIG = 0
     C                   Z-ADD     *ZERO         WTWEIG
     C* WRITE d.stokmov,f.stokmov
     C*
     C                   EXSR      S010
     C* Update transaction summary
     C* GETREC D.WAREHED,F.WRITtyp,*EQ,PRCOYNO,SSWHSE,SSITEM,STTTYP
     C*
     C                   EXSR      S011
     C* IF %sts(d.warehed,f.writtyp)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* WTCOYNO = prcoyno
     C                   MOVE      PRM001        WK0017
     C* WTWHSE = sswhse
     C                   MOVE      WSWHSE        WK0024
     C* WTITEM = ssitem
     C                   MOVE      WSITEM        WK0018
     C* WTTRNC = stttyp
     C                   MOVE      WTTTYP        WK0019
     C* WTTRPQ = sttqty
     C                   Z-ADD     WTTQTY        WK0020
     C* WTTRPV = 0
     C                   Z-ADD     *ZERO         WK0021
     C* WTTRYQ = sttqty
     C                   Z-ADD     WTTQTY        WK0022
     C* WTTRYV = 0
     C                   Z-ADD     *ZERO         WK0023
     C* WRITE d.warehed,f.writtyp
     C*
     C                   EXSR      S012
     C* ELSE                                                          *
     C                   ELSE
     C* WTTRPQ = wttrpq + sttqty
     C     WK0020        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0020
     C* WTTRYQ = wttryq + sttqty
     C     WK0022        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0022
     C* UPDATE d.warehed,f.writtyp
     C*
     C                   EXSR      S013
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END ;no change from count
     C                   END
     C* END ;status of location item no
     C                   END
     C* *** Warehouse Header
     C* GETREC D.WAREHED,F.WAREHED,*EQ,SSCOYNO,SSWHSE
     C*
     C                   EXSR      S014
     C* IF %STS(D.WAREHED,F.WAREHED)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C* WHDTLC = ##DATE
     C                   Z-ADD     ##DATE        WK0012
     C* UPDATE D.WAREHED,F.WAREHED
     C*
     C                   EXSR      S015
     C* END                                                           *
     C                   END
     C*                                                               *
     C* DELETE D.STOKreq,F.STOKSEL
     C*
     C                   EXSR      S016
     C*                                                               *
     C* GETREC D.STOKreq,F.STOKSEL,*NE,prcoyno,prseq
     C*
     C                   EXSR      S002
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
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
     C*                                                               *
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,prcoyno,prseq
     C*
     C                   EXSR      S017
     C* DELETE D.STOKREQ,F.STOKREQ
     C*
     C                   EXSR      S018
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
     C* SYSDAT - System Date
     C*****************************************************************
     C     SYSDAT        BEGSR
     C*
     C* ##YEAR = %LJF(*YMD)
     C*  Left Justify field into result field
     C                   MOVEL     XYMD          ##YEAR
     C* IF ##YEAR > 39
     C     ##YEAR        IFGT      39
     C* ##DATE = 19000000 + *YMD
     C     19000000      ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        ##DATE
     C* ELSE                                                          *
     C                   ELSE
     C* ##DATE = 20000000 + *YMD
     C     20000000      ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        ##DATE
     C* END                                                           *
     C                   END
     C*
     C     $SYSDA        ENDSR
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
     C* S001   - SETLL D.STOKREQ,F.STOKSEL,prcoyno,prseq
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HSWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HSPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HSLOCN                         Location
     C                   MOVEL     *LOVAL        HSITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KRCO01
     C                   MOVEL     PRM001        HD0004                         Company number
     C                   MOVEL     PRM001        RN0025                         Company number
     C                   Z-ADD     PRSEQ         KRSE02
     C                   Z-ADD     PRSEQ         HSSEQ                          Sequence
     C                   Z-ADD     PRSEQ         SSSEQ                          Sequence
     C*
     C     K0001         SETLL     STOKSEL                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.STOKrEQ,F.STOKSEL,*NE,PRcoyno,prseq
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0001         READE(N)  STOKSEL                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKSEL
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKSEL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - STOKSEL
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKSEL
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKSEL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0025        KRCO01
     C                   Z-ADD     SSSEQ         KRSE02                         Sequence
     C     K0001         SETGT     STOKSEL
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.WAREHED,F.WLOCITM,*EQ,SSCOYNO,SSWHSE,SSLOCN,SSITEM
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0006        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     WSLOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     WSITEM        KDIT04
     C     K0002         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - UPDATE D.WAREHED,F.WLOCITM
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0008        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HIWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03                         Location
     C                   MOVEL     HILOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HIITEM        KDIT04
     C     K0002         CHAIN     WLOCITM                            9091      CHAIN  WLOCITM
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0032        IFEQ      WK0013
     C     WIPHYC        ANDEQ     WK0014
     C     WIQOH         ANDEQ     WK0015
     C     WIQOR         ANDEQ     WK0016
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   ELSE
     C*
     C                   EXSR      S006                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WLOCITMF                             90      UPDATE WLOCITM
     C                   ELSE
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS02
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(4)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(5)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - Referential Integrity Check (Update) For File WLOCITM
     C**************************************************************************
     C     S006          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0032        IFNE      WK0013
     C*
     C                   MOVEL     WK0013        KICO01                         Company number
     C                   MOVEL     WIWHSE        KIWH02                         Warehouse Number
     C                   MOVEL     WIITEM        KIIT03                         Item Number
     C     K0003         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(2)         MSGDTA                         WLOCITM   WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $006
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0032        IFNE      WK0013
     C*
     C                   MOVEL     WK0013        KICO01                         Company number
     C                   MOVEL     WIWHSE        KIWH02                         Warehouse Number
     C                   MOVEL     WILOCN        KILO03                         Location
     C     K0004         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(3)         MSGDTA                         WLOCITM   WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $006
     C                   END
     C                   END                                                    END-Compare fld.
     C     $006          ENDSR
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.WAREHED,F.WAREDET,*EQ,SSCOYNO,SSWHSE,SSITEM
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0006        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WSITEM        KDIT03
     C     K0005         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - UPDATE D.WAREHED,F.WAREDET
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0005        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HDWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HDITEM        KDIT03
     C     K0005         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0027        IFEQ      WK0008
     C     WDPHYC        ANDEQ     WK0009
     C     WDQOH         ANDEQ     WK0010
     C     WDQOR         ANDEQ     WK0011
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S009                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS03
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(8)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(9)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S009          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0027        IFNE      WK0008
     C                   MOVEL     RN0027        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0006         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(6)         MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0027        IFNE      WK0008
     C*
     C                   MOVEL     WK0008        KDCO01                         Company number
     C                   MOVEL     WDITEM        KDIT02                         Item Number
     C     K0007         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(7)         MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END
     C                   END                                                    END-Compare fld.
     C     $009          ENDSR
     C/EJECT
     C**************************************************************************
     C* S010   - WRITE d.stokmov,f.stokmov
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   WRITE     FMT002                               90      ADD REC TO STOKMOV
     C                   Z-ADD     STS11         STS04                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC11         REC04
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(10)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(11)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.WAREHED,F.WRITtyp,*EQ,PRCOYNO,SSWHSE,SSITEM,STTTYP
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WSITEM        KDIT03
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     WTTTYP        KTTR04
     C     K0008         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - WRITE d.warehed,f.writtyp
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRITTYPF                             90      ADD REC TO WRITTYP
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(12)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(13)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - UPDATE d.warehed,f.writtyp
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0013        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HTWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HD0014        KDIT03
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     HTTRNC        KTTR04
     C     K0008         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0034        IFEQ      WK0017
     C     WTITEM        ANDEQ     WK0018
     C     WTTRNC        ANDEQ     WK0019
     C     WTTRPQ        ANDEQ     WK0020
     C     WTTRPV        ANDEQ     WK0021
     C     WTTRYQ        ANDEQ     WK0022
     C     WTTRYV        ANDEQ     WK0023
     C     WTWHSE        ANDEQ     WK0024
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(14)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(15)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC D.WAREHED,F.WAREHED,*EQ,SSCOYNO,SSWHSE
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0006        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
     C     K0009         CHAIN(N)  WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - UPDATE D.WAREHED,F.WAREHED
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0006        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HHWHSE        KHWH02
     C     K0009         CHAIN     WAREHED                            9091      CHAIN  WAREHED
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     WHDTLC        IFEQ      WK0012
     C                   UNLOCK    WAREHED                              91      RLS LCK WAREHED
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WAREHEDF                             90      UPDATE WAREHED
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(16)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(17)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - DELETE D.STOKreq,F.STOKSEL
     C**************************************************************************
     C     S016          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     WK0006        KRCO01
     C                   Z-ADD     HSSEQ         KRSE02
     C                   MOVEL     *BLANK        KSWH03
     C                   MOVEL     WSWHSE        KSWH03
     C                   MOVEL     *BLANK        KSPC04
     C                   MOVEL     HSPCKR        KSPC04
     C                   MOVEL     *BLANK        KSLO05
     C                   MOVEL     WSLOCN        KSLO05
     C                   MOVEL     *BLANK        KSIT06
     C                   MOVEL     WSITEM        KSIT06
     C     K0010         SETLL     STOKSEL                                      SETLL  STOKSEL
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - STOKSEL
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0010         READE     STOKSEL                              9190    READE  STOKSEL
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    STOKSEL                              91      DELETE STOKSEL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(18)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(19)        MSGDTA                         No record found to d
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0010         SETLL     STOKSEL                                      RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - GETREC D.STOKREQ,F.STOKREQ,*EQ,prcoyno,prseq
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM001        KRCO01
     C                   Z-ADD     PRSEQ         KRSE02
     C     K0001         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - DELETE D.STOKREQ,F.STOKREQ
     C**************************************************************************
     C     S018          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS07
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     HD0003        KRCO01
     C                   Z-ADD     HRSEQ         KRSE02
     C     K0001         SETLL     STOKREQ                                      SETLL  STOKREQ
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - STOKREQ
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     K0001         READE     STOKREQ                              9190    READE  STOKREQ
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C     REC07         CHAIN     STOKREQX                           9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     REC07         DELETE    STOKREQX                           9191      DELETE STOKREQ
     C                   Z-ADD     STS12         SVS07                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(20)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(21)        MSGDTA                         No record found to d
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-CHAIN X-FILE
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0001         SETLL     STOKREQ                                      RESUME FILE POINTER
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    STOKMOVX                             91      STOKMOVX  STOKREQX
     C                   UNLOCK    STOKREQX                             91      STOKREQX
     C                   READ      STOKMOV                                90
     C                   READ      WLOCITM1                               90
     C                   READ      ITMMAST                                90
     C                   READ      WARELOC                                90
     C                   READ      STOKMOVX                               90
     C                   READ      STOKREQX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            STOKSEL
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            WLOCITM
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WAREDET
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            STOKMOV
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            WRITTYP
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            WAREHED
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            STOKREQ
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            WLOCITM1
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            ITMMAST
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           WARELOC
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           STOKMOVX
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      12                                           STOKREQX
     C     STS12         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS12                          ASSET LOCK STATUS
     C                   ELSE
     C     STS12         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS12                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0006        RN0025                         Company number
     C                   MOVEL     WSITEM        SSITEM                         Item Number
     C                   MOVEL     WSLOCN        SSLOCN                         Location
     C                   Z-ADD     WK0007        RN0026                         Quantity counted
     C                   MOVEL     WSWHSE        SSWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0013        RN0032                         Company number
     C                   Z-ADD     WK0014        WIPHYC                         Physical Count
     C                   Z-ADD     WK0015        WIQOH                          Quantity on hand
     C                   Z-ADD     WK0016        WIQOR                          Quantity on reserve
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0008        RN0027                         Company number
     C                   Z-ADD     WK0009        WDPHYC                         Physical Count
     C                   Z-ADD     WK0010        WDQOH                          Quantity on hand
     C                   Z-ADD     WK0011        WDQOR                          Quantity on reserve
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WK0001        RN0004                         Branch Number
     C                   MOVEL     WK0002        RN0005                         Company number
     C                   Z-ADD     WTDTAC        STDTAC                         Actual Date
     C                   Z-ADD     WTDTTR        STDTTR                         Transaction Date
     C                   MOVEL     WK0003        STITEM                         Item Number
     C                   MOVEL     WTLOCN        STLOCN                         Location
     C                   MOVEL     WTLOCT        STLOCT                         Other Location
     C                   MOVEL     WTPCKL        STPCKL                         Picking List Y/N
     C                   Z-ADD     WTSEQ         STSEQ                          Picking List No.
     C                   MOVEL     WK0004        RN0006                         Supplier Number
     C                   Z-ADD     WTTIME        STTIME                         Expected Time
     C                   Z-ADD     WTTQTY        STTQTY                         Transaction Quantity
     C                   MOVEL     WTTREF        STTREF                         Transaction Referenc
     C                   MOVEL     WTTTYP        STTTYP                         Transaction Type
     C                   Z-ADD     WTUCST        STUCST                         Unit Cost
     C                   Z-ADD     WTWEIG        STWEIG                         Weight
     C                   MOVEL     WK0005        STWHSE                         Warehouse Number
     C                   MOVEL     WTWHST        STWHST                         Other Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     WK0017        RN0034                         Company number
     C                   MOVEL     WK0018        WTITEM                         Item Number
     C                   MOVEL     WK0019        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0020        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0021        WTTRPV                         Trans Period Value
     C                   Z-ADD     WK0022        WTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WK0023        WTTRYV                         Trans YTD Value
     C                   MOVEL     WK0024        WTWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   Z-ADD     WK0012        WHDTLC                         Date Of Last Count
     C                   END
     C                   END
     C                   END
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
     C*          | Move Fields From File To Work Area - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0025        WK0006                         Company number
     C                   MOVEL     SSITEM        WSITEM                         Item Number
     C                   MOVEL     SSLOCN        WSLOCN                         Location
     C                   Z-ADD     RN0026        WK0007                         Quantity counted
     C                   MOVEL     SSWHSE        WSWHSE                         Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0025        HD0004                         Company number
     C                   Z-ADD     SSSEQ         HSSEQ                          Sequence
     C                   MOVEL     SSWHSE        HSWHSE                         Warehouse Number
     C                   MOVEL     SSPCKR        HSPCKR                         Picking Route
     C                   MOVEL     SSLOCN        HSLOCN                         Location
     C                   MOVEL     SSITEM        HSITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0032        WK0013                         Company number
     C                   Z-ADD     WIPHYC        WK0014                         Physical Count
     C                   Z-ADD     WIQOH         WK0015                         Quantity on hand
     C                   Z-ADD     WIQOR         WK0016                         Quantity on reserve
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0032        HD0008                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0027        WK0008                         Company number
     C                   Z-ADD     WDPHYC        WK0009                         Physical Count
     C                   Z-ADD     WDQOH         WK0010                         Quantity on hand
     C                   Z-ADD     WDQOR         WK0011                         Quantity on reserve
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0027        HD0005                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0004        WK0001                         Branch Number
     C                   MOVEL     RN0005        WK0002                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual Date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WK0003                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   MOVEL     STLOCT        WTLOCT                         Other Location
     C                   MOVEL     STPCKL        WTPCKL                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   MOVEL     RN0006        WK0004                         Supplier Number
     C                   Z-ADD     STTIME        WTTIME                         Expected Time
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        WTWEIG                         Weight
     C                   MOVEL     STWHSE        WK0005                         Warehouse Number
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0005        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0034        WK0017                         Company number
     C                   MOVEL     WTITEM        WK0018                         Item Number
     C                   MOVEL     WTTRNC        WK0019                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0020                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0021                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0022                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0023                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0024                         Warehouse Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0034        HD0013                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HD0014                         Item Number
     C                   MOVEL     WTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   Z-ADD     WHDTLC        WK0012                         Date Of Last Count
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0029        HD0006                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0008        HD0003                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1
The end of the file was reached
WLOCITM   WAREDET
WLOCITM   WARELOC
Record update for file IMS Warehouse Location Item WI
Unable to update record for file IMS Warehouse Location Item WI
WAREDET   WLOCITM1
WAREDET   ITMMAST
Record update for file IMS Warehouse Item Details  WD
Unable to update record for file IMS Warehouse Item Details  WD
Record added to file IMS Stock movement history  ST
Unable to add record to file IMS Stock movement history  ST
Record added to file IMS Warehouse Item Types    WT
Unable to add record to file IMS Warehouse Item Types    WT
Record update for file IMS Warehouse Item Types    WT
Unable to update record for file IMS Warehouse Item Types    WT
Record update for file IMS Warehouse Header        WH
Unable to update record for file IMS Warehouse Header        WH
Record deleted from file IMS Stocktake items rqustd  SS
No record found to delete from file IMS Stocktake items rqustd  SS
Record deleted from file IMS Stock take request      SR
No record found to delete from file IMS Stock take request      SR
