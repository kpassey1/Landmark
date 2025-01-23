     F/TITLE BFSALES Process Farmstore Sales
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BFSALES
     F*  Application ID      -    BFSALES
     F*  Application Name    -    Process Farmstore Sales
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  FSALES      - (I/DISK   ) Farmstores Sales Receipts
     F*  STOKMOV     - (I/DISK   ) IMS Stock movement history  ST
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  FSSTOR      - (I/DISK   ) IMS Warehouse/Store Xref
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  FSALESX     - (U/DISK   ) Farmstores Sales Receipts
     F*  STOKMOVX    - (U/DISK   ) IMS Stock movement history  ST
     F*  FILE0001    - (U/DISK   ) IMS Loc Item In item loc
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* GTLITM - Get Location Item For Store
     F* GTWHSE - Get Warehouse from Store#
     F* UPTRTH - Update Movement Hist By Type
     F* UPWHDT - Update the warehouse detail
     F* SMSG - Error messages to job log.
     F* S001   - GETREC D.FSALES,F.FSALES,*NX
     F* S002   - Process To Reset File Pointer(EOF) - FSALES
     F* S003   - UPDATE D.FSALES,F.FSALES  ;        ** Set the processed flag **
     F* S004   - WRITE D.STOKMOV,F.STOKMOV  ;      ** output stock Movement **
     F* S005   - SETLL D.STOKMOV,F.WLOCITM1,PRM001,STWHSE,RMDIT#
     F* S006   - GETREC D.STOKMOV,F.WLOCITM1,*LOCK,*NE,PRM001,STWHSE,RMDIT#
     F* S007   - Process To Reset File Pointer(EOF) - WLOCITM1
     F* S008   - UPDATE d.stokmov,f.wlocitm1
     F* S009   - Referential Integrity Check (Update) For File WLOCITM1
     F* S010   - GETREC D.FSSTOR,F.FSSTOR,*EQ,PRM001,WKSTORE
     F* S011   - GETREC D.STOKMOV,F.WRITTYP,*EQ,PRM001,STWHSE,STITEM,STTTYP
     F* S012   - UPDATE D.STOKMOV,F.WRITTYP
     F* S013   - WRITE D.STOKMOV,F.WRITTYP
     F* S014   - GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,PRM001,STWHSE,STITEM
     F* S015   - UPDATE d.stokmov,f.waredet
     F* S016   - Referential Integrity Check (Update) For File WAREDET
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FFSALES    IF   E             DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSTOKMOV   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FFSSTOR    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FFSALESX   UF   E             DISK
     F                                     INFDS(FIDS09)
     F                                     RENAME(FSALESR:FSALESRX)
     F                                     INFSR(SFERR)
     FFILE0001  UF   E             DISK
     F                                     INFDS(FIDS11)
     F                                     RENAME(WLOCITMF:FMT002)
     F                                     INFSR(SFERR)
     FWRITTYP   UF A E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSTOKMOVX  UF A E             DISK
     F                                     INFDS(FIDS10)
     F                                     RENAME(STOKMOVF:FMT001)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(17) CTDATA PERRCD(1)             Alpha constants i
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('E-POS Sales')
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
     I              ITALPHA                     RN0002
     I              ITCOYNO                     RN0003
     I              ITIDESC                     RN0004
     ISTOKMOVF
     I              STBRNBR                     RN0005
     I              STCOYNO                     RN0006
     I              STSUPPN                     RN0007
     IWDETAILF
     I              WDCOYNO                     RN0008
     I              WDSUPPN                     RN0009
     IWARELOCF
     I              WLCOYNO                     RN0010
     IWLOCITMF
     I              WICOYNO                     RN0011
     IWRITTYPF
     I              WTCOYNO                     RN0012
     IFMT001
     I              STBRNBR                     RN0005
     I              STCOYNO                     RN0006
     I              STSUPPN                     RN0007
     IFMT002
     I              WICOYNO                     RN0011
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
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
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTIT03
     C*
     C     K0002         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0004         KLIST
     C                   KFLD                    KLCN01
     C                   KFLD                    KLUS02
     C*
     C     K0005         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTIT03
     C                   KFLD                    KTTR04
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
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RMAMEN        WMAMEN                         Processed Y/N
     C     *LIKE         DEFINE    RMDDAT        WMDDAT                         Date ccmmdd
     C     *LIKE         DEFINE    RMDEXR        WMDEXR                         Extended Retail
     C     *LIKE         DEFINE    RMDIT#        WMDIT#                         Item Number
     C     *LIKE         DEFINE    RMDLOC        WMDLOC                         Location Code
     C     *LIKE         DEFINE    RMDQTY        WMDQTY                         Quantity Invoiced
     C     *LIKE         DEFINE    RMDUCR        WMDUCR                         Unit Retail
     C     *LIKE         DEFINE    RMDUNC        WMDUNC                         Unit Cost
     C     *LIKE         DEFINE    RMUOM         WMUOM                          Unit of Measure
     C     *LIKE         DEFINE    WLCNO         WK0001                         Company number
     C     *LIKE         DEFINE    WLUSDF        WK0002                         Store Number
     C     *LIKE         DEFINE    WLWHSE        WK0003                         Warehouse Number
     C     *LIKE         DEFINE    RN0005        WK0004                         Branch Number
     C     *LIKE         DEFINE    RN0006        WK0005                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual Date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STITEM        WK0006                         Item Number
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STLOCT        WTLOCT                         Other Location
     C     *LIKE         DEFINE    STPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    RN0007        WK0007                         Supplier Number
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    STTREF        WTTREF                         Transaction Referenc
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STUCST        WTUCST                         Unit Cost
     C     *LIKE         DEFINE    STWEIG        WTWEIG                         Weight
     C     *LIKE         DEFINE    STWHSE        WK0008                         Warehouse Number
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    RN0008        WK0009                         Company number
     C     *LIKE         DEFINE    WDITEM        WK0010                         Item Number
     C     *LIKE         DEFINE    WDNOSY        WK0011                         No. of Orders Shippe
     C     *LIKE         DEFINE    WDQOH         WK0012                         Quantity on hand
     C     *LIKE         DEFINE    WDWHSE        WK0013                         Warehouse Number
     C     *LIKE         DEFINE    RN0011        WK0014                         Company number
     C     *LIKE         DEFINE    WILOCN        WK0015                         Location
     C     *LIKE         DEFINE    WIQOH         WK0016                         Quantity on hand
     C     *LIKE         DEFINE    WIWHSE        WK0017                         Warehouse Number
     C     *LIKE         DEFINE    RN0012        WK0018                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0019                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0020                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0021                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0022                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0023                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0024                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0025                         Warehouse Number
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0003        HD0001
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0010        HD0004
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    WLCNO         HLCNO
     C     *LIKE         DEFINE    WLUSDF        HLUSDF
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0006        HD0002
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0008        HD0003
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0011        HD0005
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WIITEM        HIITEM
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0012        HD0006
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HD0007
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
     C                   MOVE      *BLANKS       RMAEND           20
     C                   MOVE      *ZEROS        STTIME            6 0
     C                   MOVE      *ZEROS        WDGOH            15 6
     C                   MOVE      *BLANKS       RN0001            5            WKSTORE
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD02            1            RD STS ile Farmstore
     C                   MOVE      *BLANKS       SWRD06            1            RD STS ile Farmstore
     C                   MOVE      *BLANKS       SWRD05            1            RD STS ile Farmstore
     C                   MOVE      *BLANKS       SWRD08            1            RD STS ile Farmstore
     C                   MOVE      *BLANKS       SWRD03            1            RD STS ile Farmstore
     C                   MOVE      *BLANKS       RN0013           99
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTIT03           20            STITEM
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       RN0014           99
     C                   MOVE      *BLANKS       SWRD04            1            RD STS ile IMS Loc I
     C                   MOVE      *BLANKS       KLCN01            3            WLCNO
     C                   MOVE      *BLANKS       KLUS02            5            WLUSDF
     C                   MOVE      *BLANKS       RN0015           99
     C                   MOVE      *BLANKS       KTTR04            2            WTTRNC
     C                   MOVE      *BLANKS       RN0016           99
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     1             XYES              1 0          *YES keyword
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
     C* GETREC D.FSALES,F.FSALES,*NX
     C*
     C                   EXSR      S001
     C* DOW %STS(D.FSALES,F.FSALES)=*yes
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
     C*                                                               *
     C* IF rmamen <>'Y' ; only process un-processed records
     C     WMAMEN        IFNE      'Y'
     C*                                                               *
     C* STCOYNO = prm001 ; passed company number
     C                   MOVE      PRM001        WK0005
     C*                                                               *
     C* *** Get the correct warehouse from the store number
     C*                                                               *
     C* EXSUBR GTWHSE ; sets STWHSE
     C                   EXSR      GTWHSE
     C* ==========                                                    *
     C* STITEM = RMDIT#
     C                   MOVE      WMDIT#        WK0006
     C* RMAMEN = 'Y'
     C                   MOVE      'Y'           WMAMEN
     C*                                                               *
     C* *** Get the correct location for the store and update qty on-hand
     C*                                                               *
     C* EXSUBR GTLITM ; sets STLOCN
     C                   EXSR      GTLITM
     C* ==========                                                    *
     C* *** Update the warehouse detail file - Qty on-hand
     C* EXSUBR UPWHDT ;
     C                   EXSR      UPWHDT
     C* ==========                                                    *
     C* STDTTR = *YMD + 20000000
     C     XYMD          ADD       20000000      NRSLT0
     C                   Z-ADD     NRSLT0        WTDTTR
     C* STTTYP = 'SL'  ; sales transaction type
     C                   MOVE      'SL'          WTTTYP
     C* STDTAC = RMDDAT
     C                   Z-ADD     WMDDAT        WTDTAC
     C* STTQTY = RMDQTY
     C                   Z-ADD     WMDQTY        WTTQTY
     C* STTREF = 'E-POS Sales'
     C                   MOVE      *BLANKS       WTTREF
     C                   MOVEL     C0001         WTTREF
     C* STUCST = RMDUNC
     C                   Z-ADD     WMDUNC        WTUCST
     C* STPCKL = 'N'
     C                   MOVE      'N'           WTPCKL
     C* STSEQ = 0
     C                   Z-ADD     *ZERO         WTSEQ
     C* STWHST = ' '
     C                   MOVEL     *BLANKS       WTWHST
     C* STLOCT = ' '
     C                   MOVEL     *BLANKS       WTLOCT
     C* STTIME = 0
     C                   Z-ADD     *ZERO         STTIME
     C* STSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0007
     C* STBRNBR = ' '
     C                   MOVEL     *BLANKS       WK0004
     C* STWEIG = 0
     C                   Z-ADD     *ZERO         WTWEIG
     C*                                                               *
     C* UPDATE D.FSALES,F.FSALES  ;        ** Set the processed flag **
     C*
     C                   EXSR      S003
     C*                                                               *
     C* EXSUBR UPTRTH             ;        ** Update the Transaction type summar
     C*        y records **
     C                   EXSR      UPTRTH
     C* ==========                                                    *
     C*                                                               *
     C* WRITE D.STOKMOV,F.STOKMOV  ;      ** output stock Movement **
     C*
     C                   EXSR      S004
     C*                                                               *
     C* END ; ** record already processed **
     C                   END
     C*                                                               *
     C* GETREC D.FSALES,F.FSALES,*NX
     C*
     C                   EXSR      S001
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
     C* GTLITM - Get Location Item For Store
     C*****************************************************************
     C     GTLITM        BEGSR
     C*
     C*                                                               *
     C* *** Update Location Item details
     C*                                                               *
     C* SETLL D.STOKMOV,F.WLOCITM1,PRM001,STWHSE,RMDIT#
     C*
     C                   EXSR      S005
     C* GETREC D.STOKMOV,F.WLOCITM1,*LOCK,*NE,PRM001,STWHSE,RMDIT#
     C*
     C                   EXSR      S006
     C* IF %STS(D.STOKMOV,F.WLOCITM1)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* STLOCN = WILOCN
     C                   MOVE      WK0015        WTLOCN
     C* WIQOH = WIQOH - RMDQTY
     C     WK0016        SUB       WMDQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0016
     C* UPDATE d.stokmov,f.wlocitm1
     C*
     C                   EXSR      S008
     C* ***                                                           *
     C* ELSE                                                          *
     C                   ELSE
     C* STLOCN = '99999'
     C                   MOVE      *BLANKS       WTLOCN
     C                   MOVEL     '99999'       WTLOCN
     C* END                                                           *
     C                   END
     C*
     C     $GTLIT        ENDSR
     C/EJECT
     C*****************************************************************
     C* GTWHSE - Get Warehouse from Store#
     C*****************************************************************
     C     GTWHSE        BEGSR
     C*
     C* WKSTORE = %ctc(RMDLOC)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0001
     C                   MOVEL     WMDLOC        RN0001
     C* GETREC D.FSSTOR,F.FSSTOR,*EQ,PRM001,WKSTORE
     C*
     C                   EXSR      S010
     C* IF %STS(D.FSSTOR,F.FSSTOR)=*YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* STWHSE = wlwhse
     C                   MOVE      WK0003        WK0008
     C* ELSE                                                          *
     C                   ELSE
     C* STWHSE = '999'
     C                   MOVE      '999'         WK0008
     C* END                                                           *
     C                   END
     C*
     C     $GTWHS        ENDSR
     C/EJECT
     C*****************************************************************
     C* UPTRTH - Update Movement Hist By Type
     C*****************************************************************
     C     UPTRTH        BEGSR
     C*
     C* ***                                                           *
     C* *** Update transaction Type History
     C* ***                                                           *
     C* GETREC D.STOKMOV,F.WRITTYP,*EQ,PRM001,STWHSE,STITEM,STTTYP
     C*
     C                   EXSR      S011
     C* IF %STS(D.STOKMOV,F.WRITTYP)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* WTTRPQ = WTTRPQ + sttqty
     C     WK0021        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0021
     C* WTTRYQ = WTTRYQ + sttqty
     C     WK0023        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0023
     C* WTTRPV = WTTRPV + (sttqty * stucst)
     C     WTTQTY        MULT      WTUCST        NRSLT0
     C     WK0022        ADD       NRSLT0        NRSLT0
     C                   Z-ADD     NRSLT0        WK0022
     C* WTTRYV = WTTRYV + (sttqty * stucst)
     C     WTTQTY        MULT      WTUCST        NRSLT0
     C     WK0024        ADD       NRSLT0        NRSLT0
     C                   Z-ADD     NRSLT0        WK0024
     C* UPDATE D.STOKMOV,F.WRITTYP
     C*
     C                   EXSR      S012
     C* ELSE                                                          *
     C                   ELSE
     C* *** Write new record
     C* WTCOYNO = prm001
     C                   MOVE      PRM001        WK0018
     C* WTWHSE = stwhse
     C                   MOVE      WK0008        WK0025
     C* WTITEM = stitem
     C                   MOVE      WK0006        WK0019
     C* WTTRNC = stttyp
     C                   MOVE      WTTTYP        WK0020
     C* WTTRPQ = sttqty
     C                   Z-ADD     WTTQTY        WK0021
     C* WTTRYQ = sttqty
     C                   Z-ADD     WTTQTY        WK0023
     C* WTTRPV = sttqty * stucst
     C     WTTQTY        MULT      WTUCST        NRSLT0
     C                   Z-ADD     NRSLT0        WK0022
     C* WTTRYV = sttqty * stucst
     C     WTTQTY        MULT      WTUCST        NRSLT0
     C                   Z-ADD     NRSLT0        WK0024
     C* WRITE D.STOKMOV,F.WRITTYP
     C*
     C                   EXSR      S013
     C* END                                                           *
     C                   END
     C*
     C     $UPTRT        ENDSR
     C/EJECT
     C*****************************************************************
     C* UPWHDT - Update the warehouse detail
     C*****************************************************************
     C     UPWHDT        BEGSR
     C*
     C*                                                               *
     C* *** Update Warehouse detail file
     C*                                                               *
     C* GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,PRM001,STWHSE,STITEM
     C*
     C                   EXSR      S014
     C* IF %STS(D.STOKMOV,F.WAREDET)=*yes
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* WDQOH = WDQOH - RMDQTY
     C     WK0012        SUB       WMDQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0012
     C* UPDATE d.stokmov,f.waredet
     C*
     C                   EXSR      S015
     C* END                                                           *
     C                   END
     C*
     C     $UPWHD        ENDSR
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
     C* S001   - GETREC D.FSALES,F.FSALES,*NX
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   READ      FSALES                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.FSALES
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSALES
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S002                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - Process To Reset File Pointer(EOF) - FSALES
     C**************************************************************************
     C     S002          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.FSALES
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.FSALES
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C     *HIVAL        SETGT     FSALES
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
     C* S003   - UPDATE D.FSALES,F.FSALES  ;        ** Set the processed flag **
     C**************************************************************************
     C     S003          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   Z-ADD     HRC01         REC01
     C     HRC01         CHAIN     FSALESX                            9091
     C                   Z-ADD     STS09         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RMAMEN        IFEQ      WMAMEN
     C     RMDDAT        ANDEQ     WMDDAT
     C     RMDEXR        ANDEQ     WMDEXR
     C     RMDIT#        ANDEQ     WMDIT#
     C     RMDLOC        ANDEQ     WMDLOC
     C     RMDQTY        ANDEQ     WMDQTY
     C     RMDUCR        ANDEQ     WMDUCR
     C     RMDUNC        ANDEQ     WMDUNC
     C     RMUOM         ANDEQ     WMUOM
     C                   UNLOCK    FSALESX                              91      RLS LCK FSALESX
     C                   ELSE
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FSALESRX                             90      UPDATE FSALES
     C                   Z-ADD     STS09         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(2)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(3)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - WRITE D.STOKMOV,F.STOKMOV  ;      ** output stock Movement **
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         STTIME                         Expected Time
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   WRITE     FMT001                               90      ADD REC TO STOKMOV
     C                   Z-ADD     STS10         STS02                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC10         REC02
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(4)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(5)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.STOKMOV,F.WLOCITM1,PRM001,STWHSE,RMDIT#
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD05                         RD.SW.WRITTYP
     C                   MOVEL     *LOVAL        HILOCN                         Location
     C*
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     PRM001        HD0005                         Company number
     C                   MOVEL     PRM001        RN0011                         Company number
     C                   MOVEL     WK0008        KTWH02
     C                   MOVEL     WK0008        HIWHSE                         Warehouse Number
     C                   MOVEL     WK0008        WIWHSE                         Warehouse Number
     C                   MOVEL     WMDIT#        KTIT03
     C                   MOVEL     WMDIT#        HIITEM                         Item Number
     C                   MOVEL     WMDIT#        WIITEM                         Item Number
     C*
     C     K0001         SETLL     WLOCITM1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.STOKMOV,F.WLOCITM1,*LOCK,*NE,PRM001,STWHSE,RMDIT#
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     WK0008        KTWH02
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     WMDIT#        KTIT03
     C     K0001         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   Z-ADD     REC03         HRC03
     C     HRC03         CHAIN     FILE0001                           9091      WLOCITM1
     C                   Z-ADD     STS11         STS03                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   ELSE
     C                   Z-ADD     *HIVAL        STS11                          REC LOCKED
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   END
     C*
     C                   EXSR      S007                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - Process To Reset File Pointer(EOF) - WLOCITM1
     C**************************************************************************
     C     S007          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WLOCITM1  WRIT
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0011        KTCO01
     C                   MOVEL     *BLANK        KTWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KTWH02
     C                   MOVEL     *BLANK        KTIT03                         Item Number
     C                   MOVEL     WIITEM        KTIT03
     C     K0001         SETGT     WLOCITM1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - UPDATE d.stokmov,f.wlocitm1
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   Z-ADD     HRC03         REC03
     C     HRC03         CHAIN     FILE0001                           9091
     C                   Z-ADD     STS11         STS03                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0011        IFEQ      WK0014
     C     WILOCN        ANDEQ     WK0015
     C     WIQOH         ANDEQ     WK0016
     C     WIWHSE        ANDEQ     WK0017
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   ELSE
     C*
     C                   EXSR      S009                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT002                               90      UPDATE WLOCITM1
     C                   Z-ADD     STS11         STS03                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   ELSE
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
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
     C* S009   - Referential Integrity Check (Update) For File WLOCITM1
     C**************************************************************************
     C     S009          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0011        IFNE      WK0014
     C     WIWHSE        ORNE      WK0017
     C*
     C                   MOVEL     WK0014        KICO01                         Company number
     C                   MOVEL     WK0017        KIWH02                         Warehouse Number
     C                   MOVEL     WIITEM        KIIT03                         Item Number
     C     K0002         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(6)         MSGDTA                         WLOCITM1  WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0011        IFNE      WK0014
     C     WIWHSE        ORNE      WK0017
     C     WILOCN        ORNE      WK0015
     C*
     C                   MOVEL     WK0014        KICO01                         Company number
     C                   MOVEL     WK0017        KIWH02                         Warehouse Number
     C                   MOVEL     WK0015        KILO03                         Location
     C     K0003         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(7)         MSGDTA                         WLOCITM1  WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END
     C                   END                                                    END-Compare fld.
     C     $009          ENDSR
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.FSSTOR,F.FSSTOR,*EQ,PRM001,WKSTORE
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCN01
     C                   MOVEL     PRM001        KLCN01
     C                   MOVEL     *BLANK        KLUS02
     C                   MOVEL     RN0001        KLUS02
     C     K0004         CHAIN     FSSTOR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.FSSTOR
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.FSSTOR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.STOKMOV,F.WRITTYP,*EQ,PRM001,STWHSE,STITEM,STTTYP
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     WK0008        KTWH02
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     WK0006        KTIT03
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     WTTTYP        KTTR04
     C     K0005         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.WRITTYP
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.WRITTYP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - UPDATE D.STOKMOV,F.WRITTYP
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     HD0006        KTCO01
     C                   MOVEL     *BLANK        KTWH02                         Warehouse Number
     C                   MOVEL     HTWHSE        KTWH02
     C                   MOVEL     *BLANK        KTIT03                         Item Number
     C                   MOVEL     HD0007        KTIT03
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     HTTRNC        KTTR04
     C     K0005         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0012        IFEQ      WK0018
     C     WTITEM        ANDEQ     WK0019
     C     WTTRNC        ANDEQ     WK0020
     C     WTTRPQ        ANDEQ     WK0021
     C     WTTRPV        ANDEQ     WK0022
     C     WTTRYQ        ANDEQ     WK0023
     C     WTTRYV        ANDEQ     WK0024
     C     WTWHSE        ANDEQ     WK0025
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(10)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(11)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - WRITE D.STOKMOV,F.WRITTYP
     C**************************************************************************
     C     S013          BEGSR
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
     C* S014   - GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,PRM001,STWHSE,STITEM
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     WK0008        KTWH02
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     WK0006        KTIT03
     C     K0001         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - UPDATE d.stokmov,f.waredet
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     HD0003        KTCO01
     C                   MOVEL     *BLANK        KTWH02                         Warehouse Number
     C                   MOVEL     HDWHSE        KTWH02
     C                   MOVEL     *BLANK        KTIT03                         Item Number
     C                   MOVEL     HDITEM        KTIT03
     C     K0001         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0008        IFEQ      WK0009
     C     WDITEM        ANDEQ     WK0010
     C     WDNOSY        ANDEQ     WK0011
     C     WDQOH         ANDEQ     WK0012
     C     WDWHSE        ANDEQ     WK0013
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S016                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS06
     C                   END
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
     C* S016   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S016          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0008        IFNE      WK0009
     C     WDWHSE        ORNE      WK0013
     C     WDITEM        ORNE      WK0010
     C                   MOVEL     RN0008        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0006         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(14)        MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $016
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0008        IFNE      WK0009
     C     WDITEM        ORNE      WK0010
     C*
     C                   MOVEL     WK0009        KDCO01                         Company number
     C                   MOVEL     WK0010        KDIT02                         Item Number
     C     K0007         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(15)        MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $016
     C                   END
     C                   END                                                    END-Compare fld.
     C     $016          ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    FSALESX                              91      FSALESX   STOKMOVX
     C                   UNLOCK    STOKMOVX                             91      STOKMOVX  FILE0001
     C                   UNLOCK    FILE0001                             91      FILE0001
     C                   READ      STOKMOV                                90
     C                   READ      ITMMAST                                90
     C                   READ      WARELOC                                90
     C                   READ      FSALESX                                90
     C                   READ      STOKMOVX                               90
     C                   READ      FILE0001                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            FSALES
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            STOKMOV
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WLOCITM1
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            FSSTOR
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
     C     WFILE#        IFEQ      6                                            WAREDET
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            ITMMAST
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      8                                            WARELOC
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            FSALESX
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           STOKMOVX
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           FILE0001
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - FSALES
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WMAMEN        RMAMEN                         Processed Y/N
     C                   Z-ADD     WMDDAT        RMDDAT                         Date ccmmdd
     C                   Z-ADD     WMDEXR        RMDEXR                         Extended Retail
     C                   MOVEL     WMDIT#        RMDIT#                         Item Number
     C                   Z-ADD     WMDLOC        RMDLOC                         Location Code
     C                   Z-ADD     WMDQTY        RMDQTY                         Quantity Invoiced
     C                   Z-ADD     WMDUCR        RMDUCR                         Unit Retail
     C                   Z-ADD     WMDUNC        RMDUNC                         Unit Cost
     C                   MOVEL     WMUOM         RMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0004        RN0005                         Branch Number
     C                   MOVEL     WK0005        RN0006                         Company number
     C                   Z-ADD     WTDTAC        STDTAC                         Actual Date
     C                   Z-ADD     WTDTTR        STDTTR                         Transaction Date
     C                   MOVEL     WK0006        STITEM                         Item Number
     C                   MOVEL     WTLOCN        STLOCN                         Location
     C                   MOVEL     WTLOCT        STLOCT                         Other Location
     C                   MOVEL     WTPCKL        STPCKL                         Picking List Y/N
     C                   Z-ADD     WTSEQ         STSEQ                          Picking List No.
     C                   MOVEL     WK0007        RN0007                         Supplier Number
     C                   Z-ADD     WTTQTY        STTQTY                         Transaction Quantity
     C                   MOVEL     WTTREF        STTREF                         Transaction Referenc
     C                   MOVEL     WTTTYP        STTTYP                         Transaction Type
     C                   Z-ADD     WTUCST        STUCST                         Unit Cost
     C                   Z-ADD     WTWEIG        STWEIG                         Weight
     C                   MOVEL     WK0008        STWHSE                         Warehouse Number
     C                   MOVEL     WTWHST        STWHST                         Other Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0014        RN0011                         Company number
     C                   MOVEL     WK0015        WILOCN                         Location
     C                   Z-ADD     WK0016        WIQOH                          Quantity on hand
     C                   MOVEL     WK0017        WIWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     WK0018        RN0012                         Company number
     C                   MOVEL     WK0019        WTITEM                         Item Number
     C                   MOVEL     WK0020        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0021        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0022        WTTRPV                         Trans Period Value
     C                   Z-ADD     WK0023        WTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WK0024        WTTRYV                         Trans YTD Value
     C                   MOVEL     WK0025        WTWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WK0009        RN0008                         Company number
     C                   MOVEL     WK0010        WDITEM                         Item Number
     C                   Z-ADD     WK0011        WDNOSY                         No. of Orders Shippe
     C                   Z-ADD     WK0012        WDQOH                          Quantity on hand
     C                   MOVEL     WK0013        WDWHSE                         Warehouse Number
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
     C*          | Move Fields From File To Work Area - FSALES
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RMAMEN        WMAMEN                         Processed Y/N
     C                   Z-ADD     RMDDAT        WMDDAT                         Date ccmmdd
     C                   Z-ADD     RMDEXR        WMDEXR                         Extended Retail
     C                   MOVEL     RMDIT#        WMDIT#                         Item Number
     C                   Z-ADD     RMDLOC        WMDLOC                         Location Code
     C                   Z-ADD     RMDQTY        WMDQTY                         Quantity Invoiced
     C                   Z-ADD     RMDUCR        WMDUCR                         Unit Retail
     C                   Z-ADD     RMDUNC        WMDUNC                         Unit Cost
     C                   MOVEL     RMUOM         WMUOM                          Unit of Measure
     C                   Z-ADD     REC01         HRC01
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0005        WK0004                         Branch Number
     C                   MOVEL     RN0006        WK0005                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual Date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WK0006                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   MOVEL     STLOCT        WTLOCT                         Other Location
     C                   MOVEL     STPCKL        WTPCKL                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   MOVEL     RN0007        WK0007                         Supplier Number
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        WTWEIG                         Weight
     C                   MOVEL     STWHSE        WK0008                         Warehouse Number
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0006        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0011        WK0014                         Company number
     C                   MOVEL     WILOCN        WK0015                         Location
     C                   Z-ADD     WIQOH         WK0016                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0017                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0011        HD0005                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - FSSTOR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WLCNO         WK0001                         Company number
     C                   MOVEL     WLUSDF        WK0002                         Store Number
     C                   MOVEL     WLWHSE        WK0003                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     WLCNO         HLCNO                          Company number
     C                   MOVEL     WLUSDF        HLUSDF                         Store Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0012        WK0018                         Company number
     C                   MOVEL     WTITEM        WK0019                         Item Number
     C                   MOVEL     WTTRNC        WK0020                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0021                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0022                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0023                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0024                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0025                         Warehouse Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0012        HD0006                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HD0007                         Item Number
     C                   MOVEL     WTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0008        WK0009                         Company number
     C                   MOVEL     WDITEM        WK0010                         Item Number
     C                   Z-ADD     WDNOSY        WK0011                         No. of Orders Shippe
     C                   Z-ADD     WDQOH         WK0012                         Quantity on hand
     C                   MOVEL     WDWHSE        WK0013                         Warehouse Number
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0008        HD0003                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
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
Record update for file Farmstores Sales Receipts
Unable to update record for file Farmstores Sales Receipts
Record added to file IMS Stock movement history  ST
Unable to add record to file IMS Stock movement history  ST
WLOCITM1  WAREDET
WLOCITM1  WARELOC
Record update for file IMS Loc Item In item loc
Unable to update record for file IMS Loc Item In item loc
Record update for file IMS Warehouse Item Types    WT
Unable to update record for file IMS Warehouse Item Types    WT
Record added to file IMS Warehouse Item Types    WT
Unable to add record to file IMS Warehouse Item Types    WT
WAREDET   WLOCITM1
WAREDET   ITMMAST
Record update for file IMS Warehouse Item Details  WD
Unable to update record for file IMS Warehouse Item Details  WD
