     F/TITLE BPCKLSD Update Picking list on hand
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BPCKLSD
     F*  Application ID      -    BPCKLSD
     F*  Application Name    -    Update Picking list on hand
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  PCKLSD      - (I/DISK   ) IMS Picking list details    PD
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  WLOCITM     - (U/DISK   ) IMS Warehouse Location Item WI
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  PCKLSDX     - (U/DISK   ) IMS Picking list details    PD
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SMSG - Error messages to job log.
     F* S001   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     F* S002   - GETREC d.pcklst,f.pcklsd,*ne,prcoyno,prseq
     F* S003   - Process To Reset File Pointer(EOF) - PCKLSD
     F* S004   - GETREC d.warehed,f.waredet,*eq,prcoyno,pdwhse,pditem
     F* S005   - UPDATE d.warehed,f.waredet
     F* S006   - Referential Integrity Check (Update) For File WAREDET
     F* S007   - GETREC d.warehed,f.wlocitm,*eq,prcoyno,pdwhse,pdlocn,pditem
     F* S008   - UPDATE d.warehed,f.wlocitm
     F* S009   - Referential Integrity Check (Update) For File WLOCITM
     F* S010   - DELETE D.PCKLST,F.PCKLSD,*ONE
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FPCKLSD    IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     RENAME(WLOCITMF:FMT001)
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWLOCITM   UF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPCKLSDX   UF   E             DISK
     F                                     INFDS(FIDS07)
     F                                     RENAME(PCKLSDF:PCKLSDFX)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A1              S             80    DIM(4) CTDATA PERRCD(1)              Alpha constants i
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
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
     IITMSTRF
     I              ITALPHA                     RN0001
     I              ITCOYNO                     RN0002
     I              ITIDESC                     RN0003
     IPCKLSDF
     I              PDCOYNO                     RN0004
     IWDETAILF
     I              WDCOYNO                     RN0005
     I              WDSUPPN                     RN0006
     IWARELOCF
     I              WLCOYNO                     RN0007
     IWLOCITMF
     I              WICOYNO                     RN0008
     IFMT001
     I              WICOYNO                     RN0009
     IPCKLSDFX
     I              PDCOYNO                     RN0004
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     *ENTRY        PLIST
     C                   PARM                    RTPARM            1
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ             5 0
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
     C                   KFLD                    KLCO01
     C                   KFLD                    KLSE02
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
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C                   KFLD                    KDIT04
     C*
     C     K0006         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0007         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0008         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLSE02
     C                   KFLD                    KDWH03
     C                   KFLD                    KDPC04
     C                   KFLD                    KDLO05
     C                   KFLD                    KDIT06
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    PDITEM        WK0001                         Item Number
     C     *LIKE         DEFINE    PDLOCN        WDLOCN                         Location
     C     *LIKE         DEFINE    PDTQTY        WDTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    PDWHSE        WK0002                         Warehouse Number
     C     *LIKE         DEFINE    RN0005        WK0003                         Company number
     C     *LIKE         DEFINE    WDITEM        WK0004                         Item Number
     C     *LIKE         DEFINE    WDQAL         WK0005                         Quantity Allocated
     C     *LIKE         DEFINE    WDQOH         WK0006                         Quantity on hand
     C     *LIKE         DEFINE    WDWHSE        WK0007                         Warehouse Number
     C     *LIKE         DEFINE    RN0008        WK0008                         Company number
     C     *LIKE         DEFINE    WIITEM        WK0009                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0010                         Location
     C     *LIKE         DEFINE    WIQAL         WK0011                         Quantity Allocated
     C     *LIKE         DEFINE    WIQOH         WK0012                         Quantity on hand
     C     *LIKE         DEFINE    WIWHSE        WK0013                         Warehouse Number
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0007        HD0006
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0009        HD0008
     C     *LIKE         DEFINE    WIWHSE        HD0011
     C     *LIKE         DEFINE    WIITEM        HD0009
     C     *LIKE         DEFINE    WILOCN        HD0010
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0004        HD0002
     C     *LIKE         DEFINE    PDSEQ         HDSEQ
     C     *LIKE         DEFINE    PDWHSE        HDWHSE
     C     *LIKE         DEFINE    PDPCKR        HDPCKR
     C     *LIKE         DEFINE    PDLOCN        HDLOCN
     C     *LIKE         DEFINE    PDITEM        HDITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0005        HD0003
     C     *LIKE         DEFINE    WDWHSE        HD0005
     C     *LIKE         DEFINE    WDITEM        HD0004
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0008        HD0007
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
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
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       KLCO01            3            PLCOYNO
     C                   MOVE      *ZEROS        KLSE02            5 0          PLSEQ
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       KDWH03            3            PDWHSE
     C                   MOVE      *BLANKS       KDPC04            5            PDPCKR
     C                   MOVE      *BLANKS       KDLO05           10            PDLOCN
     C                   MOVE      *BLANKS       KDIT06           20            PDITEM
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
     C* Read all picking list details
     C* SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C*
     C                   EXSR      S001
     C* GETREC d.pcklst,f.pcklsd,*ne,prcoyno,prseq
     C*
     C                   EXSR      S002
     C* DOW %sts(d.pcklst,f.pcklsd)=*yes
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
     C* Update warehouse item on hand and allocate
     C* GETREC d.warehed,f.waredet,*eq,prcoyno,pdwhse,pditem
     C*
     C                   EXSR      S004
     C* IF %sts(d.warehed,f.waredet) = *yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* WDQOH = wdqoh - pdtqty
     C     WK0006        SUB       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0006
     C* WDQAL = wdqal - pdtqty
     C     WK0005        SUB       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0005
     C* UPDATE d.warehed,f.waredet
     C*
     C                   EXSR      S005
     C* END                                                           *
     C                   END
     C* Update warehouse loc  on hand and allocate
     C* GETREC d.warehed,f.wlocitm,*eq,prcoyno,pdwhse,pdlocn,pditem
     C*
     C                   EXSR      S007
     C* IF %sts(d.warehed,f.wlocitm) = *yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* WIQOH = wiqoh - pdtqty
     C     WK0012        SUB       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0012
     C* WIQAL = wiqal - pdtqty
     C     WK0011        SUB       WDTQTY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0011
     C* UPDATE d.warehed,f.wlocitm
     C*
     C                   EXSR      S008
     C* END                                                           *
     C                   END
     C* delete this record get next
     C* DELETE D.PCKLST,F.PCKLSD,*ONE
     C*
     C                   EXSR      S010
     C* GETREC d.pcklst,f.pcklsd,*ne,prcoyno,prseq
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
     C* S001   - SETLL d.pcklst,f.pcklsd,prcoyno,prseq
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLSD    ITMM
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   WARE
     C                   MOVE      'N'           SWRD06                         RD.SW.WARELOC
     C                   MOVEL     *LOVAL        HDWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HDPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HDLOCN                         Location
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KLCO01
     C                   MOVEL     PRM001        HD0002                         Company number
     C                   MOVEL     PRM001        RN0004                         Company number
     C                   Z-ADD     PRSEQ         KLSE02
     C                   Z-ADD     PRSEQ         HDSEQ                          Picking list
     C                   Z-ADD     PRSEQ         PDSEQ                          Picking list
     C*
     C     K0001         SETLL     PCKLSD                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC d.pcklst,f.pcklsd,*ne,prcoyno,prseq
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM001        KLCO01
     C                   Z-ADD     PRSEQ         KLSE02
     C     K0001         READE     PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - PCKLSD
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.PCKLSD    ITMM
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0004        KLCO01
     C                   Z-ADD     PDSEQ         KLSE02                         Picking list
     C     K0001         SETGT     PCKLSD
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC d.warehed,f.waredet,*eq,prcoyno,pdwhse,pditem
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0002        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0001        KDIT03
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
     C* S005   - UPDATE d.warehed,f.waredet
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0003        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HD0005        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HD0004        KDIT03
     C     K0002         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0005        IFEQ      WK0003
     C     WDITEM        ANDEQ     WK0004
     C     WDQAL         ANDEQ     WK0005
     C     WDQOH         ANDEQ     WK0006
     C     WDWHSE        ANDEQ     WK0007
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S006                                         Refer.Integrity chk.
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
     C* S006   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S006          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0005        IFNE      WK0003
     C     WDWHSE        ORNE      WK0007
     C     WDITEM        ORNE      WK0004
     C                   MOVEL     RN0005        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0003         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(1)         MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $006
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0005        IFNE      WK0003
     C     WDITEM        ORNE      WK0004
     C*
     C                   MOVEL     WK0003        KDCO01                         Company number
     C                   MOVEL     WK0004        KDIT02                         Item Number
     C     K0004         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(2)         MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $006
     C                   END
     C                   END                                                    END-Compare fld.
     C     $006          ENDSR
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC d.warehed,f.wlocitm,*eq,prcoyno,pdwhse,pdlocn,pditem
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0002        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     WDLOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     WK0001        KDIT04
     C     K0005         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - UPDATE d.warehed,f.wlocitm
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0007        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HIWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03                         Location
     C                   MOVEL     HILOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HIITEM        KDIT04
     C     K0005         CHAIN     WLOCITM                            9091      CHAIN  WLOCITM
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0008        IFEQ      WK0008
     C     WIITEM        ANDEQ     WK0009
     C     WILOCN        ANDEQ     WK0010
     C     WIQAL         ANDEQ     WK0011
     C     WIQOH         ANDEQ     WK0012
     C     WIWHSE        ANDEQ     WK0013
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   ELSE
     C*
     C                   EXSR      S009                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WLOCITMF                             90      UPDATE WLOCITM
     C                   ELSE
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS03
     C                   END
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
     C* S009   - Referential Integrity Check (Update) For File WLOCITM
     C**************************************************************************
     C     S009          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0008        IFNE      WK0008
     C     WIWHSE        ORNE      WK0013
     C     WIITEM        ORNE      WK0009
     C*
     C                   MOVEL     WK0008        KICO01                         Company number
     C                   MOVEL     WK0013        KIWH02                         Warehouse Number
     C                   MOVEL     WK0009        KIIT03                         Item Number
     C     K0006         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(3)         MSGDTA                         WLOCITM   WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0008        IFNE      WK0008
     C     WIWHSE        ORNE      WK0013
     C     WILOCN        ORNE      WK0010
     C*
     C                   MOVEL     WK0008        KICO01                         Company number
     C                   MOVEL     WK0013        KIWH02                         Warehouse Number
     C                   MOVEL     WK0010        KILO03                         Location
     C     K0007         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(4)         MSGDTA                         WLOCITM   WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $009
     C                   END
     C                   END                                                    END-Compare fld.
     C     $009          ENDSR
     C/EJECT
     C**************************************************************************
     C* S010   - DELETE D.PCKLST,F.PCKLSD,*ONE
     C**************************************************************************
     C     S010          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     HRC01         CHAIN     PCKLSDX                            9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PCKLSDX                              91      DELETE PCKLSD
     C                   Z-ADD     STS07         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-CHAIN-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-CHAIN-XFILE
     C*
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C     K0008         SETLL     PCKLSD                                       RESUME FILE POINTER
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
     C                   UNLOCK    PCKLSDX                              91      PCKLSDX
     C                   READ      WLOCITM1                               90
     C                   READ      ITMMAST                                90
     C                   READ      WARELOC                                90
     C                   READ      PCKLSDX                                90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            PCKLSD
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
     C     WFILE#        IFEQ      3                                            WLOCITM
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            WLOCITM1
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
     C     WFILE#        IFEQ      6                                            WARELOC
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATUS
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            PCKLSDX
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
     C*          | Move Fields From Work Area To File - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        PDITEM                         Item Number
     C                   MOVEL     WDLOCN        PDLOCN                         Location
     C                   Z-ADD     WDTQTY        PDTQTY                         Transaction Quantity
     C                   MOVEL     WK0002        PDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0003        RN0005                         Company number
     C                   MOVEL     WK0004        WDITEM                         Item Number
     C                   Z-ADD     WK0005        WDQAL                          Quantity Allocated
     C                   Z-ADD     WK0006        WDQOH                          Quantity on hand
     C                   MOVEL     WK0007        WDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0008        RN0008                         Company number
     C                   MOVEL     WK0009        WIITEM                         Item Number
     C                   MOVEL     WK0010        WILOCN                         Location
     C                   Z-ADD     WK0011        WIQAL                          Quantity Allocated
     C                   Z-ADD     WK0012        WIQOH                          Quantity on hand
     C                   MOVEL     WK0013        WIWHSE                         Warehouse Number
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
     C*          | Move Fields From File To Work Area - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     PDITEM        WK0001                         Item Number
     C                   MOVEL     PDLOCN        WDLOCN                         Location
     C                   Z-ADD     PDTQTY        WDTQTY                         Transaction Quantity
     C                   MOVEL     PDWHSE        WK0002                         Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0004        HD0002                         Company number
     C                   Z-ADD     PDSEQ         HDSEQ                          Picking list
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     PDPCKR        HDPCKR                         Picking Route
     C                   MOVEL     PDLOCN        HDLOCN                         Location
     C                   MOVEL     PDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0005        WK0003                         Company number
     C                   MOVEL     WDITEM        WK0004                         Item Number
     C                   Z-ADD     WDQAL         WK0005                         Quantity Allocated
     C                   Z-ADD     WDQOH         WK0006                         Quantity on hand
     C                   MOVEL     WDWHSE        WK0007                         Warehouse Number
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0005        HD0003                         Company number
     C                   MOVEL     WDWHSE        HD0005                         Warehouse Number
     C                   MOVEL     WDITEM        HD0004                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0008        WK0008                         Company number
     C                   MOVEL     WIITEM        WK0009                         Item Number
     C                   MOVEL     WILOCN        WK0010                         Location
     C                   Z-ADD     WIQAL         WK0011                         Quantity Allocated
     C                   Z-ADD     WIQOH         WK0012                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0013                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0008        HD0007                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
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
WAREDET   WLOCITM1
WAREDET   ITMMAST
WLOCITM   WAREDET
WLOCITM   WARELOC
