     F/TITLE BPCKLST    Create picking list file
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    BPCKLST
     F*  Application ID      -    BPCKLST
     F*  Application Name    -       Create picking list file
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  KP : 19/04/02 From and to warehouse added to picking HDR file
     F*  KP : 19/04/02 Unit cost added to picking detail file
     F*  MS : 23/05/02 User Defined Picking list print program name extracted
     F*  from Data Area UDPPGMS.
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKMOV     - (I/DISK   ) IMS Stock movement history  ST
     F*  PCKLST      - (U/DISK   ) IMS Picking List            PL
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  PCKLSD      - (I/DISK   ) IMS Picking list details    PD
     F*  PCKLSDX     - (U/DISK   ) IMS Picking list details    PD
     F*  STOKMOVX    - (U/DISK   ) IMS Stock movement history  ST
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* SYSDAT - System Date
     F* SMSG - Error messages to job log.
     F* S001   - SETLL d.stokmov,f.stokmov,prcoyno
     F* S002   - GETREC d.stokmov,f.stokmov,*ne,prcoyno
     F* S003   - Process To Reset File Pointer(EOF) - STOKMOV
     F* S004   - WRITE d.pcklst,f.pcklst
     F* S005   - UPDATE d.stokmov,f.stokmov
     F* S006   - GETREC D.STOKMOV,F.WARELOC,*EQ,STCOYNO,STWHSE,STLOCN
     F* S007   - WRITE d.pcklst,f.pcklsd
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FSTOKMOV   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPCKLSD    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FSTOKMOVX  UF   E             DISK
     f                                     extdesc('STOKMOV')
     F                                     INFDS(FIDS06)
     F                                     RENAME(STOKMOVF:FMT001)
     F                                     INFSR(SFERR)
     FPCKLST    UF A E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPCKLSDX   UF A E             DISK
     F                                     extdesc('PCKLSD')
     F                                     INFDS(FIDS05)
     F                                     RENAME(PCKLSDF:PCKLSDFX)
     F                                     INFSR(SFERR)
     F*
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D*
     D* User Defined Print Programs
     D*
     D @DS002          DS            30
     D  RN0001                 1     30
     D  PPGM                   1     10
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
     D  USER                 254    263
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
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     IPCKLSDF
     I              PDCOYNO                     RN0002
     IPCKLSTF
     I              PLCOYNO                     RN0003
     ISTOKMOVF
     I              STBRNBR                     RN0004
     I              STCOYNO                     RN0005
     I              STSUPPN                     RN0006
     IWARELOCF
     I              WLCOYNO                     RN0007
     IPCKLSDFX
     I              PDCOYNO                     RN0002
     IFMT001
     I              STBRNBR                     RN0004
     I              STCOYNO                     RN0005
     I              STSUPPN                     RN0006
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM001            3
     C                   PARM                    PRSEQ
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
     C*
     C     K0002         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTLO03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    PDCOST        WDCOST                         Unit Cost
     C     *LIKE         DEFINE    RN0002        WK0001                         Company number
     C     *LIKE         DEFINE    PDITEM        WDITEM                         Item Number
     C     *LIKE         DEFINE    PDLOCN        WDLOCN                         Location
     C     *LIKE         DEFINE    PDPCKR        WDPCKR                         Picking Route
     C     *LIKE         DEFINE    PDSEQ         WDSEQ                          Picking list
     C     *LIKE         DEFINE    PDTQTY        WDTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    PDTRNC        WDTRNC                         Transaction Type
     C     *LIKE         DEFINE    PDWHSE        WDWHSE                         Warehouse Number
     C     *LIKE         DEFINE    RN0003        WK0002                         Company number
     C     *LIKE         DEFINE    PLCRBY        WK0003                         Created By
     C     *LIKE         DEFINE    PLCRDT        WK0004                         Created Date
     C     *LIKE         DEFINE    PLFWH         WLFWH                          From Warehouse
     C     *LIKE         DEFINE    PLSEQ         WLSEQ                          Picking List No.
     C     *LIKE         DEFINE    PLTWH         WLTWH                          To Warehouse (if tra
     C     *LIKE         DEFINE    RN0005        WK0005                         Company number
     C     *LIKE         DEFINE    STITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    STLOCN        WTLOCN                         Location
     C     *LIKE         DEFINE    STPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    STTQTY        WTTQTY                         Transaction Quantity
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STUCST        WTUCST                         Unit Cost
     C     *LIKE         DEFINE    STWEIG        WTWEIG                         Weight
     C     *LIKE         DEFINE    STWHSE        WTWHSE                         Warehouse Number
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    WLPCKR        WK0006                         Picking Route
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    PDSEQ         HDSEQ
     C     *LIKE         DEFINE    PDWHSE        HDWHSE
     C     *LIKE         DEFINE    PDPCKR        HDPCKR
     C     *LIKE         DEFINE    PDLOCN        HDLOCN
     C     *LIKE         DEFINE    PDITEM        HDITEM
     C     *LIKE         DEFINE    RN0003        HD0002
     C     *LIKE         DEFINE    PLSEQ         HLSEQ
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0005        HD0003
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0007        HD0004
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
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
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        DOW              15 6
     C                   MOVE      *BLANKS       FIRST            20
     C                   MOVE      *ZEROS        PRSEQ            15 5
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTLO03           10            STLOCN
     C                   MOVE      *BLANKS       RN0008           99
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             CALLST            1 0          CALL STSword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C*
     C     *DTAARA       DEFINE    PCKLST        @DS001            7 0
     C     *DTAARA       DEFINE    UDPPGMS       @DS002
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
     C* Read stok movements
     C* FIRST = 'Y'
     C                   MOVE      *BLANKS       FIRST
     C                   MOVEL     'Y'           FIRST
     C* SETLL d.stokmov,f.stokmov,prcoyno
     C*
     C                   EXSR      S001
     C* GETREC d.stokmov,f.stokmov,*ne,prcoyno
     C*
     C                   EXSR      S002
     C* DOW %sts(d.stokmov,f.stokmov)=*yes
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
     C* Only output required transactions
     C* IF stseq = *zero & stpckl = 'Y'
     C     WTSEQ         IFEQ      *ZERO
     C     WTPCKL        ANDEQ     'Y'
     C* first time in get pickinglist number
     C* IF first = 'Y'
     C     FIRST         IFEQ      'Y'
     C* GETDTAA PCKLST,*LOCK
     C     *LOCK         IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* PLSEQ = pcklst
     C                   Z-ADD     @DS001        WLSEQ
     C* PCKLST = pcklst + 1
     C     @DS001        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        @DS001
     C* UPDDTAA pcklst
     C                   OUT       @DS001                               93
     C* PLCOYNO = prcoyno
     C                   MOVE      PRM001        WK0002
     C* PLCRBY = *userid
     C                   MOVE      *BLANKS       WK0003
     C                   MOVEL     USER          WK0003
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C* PLCRDT = ##DATE
     C                   Z-ADD     ##DATE        WK0004
     C* PLFWH = stwhse    ; from warehouse
     C                   MOVE      WTWHSE        WLFWH
     C* PLTWH = stwhst    ; to warehouse
     C                   MOVE      WTWHST        WLTWH
     C* Output to picking list header
     C* WRITE d.pcklst,f.pcklst
     C*
     C                   EXSR      S004
     C*                                                               *
     C* ** Get used defined Print pgm if specified
     C* GETDTAA UDPPGMS
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* FIRST = 'N'
     C                   MOVE      *BLANKS       FIRST
     C                   MOVEL     'N'           FIRST
     C* END                                                           *
     C                   END
     C* Update stock movements with picking no.
     C* STSEQ = plseq
     C                   Z-ADD     WLSEQ         WTSEQ
     C* UPDATE d.stokmov,f.stokmov
     C*
     C                   EXSR      S005
     C* Get picking sequence
     C* GETREC D.STOKMOV,F.WARELOC,*EQ,STCOYNO,STWHSE,STLOCN
     C*
     C                   EXSR      S006
     C* Output to picking details
     C* PDCOYNO = plcoyno
     C                   MOVE      WK0002        WK0001
     C* PDSEQ = plseq
     C                   Z-ADD     WLSEQ         WDSEQ
     C* PDWHSE = stwhse
     C                   MOVE      WTWHSE        WDWHSE
     C* PDPCKR = wlpckr
     C                   MOVE      WK0006        WDPCKR
     C* PDITEM = stitem
     C                   MOVE      WTITEM        WDITEM
     C* PDLOCN = stlocn
     C                   MOVE      WTLOCN        WDLOCN
     C* PDTQTY = sttqty
     C                   Z-ADD     WTTQTY        WDTQTY
     C* PDTRNC = stttyp
     C                   MOVE      WTTTYP        WDTRNC
     C* PDCOST = stucst            ; unit cost
     C                   Z-ADD     WTUCST        WDCOST
     C* WRITE d.pcklst,f.pcklsd
     C*
     C                   EXSR      S007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GETREC d.stokmov,f.stokmov,*ne,prcoyno
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
     C* Print picking list
     C* IF first = 'N'
     C     FIRST         IFEQ      'N'
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* PRSEQ = plseq
     C                   Z-ADD     WLSEQ         PRSEQ
     C* IF PPGM <> ' '
     C     PPGM          IFNE      *BLANKS
     C* CALL PPGM,bat,prcoyno,prseq
     C                   Z-ADD     1             CALLST
     C                   CALL      PPGM          P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL 'PPCKLSTC',bat,prcoyno,prseq
     C                   Z-ADD     1             CALLST
     C                   CALL      'PPCKLSTC'    P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
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
     C* S001   - SETLL d.stokmov,f.stokmov,prcoyno
     C**************************************************************************
     C     S001          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV   EXPD
     C                   MOVE      'N'           SWRD03                         RD.SW.WARELOC   WLOC
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C*
     C                   MOVEL     PRM001        KTCO01
     C                   MOVEL     PRM001        HD0003                         Company number
     C                   MOVEL     PRM001        RN0005                         Company number
     C*
     C     K0001         SETLL     STOKMOV                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002   - GETREC d.stokmov,f.stokmov,*ne,prcoyno
     C**************************************************************************
     C     S002          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM001        KTCO01
     C     K0001         READE     STOKMOV                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKMOV   EXPD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV   EXPD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S003                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003   - Process To Reset File Pointer(EOF) - STOKMOV
     C**************************************************************************
     C     S003          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKMOV   EXPD
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKMOV   EXPD
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0005        KTCO01
     C     K0001         SETGT     STOKMOV
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S004   - WRITE d.pcklst,f.pcklst
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     PCKLSTF                              90      ADD REC TO PCKLST
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - UPDATE d.stokmov,f.stokmov
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   Z-ADD     HRC01         REC01
     C     HRC01         CHAIN     STOKMOVX                           9091
     C                   Z-ADD     STS06         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0005        IFEQ      WK0005
     C     STITEM        ANDEQ     WTITEM
     C     STLOCN        ANDEQ     WTLOCN
     C     STPCKL        ANDEQ     WTPCKL
     C     STSEQ         ANDEQ     WTSEQ
     C     STTQTY        ANDEQ     WTTQTY
     C     STTTYP        ANDEQ     WTTTYP
     C     STUCST        ANDEQ     WTUCST
     C     STWEIG        ANDEQ     WTWEIG
     C     STWHSE        ANDEQ     WTWHSE
     C     STWHST        ANDEQ     WTWHST
     C                   UNLOCK    STOKMOVX                             91      RLS LCK STOKMOVX
     C                   ELSE
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT001                               90      UPDATE STOKMOV
     C                   Z-ADD     STS06         STS01                          SYNC STATUS
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
     C**************************************************************************
     C* S006   - GETREC D.STOKMOV,F.WARELOC,*EQ,STCOYNO,STWHSE,STLOCN
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     WK0005        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     WTWHSE        KTWH02
     C                   MOVEL     *BLANK        KTLO03
     C                   MOVEL     WTLOCN        KTLO03
     C     K0002         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WARELOC   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - WRITE d.pcklst,f.pcklsd
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   WRITE     PCKLSDFX                             90      ADD REC TO PCKLSD
     C                   Z-ADD     STS05         STS04                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC05         REC04
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    PCKLSDX                              91      PCKLSDX   STOKMOVX
     C                   UNLOCK    STOKMOVX                             91      STOKMOVX
     C                   READ      PCKLST                                 90
     C                   READ      PCKLSD                                 90
     C                   READ      PCKLSDX                                90
     C                   READ      STOKMOVX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            STOKMOV
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            PCKLST
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            WARELOC
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            PCKLSD
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            PCKLSDX
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            STOKMOVX
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
     C*          | Move Fields From Work Area To File - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0005        RN0005                         Company number
     C                   MOVEL     WTITEM        STITEM                         Item Number
     C                   MOVEL     WTLOCN        STLOCN                         Location
     C                   MOVEL     WTPCKL        STPCKL                         Picking List Y/N
     C                   Z-ADD     WTSEQ         STSEQ                          Picking List No.
     C                   Z-ADD     WTTQTY        STTQTY                         Transaction Quantity
     C                   MOVEL     WTTTYP        STTTYP                         Transaction Type
     C                   Z-ADD     WTUCST        STUCST                         Unit Cost
     C                   Z-ADD     WTWEIG        STWEIG                         Weight
     C                   MOVEL     WTWHSE        STWHSE                         Warehouse Number
     C                   MOVEL     WTWHST        STWHST                         Other Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PCKLST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0002        RN0003                         Company number
     C                   MOVEL     WK0003        PLCRBY                         Created By
     C                   Z-ADD     WK0004        PLCRDT                         Created Date
     C                   MOVEL     WLFWH         PLFWH                          From Warehouse
     C                   Z-ADD     WLSEQ         PLSEQ                          Picking List No.
     C                   MOVEL     WLTWH         PLTWH                          To Warehouse (if tra
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     WDCOST        PDCOST                         Unit Cost
     C                   MOVEL     WK0001        RN0002                         Company number
     C                   MOVEL     WDITEM        PDITEM                         Item Number
     C                   MOVEL     WDLOCN        PDLOCN                         Location
     C                   MOVEL     WDPCKR        PDPCKR                         Picking Route
     C                   Z-ADD     WDSEQ         PDSEQ                          Picking list
     C                   Z-ADD     WDTQTY        PDTQTY                         Transaction Quantity
     C                   MOVEL     WDTRNC        PDTRNC                         Transaction Type
     C                   MOVEL     WDWHSE        PDWHSE                         Warehouse Number
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
     C*          | Move Fields From File To Work Area - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0005        WK0005                         Company number
     C                   MOVEL     STITEM        WTITEM                         Item Number
     C                   MOVEL     STLOCN        WTLOCN                         Location
     C                   MOVEL     STPCKL        WTPCKL                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   Z-ADD     STTQTY        WTTQTY                         Transaction Quantity
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        WTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        WTWEIG                         Weight
     C                   MOVEL     STWHSE        WTWHSE                         Warehouse Number
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0005        HD0003                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WLPCKR        WK0006                         Picking Route
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0007        HD0004                         Company number
     C                   MOVEL     WLWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     PDCOST        WDCOST                         Unit Cost
     C                   MOVEL     RN0002        WK0001                         Company number
     C                   MOVEL     PDITEM        WDITEM                         Item Number
     C                   MOVEL     PDLOCN        WDLOCN                         Location
     C                   MOVEL     PDPCKR        WDPCKR                         Picking Route
     C                   Z-ADD     PDSEQ         WDSEQ                          Picking list
     C                   Z-ADD     PDTQTY        WDTQTY                         Transaction Quantity
     C                   MOVEL     PDTRNC        WDTRNC                         Transaction Type
     C                   MOVEL     PDWHSE        WDWHSE                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   Z-ADD     PDSEQ         HDSEQ                          Picking list
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     PDPCKR        HDPCKR                         Picking Route
     C                   MOVEL     PDLOCN        HDLOCN                         Location
     C                   MOVEL     PDITEM        HDITEM                         Item Number
     C                   END
     C                   END
     C                   END
     C                   ENDSR
