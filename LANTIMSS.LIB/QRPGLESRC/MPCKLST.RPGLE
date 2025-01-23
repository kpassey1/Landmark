     F/TITLE MPCKLST    Pick list On hand Update
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MPCKLST
     F*  Application ID      -    MPCKLST
     F*  Application Name    -       Pick list On hand Update
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  PCKLST      - (U/DISK   ) IMS Picking List            PL
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PCKLSD      - (I/DISK   ) IMS Picking list details    PD
     F*  MPCKLSTD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCCHEK     - Check request is correct
     F*
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0001     - List Screen for PCKLST
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001S1 / FL0003 : DSPATR(ND)
     F*  06     - SCR001 / CYDESC : DSPATR(PC)
     F*  06     - SCR001 / CYDESC : DSPATR(RI)
     F*  63     - SCR001C1 SFLDSPCTL
     F*  64     - SCR001C1 SFLDSP
     F*  65     - SCR001S1 SFLNXTCHG
     F*  66     - SCR001C1 SFLINZ
     F*  99     - SCR001 OVERLAY
     F* N63     - SCR001C1 SFLCLR
     F* N64     - SCR001C1 ERASE(SCR001S1)
     F* N67     - SCR001C1 SFLEND
     F* N79     - SCR001 PUTOVR
     F* N79     - SCR001C1 PUTOVR
     F*
     F*  SC0004     - List Screen for PCKLSD
     F*
     F*  01     - SCR002 / CYDESC : DSPATR(PC)
     F*  01     - SCR002 / CYDESC : DSPATR(RI)
     F*  63     - SCR002C1 SFLDSPCTL
     F*  64     - SCR002C1 SFLDSP
     F*  65     - SCR002S1 SFLNXTCHG
     F*  66     - SCR002C1 SFLINZ
     F*  99     - SCR002 OVERLAY
     F* N63     - SCR002C1 SFLCLR
     F* N64     - SCR002C1 ERASE(SCR002S1)
     F* N67     - SCR002C1 SFLEND
     F* N79     - SCR002 PUTOVR
     F* N79     - SCR002C1 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for PCKLST
     F* S002 - List Screen for PCKLSD
     F* S003 - Check request is correct
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S04BKW - SCRN SUB
     F* S04FWD - SCRN SUB
     F* SY0010 - Format Date
     F* SMSG - calls message handling program to either clear, add, or
     F* S004   - GETREC d.company,f.company,*eq,prcoyno
     F* S005   - SETLL D.PCKLST,F.PCKLST,SVK001,SVK002
     F* S006   - SETLL D.PCKLST,F.PCKLSD,SVK003,SVK004
     F* S007   - DELETE d.pcklst,f.pcklst
     F* S008   - GETBLK D.PCKLST,F.PCKLST,*PV,prcoyno
     F* S009   - Process To Reset File Pointer(BOF) - PCKLST
     F* S010   - Process To Reset File Pointer(EOF) - PCKLST
     F* S011   - GETREC D.PCKLST,F.PCKLST,*EQ,PLCOYNO,PLSEQ
     F* S012   - GETREC D.PCKLST,F.PCKLST,*LOCK,*EQ,PLCOYNO,PLSEQ
     F* S013   - GETBLK D.PCKLST,F.PCKLSD,*PV,SVK003,SVK004
     F* S014   - Process To Reset File Pointer(BOF) - PCKLSD
     F* S015   - GETBLK D.PCKLST,F.PCKLSD,*ne,SVK003,SVK004
     F* S016   - Process To Reset File Pointer(EOF) - PCKLSD
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMPCKLSTD  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR002S1:RRN02)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPCKLSD    IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FPCKLST    UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(12)
     D A02             S              5  0 DIM(12)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(4) CTDATA PERRCD(1)              Alpha constants i
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(7) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(7) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D*
     D* INFDS for cursor location
     D*
     D DSPFDS          DS
     D  ROW                  370    370
     D  COL                  371    371
     D  SFLRRN               378    379B 0
     D*
     D* Work Data Structure for cursor
     D*
     D @DS001          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS002          DS
     D  FLDSCR                 1     10
     D  FLDNAM                11     20
     D  FLDINX                21     24  0
     D  DSPERR                25     25
     D  #DS                   26     26
     D  #HI                   27     27
     D  #RI                   28     28
     D  #UL                   29     29
     D  #BL                   30     30
     D  #CS                   31     31
     D  #PC                   32     32
     D  #ND                   33     33
     D  #PR                   34     34
     D  #GN                   35     35
     D  #RD                   36     36
     D  #PK                   37     37
     D  #WT                   38     38
     D  #TQ                   39     39
     D  #YW                   40     40
     D  #BU                   41     41
     D  DA6                   27     41    DIM(15)                              Fld Attr. Wrk Ary
     D  #ATRIB                11     41
     D  #FROM                 25     28  0
     D  #TO                   29     32  0
     D  #CLF                  25     32  0
     D  #MAP                   1     24
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('Invalid action choic-
     D                                     e')
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
     D* Message data structure
     D*
     D @DS003          DS
     D  MSGDTA                 1    132
     D  UMESG1                 1     51
     D  UMESG2                52    102
     D  UMESG3               103    132
     D*
     D* Program status data structure
     D*
     D SDS            SDS
     D  WSID                 244    253
     D  USER                 254    263
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
     I              CYCOYNO                     RN0007
     I              CYEMPCOL                    RN0008
     I              CYEMPHEAD                   RN0009
     I              CYPRDHEAD                   RN0010
     I              CYREFHEAD                   RN0011
     I              CYSDESC                     RN0012
     IPCKLSDF
     I              PDCOYNO                     RN0013
     IPCKLSTF
     I              PLCOYNO                     RN0014
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM003            3
     C                   PARM                    DTSEQ
     C*
     C     P0002         PLIST
     C                   PARM                    BAT
     C                   PARM                    WK0001            3
     C                   PARM                    XXSEQ
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM003            3
     C*
     C     PMSGCL        PLIST
     C                   PARM                    MSGACT            1
     C                   PARM                    MSGID
     C                   PARM                    MSGF             10
     C                   PARM                    MSGFL            10
     C                   PARM                    MSGDTA
     C*
     C     PHELP         PLIST
     C                   PARM                    APPSET
     C                   PARM                    APPTYP
     C                   PARM                    APPPGM
     C                   PARM                    APPSCR
     C                   PARM                    APPROW
     C                   PARM                    APPCOL
     C********************************************************************
     C*                   K e y      L i s t
     C********************************************************************
     C*
     C     K0001         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0002         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLSE02
     C*
     C     K0003         KLIST
     C                   KFLD                    KLCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDSE02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    PLCRDT        WLCRDT                         Created Date
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0007        HD0001
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
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C04               3 0
     C                   MOVE      *ZEROS        DTSEQ            15 5
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *BLANKS       FL0003           10
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *ZEROS        PRM002            5 0
     C                   MOVE      *ZEROS        PS0102            5 0
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *ZEROS        SVK002            5 0
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *ZEROS        SVK004            5 0
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0003           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0004            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP           20
     C                   MOVE      *BLANKS       RN0005            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0006            4            SYMMDDA
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        XXSEQ            15 5
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       KLCO01            3            PLCOYNO
     C                   MOVE      *ZEROS        KLSE02            5 0          PLSEQ
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KDCO01            3            PDCOYNO
     C                   MOVE      *ZEROS        KDSE02            5 0          PDSEQ
     C                   MOVE      *BLANKS       RN0015           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'LANDIMS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     1             CALLST            1 0          CALL STS
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
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
     C*
     C* Clear Message Subfile.
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C*      *------------------------------------------*
     C*      *  Process all screens.                    *
     C*      *------------------------------------------*
     C                   MOVEL     'SC0001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0004'      S002
     C     SCRNID        CASEQ     'SCCHEK'      S003
     C     SCRNID        CASEQ     'SEND'        SEND
     C                   END
     C                   END
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
     C                   MOVE      *BLANK        SCRNID
     C                   RETURN
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S001 - List Screen for PCKLST
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '001000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S004
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0004
     C* SYDSEP = CYDSEP
     C                   MOVE      *BLANKS       RN0005
     C                   MOVEL     WYDSEP        RN0005
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* PLSEQ = 0
     C                   Z-ADD     *ZERO         XLSEQ
     C* PLCRDT = 0
     C                   Z-ADD     *ZERO         WLCRDT
     C* PLCRBY = ' '
     C                   MOVEL     *BLANKS       XLCRBY
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = PRcoyno
     C                   MOVE      PRM003        SVK001
     C* SVK002 = 0
     C                   Z-ADD     *ZERO         SVK002
     C*                                                               *
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.PCKLST,F.PCKLST,SVK001,SVK002
     C*
     C                   EXSR      S005
     C*                                                               *
     C* Fill list Panel
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR001
     C* Turn off SFLDSP in case of empty subfile
     C     RRN01         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN01         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN01         DRN01
     C                   EXFMT     SCR001C1
     C     SFLRRN        IFGT      0
     C     DRN01         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN01
     C                   Z-ADD     SFLRRN        DRN01
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(6)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 12
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S01BKW
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C* IF PS0102<>0
     C     PS0102        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK002 = PS0102
     C                   Z-ADD     PS0102        SVK002
     C* PS0102 = 0
     C                   Z-ADD     *ZERO         PS0102
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* Set pointer to file.
     C* SETLL D.PCKLST,F.PCKLST,SVK001,SVK002
     C*
     C                   EXSR      S005
     C* Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - List Screen for PCKLSD
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* Set Keys to values from header file.
     C* SVK003 = PLCOYNO
     C                   MOVE      WK0001        SVK003
     C* SVK004 = PLSEQ
     C                   Z-ADD     XLSEQ         SVK004
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.PCKLST,F.PCKLSD,SVK003,SVK004
     C*
     C                   EXSR      S006
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S04FWD
     C                   EXSR      S04FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN63
     C                   MOVE      '1'           *IN65
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   WRITE     SCR002
     C* Turn off SFLDSP in case of empty subfile
     C     RRN02         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN02         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN02         DRN02
     C                   EXFMT     SCR002C1
     C     SFLRRN        IFGT      0
     C     DRN02         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN02
     C                   Z-ADD     SFLRRN        DRN02
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 3
     C*                                                               *
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen on
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     2. Fill panel.
     C* EXSUBR S04BKW
     C                   EXSR      S04BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     2. Fill Panel.
     C* EXSUBR S04FWD
     C                   EXSR      S04FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Check request is correct
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*
     C     DSPLY         DOWEQ     'Y'
     C*
     C                   MOVE      '1'           *IN79
     C                   MOVE      '0'           *IN99
     C* Write sub-file messages
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      '1'           *IN99
     C                   WRITE     MSGCTL
     C                   END
     C                   EXFMT     SCR003
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* RLSREC d.pcklst,f.pcklst
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    PCKLST                               91      RLS LCK PCKLST
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Accept
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* DTSEQ = plseq
     C                   Z-ADD     XLSEQ         DTSEQ
     C* CALL 'BPCKLSDC',bat,prcoyno,dtseq
     C                   Z-ADD     1             CALLST
     C                   CALL      'BPCKLSDC'    P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* DELETE d.pcklst,f.pcklst
     C*
     C                   EXSR      S007
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* SREDSP -  Redisplay Windows within stack.
     C*****************************************************************
     C     SREDSP        BEGSR
     C*
     C                   Z-ADD     SP            CT
     C     CT            DOWGT     1
     C     STY(CT)       ANDNE     'F'
     C                   SUB       1             CT
     C                   END
     C*
     C*  Redisplay Windows within stack.
     C*
     C     CT            DOWLE     SP
     C     CT            ANDGT     0
     C*
     C     SID(CT)       IFEQ      'SC0001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0004'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   WRITE     SCR002C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCCHEK'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   END
     C                   END
     C                   END
     C*
     C                   ADD       1             CT
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* S01BKW - SCRN SUB
     C*****************************************************************
     C     S01BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear hidden key arrays used for record
     C* ** retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = 0
     C                   Z-ADD     *ZERO         A02
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0003,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PCKLST,F.PCKLST,*PV,prcoyno
     C*
     C                   EXSR      S008
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM003        KLCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.PCKLST    PCKL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XLSEQ
     C                   MOVEL     *BLANKS       FL0003
     C                   MOVEL     *BLANKS       XLCRBY
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  PCKLST                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HLSEQ                          Picking List No.
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* *** Format the date
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = plcrdt  ; input date
     C                   Z-ADD     WLCRDT        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01BK
     C                   END
     C* FL0003 = SYDATO
     C                   MOVE      RN0003        FL0003
     C*                                                               *
     C* FLDATR fl0003,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = PLCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0001        A01(Z1)
     C* A002(C01) = PLSEQ
     C                   Z-ADD     XLSEQ         A02(Z1)
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XLSEQ
     C                   MOVEL     *BLANKS       FL0003
     C                   MOVEL     *BLANKS       XLCRBY
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S010                                         CHK EOF
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01EDT - SCRN SUB
     C*****************************************************************
     C     S01EDT        BEGSR
     C*
     C* ** Process Inquiry List Panel (IL)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I01 = 0
     C                   Z-ADD     *ZERO         Z2
     C* DOBLK D.PCKLST
     C*
     C                   Z-ADD     RRN01         SRN01                          Save RRN
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS01
     C     SRN01         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR001S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(6)
     C* I01 = I01+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* ** Reptrint
     C* IF FL0001=06
     C     FL0001        IFEQ      06
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* PLCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0001
     C* XXSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       XXSEQ
     C* CALL 'PPCKLSTC',BAT,PLCOYNO,XXSEQ
     C                   Z-ADD     1             CALLST
     C                   CALL      'PPCKLSTC'    P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Display details
     C* IF FL0001=07
     C     FL0001        IFEQ      07
     C* PLCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0001
     C* PLSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       XLSEQ
     C* GETREC D.PCKLST,F.PCKLST,*EQ,PLCOYNO,PLSEQ
     C*
     C                   EXSR      S011
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Accept picking list
     C* IF FL0001=08
     C     FL0001        IFEQ      08
     C* PLCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0001
     C* PLSEQ = A002(I01)
     C                   Z-ADD     A02(Z2)       XLSEQ
     C* GETREC D.PCKLST,F.PCKLST,*LOCK,*EQ,PLCOYNO,PLSEQ
     C*
     C                   EXSR      S012
     C* EXSCR SCchek
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0001<>0)&(UPDFLG=0)
     C     FL0001        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0001,'Invalid action choice'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(6)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*
     C     $S01ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01FWD - SCRN SUB
     C*****************************************************************
     C     S01FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear Hidden key arrays used for later
     C* ** record retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = 0
     C                   Z-ADD     *ZERO         A02
     C* FLDATR FL0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR FL0003,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PCKLST,F.PCKLST,*NE,prcoyno
     C*
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM003        KLCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN01
     C*
     C                   Z-ADD     1             XRN01                          Init Next RRN
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.PCKLST    PCKL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XLSEQ
     C                   MOVEL     *BLANKS       FL0003
     C                   MOVEL     *BLANKS       XLCRBY
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  PCKLST                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HLSEQ                          Picking List No.
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR FL0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* *** Format the date
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = plcrdt  ; input date
     C                   Z-ADD     WLCRDT        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* FL0003 = SYDATO
     C                   MOVE      RN0003        FL0003
     C* FLDATR FL0003,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = PLCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0001        A01(Z1)
     C* A002(C01) = PLSEQ
     C                   Z-ADD     XLSEQ         A02(Z1)
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XLSEQ
     C                   MOVEL     *BLANKS       FL0003
     C                   MOVEL     *BLANKS       XLCRBY
     C                   MOVEA     INS01         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR001S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     INS01         *IN
     C                   END
     C     RRN01         IFGT      SRN01
     C                   Z-ADD     SRN01         RRN01
     C                   END
     C                   EXSR      S010                                         RESET FP
     C* IF c01 = 0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S04BKW - SCRN SUB
     C*****************************************************************
     C     S04BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* GETBLK D.PCKLST,F.PCKLSD,*PV,SVK003,SVK004
     C*
     C                   EXSR      S013
     C                   EXSR      S015
     C*
     C     $S04BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S04FWD - SCRN SUB
     C*****************************************************************
     C     S04FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C04 = 0
     C                   Z-ADD     *ZERO         C04
     C* GETBLK D.PCKLST,F.PCKLSD,*NE,SVK003,SVK004
     C*
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   Z-ADD     SVK004        KDSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR002S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR002C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PCKLSD    ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XDWHSE
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       XDLOCN
     C                   Z-ADD     *ZEROS        XDTQTY
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0004         READE     PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDSEQ                          Picking list
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDPCKR                         Picking Route
     C                   MOVEL     *BLANK        HDLOCN                         Location
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* C04 = C04+1
     C     C04           ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        C04
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   MOVEL     *BLANKS       XDWHSE
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       XDLOCN
     C                   Z-ADD     *ZEROS        XDTQTY
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR002S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S016                                         RESET FP
     C* IF c04 = 0
     C     C04           IFEQ      *ZERO
     C* EXSUBR s04bkw
     C                   EXSR      S04BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S04FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S04FW        ENDSR
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
     C                   MOVEL     *BLANKS       RN0003
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0005        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0002        SYMMDD
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
     C                   MOVE      *BLANK        RN0001
     C                   MOVEL     SYCCYY        RN0001
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0006
     C                   MOVEL     SYMMDD        RN0006
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
     C     RN0004        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0004        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0005:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0003        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0002        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0003
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0002        RN0002
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0005        RN0005
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0004        RN0004
     C*
     C     $SY001        ENDSR
     C/EJECT
     C*****************************************************************
     C* SMSG - calls message handling program to either clear, add, or
     C*        remove messages from message subfile or extracts
     C*        messages from message files.
     C*****************************************************************
     C     SMSG          BEGSR
     C*
     C* Add message to message subfile
     C*
     C     MSGACT        IFEQ      'A'
     C     MSGACT        OREQ      'R'
     C                   MOVE      'Y'           MSGFLG
     C                   ELSE
     C* Clear message subfile or extract message from message file.
     C*
     C     MSGACT        IFEQ      'C'
     C                   MOVE      'N'           MSGFLG
     C                   END
     C                   END
     C*
     C     MSGACT        IFEQ      'C'
     C     MSGACT        OREQ      'A'
     C     MSGACT        OREQ      'E'
     C                   CALL      'CLMSG'       PMSGCL
     C                   MOVE      *BLANK        MSGID
     C                   MOVE      *BLANK        MSGF
     C                   MOVE      *BLANK        MSGFL
     C* Do not clear the message data field if message is extracted
     C* from message file
     C     MSGACT        IFNE      'E'
     C                   MOVE      *BLANK        MSGDTA
     C                   END
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM003        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - SETLL D.PCKLST,F.PCKLST,SVK001,SVK002
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C                   Z-ADD     *LOVAL        HLSEQ                          Picking List No.
     C*
     C                   MOVEL     SVK001        KLCO01
     C                   MOVEL     SVK001        HD0003                         Company number
     C                   MOVEL     SVK001        RN0014                         Company number
     C                   Z-ADD     SVK002        KLSE02
     C                   Z-ADD     SVK002        HLSEQ                          Picking List No.
     C                   Z-ADD     SVK002        PLSEQ                          Picking List No.
     C*
     C     K0002         SETLL     PCKLST                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.PCKLST,F.PCKLSD,SVK003,SVK004
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   MOVEL     *LOVAL        HDWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HDPCKR                         Picking Route
     C                   MOVEL     *LOVAL        HDLOCN                         Location
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     SVK003        KLCO01
     C                   MOVEL     SVK003        HD0002                         Company number
     C                   MOVEL     SVK003        RN0013                         Company number
     C                   Z-ADD     SVK004        KLSE02
     C                   Z-ADD     SVK004        HDSEQ                          Picking list
     C                   Z-ADD     SVK004        PDSEQ                          Picking list
     C*
     C     K0002         SETLL     PCKLSD                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - DELETE d.pcklst,f.pcklst
     C**************************************************************************
     C     S007          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     WK0001        KLCO01
     C                   Z-ADD     XLSEQ         KLSE02
     C     K0002         SETLL     PCKLST                                       SETLL  PCKLST
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - PCKLST
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     PCKLST                               9190    READE  PCKLST
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PCKLST                               91      DELETE PCKLST
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(1)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(2)         MSGDTA                         No record found to d
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
     C     K0002         SETLL     PCKLST                                       RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETBLK D.PCKLST,F.PCKLST,*PV,prcoyno
     C**************************************************************************
     C     S008          BEGSR
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     PRM003        KLCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN01        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ01        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD01        DOUNE     'Y'                                          RD.SW.PCKLST    PCKL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READPE(N) PCKLST                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   Z-ADD     *ZERO         HLSEQ                          Picking List No.
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S009                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - Process To Reset File Pointer(BOF) - PCKLST
     C**************************************************************************
     C     S009          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.PCKLST    PCKL
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0014        KLCO01
     C     K0003         SETLL     PCKLST
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(3)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(EOF) - PCKLST
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.PCKLST    PCKL
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0014        KLCO01
     C     K0003         SETGT     PCKLST
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(4)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.PCKLST,F.PCKLST,*EQ,PLCOYNO,PLSEQ
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     WK0001        KLCO01
     C                   Z-ADD     XLSEQ         KLSE02
     C     K0002         CHAIN(N)  PCKLST                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.PCKLST,F.PCKLST,*LOCK,*EQ,PLCOYNO,PLSEQ
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     WK0001        KLCO01
     C                   Z-ADD     XLSEQ         KLSE02
     C     K0002         CHAIN     PCKLST                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.PCKLST    PCKL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETBLK D.PCKLST,F.PCKLSD,*PV,SVK003,SVK004
     C**************************************************************************
     C     S013          BEGSR
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   Z-ADD     SVK004        KDSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN02        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ02        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PCKLSD    ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0004         READPE    PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDSEQ                          Picking list
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDPCKR                         Picking Route
     C                   MOVEL     *BLANK        HDLOCN                         Location
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S014                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(BOF) - PCKLSD
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PCKLSD    ITMM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0013        KDCO01
     C                   Z-ADD     PDSEQ         KDSE02                         Picking list
     C     K0004         SETLL     PCKLSD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(3)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - GETBLK D.PCKLST,F.PCKLSD,*ne,SVK003,SVK004
     C**************************************************************************
     C     S015          BEGSR
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   Z-ADD     SVK004        KDSE02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR002S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR002C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PCKLSD    ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XDWHSE
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       XDLOCN
     C                   Z-ADD     *ZEROS        XDTQTY
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0004         READE     PCKLSD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDSEQ                          Picking list
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDPCKR                         Picking Route
     C                   MOVEL     *BLANK        HDLOCN                         Location
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PCKLSD    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   MOVEL     *BLANKS       XDWHSE
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       XDLOCN
     C                   Z-ADD     *ZEROS        XDTQTY
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR002S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S016                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - Process To Reset File Pointer(EOF) - PCKLSD
     C**************************************************************************
     C     S016          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PCKLSD    ITMM
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PCKLSD    ITMM
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0013        KDCO01
     C                   Z-ADD     PDSEQ         KDSE02                         Picking list
     C     K0004         SETGT     PCKLSD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       14            WADJ02
     C                   END
     C                   MOVEL     A1(4)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C*****************************************************************
     C* *PSSR - Program Execution Errors Handler
     C*****************************************************************
     C     *PSSR         BEGSR
     C     UERCNT        IFNE      *ZERO
     C                   MOVEL     '*CANCL'      URSUME
     C                   ELSE
     C                   Z-ADD     1             UERCNT
     C                   MOVE      'R'           MSGACT
     C                   MOVE      *BLANKS       MSGF
     C                   MOVEL     'QCPFMSG'     MSGF
     C                   MOVE      *BLANKS       MSGFL
     C                   MOVEL     'QSYS'        MSGFL
     C                   MOVE      *BLANKS       MSGDTA
     C     UMSGTX        IFNE      *BLANKS
     C                   MOVEL     UMSGTX        MSGDTA
     C                   ELSE
     C                   MOVEL     UROUTN        MSGDTA
     C                   END
     C*
     C     USTAT         IFEQ      *ZEROS
     C                   MOVE      UFSTAT        USTAT
     C                   MOVE      UFSRCL        USRCLN
     C                   END
     C                   MOVE      USTAT         USTAT4
     C*
     C     MSGID         IFEQ      *BLANKS
     C                   MOVE      USTAT4        MSGID
     C                   MOVEL     'RPG'         MSGID
     C                   MOVEL     'QRPGMSGE'    MSGF
     C                   END
     C*
     C                   CALL      'CLMSG'       PMSGCL                   93
     C*
     C                   MOVEL     '1'           UEROPT
     C                   EXFMT     PSSR0001
     C*
     C     UEROPT        IFEQ      '1'
     C                   MOVEL     '*GETIN  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '2'
     C                   MOVEL     '*CANCL  '    URSUME
     C                   ELSE
     C     UEROPT        IFEQ      '3'
     C                   MOVE      '        '    URSUME
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   MOVEL     *BLANK        MSGID
     C                   MOVE      *ZERO         UERCNT
     C*
     C                   ENDSR     URSUME
     C*/EJECT
     C*****************************************************************
     C* SATRIB - Display Attribute Handler
     C*****************************************************************
     C     SATRIB        BEGSR
     C*
     C* FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX
     C*
     C                   Z-ADD     1             X0
     C     #MAP          LOOKUP    DA1(X0)                                90
     C     *IN90         IFEQ      '1'                                          IF FIND
     C                   MOVEA     DA2(X0)       DA3
     C*
     C*          ------------------------------------------------------
     C*          | @DSPERR/VALIDATION FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     DSPERR        IFNE      *BLANK
     C     DA3(6)        IFNE      *BLANK                                       TURN ON *PC
     C                   MOVE      DA3(6)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVE      '0'           *IN80
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,6 NE *BLANK
     C*
     C     DA3(2)        IFNE      *BLANK                                       TURN ON *RI
     C                   MOVE      DA3(2)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,2 NE *BLANK
     C*
     C     DA3(3)        IFNE      *BLANK                                       TURN OFF *UL
     C     DA3(16)       ANDEQ     ' Y'                                         KEEP UL
     C                   MOVE      DA3(3)        X1
     C     DSPERR        IFEQ      'X'
     C                   MOVEA     '0'           *IN(X1)
     C                   ELSE                                                   x-DSPERR EQ 'X'
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DSPERR EQ 'X'
     C                   END                                                    DA3,3 NE *BLANK
     C                   ELSE                                                   x-DSPERR NE *BL
     C*
     C*          ------------------------------------------------------
     C*          | *DS - RESET FIELD DISPLAY ATTRIBUTES
     C*          ------------------------------------------------------
     C     #DS           IFNE      *BLANK
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C     X0            IFEQ      3
     C     DA3(16)       ANDEQ     ' Y'
     C                   ELSE                                                   x-X0 EQ 3
     C                   MOVE      DA3(X0)       X1
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    X0 EQ 3
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C*          ------------------------------------------------------
     C*          | *DS - TURN ON ORIGINAL COLOR ATTRIBUTES
     C*          |       IF THERE IS NO COLOR SPECIFIED
     C*          ------------------------------------------------------
     C     DA3(17)       IFNE      *BLANK
     C     #GN           ANDEQ     *BLANK
     C     #RD           ANDEQ     *BLANK
     C     #WT           ANDEQ     *BLANK
     C     #PK           ANDEQ     *BLANK
     C     #TQ           ANDEQ     *BLANK
     C     #YW           ANDEQ     *BLANK
     C     #BU           ANDEQ     *BLANK
     C                   MOVE      DA3(17)       X1
     C                   MOVEA     '1'           *IN(X1)
     C                   END                                                    DA3,17 NE *BLAN
     C                   END                                                    #DS NE *BLANK
     C*
     C*          ------------------------------------------------------
     C*          | LOOP TO TURN ON/OFF ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     1             DO        15            X0
     C     DA3(X0)       IFNE      *BLANK
     C                   MOVE      DA3(X0)       X1
     C*          ------------------------------------------------------
     C*          | TURN ON ATTRIBUTE INDICATORS
     C*          ------------------------------------------------------
     C     DA6(X0)       IFNE      *BLANK
     C                   MOVEA     '1'           *IN(X1)
     C                   ELSE                                                   x-DA6,X0 NE *BL
     C*          ------------------------------------------------------
     C*          | FOR COLOR ATTRIBUTE, RESET OTHER COLOR THAT ARE
     C*          | NOT SPECIFIED.
     C*          ------------------------------------------------------
     C     X0            IFGE      9
     C     X0            ANDLE     15
     C     #GN           IFNE      *BLANK
     C     #RD           ORNE      *BLANK
     C     #WT           ORNE      *BLANK
     C     #PK           ORNE      *BLANK
     C     #TQ           ORNE      *BLANK
     C     #YW           ORNE      *BLANK
     C     #BU           ORNE      *BLANK
     C                   MOVEA     '0'           *IN(X1)
     C                   END                                                    #GN NE *BLANK
     C                   END                                                    X0 GE 9
     C                   END                                                    DA6,X0 NE *BLAN
     C                   END                                                    DA3,X0 NE *BLAN
     C                   END                                                    1 DO 15
     C                   END                                                    DSPERR NE *BLAN
     C                   END                                                    *IN90 EQ '1'
     C*
     C                   MOVE      *BLANK        #ATRIB
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            PCKLST
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATUS
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            COMPANY
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATUS
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            PCKLSD
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATUS
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - PCKLST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0014                         Company number
     C                   MOVEL     XLCRBY        PLCRBY                         Created By
     C                   Z-ADD     WLCRDT        PLCRDT                         Created Date
     C                   Z-ADD     XLSEQ         PLSEQ                          Picking List No.
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0014        WK0001                         Company number
     C                   MOVEL     PLCRBY        XLCRBY                         Created By
     C                   Z-ADD     PLCRDT        WLCRDT                         Created Date
     C                   Z-ADD     PLSEQ         XLSEQ                          Picking List No.
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0014        HD0003                         Company number
     C                   Z-ADD     PLSEQ         HLSEQ                          Picking List No.
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0007        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PCKLSD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     PDITEM        XDITEM                         Item Number
     C                   MOVEL     PDLOCN        XDLOCN                         Location
     C                   Z-ADD     PDTQTY        XDTQTY                         Transaction Quantity
     C                   MOVEL     PDWHSE        XDWHSE                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0013        HD0002                         Company number
     C                   Z-ADD     PDSEQ         HDSEQ                          Picking list
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     PDPCKR        HDPCKR                         Picking Route
     C                   MOVEL     PDLOCN        HDLOCN                         Location
     C                   MOVEL     PDITEM        HDITEM                         Item Number
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
Record deleted from file IMS Picking List            PL
No record found to delete from file IMS Picking List            PL
The beginning of the file was reached
The end of the file was reached
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  06      06
SC0004    XYDESC    0000  01      01
SC0001    FL0001    0000  0103    010402               Y
SC0001    FL0003    0000            05
