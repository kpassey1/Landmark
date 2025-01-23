     F/TITLE BMEPROC Reset Op.Bal. & Mvts at M/E
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BMEPROC
     F*  Application ID      -    BMEPROC
     F*  Application Name    -    Reset Op.Bal. & Mvts at M/E
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKMOV7    - (I/DISK   ) IMS Whse/Item/Trans. Date
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  FILE0001    - (U/DISK   ) IMS Whse/Item/Trans. Date
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN
     F* S002   - GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     F* S003   - Process To Reset File Pointer(EOF) - STOKMOV7
     F* S004   - UPDATE D.WAREHED,F.WAREDET
     F* S005   - Referential Integrity Check (Update) For File WAREDET
     F* S006   - GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     F* S007   - GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     F* S008   - GETREC D.WAREHED,F.WRITTYP,*EQ,PRCOYN,STWHSE,STITEM,STTTYP
     F* S009   - UPDATE D.WAREHED,F.WRITTYP
     F* S010   - DELETE D.STOKMOV7,F.STOKMOV7,*ONE
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FSTOKMOV7  IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWRITTYP   UF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FFILE0001  UF   E             DISK
     F                                     INFDS(FIDS07)
     F                                     RENAME(STOKMOVF:FMT001)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(9) CTDATA PERRCD(1)              Alpha constants i
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
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
     IIMSTRMF
     I              TTCOYNO                     RN0001
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
     IWLOCITMF
     I              WICOYNO                     RN0010
     IWRITTYPF
     I              WTCOYNO                     RN0011
     IFMT001
     I              STBRNBR                     RN0005
     I              STCOYNO                     RN0006
     I              STSUPPN                     RN0007
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRCOYN            3
     C                   PARM                    PRDATE            8 0
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
     C*
     C     K0002         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0003         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C     K0004         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDIT02
     C*
     C     K0005         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTTR03
     C*
     C     K0006         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C                   KFLD                    KTTR04
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTIT03
     C                   KFLD                    KTDT04
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    TTONHC        WTONHC                         On Hand Calculation
     C     *LIKE         DEFINE    RN0005        WK0001                         Branch Number
     C     *LIKE         DEFINE    RN0006        WK0002                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual Date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STITEM        WK0003                         Item Number
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STLOCT        WTLOCT                         Other Location
     C     *LIKE         DEFINE    STPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    RN0007        WK0004                         Supplier Number
     C     *LIKE         DEFINE    STTIME        WTTIME                         Expected Time
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    STTREF        WTTREF                         Transaction Referenc
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STUCST        WTUCST                         Unit Cost
     C     *LIKE         DEFINE    STWEIG        WTWEIG                         Weight
     C     *LIKE         DEFINE    STWHSE        WK0005                         Warehouse Number
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    RN0008        WK0006                         Company number
     C     *LIKE         DEFINE    WDOBAL        WK0007                         Opening balance
     C     *LIKE         DEFINE    RN0011        WK0008                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0009                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0010                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0011                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0012                         Trans Period Value
     C     *LIKE         DEFINE    WTWHSE        WK0013                         Warehouse Number
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0003        HD0002
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0010        HD0006
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WIITEM        HIITEM
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0006        HD0003
     C     *LIKE         DEFINE    STWHSE        HTWHSE
     C     *LIKE         DEFINE    STITEM        HD0004
     C     *LIKE         DEFINE    STDTTR        HTDTTR
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0008        HD0005
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0011        HD0007
     C     *LIKE         DEFINE    WTWHSE        HD0010
     C     *LIKE         DEFINE    WTITEM        HD0008
     C     *LIKE         DEFINE    WTTRNC        HD0009
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
     C                   MOVE      *ZEROS        COST             13 2
     C                   MOVE      *ZEROS        CTFDAT            8 0
     C                   MOVE      *BLANKS       SVITEM           20
     C                   MOVE      *BLANKS       SVWHSE            3
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD06            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD05            1            RD STS ed
     C                   MOVE      *BLANKS       SWRD04            1            RD STS ed
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO02            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR03            2            TTTRNC
     C                   MOVE      *BLANKS       KTTR04            2            WTTRNC
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTIT03           20            STITEM
     C                   MOVE      *ZEROS        KTDT04            8 0          STDTTR
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
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
     C*                                                               *
     C* *** Move Cut-off date passed to date field.
     C* CTFDAT = PRDATE
     C                   Z-ADD     PRDATE        CTFDAT
     C*                                                               *
     C* *** Start read of Stock Movements.
     C* SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN
     C*
     C                   EXSR      S001
     C* GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     C*
     C                   EXSR      S002
     C*                                                               *
     C* *** Read all records.
     C* DOW %STS(D.STOKMOV7,F.STOKMOV7)=*YES
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
     C* *** If change of warehouse or item.
     C* IF STWHSE <> SVWHSE | STITEM <> SVITEM
     C     WK0005        IFNE      SVWHSE
     C     WK0003        ORNE      SVITEM
     C*                                                               *
     C* *** Update opening balance for whse/item just processed.
     C* IF SVWHSE <> ' '
     C     SVWHSE        IFNE      *BLANKS
     C* UPDATE D.WAREHED,F.WAREDET
     C*
     C                   EXSR      S004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get opening balance for whse/item just read.
     C* GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     C*
     C                   EXSR      S006
     C* SVWHSE = STWHSE
     C                   MOVE      WK0005        SVWHSE
     C* SVITEM = STITEM
     C                   MOVE      WK0003        SVITEM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If movement not yet picked keep.
     C* IF STPCKL = 'Y' & STSEQ = 0
     C     WTPCKL        IFEQ      'Y'
     C     WTSEQ         ANDEQ     *ZERO
     C* GOTO :END
     C                   GOTO      END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If movement after cut-off date keep.
     C* IF STDTTR > CTFDAT
     C     WTDTTR        IFGT      CTFDAT
     C* GOTO :END
     C                   GOTO      END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get transaction type.
     C* GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     C*
     C                   EXSR      S007
     C*                                                               *
     C* *** If 'Add' to Qty on hand, add to opening balance.
     C* IF TTONHC = 'A'
     C     WTONHC        IFEQ      'A'
     C* WDOBAL = WDOBAL + STTQTY
     C     WK0007        ADD       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If 'Subtract', subtract from opening balance.
     C* IF TTONHC = 'S'
     C     WTONHC        IFEQ      'S'
     C* WDOBAL = WDOBAL - STTQTY
     C     WK0007        SUB       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If 'On-Reserve' calculation, subtract from opening balance.
     C* IF TTONHC = 'R'
     C     WTONHC        IFEQ      'R'
     C* WDOBAL = WDOBAL - STTQTY
     C     WK0007        SUB       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Adjust Movement summary record.
     C* GETREC D.WAREHED,F.WRITTYP,*EQ,PRCOYN,STWHSE,STITEM,STTTYP
     C*
     C                   EXSR      S008
     C* WTTRPQ = WTTRPQ - STTQTY
     C     WK0011        SUB       WTTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0011
     C* COST = STTQTY * STUCST
     C     WTTQTY        MULT      WTUCST        NRSLT0
     C                   Z-ADD     NRSLT0        COST
     C* WTTRPV = WTTRPV - COST
     C     WK0012        SUB       COST          NRSLT0
     C                   Z-ADD     NRSLT0        WK0012
     C* UPDATE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S009
     C*                                                               *
     C* *** Delete stock movement.
     C* DELETE D.STOKMOV7,F.STOKMOV7,*ONE
     C*
     C                   EXSR      S010
     C*                                                               *
     C* *** Tag for movements not deleted.
     C* TAG :END
     C     END           TAG
     C*                                                               *
     C* *** Get next Stock Movement.
     C* GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
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
     C* S001   - SETLL D.STOKMOV7,F.STOKMOV7,PRCOYN
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV7
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C                   MOVEL     *LOVAL        HTWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0004                         Item Number
     C                   Z-ADD     *LOVAL        HTDTTR                         Transaction Date
     C*
     C                   MOVEL     PRCOYN        KTCO01
     C                   MOVEL     PRCOYN        HD0003                         Company number
     C                   MOVEL     PRCOYN        RN0006                         Company number
     C*
     C     K0001         SETLL     STOKMOV7                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC D.STOKMOV7,F.STOKMOV7,*NE,PRCOYN
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRCOYN        KTCO01
     C     K0001         READE     STOKMOV7                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKMOV7
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV7
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - STOKMOV7
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKMOV7
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV7
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0006        KTCO01
     C     K0001         SETGT     STOKMOV7
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
     C* S004   - UPDATE D.WAREHED,F.WAREDET
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0005        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HDWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HDITEM        KDIT03
     C     K0002         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0008        IFEQ      WK0006
     C     WDOBAL        ANDEQ     WK0007
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S005                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
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
     C* S005   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S005          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0008        IFNE      WK0006
     C                   MOVEL     RN0008        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0003         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(2)         MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $005
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0008        IFNE      WK0006
     C*
     C                   MOVEL     WK0006        KDCO01                         Company number
     C                   MOVEL     WDITEM        KDIT02                         Item Number
     C     K0004         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(3)         MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $005
     C                   END
     C                   END                                                    END-Compare fld.
     C     $005          ENDSR
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.WAREHED,F.WAREDET,*EQ,PRCOYN,STWHSE,STITEM
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0005        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0003        KDIT03
     C     K0002         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.IMSTRN,F.IMSTRN,*EQ,PRCOYN,STTTYP
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     PRCOYN        KTCO02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     WTTTYP        KTTR03
     C     K0005         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.WAREHED,F.WRITTYP,*EQ,PRCOYN,STWHSE,STITEM,STTTYP
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRCOYN        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0005        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0003        KDIT03
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     WTTTYP        KTTR04
     C     K0006         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - UPDATE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0007        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HD0010        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HD0008        KDIT03
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     HD0009        KTTR04
     C     K0006         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0011        IFEQ      WK0008
     C     WTITEM        ANDEQ     WK0009
     C     WTTRNC        ANDEQ     WK0010
     C     WTTRPQ        ANDEQ     WK0011
     C     WTTRPV        ANDEQ     WK0012
     C     WTWHSE        ANDEQ     WK0013
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(6)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(7)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - DELETE D.STOKMOV7,F.STOKMOV7,*ONE
     C**************************************************************************
     C     S010          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     HRC01         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    FILE0001                             91      DELETE STOKMOV7
     C                   Z-ADD     STS07         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(8)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-CHAIN-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(9)         MSGDTA                         No record found to d
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-CHAIN-XFILE
     C*
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C     K0007         SETLL     STOKMOV7                                     RESUME FILE POINTER
     C                   MOVEA     '00'          *IN(90)
     C                   END
     C*
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    FILE0001                             91      FILE0001
     C                   READ      WLOCITM1                               90
     C                   READ      ITMMAST                                90
     C                   READ      FILE0001                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            STOKMOV7
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            WAREDET
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            IMSTRN
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WRITTYP
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            WLOCITM1
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            ITMMAST
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            FILE0001
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS07                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - STOKMOV7
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0005                         Branch Number
     C                   MOVEL     WK0002        RN0006                         Company number
     C                   Z-ADD     WTDTAC        STDTAC                         Actual Date
     C                   Z-ADD     WTDTTR        STDTTR                         Transaction Date
     C                   MOVEL     WK0003        STITEM                         Item Number
     C                   MOVEL     WTLOCN        STLOCN                         Location
     C                   MOVEL     WTLOCT        STLOCT                         Other Location
     C                   MOVEL     WTPCKL        STPCKL                         Picking List Y/N
     C                   Z-ADD     WTSEQ         STSEQ                          Picking List No.
     C                   MOVEL     WK0004        RN0007                         Supplier Number
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
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0006        RN0008                         Company number
     C                   Z-ADD     WK0007        WDOBAL                         Opening balance
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WK0008        RN0011                         Company number
     C                   MOVEL     WK0009        WTITEM                         Item Number
     C                   MOVEL     WK0010        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0011        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0012        WTTRPV                         Trans Period Value
     C                   MOVEL     WK0013        WTWHSE                         Warehouse Number
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
     C*          | Move Fields From File To Work Area - STOKMOV7
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0005        WK0001                         Branch Number
     C                   MOVEL     RN0006        WK0002                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual Date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WK0003                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   MOVEL     STLOCT        WTLOCT                         Other Location
     C                   MOVEL     STPCKL        WTPCKL                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   MOVEL     RN0007        WK0004                         Supplier Number
     C                   Z-ADD     STTIME        WTTIME                         Expected Time
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        WTWEIG                         Weight
     C                   MOVEL     STWHSE        WK0005                         Warehouse Number
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0006        HD0003                         Company number
     C                   MOVEL     STWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     STITEM        HD0004                         Item Number
     C                   Z-ADD     STDTTR        HTDTTR                         Transaction Date
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0008        WK0006                         Company number
     C                   Z-ADD     WDOBAL        WK0007                         Opening balance
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0008        HD0005                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0011        WK0008                         Company number
     C                   MOVEL     WTITEM        WK0009                         Item Number
     C                   MOVEL     WTTRNC        WK0010                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0011                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0012                         Trans Period Value
     C                   MOVEL     WTWHSE        WK0013                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0011        HD0007                         Company number
     C                   MOVEL     WTWHSE        HD0010                         Warehouse Number
     C                   MOVEL     WTITEM        HD0008                         Item Number
     C                   MOVEL     WTTRNC        HD0009                         Transaction Type
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
WAREDET   WLOCITM1
WAREDET   ITMMAST
Record update for file IMS Warehouse Item Details  WD
Unable to update record for file IMS Warehouse Item Details  WD
Record update for file IMS Warehouse Item Types    WT
Unable to update record for file IMS Warehouse Item Types    WT
Record deleted from file IMS Whse/Item/Trans. Date
No record found to delete from file IMS Whse/Item/Trans. Date
