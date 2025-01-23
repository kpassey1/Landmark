     F/TITLE PRIMS Prompts for Batch/Report Jobs
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    PRIMS
     F*  Application ID      -    PRIMS
     F*  Application Name    -    Prompts for Batch/Report Jobs
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  PRIMSD      - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCR001     - Date Selection
     F*
     F*  01     - SCR001 / WSDATE : DSPATR(PC)
     F*  01     - SCR001 / WSDATE : DSPATR(RI)
     F*  02     - SCR001 / WSDATE : DSPATR(UL)
     F*  99     - SCR001 OVERLAY
     F* N79     - SCR001 PUTOVR
     F*
     F*  SCR002     - Stock Movement History Select
     F*
     F*  01     - SCR002 / CYDESC : DSPATR(PC)
     F*  01     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SCR003     - Period end cut-off date
     F*
     F*  99     - SCR003 OVERLAY
     F* N79     - SCR003 PUTOVR
     F*
     F*  SCSUBM     - Submit Screen
     F*
     F* N79     - SCR004 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Date Selection
     F* S002 - Stock Movement History Select
     F* S003 - Period end cut-off date
     F* S004 - Submit Screen
     F* SREDSP -  Redisplay Windows within stack.
     F* SYSDAT - System Date
     F* SY0010 - Format Date
     F* SY0020 - Alpha date to numeric
     F* SY0030 - Validate a Date
     F* SREM - Calculates the remainder of a division.
     F* SMSG - calls message handling program to either clear, add, or
     F* S005   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FPRIMSD    CF   E             WORKSTN
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D WK2             S              1    DIM(256)                             Alpha wrk array
     D WKA             S              1    DIM(256)                             Alpha wrk array
     D A01             S              1    DIM(10)
     D A02             S              1    DIM(8)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(5) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(5) ALT(DA1)
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
     D C0001           C                   CONST('PSTOKMOVC')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST(' Print Daily Stock M-
     D                                     ovements  ')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('  Print Expected Del-
     D                                     iveries   ')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('PSTKMHISC')
     D*
     D* Named constants
     D*
     D C0005           C                   CONST('    Stock Movement H-
     D                                     istory    ')
     D*
     D* Named constants
     D*
     D C0006           C                   CONST('PSTOKSTATC')
     D*
     D* Named constants
     D*
     D C0007           C                   CONST('     Stock Status Re-
     D                                     port      ')
     D*
     D* Named constants
     D*
     D C0008           C                   CONST('PSTOKVALC')
     D*
     D* Named constants
     D*
     D C0009           C                   CONST(' Theoretical Stock V-
     D                                     aluation  ')
     D*
     D* Named constants
     D*
     D C0010           C                   CONST('          Period End-
     D                                               ')
     D*
     D* Named constants
     D*
     D C0011           C                   CONST('      Print Picking -
     D                                     List      ')
     D*
     D* Named constants
     D*
     D C0012           C                   CONST('  Replenishment by W-
     D                                     arehouse  ')
     D*
     D* Named constants
     D*
     D C0013           C                   CONST('  Replenishment by L-
     D                                     ocation   ')
     D*
     D* Named constants
     D*
     D C0014           C                   CONST('           Year End -
     D                                               ')
     D*
     D* Named constants
     D*
     D C0015           C                   CONST('Job will be submitte-
     D                                     d to batch')
     D*
     D* Named constants
     D*
     D C0016           C                   CONST('Job will be processe-
     D                                     d on line')
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
     I              CYCOYNO                     RN0016
     I              CYEMPCOL                    RN0017
     I              CYEMPHEAD                   RN0018
     I              CYPRDHEAD                   RN0019
     I              CYREFHEAD                   RN0020
     I              CYSDESC                     RN0021
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PRMBAT
     C                   PARM                    PRM001            3
     C                   PARM                    DTDATE
     C*
     C     P0002         PLIST
     C                   PARM                    PRMBAT
     C                   PARM                    PRM001            3
     C*
     C     P0003         PLIST
     C                   PARM                    PRMBAT
     C                   PARM                    PRM001            3
     C                   PARM                    FWHSE
     C                   PARM                    TWHSE
     C                   PARM                    FITEM
     C                   PARM                    TITEM
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM002           20
     C                   PARM                    PRM001            3
     C                   PARM                    XDMY              6 0
     C                   PARM                    XYMD              6 0
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
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0016        WK0001                         Company number
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0016        HD0001
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        NARG2            30 9          Numer argument2
     C                   MOVE      *ZEROS        C2                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        NARG1            30 9          Numer argument1
     C                   MOVE      *ZEROS        NRSLT            30 9          Numeric result
     C                   MOVE      *ZEROS        NWK300           30 0          Numeric wrk fld
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
     C                   MOVE      *ZEROS        ##CEN             4 0
     C                   MOVE      *ZEROS        ##DMY             8 0
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *ZEROS        ##YMD             8 0
     C                   MOVE      *ZEROS        DTDATE           15 5
     C                   MOVE      *BLANKS       DTSUBM           30
     C                   MOVE      *BLANKS       FITEM            20
     C                   MOVE      *BLANKS       FWHSE             3
     C                   MOVE      *BLANKS       PGMDES           30
     C                   MOVE      *BLANKS       PRMBAT            1
     C                   MOVE      *BLANKS       PRMPGM           10
     C                   MOVE      *BLANKS       SCFLG             1
     C                   MOVE      *ZEROS        SVDATV           15 6
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0001            4            SYCCYYA
     C                   MOVE      *ZEROS        SYCMD             8 0
     C                   MOVE      *ZEROS        RN0002            8 0          SYCMD
     C                   MOVE      *BLANKS       SYCMDA            8
     C                   MOVE      *ZEROS        SYCYN             4 0
     C                   MOVE      *BLANKS       RN0003           10            SYDATAI
     C                   MOVE      *BLANKS       RN0004           10            SYDATAI
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0005            8 0          SYDATI
     C                   MOVE      *ZEROS        RN0006            8 0          SYDATNO
     C                   MOVE      *ZEROS        RN0007            8 0          SYDATNO
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0008           10            SYDATO
     C                   MOVE      *ZEROS        SYDATV            8 0
     C                   MOVE      *ZEROS        RN0009            8 0          SYDATV
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *ZEROS        SYDDN             2 0
     C                   MOVE      *BLANKS       SYDERR            1
     C                   MOVE      *BLANKS       RN0010            1            SYDERR
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0011            1            SYDFMT
     C                   MOVE      *BLANKS       RN0012            1            SYDFMT
     C                   MOVE      *ZEROS        SYDMC             8 0
     C                   MOVE      *BLANKS       SYDMCA            8
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0013            1            SYDSEP
     C                   MOVE      *BLANKS       RN0014            1            SYDSEP
     C                   MOVE      *ZEROS        SYMDC             8 0
     C                   MOVE      *BLANKS       SYMDCA            8
     C                   MOVE      *ZEROS        SYMDN             4 0
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0015            4            SYMMDDA
     C                   MOVE      *ZEROS        SYMMN             2 0
     C                   MOVE      *ZEROS        Z1                2 0          SY1
     C                   MOVE      *ZEROS        Z2                2 0          SY2
     C                   MOVE      *BLANKS       TITEM            20
     C                   MOVE      *BLANKS       TWHSE             3
     C                   MOVE      *BLANKS       WKCYY             4
     C                   MOVE      *BLANKS       WKDA8F            8
     C                   MOVE      *BLANKS       WKDDA             2
     C                   MOVE      *ZEROS        WKEND             2 0
     C                   MOVE      *ZEROS        WKLEAP           15 6
     C                   MOVE      *BLANKS       WKMMA             2
     C                   MOVE      *BLANKS       WSDATE           10
     C                   MOVE      *ZEROS        WSDTTR            8 0
     C                   MOVE      *BLANKS       YESNO             1
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       RN0022           99
     C                   MOVE      *BLANKS       RN0023           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       RN0024           99
     C                   MOVE      *BLANKS       RN0025           99
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
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
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
     C                   MOVEL     'SCR001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SCR001'      S001
     C     SCRNID        CASEQ     'SCR002'      S002
     C     SCRNID        CASEQ     'SCR003'      S003
     C     SCRNID        CASEQ     'SCSUBM'      S004
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
     C* S001 - Date Selection
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* Move program passed to 10 byte field.
     C* PRMPGM = %LJF(PRPRGRM)
     C*  Left Justify field into result field
     C                   MOVEL     PRM002        PRMPGM
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C*
     C                   EXSR      S005
     C*                                                               *
     C* SYDFMT = cydfmt
     C                   MOVE      WYDFMT        RN0012
     C* SYDSEP = cydsep
     C                   MOVE      WYDSEP        RN0014
     C*                                                               *
     C* EXSUBR sysdat
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0008
     C* SYDATI = ##ymd
     C                   Z-ADD     ##YMD         RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* WSDATE = SYDATO
     C                   MOVE      RN0008        WSDATE
     C* Check program called & output appropriate screen.
     C*                                                               *
     C* *** Daily Movements report ***
     C* IF PRMPGM = 'PSTOKMOVC'
     C     PRMPGM        IFEQ      C0001
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = ' Print Daily Stock Movements  '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0002         PGMDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Expected Deliveries ***
     C* IF PRMPGM = 'BPEDELC'
     C     PRMPGM        IFEQ      'BPEDELC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = '  Print Expected Deliveries   '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0003         PGMDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Stock Movement History ***
     C* IF PRMPGM = 'PSTKMHISC'
     C     PRMPGM        IFEQ      C0004
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = '    Stock Movement History    '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0005         PGMDES
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Stock Status ***
     C* IF PRMPGM = 'PSTOKSTATC'
     C     PRMPGM        IFEQ      C0006
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = '     Stock Status Report      '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0007         PGMDES
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Stock Valuation ***
     C* IF PRMPGM = 'PSTOKVALC'
     C     PRMPGM        IFEQ      C0008
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = ' Theoretical Stock Valuation  '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0009         PGMDES
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Period End ***
     C* IF PRMPGM = 'IMSMENDC'
     C     PRMPGM        IFEQ      'IMSMENDC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'N'
     C                   MOVE      'N'           SCFLG
     C* PGMDES = '          Period End          '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0010         PGMDES
     C* EXSCR SCR003
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Picking List ***
     C* IF PRMPGM = 'BPCKLSTC'
     C     PRMPGM        IFEQ      'BPCKLSTC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'Y'
     C                   MOVE      'Y'           SCFLG
     C* PGMDES = '      Print Picking List      '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0011         PGMDES
     C* EXSCR scsubm
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno ='Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Replenishment by Warehouse ***
     C* IF PRMPGM = 'BPRPLNC'
     C     PRMPGM        IFEQ      'BPRPLNC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'Y'
     C                   MOVE      'Y'           SCFLG
     C* PGMDES = '  Replenishment by Warehouse  '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0012         PGMDES
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno ='Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Replenishment by Warehouse ***
     C* IF PRMPGM = 'PLRPLNC'
     C     PRMPGM        IFEQ      'PLRPLNC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'Y'
     C                   MOVE      'Y'           SCFLG
     C* PGMDES = '  Replenishment by Location   '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0013         PGMDES
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno ='Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Year End ***
     C* IF PRMPGM = 'BCYMVSMC'
     C     PRMPGM        IFEQ      'BCYMVSMC'
     C* PRMBAT = 'B'
     C                   MOVE      'B'           PRMBAT
     C* SCFLG = 'Y'
     C                   MOVE      'Y'           SCFLG
     C* PGMDES = '           Year End           '
     C                   MOVE      *BLANKS       PGMDES
     C                   MOVEL     C0014         PGMDES
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno ='Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
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
     C                   EXFMT     SCR001
     C                   MOVEA     '01'          *IN(1)
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
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* *** Check the input date
     C*                                                               *
     C* SYDATAI = WSDATE
     C                   MOVE      WSDATE        RN0004
     C* SYDATNO = *ZEROS
     C                   Z-ADD     *ZEROS        RN0007
     C* SYCMD = *zeros
     C                   Z-ADD     *ZEROS        RN0002
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*                                                               *
     C* *** VALIDATE THE INPUT DATE
     C* SYDATV = SYCMD
     C                   Z-ADD     RN0002        RN0009
     C* SYDERR = '0'
     C                   MOVE      '0'           RN0010
     C* EXSUBR SY0030
     C                   EXSR      SY0030
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* IF SYDERR = '1'
     C     RN0010        IFEQ      '1'
     C* DSPERR WSDATE,'USR0007','ERRORS',*LIBL
     C                   MOVEL     'USR0007'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WSDATE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* SYDATI = SYCMD
     C                   Z-ADD     RN0002        RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* WSDATE = SYDATO
     C                   MOVE      RN0008        WSDATE
     C* END                                                           *
     C                   END
     C* *** Call report print program.
     C* IF SYDERR = '0'
     C     RN0010        IFEQ      '0'
     C* DTDATE = SYCMD
     C                   Z-ADD     RN0002        DTDATE
     C* YESNO = 'N'
     C                   MOVE      'N'           YESNO
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno = 'Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO,DTDATE
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Stock Movement History Select
     C*****************************************************************
     C     S002          BEGSR
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
     C                   EXFMT     SCR002
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
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* *** Call report print program.
     C* YESNO = 'N'
     C                   MOVE      'N'           YESNO
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno = 'Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO,FWHSE,TWHSE,FITEM,TITEM
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0003                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Period end cut-off date
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
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* *** Call Period End control procedure.
     C* SYDATAI = WSDATE
     C                   MOVE      WSDATE        RN0004
     C* EXSUBR sy0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* *** VALIDATE THE DATE
     C* DTDATE = SYCMD
     C                   Z-ADD     RN0002        DTDATE
     C* SYDATV = DTDATE
     C                   Z-ADD     DTDATE        RN0009
     C* SYDERR = '0'
     C                   MOVE      '0'           RN0010
     C* EXSUBR SY0030
     C                   EXSR      SY0030
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* YESNO = 'N'
     C                   MOVE      'N'           YESNO
     C*                                                               *
     C* IF SYDERR = '1'
     C     RN0010        IFEQ      '1'
     C* DSPERR *NONE,'USR0007','ERRORS',*LIBL
     C                   MOVEL     'USR0007'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* SYDATI = SYCMD
     C                   Z-ADD     RN0002        RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* WSDATE = SYDATO
     C                   MOVE      RN0008        WSDATE
     C* ELSE                                                          *
     C                   ELSE
     C* *** Process if date is valid
     C* EXSCR SCSUBM
     C                   ADD       1             SP
     C                   MOVEL     'SCR003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* IF yesno = 'Y'
     C     YESNO         IFEQ      'Y'
     C* CALL PRMPGM,PRMBAT,PRCOYNO,DTDATE
     C                   Z-ADD     1             CALLST
     C                   CALL      PRMPGM        P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 - Submit Screen
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Display job type.
     C* IF PRMBAT = 'B'
     C     PRMBAT        IFEQ      'B'
     C* DTSUBM = 'Job will be submitted to batch'
     C                   MOVE      *BLANKS       DTSUBM
     C                   MOVEL     C0015         DTSUBM
     C* ELSE                                                          *
     C                   ELSE
     C* DTSUBM = 'Job will be processed on line'
     C                   MOVE      *BLANKS       DTSUBM
     C                   MOVEL     C0016         DTSUBM
     C* END                                                           *
     C                   END
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
     C                   EXFMT     SCR004
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
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* IF SCFLG = 'N'
     C     SCFLG         IFEQ      'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* ELSE                                                          *
     C                   ELSE
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* YESNO = 'Y'
     C                   MOVE      'Y'           YESNO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   END
     C                   END
     C     $00499        ENDSR
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
     C     SID(CT)       IFEQ      'SCR001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR002'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR003'
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   ELSE
     C     SID(CT)       IFEQ      'SCSUBM'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   END
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
     C* SYSDAT - System Date
     C*****************************************************************
     C     SYSDAT        BEGSR
     C*
     C* ##YEAR = %LJF(*YMD)
     C*  Left Justify field into result field
     C                   MOVEL     XYMD          ##YEAR
     C* ##YMD = *ZEROS
     C                   Z-ADD     *ZEROS        ##YMD
     C* ##DMY = *ZEROS
     C                   Z-ADD     *ZEROS        ##DMY
     C* ##DMY = %LJF(*DMY)
     C*  Left Justify field into result field
     C                   MOVEL     XDMY          ##DMY
     C* ##YMD = 20000000 + *YMD
     C     20000000      ADD       XYMD          NRSLT0
     C                   Z-ADD     NRSLT0        ##YMD
     C* ##CEN = 2000 + ##YEAR
     C     2000          ADD       ##YEAR        NRSLT0
     C                   Z-ADD     NRSLT0        ##CEN
     C* ##DMY = %RJF(##CEN)
     C*  Right Justify field into result field
     C                   MOVE      ##CEN         ##DMY
     C*
     C     $SYSDA        ENDSR
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
     C                   MOVEL     *BLANKS       RN0008
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0014        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0005        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0005        SYMMDD
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
     C                   MOVE      *BLANK        RN0015
     C                   MOVEL     SYMMDD        RN0015
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
     C     RN0012        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0012        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0008        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0008        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0008
     C                   MOVEL     ARSLT0        RN0008
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0005        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0008
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0005        RN0005
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0014        RN0014
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0012        RN0012
     C*
     C     $SY001        ENDSR
     C/EJECT
     C*****************************************************************
     C* SY0020 - Alpha date to numeric
     C*****************************************************************
     C     SY0020        BEGSR
     C*
     C* *** Character date to a number date
     C* *** INPUT PARAMETER = SYDATAI - Character date incl /'s   10A
     C* ***                 = SYDSEP - date seperator
     C* ***                 = SYDFMT - date format
     C* *** OUTPUT PARAMETER = SYDATNO - unformatted numeric date  8,0S
     C* ***                  = SYMDC - the date in MDC format      8,0S  #MDC
     C* ***                  = SYDMC - the date in DMC format      8,0S  #DMC
     C* ***                  = SYCMD - the date in DMC format      8,0S  #CMD
     C* ***                                                           *
     C* SYDATNO = *zeros
     C                   Z-ADD     *ZEROS        RN0007
     C* ***                                                           *
     C* IF SYDSEP = ' '
     C     RN0014        IFEQ      *BLANKS
     C* SYDSEP = '/'           ;default seperator
     C                   MOVE      '/'           RN0014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA10 = *blanks
     C                   MOVEA     *BLANKS       A01
     C* WKDA10 = %MVA(SYDATAI); char date to array
     C*  Move array instruction
     C                   MOVEA     RN0004        A01
     C* WKDA8 = *blanks
     C                   MOVEA     *BLANKS       A02
     C* SY1 = 1 ; input index
     C                   Z-ADD     1             Z1
     C* SY2 = 1 ; output index
     C                   Z-ADD     1             Z2
     C*                                                               *
     C* DOW sy1 < 11
     C     Z1            DOWLT     11
     C* *** Drop the seperators
     C* IF WKDA10(SY1) <> ' ' & SY2 < 9 ; process the input
     C     A01(Z1)       IFNE      *BLANKS
     C     Z2            ANDLT     9
     C*                                                               *
     C* *** Drop anything that is not a number
     C*                                                               *
     C* IF WKDA10(SY1) >= '0' *and WKDA10(SY1) <='9'
     C     A01(Z1)       IFGE      '0'
     C     A01(Z1)       ANDLE     '9'
     C* WKDA8(SY2) = WKDA10(SY1)
     C                   MOVE      *BLANKS       A02(Z2)
     C                   MOVE      A01(Z1)       A02(Z2)
     C* *** Ignore non-numerics
     C* SY2 = sy2 + 1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* SY1 = sy1 + 1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA8F = %MVA(wkda8) ; array to field
     C*  Move array instruction
     C                   MOVEA     A02           WKDA8F
     C* SYDATNO = %CTN(WKDA8F); stripped date to number
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        RN0007
     C                   MOVE      WKDA8F        RN0007
     C* ***                                                           *
     C* *** Create system base date
     C* ***                                                           *
     C* IF SYDFMT = '1' ; the input date should be in DMC format
     C     RN0012        IFEQ      '1'
     C* WKDDA = %SUB(WKDA8F,1,2)
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     2             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKDDA
     C                   MOVEL     ARSLT0        WKDDA
     C* WKMMA = %SUB(WKDA8F,3,2)
     C*  Substring
     C                   Z-ADD     3             C1
     C                   Z-ADD     2             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKMMA
     C                   MOVEL     ARSLT0        WKMMA
     C* WKCYY = %SUB(WKDA8F,5,4)
     C*  Substring
     C                   Z-ADD     5             C1
     C                   Z-ADD     4             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKCYY
     C                   MOVEL     ARSLT0        WKCYY
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2' ; the input date should be in MDC format
     C     RN0012        IFEQ      '2'
     C* WKDDA = %SUB(WKDA8F,3,2)
     C*  Substring
     C                   Z-ADD     3             C1
     C                   Z-ADD     2             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKDDA
     C                   MOVEL     ARSLT0        WKDDA
     C* WKMMA = %SUB(WKDA8F,1,2)
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     2             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKMMA
     C                   MOVEL     ARSLT0        WKMMA
     C* WKCYY = %SUB(WKDA8F,5,4)
     C*  Substring
     C                   Z-ADD     5             C1
     C                   Z-ADD     4             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  WKDA8F:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WKCYY
     C                   MOVEL     ARSLT0        WKCYY
     C* END                                                           *
     C                   END
     C* ***                                                           *
     C* *** Create base date for validation
     C* ***                                                           *
     C* SYDMCA = ' '
     C                   MOVEL     *BLANKS       SYDMCA
     C* SYDMCA = %CON(SYDMCA,WKDDA)
     C*  Concatenate
     C     SYDMCA        CAT(P)    WKDDA:0       ARSLT0
     C                   MOVE      *BLANKS       SYDMCA
     C                   MOVEL     ARSLT0        SYDMCA
     C* SYDMCA = %CON(SYDMCA,WKMMA)
     C*  Concatenate
     C     SYDMCA        CAT(P)    WKMMA:0       ARSLT0
     C                   MOVE      *BLANKS       SYDMCA
     C                   MOVEL     ARSLT0        SYDMCA
     C* SYDMCA = %CON(SYDMCA,WKCYY)
     C*  Concatenate
     C     SYDMCA        CAT(P)    WKCYY:0       ARSLT0
     C                   MOVE      *BLANKS       SYDMCA
     C                   MOVEL     ARSLT0        SYDMCA
     C* SYDMC = %CTN(SYDMCA)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        SYDMC
     C                   MOVE      SYDMCA        SYDMC
     C*                                                               *
     C* SYMDCA = ' '
     C                   MOVEL     *BLANKS       SYMDCA
     C* SYMDCA = %CON(SYMDCA,WKMMA)
     C*  Concatenate
     C     SYMDCA        CAT(P)    WKMMA:0       ARSLT0
     C                   MOVE      *BLANKS       SYMDCA
     C                   MOVEL     ARSLT0        SYMDCA
     C* SYMDCA = %CON(SYMDCA,WKDDA)
     C*  Concatenate
     C     SYMDCA        CAT(P)    WKDDA:0       ARSLT0
     C                   MOVE      *BLANKS       SYMDCA
     C                   MOVEL     ARSLT0        SYMDCA
     C* SYMDCA = %CON(SYMDCA,WKCYY)
     C*  Concatenate
     C     SYMDCA        CAT(P)    WKCYY:0       ARSLT0
     C                   MOVE      *BLANKS       SYMDCA
     C                   MOVEL     ARSLT0        SYMDCA
     C* SYMDC = %CTN(SYMDCA)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        SYMDC
     C                   MOVE      SYMDCA        SYMDC
     C*                                                               *
     C* SYCMDA = ' '
     C                   MOVEL     *BLANKS       SYCMDA
     C* SYCMDA = %CON(SYcmdA,WKCYY)
     C*  Concatenate
     C     SYCMDA        CAT(P)    WKCYY:0       ARSLT0
     C                   MOVE      *BLANKS       SYCMDA
     C                   MOVEL     ARSLT0        SYCMDA
     C* SYCMDA = %CON(SYcmda,WKMMA)
     C*  Concatenate
     C     SYCMDA        CAT(P)    WKMMA:0       ARSLT0
     C                   MOVE      *BLANKS       SYCMDA
     C                   MOVEL     ARSLT0        SYCMDA
     C* SYCMDA = %CON(SYcmda,WKdda)
     C*  Concatenate
     C     SYCMDA        CAT(P)    WKDDA:0       ARSLT0
     C                   MOVE      *BLANKS       SYCMDA
     C                   MOVEL     ARSLT0        SYCMDA
     C* SYCMD = %CTN(SYCMDA)
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        RN0002
     C                   MOVE      SYCMDA        RN0002
     C* ***                                                           *
     C* *** Initialise the input fields
     C* ***                                                           *
     C* SYDSEP = SYDSEP
     C                   MOVE      RN0014        RN0014
     C* SYDFMT = SYDFMT
     C                   MOVE      RN0012        RN0012
     C* SYDATAI = SYDATAI
     C                   MOVE      RN0004        RN0004
     C*
     C     $SY002        ENDSR
     C/EJECT
     C*****************************************************************
     C* SY0030 - Validate a Date
     C*****************************************************************
     C     SY0030        BEGSR
     C*
     C* *** Input SYDATV 8/0 - CMD format
     C* SYDERR = '0' ; 1=error 0=Valid
     C                   MOVE      '0'           RN0010
     C* IF sydatv <> 0
     C     RN0009        IFNE      *ZERO
     C*                                                               *
     C* *** Split the date
     C*                                                               *
     C* SYCYN = %ljf(sydatv)  ; CYY portion
     C*  Left Justify field into result field
     C                   MOVEL     RN0009        SYCYN
     C* SYMDN = %rjf(sydatv)  ; MMDD portion
     C*  Right Justify field into result field
     C                   MOVE      RN0009        SYMDN
     C* SYMMN = %LJF(SYMDN)   ; MM portion
     C*  Left Justify field into result field
     C                   MOVEL     SYMDN         SYMMN
     C* SYDDN = %RJF(SYMDN)   ; DD portion
     C*  Right Justify field into result field
     C                   MOVE      SYMDN         SYDDN
     C*                                                               *
     C* *** Set Up end month days
     C*                                                               *
     C* IF symmn = 1
     C     SYMMN         IFEQ      1
     C* WKEND = 31           ; Jan End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF symmn = 2
     C     SYMMN         IFEQ      2
     C* WKLEAP = %REM(sycyn,4)
     C*  Remainder
     C                   Z-ADD     SYCYN         NARG1
     C                   Z-ADD     4             NARG2
     C                   EXSR      SREM
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        WKLEAP
     C* IF wkleap = 0
     C     WKLEAP        IFEQ      *ZERO
     C* WKEND = 29           ; Feb End day
     C                   Z-ADD     29            WKEND
     C* ELSE                                                          *
     C                   ELSE
     C* WKEND = 28
     C                   Z-ADD     28            WKEND
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 3
     C     SYMMN         IFEQ      3
     C* WKEND = 31           ; Mar End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 4
     C     SYMMN         IFEQ      4
     C* WKEND = 30           ; Apr End day
     C                   Z-ADD     30            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 5
     C     SYMMN         IFEQ      5
     C* WKEND = 31           ; May End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 6
     C     SYMMN         IFEQ      6
     C* WKEND = 30           ; Jun End day
     C                   Z-ADD     30            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 7
     C     SYMMN         IFEQ      7
     C* WKEND = 31           ; Jul End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 8
     C     SYMMN         IFEQ      8
     C* WKEND = 31           ; Aug End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 9
     C     SYMMN         IFEQ      9
     C* WKEND = 30           ; Sep End day
     C                   Z-ADD     30            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 10
     C     SYMMN         IFEQ      10
     C* WKEND = 31           ; Oct End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 11
     C     SYMMN         IFEQ      11
     C* WKEND = 31           ; Nov End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* IF symmn = 12
     C     SYMMN         IFEQ      12
     C* WKEND = 31           ; Dec End day
     C                   Z-ADD     31            WKEND
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ***                                                           *
     C*                                                               *
     C*                                                               *
     C* *** Year Range
     C*                                                               *
     C* IF sycyn < 2000
     C     SYCYN         IFLT      2000
     C* SYDERR = '1' ; 1=error 0=Valid   ; the year is invalid
     C                   MOVE      '1'           RN0010
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the months
     C*                                                               *
     C* IF symmn <1 *or symmn >12
     C     SYMMN         IFLT      1
     C     SYMMN         ORGT      12
     C* SYDERR = '1' ; 1=error 0=Valid   ; the month is invalid
     C                   MOVE      '1'           RN0010
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the days
     C*                                                               *
     C* IF syddn <1 *or syddn > wkend
     C     SYDDN         IFLT      1
     C     SYDDN         ORGT      WKEND
     C* SYDERR = '1' ; 1=error 0=Valid   ; the days are invalid
     C                   MOVE      '1'           RN0010
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Init Fields
     C* SYDATV = 0
     C                   Z-ADD     *ZERO         RN0009
     C* WKLEAP = 0
     C                   Z-ADD     *ZERO         WKLEAP
     C*
     C     $SY003        ENDSR
     C/EJECT
     C*****************************************************************
     C* SREM - Calculates the remainder of a division.
     C*        It returns undefined (*HIVAL) value if "Denominator"
     C*        is zero.
     C*
     C* FUNCTION:    REMAINDER (NUMERATOR, DENOMINATOR)
     C*****************************************************************
     C     SREM          BEGSR
     C*
     C     NARG1         IFEQ      *HIVAL
     C     NARG2         OREQ      *HIVAL
     C                   MOVE      *HIVAL        NRSLT
     C                   ELSE
     C*
     C*  Denominator if 0, return undefine value.
     C*
     C     NARG2         IFEQ      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C     NARG1         DIV       NARG2         NWK300
     C                   MVR                     NRSLT
     C                   END
     C*
     C                   END
     C                   ENDSR
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
     C* S005   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C**************************************************************************
     C     S005          BEGSR
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
     C     WFILE#        IFEQ      1                                            COMPANY
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
     C                   MOVEL     RN0016        WK0001                         Company number
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0016        HD0001                         Company number
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCR002    XYDESC    0000  01      01
SCR001    WSDATE    0000  0102    01                   Y
