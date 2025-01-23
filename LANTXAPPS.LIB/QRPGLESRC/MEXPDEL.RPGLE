     F/TITLE MEXPDEL Work With Expected Deliveries
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MEXPDEL
     F*  Application ID      -    MEXPDEL
     F*  Application Name    -    Work With Expected Deliveries
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  EXPDEL      - (I/DISK   ) IMS Expected Deliveries     ED
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  STOKMOV6    - (I/DISK   ) IMS reference type
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  EXPDELX     - (U/DISK   ) IMS Expected Deliveries     ED
     F*  MEXPDELD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCDELT     - Check deletion
     F*
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0001     - List Screen for EXPDEL
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001S1 / FL0006 : DSPATR(ND)
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
     F*  SC0003     - List Screen for STOKMOV6
     F*
     F*  01     - SCR002S1 / FL0008 : DSPATR(ND)
     F*  02     - SCR002 / CYDESC : DSPATR(PC)
     F*  02     - SCR002 / CYDESC : DSPATR(RI)
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
     F* S001 - List Screen for EXPDEL
     F* S002 - List Screen for STOKMOV6
     F* S003 - Check deletion
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03BKW - SCRN SUB
     F* S03FWD - SCRN SUB
     F* SY0010 - Format Date
     F* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     F* SMSG - calls message handling program to either clear, add, or
     F* SCMA - Convert date into Cenyr_month_day form.
     F* S004   - GETREC d.company,f.company,*eq,prcoyno
     F* S005   - SETLL D.EXPDEL,F.EXPDEL,SVK001
     F* S006   - SETLL D.EXPDEL,F.EXPDEL,SVK001,SVK002,SVK003,SVK004
     F* S007   - SETLL D.EXPDEL,F.STOKMOV6,SVK005,SVK006
     F* S008   - DELETE d.expdel,f.expdel
     F* S009   - GETBLK D.EXPDEL,F.EXPDEL,F.SUPLIER,*PV,prcoyno
     F* S010   - Process To Reset File Pointer(BOF) - EXPDEL    SUPLIER
     F* S011   - Process To Reset File Pointer(EOF) - EXPDEL    SUPLIER
     F* S012   - GETREC D.EXPDEL,F.EXPDEL,*LOCK,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     F* S013   - GETREC D.EXPDEL,F.EXPDEL,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     F* S014   - GETBLK D.EXPDEL,F.STOKMOV6,F.IMSTRN,F.ITMMAST,*PV,SVK005,SVK006
     F* S015   - Process To Reset File Pointer(BOF) - STOKMOV6  IMSTRN    ITMMAS
     F* S016   - Process To Reset File Pointer(EOF) - STOKMOV6  IMSTRN    ITMMAS
     F* *PSSR - Program Execution Errors Handler
     F* SATRIB - Display Attribute Handler
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMEXPDELD  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR002S1:RRN02)
     F                                     INFDS(DSPFDS)
     FEXPDEL    IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FSTOKMOV6  IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FEXPDELX   UF   E             DISK
     F                                     INFDS(FIDS07)
     F                                     RENAME(EXPDELF:EXPDELFX)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(11)
     D A02             S              8  0 DIM(11)
     D A03             S              6  0 DIM(11)
     D A04             S             15    DIM(11)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(4) CTDATA PERRCD(1)              Alpha constants i
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(8) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(8) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
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
     D* Data structure for user define
     D*
     D @DS003          DS
     D  WK0012                 1     40
     D  TTSD                   1     20
     D*
     D* Data structure for user define
     D*
     D @DS004          DS
     D  WK0013                 1     40
     D  ITSD                   1     20
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
     D @DS005          DS
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
     I              CYCOYNO                     RN0005
     I              CYEMPCOL                    RN0006
     I              CYEMPHEAD                   RN0007
     I              CYPRDHEAD                   RN0008
     I              CYREFHEAD                   RN0009
     I              CYSDESC                     RN0010
     IEXPDELF
     I              EDBRNBR                     RN0011
     I              EDCOYNO                     RN0012
     I              EDSUPPN                     RN0013
     IIMSTRMF
     I              TTCOYNO                     RN0014
     IITMSTRF
     I              ITALPHA                     RN0015
     I              ITCOYNO                     RN0016
     I              ITIDESC                     RN0017
     ISTOKMOVF
     I              STBRNBR                     RN0018
     I              STCOYNO                     RN0019
     I              STSUPPN                     RN0020
     ISUPLIERF
     I              SUALPHA                     RN0021
     I              SUBRNBR                     RN0022
     I              SUCONNAM                    RN0023
     I              SUCOYNO                     RN0024
     I              SUPSTCD                     RN0025
     I              SUSUPPN                     RN0026
     I              SUTELEPH                    RN0027
     IEXPDELFX
     I              EDBRNBR                     RN0011
     I              EDCOYNO                     RN0012
     I              EDSUPPN                     RN0013
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM005            3
     C                   PARM                    WKUSER
     C                   PARM                    PRACT
     C                   PARM                    PRALWD
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM005            3
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
     C                   KFLD                    KDCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDDT02
     C                   KFLD                    KDTI03
     C                   KFLD                    KDTR04
     C*
     C     K0004         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDTR02
     C*
     C     K0005         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTTR02
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTTR03
     C*
     C     K0008         KLIST
     C                   KFLD                    KTCO03
     C                   KFLD                    KTIT04
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    RN0011        WK0001                         Branch Number
     C     *LIKE         DEFINE    RN0012        WK0002                         Company number
     C     *LIKE         DEFINE    EDDTTR        WDDTTR                         Transaction Date
     C     *LIKE         DEFINE    RN0013        WK0003                         Supplier Number
     C     *LIKE         DEFINE    RN0014        WK0005                         Company number
     C     *LIKE         DEFINE    TTTRNC        WTTRNC                         Transaction Type
     C     *LIKE         DEFINE    RN0016        WK0006                         Company number
     C     *LIKE         DEFINE    ITITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    RN0019        WK0007                         Company number
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STITEM        WK0008                         Item Number
     C     *LIKE         DEFINE    STTREF        WTTREF                         Transaction Referenc
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    RN0022        WK0009                         Branch Number
     C     *LIKE         DEFINE    RN0024        WK0010                         Company number
     C     *LIKE         DEFINE    SUNAME        WUNAME                         Customer name
     C     *LIKE         DEFINE    RN0026        WK0011                         Supplier Number
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0005        HD0001
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
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C03               3 0
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *BLANKS       FL0002           20
     C                   MOVE      *BLANKS       FL0004           20
     C                   MOVE      *BLANKS       FL0005           20
     C                   MOVE      *BLANKS       FL0006           10
     C                   MOVE      *BLANKS       FL0007           10
     C                   MOVE      *BLANKS       FL0008           10
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRACT             1
     C                   MOVE      *BLANKS       PRALWD            1
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *ZEROS        PRM002            6 0
     C                   MOVE      *ZEROS        PRM003            6 0
     C                   MOVE      *BLANKS       PRM004           15
     C                   MOVE      *ZEROS        PS0102            8 0
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *ZEROS        SVK002            8 0
     C                   MOVE      *ZEROS        SVK003            6 0
     C                   MOVE      *BLANKS       SVK004           15
     C                   MOVE      *BLANKS       SVK005            3
     C                   MOVE      *BLANKS       SVK006           15
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
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0004            4            SYMMDDA
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       WKDFMT            1
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       KDCO01            3            EDCOYNO
     C                   MOVE      *ZEROS        KDDT02            8 0          EDDTTR
     C                   MOVE      *ZEROS        KDTI03            6 0          EDTIME
     C                   MOVE      *BLANKS       KDTR04           15            EDTREF
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       KDTR02           15            EDTREF
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       KTTR02           15            STTREF
     C                   MOVE      *BLANKS       KTCO02            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR03            2            TTTRNC
     C                   MOVE      *BLANKS       KTCO03            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT04           20            ITITEM
     C                   MOVE      *BLANKS       RN0028           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      '  '          APPSET
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVEL     'LANDXAPP'    APPSET
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
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
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
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS          0030
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             CALLST            1 0          CALL STSword
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
     C     SCRNID        CASEQ     'SC0003'      S002
     C     SCRNID        CASEQ     'SCDELT'      S003
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
     C* S001 - List Screen for EXPDEL
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
     C* WKDFMT = cydfmt
     C                   MOVE      WYDFMT        WKDFMT
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* EDDTTR = 0
     C                   Z-ADD     *ZERO         WDDTTR
     C* EDTIME = 0
     C                   Z-ADD     *ZERO         WK0004
     C* EDTREF = ' '
     C                   MOVEL     *BLANKS       XDTREF
     C* EDCARR = ' '
     C                   MOVEL     *BLANKS       XDCARR
     C* Set Key values to parms passed
     C* SVK001 = PRcoyno
     C                   MOVE      PRM005        SVK001
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.EXPDEL,F.EXPDEL,SVK001
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
     C* SVK002 = %CMD(PS0102)
     C*  Cenyr Month Day
     C                   Z-ADD     PS0102        NARG1
     C                   MOVE      'DMC'         DATFMT
     C                   EXSR      SCMA
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        SVK002
     C* SVK003 = 0
     C                   Z-ADD     *ZERO         SVK003
     C* SVK004 = *blanks
     C                   MOVEL     *BLANKS       SVK004
     C* Reset/clear reposition values to parms passed
     C* PS0102 = 0
     C                   Z-ADD     *ZERO         PS0102
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C*                                                               *
     C* Set pointer to file.
     C* SETLL D.EXPDEL,F.EXPDEL,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S006
     C*                                                               *
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
     C* S002 - List Screen for STOKMOV6
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00'          *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* Set Keys to values from header file.
     C* SVK005 = EDCOYNO
     C                   MOVE      WK0002        SVK005
     C* SVK006 = EDTREF
     C                   MOVE      XDTREF        SVK006
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = eddttr  ; input date
     C                   Z-ADD     WDDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0007 = SYDATO
     C                   MOVE      RN0003        FL0007
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.EXPDEL,F.STOKMOV6,SVK005,SVK006
     C*
     C                   EXSR      S007
     C* Fill List panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
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
     C                   MOVEA     '0'           *IN(2)
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
     C* EXSUBR S03BKW
     C                   EXSR      S03BKW
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
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Check deletion
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00'          *IN(1)
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
     C* RLSREC d.expdel,f.expdel
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   UNLOCK    EXPDELX                              91      RLS LCK EXPDELX
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Accept
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* DELETE d.expdel,f.expdel
     C*
     C                   EXSR      S008
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
     C     SID(CT)       IFEQ      'SC0003'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   WRITE     SCR002C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCDELT'
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
     C* A003 = 0
     C                   Z-ADD     *ZERO         A03
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A04
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0006,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.EXPDEL,F.EXPDEL,F.SUPLIER,*PV,prcoyno
     C*
     C                   EXSR      S009
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM005        KDCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     11            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.EXPDEL    SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       FL0006
     C                   Z-ADD     *ZEROS        WK0004
     C                   MOVEL     *BLANKS       XDTREF
     C                   MOVEL     *BLANKS       XDCARR
     C                   MOVEL     *BLANKS       FL0002
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     EXPDEL                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDDTTR                         Transaction Date
     C                   Z-ADD     *ZERO         HDTIME                         Expected time
     C                   MOVEL     *BLANK        HDTREF                         Transaction Referenc
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.EXPDEL    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0012        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     RN0013        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     RN0011        KUBR03
     C     K0005         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0006,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = EDCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = EDDTTR
     C                   Z-ADD     WDDTTR        A02(Z1)
     C* A003(C01) = EDTIME
     C                   Z-ADD     WK0004        A03(Z1)
     C* A004(C01) = EDTREF
     C                   MOVE      *BLANKS       A04(Z1)
     C                   MOVE      XDTREF        A04(Z1)
     C* ** Fill any possible work fields in list
     C* ** panel with secondary file fields.
     C* IF %STS(D.EXPDEL,F.SUPLIER)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* FL0002 = %ljf(SUNAME)
     C*  Left Justify field into result field
     C                   MOVEL     WUNAME        FL0002
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = eddttr  ; input date
     C                   Z-ADD     WDDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01BK
     C                   END
     C* FL0006 = SYDATO
     C                   MOVE      RN0003        FL0006
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
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       FL0006
     C                   Z-ADD     *ZEROS        WK0004
     C                   MOVEL     *BLANKS       XDTREF
     C                   MOVEL     *BLANKS       XDCARR
     C                   MOVEL     *BLANKS       FL0002
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
     C                   EXSR      S011                                         CHK EOF
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
     C* DOBLK D.EXPDEL
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
     C* EDCOYNO = A001(I01)
     C                   MOVE      A01(Z2)       WK0002
     C* EDDTTR = A002(I01)
     C                   Z-ADD     A02(Z2)       WDDTTR
     C* EDTIME = A003(I01)
     C                   Z-ADD     A03(Z2)       WK0004
     C* EDTREF = A004(I01)
     C                   MOVE      A04(Z2)       XDTREF
     C* ** Delete record
     C* IF FL0001=4
     C     FL0001        IFEQ      4
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* SVK003 = A003(I01)
     C                   Z-ADD     A03(Z2)       SVK003
     C* SVK004 = A004(I01)
     C                   MOVE      A04(Z2)       SVK004
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C*                                                               *
     C* *** Check user allowed delete.
     C* BAT = 'I'
     C                   MOVE      'I'           BAT
     C* WKUSER = *userid
     C                   MOVE      *BLANKS       WKUSER
     C                   MOVEL     USER          WKUSER
     C* PRACT = %ctc(mode)
     C*  Convert To Character
     C                   MOVE      *BLANK        PRACT
     C                   MOVEL     MODE          PRACT
     C* PRALWD = ' '
     C                   MOVE      *BLANKS       PRALWD
     C* CALL 'BSECIMS',bat,prcoyno,wkuser,pract,pralwd
     C                   Z-ADD     1             CALLST
     C                   CALL      'BSECIMS'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C*                                                               *
     C* *** If not allowed output error
     C* IF pralwd = 'N'
     C     PRALWD        IFEQ      'N'
     C* DSPERR *NONE,'USR0001','ERRORS'
     C                   MOVEL     'USR0001'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If allowed output window.
     C* IF PRALWD= 'Y'
     C     PRALWD        IFEQ      'Y'
     C* GETREC D.EXPDEL,F.EXPDEL,*LOCK,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     C*
     C                   EXSR      S012
     C* EXSCR SCdelt
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
     C* END                                                           *
     C                   END
     C* ** Display details
     C* IF FL0001=06
     C     FL0001        IFEQ      06
     C* SVK002 = A002(I01)
     C                   Z-ADD     A02(Z2)       SVK002
     C* SVK003 = A003(I01)
     C                   Z-ADD     A03(Z2)       SVK003
     C* SVK004 = A004(I01)
     C                   MOVE      A04(Z2)       SVK004
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* GETREC D.EXPDEL,F.EXPDEL,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     C*
     C                   EXSR      S013
     C* EXSCR SC0003
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
     C* ** If the action choice invalid
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
     C* A003 = 0
     C                   Z-ADD     *ZERO         A03
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A04
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0006,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.EXPDEL,F.EXPDEL,F.SUPLIER,*NE,Prcoyno
     C*
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM005        KDCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     11            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.EXPDEL    SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       FL0006
     C                   Z-ADD     *ZEROS        WK0004
     C                   MOVEL     *BLANKS       XDTREF
     C                   MOVEL     *BLANKS       XDCARR
     C                   MOVEL     *BLANKS       FL0002
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     EXPDEL                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDDTTR                         Transaction Date
     C                   Z-ADD     *ZERO         HDTIME                         Expected time
     C                   MOVEL     *BLANK        HDTREF                         Transaction Referenc
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.EXPDEL    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0012        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     RN0013        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     RN0011        KUBR03
     C     K0005         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0006,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = EDCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = EDDTTR
     C                   Z-ADD     WDDTTR        A02(Z1)
     C* A003(C01) = EDTIME
     C                   Z-ADD     WK0004        A03(Z1)
     C* A004(C01) = EDTREF
     C                   MOVE      *BLANKS       A04(Z1)
     C                   MOVE      XDTREF        A04(Z1)
     C* ** Set any work fields to values in
     C* ** secondary file fields.
     C* IF %STS(D.EXPDEL,F.SUPLIER)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* FL0002 = SUNAME
     C                   MOVE      *BLANKS       FL0002
     C                   MOVEL     WUNAME        FL0002
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = eddttr  ; date maintained
     C                   Z-ADD     WDDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* FL0006 = SYDATO
     C                   MOVE      RN0003        FL0006
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
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       FL0006
     C                   Z-ADD     *ZEROS        WK0004
     C                   MOVEL     *BLANKS       XDTREF
     C                   MOVEL     *BLANKS       XDCARR
     C                   MOVEL     *BLANKS       FL0002
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
     C                   EXSR      S011                                         RESET FP
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
     C* S03BKW - SCRN SUB
     C*****************************************************************
     C     S03BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* FLDATR fl0008,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0008  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.EXPDEL,F.STOKMOV6,F.IMSTRN,F.ITMMAST,*PV,SVK005,SVK006
     C*
     C                   EXSR      S014
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK005        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     SVK006        KTTR02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.STOKMOV6  IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       FL0004
     C                   MOVEL     *BLANKS       FL0005
     C                   MOVEL     *BLANKS       FL0008
     C                   Z-ADD     *ZEROS        XTTIME
     C                   Z-ADD     *ZEROS        XTTQTY
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0006         READE     STOKMOV6                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HTTREF                         Transaction Referenc
     C                   MOVEL     *BLANK        HTTTYP                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.STOKMOV6  IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0019        KTCO02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     STTTYP        KTTR03
     C     K0007         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0019        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     STITEM        KTIT04
     C     K0008         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.ITMMAST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* FLDATR fl0008,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0008  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF %STS(D.EXPDEL,F.IMSTRN)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* FL0004 = TTSD
     C                   MOVE      TTSD          FL0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.EXPDEL,F.ITMMAST)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* FL0005 = ITSD
     C                   MOVE      ITSD          FL0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = stdttr  ; input date
     C                   Z-ADD     WTDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03BK
     C                   END
     C* FL0008 = SYDATO
     C                   MOVE      RN0003        FL0008
     C*                                                               *
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
     C                   MOVEL     *BLANKS       FL0004
     C                   MOVEL     *BLANKS       FL0005
     C                   MOVEL     *BLANKS       FL0008
     C                   Z-ADD     *ZEROS        XTTIME
     C                   Z-ADD     *ZEROS        XTTQTY
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
     C     $S03BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03FWD - SCRN SUB
     C*****************************************************************
     C     S03FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C03 = 0
     C                   Z-ADD     *ZERO         C03
     C* FLDATR fl0008,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0008  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.EXPDEL,F.STOKMOV6,F.IMSTRN,F.ITMMAST,*NE,SVK005,SVK006
     C*
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK005        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     SVK006        KTTR02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.STOKMOV6  IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       FL0004
     C                   MOVEL     *BLANKS       FL0005
     C                   MOVEL     *BLANKS       FL0008
     C                   Z-ADD     *ZEROS        XTTIME
     C                   Z-ADD     *ZEROS        XTTQTY
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0006         READE     STOKMOV6                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HTTREF                         Transaction Referenc
     C                   MOVEL     *BLANK        HTTTYP                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.STOKMOV6  IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0019        KTCO02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     STTTYP        KTTR03
     C     K0007         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0019        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     STITEM        KTIT04
     C     K0008         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.ITMMAST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* FLDATR fl0008,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0008  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     C03           ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        C03
     C* IF %STS(D.EXPDEL,F.IMSTRN)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* FL0004 = TTSD
     C                   MOVE      TTSD          FL0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.EXPDEL,F.ITMMAST)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* FL0005 = ITSD
     C                   MOVE      ITSD          FL0005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0003
     C* SYDATI = stdttr  ; input date
     C                   Z-ADD     WTDTTR        RN0002
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03FW
     C                   END
     C* FL0008 = SYDATO
     C                   MOVE      RN0003        FL0008
     C*                                                               *
     C*                                                               *
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
     C                   MOVEL     *BLANKS       FL0004
     C                   MOVEL     *BLANKS       FL0005
     C                   MOVEL     *BLANKS       FL0008
     C                   Z-ADD     *ZEROS        XTTIME
     C                   Z-ADD     *ZEROS        XTTQTY
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
     C* IF c03 = 0
     C     C03           IFEQ      *ZERO
     C* EXSUBR s03bkw
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S03FW        ENDSR
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
     C     SYDSEP        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           SYDSEP
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
     C                   MOVE      *BLANK        RN0004
     C                   MOVEL     SYMMDD        RN0004
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
     C     SYDFMT        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDSEP:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDSEP:0      ARSLT0
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
     C     SYDFMT        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDSEP:0      ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     ARSLT0        RN0003
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0003        CAT(P)    SYDSEP:0      ARSLT0
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
     C                   MOVE      SYDSEP        SYDSEP
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      SYDFMT        SYDFMT
     C*
     C     $SY001        ENDSR
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
     C*****************************************************************
     C* SCMA - Convert date into Cenyr_month_day form.
     C*        Argument with value of zero results in zero.
     C*
     C* FUNCTION:    CMD(DATE)
     C*****************************************************************
     C     SCMA          BEGSR
     C*
     C     NARG1         IFEQ      *ZERO
     C                   Z-ADD     *ZERO         NRSLT
     C                   ELSE
     C*
     C* Break Date in MONTH, DAY, and YEAR.
     C                   EXSR      SBRDAT
     C     NRSLT         IFNE      *HIVAL
     C* Get result in CMD format.
     C                   Z-ADD     SVCC          X12
     C                   Z-ADD     SVYY          X34
     C                   Z-ADD     SVMM          X56
     C                   Z-ADD     SVDD          X78
     C                   Z-ADD     X1CDAT        NRSLT
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM005        KYCO01
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
     C* S005   - SETLL D.EXPDEL,F.EXPDEL,SVK001
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   Z-ADD     *LOVAL        HDDTTR                         Transaction Date
     C                   Z-ADD     *LOVAL        HDTIME                         Expected time
     C                   MOVEL     *LOVAL        HDTREF                         Transaction Referenc
     C*
     C                   MOVEL     SVK001        KDCO01
     C                   MOVEL     SVK001        HD0002                         Company number
     C                   MOVEL     SVK001        RN0012                         Company number
     C*
     C     K0002         SETLL     EXPDEL                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.EXPDEL,F.EXPDEL,SVK001,SVK002,SVK003,SVK004
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HD0002                         Company number
     C                   Z-ADD     *LOVAL        HDDTTR                         Transaction Date
     C                   Z-ADD     *LOVAL        HDTIME                         Expected time
     C                   MOVEL     *LOVAL        HDTREF                         Transaction Referenc
     C*
     C                   MOVEL     SVK001        KDCO01
     C                   MOVEL     SVK001        HD0002                         Company number
     C                   MOVEL     SVK001        RN0012                         Company number
     C                   Z-ADD     SVK002        KDDT02
     C                   Z-ADD     SVK002        HDDTTR                         Transaction Date
     C                   Z-ADD     SVK002        EDDTTR                         Transaction Date
     C                   Z-ADD     SVK003        KDTI03
     C                   Z-ADD     SVK003        HDTIME                         Expected time
     C                   Z-ADD     SVK003        EDTIME                         Expected time
     C                   MOVEL     SVK004        KDTR04
     C                   MOVEL     SVK004        HDTREF                         Transaction Referenc
     C                   MOVEL     SVK004        EDTREF                         Transaction Referenc
     C*
     C     K0003         SETLL     EXPDEL                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - SETLL D.EXPDEL,F.STOKMOV6,SVK005,SVK006
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   MOVEL     *LOVAL        HTTTYP                         Transaction Type
     C*
     C                   MOVEL     SVK005        KDCO01
     C                   MOVEL     SVK005        HD0005                         Company number
     C                   MOVEL     SVK005        RN0019                         Company number
     C                   MOVEL     SVK006        KDTR02
     C                   MOVEL     SVK006        HTTREF                         Transaction Referenc
     C                   MOVEL     SVK006        STTREF                         Transaction Referenc
     C*
     C     K0004         SETLL     STOKMOV6                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - DELETE d.expdel,f.expdel
     C**************************************************************************
     C     S008          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     WK0002        KDCO01
     C                   Z-ADD     WDDTTR        KDDT02
     C                   Z-ADD     WK0004        KDTI03
     C                   MOVEL     *BLANK        KDTR04
     C                   MOVEL     XDTREF        KDTR04
     C     K0003         SETLL     EXPDEL                                       SETLL  EXPDEL
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - EXPDEL
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE     EXPDEL                               9190    READE  EXPDEL
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     REC01         CHAIN     EXPDELX                            9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     REC01         DELETE    EXPDELX                            9191      DELETE EXPDEL
     C                   Z-ADD     STS07         SVS01                          SAVE FILE STS
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
     C                   END                                                    END-CHAIN X-FILE
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0003         SETLL     EXPDEL                                       RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETBLK D.EXPDEL,F.EXPDEL,F.SUPLIER,*PV,prcoyno
     C**************************************************************************
     C     S009          BEGSR
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     PRM005        KDCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.EXPDEL    SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READPE    EXPDEL                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0002                         Company number
     C                   Z-ADD     *ZERO         HDDTTR                         Transaction Date
     C                   Z-ADD     *ZERO         HDTIME                         Expected time
     C                   MOVEL     *BLANK        HDTREF                         Transaction Referenc
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.EXPDEL    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0012        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     RN0013        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     RN0011        KUBR03
     C     K0005         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S010                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(BOF) - EXPDEL    SUPLIER
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.EXPDEL    SUPL
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0012        KDCO01
     C     K0002         SETLL     EXPDEL
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0024        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     RN0026        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     RN0022        KUBR03
     C     K0005         SETLL     SUPLIER
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
     C* S011   - Process To Reset File Pointer(EOF) - EXPDEL    SUPLIER
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.EXPDEL    SUPL
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0012        KDCO01
     C     K0002         SETGT     EXPDEL
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0024        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     RN0026        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     RN0022        KUBR03
     C     K0005         SETGT     SUPLIER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       11            WADJ01
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
     C* S012   - GETREC D.EXPDEL,F.EXPDEL,*LOCK,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     WK0002        KDCO01
     C                   Z-ADD     WDDTTR        KDDT02
     C                   Z-ADD     WK0004        KDTI03
     C                   MOVEL     *BLANK        KDTR04
     C                   MOVEL     XDTREF        KDTR04
     C     K0003         CHAIN     EXPDEL                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   Z-ADD     REC01         HRC01
     C     HRC01         CHAIN     EXPDELX                            9091      EXPDEL
     C                   Z-ADD     STS07         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   ELSE
     C                   Z-ADD     *HIVAL        STS07                          REC LOCKED
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.EXPDEL,F.EXPDEL,*EQ,EDCOYNO,EDDTTR,EDTIME,EDTREF
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     WK0002        KDCO01
     C                   Z-ADD     WDDTTR        KDDT02
     C                   Z-ADD     WK0004        KDTI03
     C                   MOVEL     *BLANK        KDTR04
     C                   MOVEL     XDTREF        KDTR04
     C     K0003         CHAIN     EXPDEL                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.EXPDEL    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETBLK D.EXPDEL,F.STOKMOV6,F.IMSTRN,F.ITMMAST,*PV,SVK005,SVK006
     C**************************************************************************
     C     S014          BEGSR
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK005        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     SVK006        KTTR02
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.STOKMOV6  IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0006         READPE    STOKMOV6                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0005                         Company number
     C                   MOVEL     *BLANK        HTTREF                         Transaction Referenc
     C                   MOVEL     *BLANK        HTTTYP                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.STOKMOV6  IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0019        KTCO02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     STTTYP        KTTR03
     C     K0007         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN    ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0019        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     STITEM        KTIT04
     C     K0008         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMMAST
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.ITMMAST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S015                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - Process To Reset File Pointer(BOF) - STOKMOV6  IMSTRN    ITMMAS
     C**************************************************************************
     C     S015          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.STOKMOV6  IMST
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTTR02                         Transaction Referenc
     C                   MOVEL     STTREF        KTTR02
     C     K0006         SETLL     STOKMOV6
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0014        KTCO02
     C                   MOVEL     *BLANK        KTTR03                         Transaction Type
     C                   MOVEL     TTTRNC        KTTR03
     C     K0007         SETLL     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(3)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - Process To Reset File Pointer(EOF) - STOKMOV6  IMSTRN    ITMMAS
     C**************************************************************************
     C     S016          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.STOKMOV6  IMST
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.STOKMOV6  IMST
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0019        KTCO01
     C                   MOVEL     *BLANK        KTTR02                         Transaction Referenc
     C                   MOVEL     STTREF        KTTR02
     C     K0006         SETGT     STOKMOV6
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0014        KTCO02
     C                   MOVEL     *BLANK        KTTR03                         Transaction Type
     C                   MOVEL     TTTRNC        KTTR03
     C     K0007         SETGT     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ02
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
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    EXPDELX                              91      EXPDELX   MEXPDELD
     C                   READ      EXPDELX                                90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            EXPDEL
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
     C     WFILE#        IFEQ      3                                            SUPLIER
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
     C     WFILE#        IFEQ      4                                            STOKMOV6
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATUS
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            IMSTRN
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATUS
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
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
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      7                                            EXPDELX
     C     STS07         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS07                          ASSET LOCK STATUS
     C                   ELSE
     C     STS07         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
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
     C*          | Move Fields From Work Area To File - EXPDEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0011                         Branch Number
     C                   MOVEL     XDCARR        EDCARR                         Carrier
     C                   MOVEL     WK0002        RN0012                         Company number
     C                   Z-ADD     WDDTTR        EDDTTR                         Transaction Date
     C                   MOVEL     WK0003        RN0013                         Supplier Number
     C                   Z-ADD     WK0004        EDTIME                         Expected time
     C                   MOVEL     XDTREF        EDTREF                         Transaction Referenc
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - EXPDEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0011        WK0001                         Branch Number
     C                   MOVEL     EDCARR        XDCARR                         Carrier
     C                   MOVEL     RN0012        WK0002                         Company number
     C                   Z-ADD     EDDTTR        WDDTTR                         Transaction Date
     C                   MOVEL     RN0013        WK0003                         Supplier Number
     C                   Z-ADD     EDTIME        WK0004                         Expected time
     C                   MOVEL     EDTREF        XDTREF                         Transaction Referenc
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0012        HD0002                         Company number
     C                   Z-ADD     EDDTTR        HDDTTR                         Transaction Date
     C                   Z-ADD     EDTIME        HDTIME                         Expected time
     C                   MOVEL     EDTREF        HDTREF                         Transaction Referenc
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0005        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0022        WK0009                         Branch Number
     C                   MOVEL     RN0024        WK0010                         Company number
     C                   MOVEL     SUNAME        WUNAME                         Customer name
     C                   MOVEL     RN0026        WK0011                         Supplier Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0024        HD0007                         Company number
     C                   MOVEL     RN0026        HD0008                         Supplier Number
     C                   MOVEL     RN0022        HD0006                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV6
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0019        WK0007                         Company number
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        WK0008                         Item Number
     C                   Z-ADD     STTIME        XTTIME                         Expected Time
     C                   Z-ADD     STTQTY        XTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        WTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0019        HD0005                         Company number
     C                   MOVEL     STTREF        HTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        HTTTYP                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0014        WK0005                         Company number
     C                   MOVEL     TTTRNC        WTTRNC                         Transaction Type
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0014        HD0003                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   MOVE      TTDESC        WK0012                         MV TTDESC TO WK0012
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0016        WK0006                         Company number
     C                   MOVEL     ITITEM        WTITEM                         Item Number
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0016        HD0004                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   MOVE      RN0017        WK0013                         MV RN0017 TO WK0013
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
Record deleted from file IMS Expected Deliveries     ED
No record found to delete from file IMS Expected Deliveries     ED
The beginning of the file was reached
The end of the file was reached
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  06      06
SC0003    XYDESC    0000  02      02
SC0001    FL0001    0000  0103    010402               Y
SC0001    FL0006    0000            05
SC0003    FL0008    0000            01
