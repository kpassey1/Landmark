     F/TITLE MNU060       Display User Menus
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MNU060
     F*  Application ID      -    MNU060
     F*  Application Name    -          Display User Menus
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  This program displays the main user menu.
     F*
     F*  From here all specified menus and options are selected.
     F*
     F*  The menus can be selected by using the roll keys to move the
     F*  highlighted box or by moving the cursor to the required menu, and
     F*  pressing enter.
     F*
     F*  The menu options are displayed by using the enter key on the selected
     F*  menu.
     F*
     F*  Once the menu is displayed the highlighted box must be positioned on
     F*  the required option to run the required application program.
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  MNUHED      - (I/DISK   ) Menu Heading file           MB
     F*  MNUUSR      - (I/DISK   ) Menu Users                  MA
     F*  MNUUSR1     - (I/DISK   ) User Seq
     F*  MNUPGM      - (I/DISK   ) Program Names               MP
     F*  MNUOPT      - (I/DISK   ) Menu Options                MC
     F*  MNUHLP      - (I/DISK   ) Menu Help Text              MD
     F*  MNU060D     - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - Menu selection
     F*
     F*  01     - SCR001 / MND : DSPATR(RI)
     F*  02     - SCR001 / MND : DSPATR(RI)
     F*  03     - SCR001 / MND : DSPATR(RI)
     F*  04     - SCR001 / MND : DSPATR(RI)
     F*  05     - SCR001 / MND : DSPATR(RI)
     F*  06     - SCR001 / MND : DSPATR(RI)
     F*  07     - SCR001 / MND : DSPATR(RI)
     F*  08     - SCR001 / MND : DSPATR(RI)
     F*  09     - SCR001 / MND : DSPATR(RI)
     F*  10     - SCR001 / MND : DSPATR(RI)
     F*  11     - SCR001 / MND : DSPATR(RI)
     F*  12     - SCR001 / MND : DSPATR(RI)
     F*  99     - SCR001 OVERLAY
     F* N79     - SCR001 PUTOVR
     F*
     F*  SC0002     - Options for menu
     F*
     F*  01     - SCR002 / SEL : DSPATR(ND)
     F*  02     - SCR002 / SEL : DSPATR(ND)
     F*  03     - SCR002 / SEL : DSPATR(ND)
     F*  04     - SCR002 / SEL : DSPATR(ND)
     F*  05     - SCR002 / SEL : DSPATR(ND)
     F*  06     - SCR002 / SEL : DSPATR(ND)
     F*  07     - SCR002 / SEL : DSPATR(ND)
     F*  08     - SCR002 / SEL : DSPATR(ND)
     F*  09     - SCR002 / SEL : DSPATR(ND)
     F*  10     - SCR002 / SEL : DSPATR(ND)
     F*  11     - SCR002 / SOPT : DSPATR(PC)
     F*  11     - SCR002 / SOPT : DSPATR(RI)
     F*  12     - SCR002 / SOPT : DSPATR(UL)
     F*  13     - SCR002 / T03 : DSPATR(RI)
     F*  14     - SCR002 / T03 : DSPATR(RI)
     F*  15     - SCR002 / T03 : DSPATR(RI)
     F*  16     - SCR002 / T03 : DSPATR(RI)
     F*  17     - SCR002 / T03 : DSPATR(RI)
     F*  18     - SCR002 / T03 : DSPATR(RI)
     F*  19     - SCR002 / T03 : DSPATR(RI)
     F*  20     - SCR002 / T03 : DSPATR(RI)
     F*  21     - SCR002 / T03 : DSPATR(RI)
     F*  22     - SCR002 / T03 : DSPATR(RI)
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     - Help text
     F*
     F* N79     - SCR003 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Menu selection
     F* S002 - Options for menu
     F* S003 - Help text
     F* SPBACT - Performs all the program begin actions.
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW -
     F* S01FWD -
     F* S03ABR - SCRN SUB
     F* S500 - SCRN SUB
     F* S03AFR - SCRN SUB
     F* S501 - SCRN SUB
     F* S03ALD - SCRN SUB
     F* S502 - SCRN SUB
     F* S03KEY - Set up Keywords
     F* SCSL - Checks if cursor is within the boundray of cordinates
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* SHELP - Process help text.
     F* S004   - GETREC D.menu,F.mnuusr,*EQ,WSUSER
     F* S005   - GETREC d.menu,f.mnuusr1,*eq,maguser
     F* S006   - SETLL D.menu,F.mnuhed,WSUSER
     F* S007   - SETLL d.menu,f.mnuhed,wsuser,first
     F* S008   - SETGT D.menu,f.mnuhed,wsuser,LAST
     F* S009   - GETREC D.menu,F.mnuopt,*eq,wsuser,wk05a1,wk05a2
     F* S010   - GETREC d.menu,f.MNUhed,*pv,wsuser
     F* S011   - Process To Reset File Pointer(BOF) - MNUHED
     F* S012   - GETREC D.MENU,F.MNUPGM,*EQ,MBMNUC
     F* S013   - GETREC D.menu,f.MNUhed,*Ne,wsuser
     F* S014   - Process To Reset File Pointer(EOF) - MNUHED
     F* S015   - SETLL D.Menu,F.MNUOPT,WSUSER,WKMENU,SVK03
     F* S016   - GETREC D.Menu,F.MNUOPT,*PV,WSUSER,WKMENU
     F* S017   - Process To Reset File Pointer(BOF) - MNUOPT
     F* S018   - SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     F* S019   - GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     F* S020   - Process To Reset File Pointer(BOF) - MNUHLP
     F* S021   - GETREC D.Menu,F.MNUOPT,*NE,WSUSER,WKMENU
     F* S022   - Process To Reset File Pointer(EOF) - MNUOPT
     F* S023   - GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     F* S024   - Process To Reset File Pointer(EOF) - MNUHLP
     F* *PSSR - Program Execution Errors Handler
     F* SCLF   - CLF : Cursor Location On Field Handler
     F* SATRIB - Display Attribute Handler
     F* SFERR - File Exception Handler
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMNU060D   CF   E             WORKSTN
     F                                     INFDS(DSPFDS)
     FMNUHED    IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FMNUUSR    IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FMNUUSR1   IF   E           K DISK
     F                                     RENAME(MNUUSRF:FMT001)
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FMNUPGM    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FMNUOPT    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FMNUHLP    IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D B01             S              5    DIM(10)
     D B02             S              2  0 DIM(10)
     D MNU             S              5    DIM(12)
     D A01             S             10    DIM(10)
     D CMD             S             80    DIM(1) CTDATA PERRCD(1)              OS/400 Commands
     D CST             S              1    DIM(2560)                            Command string
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D DA4             S             24    DIM(15) CTDATA PERRCD(1)             CLF : Cursor Loc
     D DA5             S              8    DIM(15) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ar
     D DA1             S             24    DIM(36) CTDATA PERRCD(1)             Fld Attr. Indic
     D DA2             S             34    DIM(36) ALT(DA1)
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D*
     D* Software Application
     D*
     D @DS001          DS            30
     D  ZZSOFT                 1     30
     D*
     D* Company Heading
     D*
     D @DS002          DS            30
     D  ZZCOMP                 1     30
     D*
     D* Description for level 1
     D*
     D @DS003          DS            15
     D  ZZLEV1                 1     15
     D*
     D* F18 Selection Program
     D*
     D @DS004          DS            10
     D  ZZPGM1                 1     10
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
     D @DS005          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS006          DS
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
     D  DA6                   27     41    DIM(15)                              Fld Attr. Wrk Ar
     D  #ATRIB                11     41
     D  #FROM                 25     28  0
     D  #TO                   29     32  0
     D  #CLF                  25     32  0
     D  #MAP                   1     24
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('F18=Select')
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
     D @DS007          DS
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
     D @DS008          DS
     D  MND                    1    360    DIM(12)
     D  MND001                 1     30
     D  MND002                31     60
     D  MND003                61     90
     D  MND004                91    120
     D  MND005               121    150
     D  MND006               151    180
     D  MND007               181    210
     D  MND008               211    240
     D  MND009               241    270
     D  MND010               271    300
     D  MND011               301    330
     D  MND012               331    360
     D @DS009          DS
     D  SEL                    1     20P 0 DIM(10) PACKEVEN
     D  SEL001                 1      2P 0
     D  SEL002                 3      4P 0
     D  SEL003                 5      6P 0
     D  SEL004                 7      8P 0
     D  SEL005                 9     10P 0
     D  SEL006                11     12P 0
     D  SEL007                13     14P 0
     D  SEL008                15     16P 0
     D  SEL009                17     18P 0
     D  SEL010                19     20P 0
     D @DS010          DS
     D  T03                    1    300    DIM(10)
     D  T03001                 1     30
     D  T03002                31     60
     D  T03003                61     90
     D  T03004                91    120
     D  T03005               121    150
     D  T03006               151    180
     D  T03007               181    210
     D  T03008               211    240
     D  T03009               241    270
     D  T03010               271    300
     D @DS011          DS
     D  T05                    1    600    DIM(10)
     D  T05001                 1     60
     D  T05002                61    120
     D  T05003               121    180
     D  T05004               181    240
     D  T05005               241    300
     D  T05006               301    360
     D  T05007               361    420
     D  T05008               421    480
     D  T05009               481    540
     D  T05010               541    600
     IMNUUSRF
     I              MAGUSER                     RN0001
     IFMT001
     I              MAGUSER                     RN0002
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PRDFV1
     C                   PARM                    PRDFV2
     C                   PARM                    PRDFV3
     C*
     C     P0002         PLIST
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C                   PARM                    PARM3
     C                   PARM                    PARM4
     C*
     C     P0003         PLIST
     C                   PARM                    WCSPGM
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C                   PARM                    PARM3
     C                   PARM                    PARM4
     C*
     C     P0004         PLIST
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C                   PARM                    PARM3
     C*
     C     P0005         PLIST
     C                   PARM                    WCSPGM
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C                   PARM                    PARM3
     C*
     C     P0006         PLIST
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C*
     C     P0007         PLIST
     C                   PARM                    WCSPGM
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C*
     C     P0008         PLIST
     C                   PARM                    PARM1
     C*
     C     P0009         PLIST
     C                   PARM                    WCSPGM
     C                   PARM                    PARM1
     C*
     C     P0010         PLIST
     C                   PARM                    WCSPGM
     C*
     C     P0011         PLIST
     C                   PARM                    PARM
     C                   PARM                    WKLEN
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
     C                   KFLD                    KAUS01
     C*
     C     K0002         KLIST
     C                   KFLD                    KAGU01
     C*
     C     K0003         KLIST
     C                   KFLD                    KAGU01
     C                   KFLD                    KBMN02
     C*
     C     K0004         KLIST
     C                   KFLD                    KAGU01
     C                   KFLD                    KBMN02
     C                   KFLD                    KCOP03
     C*
     C     K0005         KLIST
     C                   KFLD                    KBUS01
     C*
     C     K0006         KLIST
     C                   KFLD                    KPPG01
     C*
     C     K0007         KLIST
     C                   KFLD                    KCUS01
     C                   KFLD                    KCMN02
     C                   KFLD                    KCOP03
     C*
     C     K0008         KLIST
     C                   KFLD                    KCUS01
     C                   KFLD                    KCMN02
     C*
     C     K0009         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C                   KFLD                    KDSE03
     C*
     C     K0010         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    MBMNUC        WBMNUC                         Menu
     C     *LIKE         DEFINE    MBMNUD        WBMNUD                         Menu Description
     C     *LIKE         DEFINE    MDMNUC        WDMNUC                         Menu
     C     *LIKE         DEFINE    MDOPTC        WDOPTC                         Option
     C     *LIKE         DEFINE    MDSEQN        WDSEQN                         Sequence Number
     C     *LIKE         DEFINE    MDTEXT        WDTEXT                         Text
     C     *LIKE         DEFINE    MCACTA        WCACTA                         Add
     C     *LIKE         DEFINE    MCACTD        WCACTD                         Delete
     C     *LIKE         DEFINE    MCACTR        WCACTR                         Revise
     C     *LIKE         DEFINE    MCMNUC        WCMNUC                         Menu
     C     *LIKE         DEFINE    MCOPTC        WCOPTC                         Option
     C     *LIKE         DEFINE    MCOPTD        WCOPTD                         Option Descripti
     C     *LIKE         DEFINE    MCPGMN        WCPGMN                         Program Name
     C     *LIKE         DEFINE    MCPGMT        WCPGMT                         Program Type
     C     *LIKE         DEFINE    MCPRM1        WCPRM1                         Parameter
     C     *LIKE         DEFINE    MCPRM2        WCPRM2                         Parameter
     C     *LIKE         DEFINE    MCPRM3        WCPRM3                         Parameter
     C     *LIKE         DEFINE    MCPRM4        WCPRM4                         Parameter
     C     *LIKE         DEFINE    MCSPGM        WCSPGM                         Secondary Progra
     C     *LIKE         DEFINE    MCUSER        WCUSER                         User
     C     *LIKE         DEFINE    MACHG         WACHG                          Allow Change of
     C     *LIKE         DEFINE    MADFV1        WADFV1                         Default Value fo
     C     *LIKE         DEFINE    MADFV2        WADFV2                         Default Value fo
     C     *LIKE         DEFINE    MADFV3        WADFV3                         Default Value fo
     C     *LIKE         DEFINE    RN0001        WK0001                         Group User
     C     *LIKE         DEFINE    MACHG         WK0002                         Allow Change of
     C     *LIKE         DEFINE    MADFV1        WK0003                         Default Value fo
     C     *LIKE         DEFINE    MADFV2        WK0004                         Default Value fo
     C     *LIKE         DEFINE    MADFV3        WK0005                         Default Value fo
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    MBUSER        HBUSER
     C     *LIKE         DEFINE    MBMNUC        HBMNUC
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    MDMNUC        HDMNUC
     C     *LIKE         DEFINE    MDOPTC        HDOPTC
     C     *LIKE         DEFINE    MDSEQN        HDSEQN
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    MCUSER        HCUSER
     C     *LIKE         DEFINE    MCMNUC        HCMNUC
     C     *LIKE         DEFINE    MCOPTC        HCOPTC
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    MPPGMN        HPPGMN
     C     *LIKE         DEFINE    MPSPGM        HPSPGM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    MAUSER        HAUSER
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    MAUSER        HD0001
     C                   MOVE      *ZEROS        ROW1              3 0
     C                   MOVE      *ZEROS        COL1              3 0
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        NARG1            30 9
     C                   MOVE      *ZEROS        NARG2            30 9
     C                   MOVE      *ZEROS        NARG4            30 9
     C                   MOVE      *ZEROS        NRSLT            30 9
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
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . .
     C                   MOVE      *BLANKS       ERR               1
     C                   MOVE      *BLANKS       FIRST             5
     C                   MOVE      *BLANKS       FL0001            4
     C                   MOVE      *BLANKS       FL0002            4
     C                   MOVE      *BLANKS       FL0003           26
     C                   MOVE      *ZEROS        FSTSEL            2 0
     C                   MOVE      *BLANKS       FST03             5
     C                   MOVE      *ZEROS        FST04             5 0
     C                   MOVE      *BLANKS       LAST              5
     C                   MOVE      *ZEROS        LSTSEL            2 0
     C                   MOVE      *BLANKS       LST03             5
     C                   MOVE      *ZEROS        LST04             5 0
     C                   MOVE      *ZEROS        MCOL              3 0
     C                   MOVE      *BLANKS       MORE              1
     C                   MOVE      *ZEROS        MROW              3 0
     C                   MOVE      *ZEROS        Z4                3 0          NUM
     C                   MOVE      *ZEROS        NUMLST            3 0
     C                   MOVE      *BLANKS       ONCE2             1
     C                   MOVE      *ZEROS        OP                2 0
     C                   MOVE      *ZEROS        OPLST             2 0
     C                   MOVE      *BLANKS       OPTU              1
     C                   MOVE      *BLANKS       PARM            256
     C                   MOVE      *BLANKS       PARM1            20
     C                   MOVE      *BLANKS       PARM2            20
     C                   MOVE      *BLANKS       PARM3            20
     C                   MOVE      *BLANKS       PARM4            20
     C                   MOVE      *ZEROS        PCOL              3 0
     C                   MOVE      *ZEROS        PECOL             2 0
     C                   MOVE      *BLANKS       PRDFV1           10
     C                   MOVE      *BLANKS       PRDFV2           10
     C                   MOVE      *BLANKS       PRDFV3           10
     C                   MOVE      *ZEROS        PROW              3 0
     C                   MOVE      *ZEROS        P2ROW             3 0
     C                   MOVE      *ZEROS        SELCNT            2 0
     C                   MOVE      *ZEROS        SOPT              2 0
     C                   MOVE      *BLANKS       SVK004            5
     C                   MOVE      *BLANKS       SVK005            5
     C                   MOVE      *BLANKS       SVK03             5
     C                   MOVE      *ZEROS        SVK04             5 0
     C                   MOVE      *ZEROS        S03CNT            3 0
     C                   MOVE      *ZEROS        S04CNT            3 0
     C                   MOVE      *BLANKS       WKCHG             1
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *ZEROS        WKCOL1            3 0
     C                   MOVE      *BLANKS       WKDFV1           10
     C                   MOVE      *BLANKS       WKDFV2           10
     C                   MOVE      *BLANKS       WKDFV3           10
     C                   MOVE      *ZEROS        WKLEN            15 5
     C                   MOVE      *BLANKS       WKLEV            10
     C                   MOVE      *BLANKS       WKMENU            5
     C                   MOVE      *ZEROS        Z5                3 0          Stored NUM
     C                   MOVE      *ZEROS        Z6                2 0          Stored OP
     C                   MOVE      *BLANKS       WKOPT             5
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *ZEROS        WKROW1            3 0
     C                   MOVE      *BLANKS       WK05A1            5
     C                   MOVE      *BLANKS       WK05A2            5
     C                   MOVE      *BLANKS       WK40A1           40
     C                   MOVE      *BLANKS       WK60A1           60
     C                   MOVE      *BLANKS       WSUSER           10
     C                   MOVE      *ZEROS        X                 3 0
     C                   MOVE      *ZEROS        Y                 3 0
     C                   MOVE      *ZEROS        Z                 3 0
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen f
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KAUS01           10            MAUSER
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       KAGU01           10            MAGUSER
     C                   MOVE      *BLANKS       KBMN02            5            MBMNUC
     C                   MOVE      *BLANKS       KCOP03            5            MCOPTC
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed
     C                   MOVE      *BLANKS       KBUS01           10            MBUSER
     C                   MOVE      *BLANKS       KPPG01           10            MPPGMN
     C                   MOVE      *BLANKS       KCUS01           10            MCUSER
     C                   MOVE      *BLANKS       KCMN02            5            MCMNUC
     C                   MOVE      *BLANKS       KDMN01            5            MDMNUC
     C                   MOVE      *BLANKS       KDOP02            5            MDOPTC
     C                   MOVE      *ZEROS        KDSE03            5 0          MDSEQN
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA fld
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      '  '          APPSET
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVE      *ZEROS        SEL001                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL002                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL003                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL004                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL005                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL006                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL007                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL008                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL009                         Init DS/*DTA fld
     C                   MOVE      *ZEROS        SEL010                         Init DS/*DTA fld
     C                   MOVEL     'LANDMENU'    APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     *ZEROS        LEN              15 5
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        OFFSET            4 0          OFFSET
     C                   Z-ADD     *ZEROS        NRSLT            30 9          RESULT
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        DAS003            5 0
     C                   Z-ADD     *ZEROS        DAS004            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        RN0003           30 9
     C                   Z-ADD     *ZEROS        NRSLT1           30 9
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             C3                5 0          *CST INDEX
     C                   Z-ADD     1             CALLST            1 0          CALL STSEX
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    MNUAPP        @DS001
     C     *DTAARA       DEFINE    MNUCOMP       @DS002
     C     *DTAARA       DEFINE    MNULEV1       @DS003
     C     *DTAARA       DEFINE    MNUPGM1       @DS004
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
     C                   EXSR      SPBACT
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0002'      S002
     C     SCRNID        CASEQ     'SC0003'      S003
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
     C* S001 - Menu selection
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* POSCUR WKROW,WKCOL
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C*                                                               *
     C* GETDTAA mnucomp
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* GETDTAA mnuapp
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* GETDTAA mnulev1
     C                   IN        @DS003                               93
     C                   Z-ADD     0             DAS003
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS003
     C                   END
     C* GETDTAA mnupgm1
     C                   IN        @DS004                               93
     C                   Z-ADD     0             DAS004
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS004
     C                   END
     C* PRDFV1 = *blanks
     C                   MOVEL     *BLANKS       PRDFV1
     C* PRDFV2 = *blanks
     C                   MOVEL     *BLANKS       PRDFV2
     C* PRDFV3 = *blanks
     C                   MOVEL     *BLANKS       PRDFV3
     C*                                                               *
     C* Retrieve User Details for menu
     C* WSUSER = *userid
     C                   MOVE      *BLANKS       WSUSER
     C                   MOVEL     USER          WSUSER
     C* GETREC D.menu,F.mnuusr,*EQ,WSUSER
     C*
     C                   EXSR      S004
     C* IF %sts(d.menu,f.mnuusr)=*no
     C*  Status of last file I/O
     C     STS02         IFNE      *ZERO
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If user belongs to a group use group values
     C* IF MAGuser <> *blank
     C     WK0001        IFNE      *BLANK
     C* WSUSER = Maguser
     C                   MOVE      WK0001        WSUSER
     C* GETREC d.menu,f.mnuusr1,*eq,maguser
     C*
     C                   EXSR      S005
     C* WKDFV1 = menu.mnuusr1.madfv1
     C                   MOVE      WK0003        WKDFV1
     C* WKDFV2 = menu.mnuusr1.madfv2
     C                   MOVE      WK0004        WKDFV2
     C* WKDFV3 = menu.mnuusr1.madfv3
     C                   MOVE      WK0005        WKDFV3
     C* WKCHG = menu.mnuusr1.machg
     C                   MOVE      WK0002        WKCHG
     C* ELSE                                                          *
     C                   ELSE
     C* WKDFV1 = menu.mnuusr.madfv1
     C                   MOVE      WADFV1        WKDFV1
     C* WKDFV2 = menu.mnuusr.madfv2
     C                   MOVE      WADFV2        WKDFV2
     C* WKDFV3 = menu.mnuusr.madfv3
     C                   MOVE      WADFV3        WKDFV3
     C* WKCHG = menu.mnuusr.machg
     C                   MOVE      WACHG         WKCHG
     C* END                                                           *
     C                   END
     C* MNU = ' '
     C                   MOVEA     *BLANKS       MNU
     C* MND = ' '
     C                   MOVEA     *BLANKS       MND
     C*                                                               *
     C* Set F18=Select text if user is allowed selection
     C* IF wkchg='Y'
     C     WKCHG         IFEQ      'Y'
     C* FL0003 = %BCT('F18=Select',zzlev1,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     C0001         AARG1
     C     AARG1         CAT(P)    ZZLEV1:C1     ARSLT0
     C                   MOVE      *BLANKS       FL0003
     C                   MOVEL     ARSLT0        FL0003
     C* ELSE                                                          *
     C                   ELSE
     C* FL0003 = *blanks
     C                   MOVEL     *BLANKS       FL0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.menu,F.mnuhed,WSUSER
     C*
     C                   EXSR      S006
     C* Fill list Panel
     C* NUM = 1
     C                   Z-ADD     1             Z4
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
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
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkw
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* SETLL d.menu,f.mnuhed,wsuser,first
     C*
     C                   EXSR      S007
     C*  Fill panel.
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
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* SETGT D.menu,f.mnuhed,wsuser,LAST
     C*
     C                   EXSR      S008
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Exit program on function key 12
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Select
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* If F18 is allowed for user call selection pgm
     C* IF wkchg='Y'
     C     WKCHG         IFEQ      'Y'
     C* CALL zzpgm1,prdfv1,prdfv2,prdfv3
     C                   Z-ADD     1             CALLST
     C                   CALL      ZZPGM1        P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF *CALLSTS=*NO
     C     CALLST        IFEQ      XNO
     C* DSPERR *NONE,'MNU0014','MENUERR'
     C                   MOVEL     'MNU0014'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* otherwise display error message
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR *NONE,'MNU0015','MENUERR'
     C                   MOVEL     'MNU0015'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Help
     C*
     C     *IN60         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process help requests
     C*                                                               *
     C* WKMENU = mnu(num)
     C                   MOVE      MNU(Z4)       WKMENU
     C* WKOPT = ' '
     C                   MOVEL     *BLANKS       WKOPT
     C* EXSCR sc0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
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
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Page Up
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* IF num > 1
     C     Z4            IFGT      1
     C* Z = num - 1
     C     Z4            SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z
     C* IF mnd(z) <> ' '
     C     MND(Z)        IFNE      *BLANKS
     C* FLDATR mnd(num),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* NUM = num - 1
     C     Z4            SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* FLDATR mnd(num),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted menu
     C* NUMLST = num
     C                   Z-ADD     Z4            NUMLST
     C* WKROW = num + mrow
     C     Z4            ADD       MROW          NRSLT0
     C                   Z-ADD     NRSLT0        WKROW
     C* WKCOL = mcol
     C                   Z-ADD     MCOL          WKCOL
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* SETLL d.menu,f.mnuhed,wsuser,first
     C*
     C                   EXSR      S007
     C*     2. Fill panel.
     C* EXSUBR S01BKW
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Page dwn
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* IF num < 12
     C     Z4            IFLT      12
     C* Z = num + 1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z
     C* IF mnd(z) <> ' '
     C     MND(Z)        IFNE      *BLANKS
     C* FLDATR mnd(num),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* NUM = num + 1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* FLDATR mnd(num),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted menu
     C* NUMLST = num
     C                   Z-ADD     Z4            NUMLST
     C* WKROW = num + mrow
     C     Z4            ADD       MROW          NRSLT0
     C                   Z-ADD     NRSLT0        WKROW
     C* WKCOL = mcol
     C                   Z-ADD     MCOL          WKCOL
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*     2. Fill Panel.
     C* SETGT D.menu,f.mnuhed,wsuser,LAST
     C*
     C                   EXSR      S008
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* Check If cursor is on menu bar
     C* WKNUM = num
     C                   Z-ADD     Z4            Z5
     C* IF mnd(1) <> ' '
     C     MND(1)        IFNE      *BLANKS
     C* IF %clf(mnd(1))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     1             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 1
     C                   Z-ADD     1             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(2) <> ' '
     C     MND(2)        IFNE      *BLANKS
     C* IF %clf(mnd(2))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     2             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 2
     C                   Z-ADD     2             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(3) <> ' '
     C     MND(3)        IFNE      *BLANKS
     C* IF %clf(mnd(3))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     3             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 3
     C                   Z-ADD     3             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(4) <> ' '
     C     MND(4)        IFNE      *BLANKS
     C* IF %clf(mnd(4))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     4             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 4
     C                   Z-ADD     4             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(5) <> ' '
     C     MND(5)        IFNE      *BLANKS
     C* IF %clf(mnd(5))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     5             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 5
     C                   Z-ADD     5             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(6) <> ' '
     C     MND(6)        IFNE      *BLANKS
     C* IF %clf(mnd(6))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     6             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 6
     C                   Z-ADD     6             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(7) <> ' '
     C     MND(7)        IFNE      *BLANKS
     C* IF %clf(mnd(7))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     7             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 7
     C                   Z-ADD     7             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(8) <> ' '
     C     MND(8)        IFNE      *BLANKS
     C* IF %clf(mnd(8))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     8             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 8
     C                   Z-ADD     8             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(9) <> ' '
     C     MND(9)        IFNE      *BLANKS
     C* IF %clf(mnd(9))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     9             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 9
     C                   Z-ADD     9             Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(10) <> ' '
     C     MND(10)       IFNE      *BLANKS
     C* IF %clf(mnd(10))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     10            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 10
     C                   Z-ADD     10            Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(11) <> ' '
     C     MND(11)       IFNE      *BLANKS
     C* IF %clf(mnd(11))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     11            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 11
     C                   Z-ADD     11            Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF mnd(12) <> ' '
     C     MND(12)       IFNE      *BLANKS
     C* IF %clf(mnd(12))
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     12            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* NUM = 12
     C                   Z-ADD     12            Z4
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKROW = *row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   MOVE      HALFWD        ROW1
     C                   Z-ADD     ROW1          WKROW
     C* WKCOL = *col
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   MOVE      HALFWD        COL1
     C                   Z-ADD     COL1          WKCOL
     C*                                                               *
     C* IF (num <> 0) & (mnu(num) <> ' ')
     C     Z4            IFNE      *ZERO
     C     MNU(Z4)       ANDNE     *BLANKS
     C* IF numlst <> num
     C     NUMLST        IFNE      Z4
     C* FLDATR mnd(wknum),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mnd(num),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* NUMLST = num
     C                   Z-ADD     Z4            NUMLST
     C* ELSE                                                          *
     C                   ELSE
     C* WKMENU = mnu(num)
     C                   MOVE      MNU(Z4)       WKMENU
     C* EXSCR sc0002
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
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
     C* END                                                           *
     C                   END
     C*                                                               *
     C* POSCUR WKROW,WKCOL
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Options for menu
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00010000'    *IN(9)
     C                   MOVEA     '000000'      *IN(17)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Initialise Fields
     C* FST03 = ' '
     C                   MOVEL     *BLANKS       FST03
     C* LST03 = ' '
     C                   MOVEL     *BLANKS       LST03
     C* SVK03 = ' '
     C                   MOVEL     *BLANKS       SVK03
     C* FSTSEL = 0
     C                   Z-ADD     *ZERO         FSTSEL
     C* LSTSEL = 0
     C                   Z-ADD     *ZERO         LSTSEL
     C* SEL = 0
     C                   Z-ADD     *ZERO         SEL
     C* SELCNT = 0
     C                   Z-ADD     *ZERO         SELCNT
     C* SOPT = 0
     C                   Z-ADD     *ZERO         SOPT
     C* OPTU = 'N'
     C                   MOVE      'N'           OPTU
     C*                                                               *
     C* ** Position cusror to fisrt line
     C* IF once2  <> 'Y'
     C     ONCE2         IFNE      'Y'
     C* PROW = 6
     C                   Z-ADD     6             PROW
     C* PCOL = 40
     C                   Z-ADD     40            PCOL
     C* PECOL = 78
     C                   Z-ADD     78            PECOL
     C* WKROW1 = prow + 1
     C     PROW          ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WKROW1
     C* WKCOL1 = pcol
     C                   Z-ADD     PCOL          WKCOL1
     C* POSCUR WKROW1,WKCOL1
     C                   Z-ADD     WKROW1        LIN
     C                   Z-ADD     WKCOL1        POS
     C* ONCE2 = 'Y'
     C                   MOVE      'Y'           ONCE2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* S03CNT = 010
     C                   Z-ADD     010           S03CNT
     C*                                                               *
     C* ** Build first List
     C* OP = 1
     C                   Z-ADD     1             OP
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
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
     C                   EXFMT     SCR002
     C                   MOVEA     '01'          *IN(11)
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
     C* Bkw
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = FST03
     C                   MOVE      FST03         SVK03
     C* SELCNT = FSTSEL - 1
     C     FSTSEL        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        SELCNT
     C* ** Array Backwards read.
     C* EXSUBR S03ABR
     C                   EXSR      S03ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = LST03
     C                   MOVE      LST03         SVK03
     C* SELCNT = LSTSEL - 1
     C     LSTSEL        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        SELCNT
     C* ** Array Forward Read.
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Select
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* If F18 is allowed for user call selection pgm
     C* IF wkchg='Y'
     C     WKCHG         IFEQ      'Y'
     C* CALL zzpgm1,prdfv1,prdfv2,prdfv3
     C                   Z-ADD     1             CALLST
     C                   CALL      ZZPGM1        P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF *CALLSTS=*NO
     C     CALLST        IFEQ      XNO
     C* DSPERR *NONE,'MNU0014','MENUERR'
     C                   MOVEL     'MNU0014'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* otherwise display error message
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR *NONE,'MNU0015','MENUERR'
     C                   MOVEL     'MNU0015'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Help
     C*
     C     *IN60         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process help requests
     C*                                                               *
     C* WKOPT = b01(op)
     C                   MOVE      B01(OP)       WKOPT
     C* EXSCR sc0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* X = 0
     C                   Z-ADD     *ZERO         X
     C* DO 1,10,x
     C     1             DO        10            X
     C* FLDATR T03(x),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     X             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF x = op
     C     X             IFEQ      OP
     C* FLDATR t03(x),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     X             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*                                                               *
     C* IF op = 1
     C     OP            IFEQ      1
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = FST03
     C                   MOVE      FST03         SVK03
     C* SELCNT = FSTSEL - 1
     C     FSTSEL        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        SELCNT
     C* ** Array Backwards read.
     C* EXSUBR S03ABR
     C                   EXSR      S03ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* Z = op - 1
     C     OP            SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z
     C* IF t03(z) <> ' '
     C     T03(Z)        IFNE      *BLANKS
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* OP = op - 1
     C     OP            SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        OP
     C* FLDATR t03(op),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted option
     C* OPLST = op
     C                   Z-ADD     OP            OPLST
     C* WKROW1 = op + prow
     C     OP            ADD       PROW          NRSLT0
     C                   Z-ADD     NRSLT0        WKROW1
     C* WKCOL1 = pcol
     C                   Z-ADD     PCOL          WKCOL1
     C* POSCUR wkrow1,wkcol1
     C                   Z-ADD     WKROW1        LIN
     C                   Z-ADD     WKCOL1        POS
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*                                                               *
     C* IF op = 10
     C     OP            IFEQ      10
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = LST03
     C                   MOVE      LST03         SVK03
     C* SELCNT = LSTSEL - 1
     C     LSTSEL        SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        SELCNT
     C* ** Array Forward Read.
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* Z = op + 1
     C     OP            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF t03(Z) <> ' '
     C     T03(Z)        IFNE      *BLANKS
     C* OP = op + 1
     C     OP            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        OP
     C* ELSE                                                          *
     C                   ELSE
     C* OP = 1
     C                   Z-ADD     1             OP
     C* END                                                           *
     C                   END
     C* FLDATR t03(op),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted option
     C* OPLST = op
     C                   Z-ADD     OP            OPLST
     C* WKROW1 = op +  prow
     C     OP            ADD       PROW          NRSLT0
     C                   Z-ADD     NRSLT0        WKROW1
     C* WKCOL1 = pcol
     C                   Z-ADD     PCOL          WKCOL1
     C* POSCUR wkrow1,wkcol1
     C                   Z-ADD     WKROW1        LIN
     C                   Z-ADD     WKCOL1        POS
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* Check If cursor is on menu bar
     C* Bypass If cursor is on option selection & option no was used last
     C* ERR = 'N'
     C                   MOVE      'N'           ERR
     C* WKOP = op
     C                   Z-ADD     OP            Z6
     C* IF (OPTU='N') *OR (%CLF(SOPT)=*NO)
     C* P2ROW = prow + 1
     C     PROW          ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(1) <> ' '
     C     T03(1)        IFNE      *BLANKS
     C* IF %CLF(T03(1))
     C* IF %CSL(P2row,PCOL,P2ROW,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 1
     C                   Z-ADD     1             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 2
     C     PROW          ADD       2             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(2) <> ' '
     C     T03(2)        IFNE      *BLANKS
     C* IF %clf(t03(2))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 2
     C                   Z-ADD     2             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 3
     C     PROW          ADD       3             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(3) <> ' '
     C     T03(3)        IFNE      *BLANKS
     C* IF %clf(t03(3))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 3
     C                   Z-ADD     3             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 4
     C     PROW          ADD       4             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(4) <> ' '
     C     T03(4)        IFNE      *BLANKS
     C* IF %clf(t03(4))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 4
     C                   Z-ADD     4             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 5
     C     PROW          ADD       5             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(5) <> ' '
     C     T03(5)        IFNE      *BLANKS
     C* IF %clf(t03(5))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 5
     C                   Z-ADD     5             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 6
     C     PROW          ADD       6             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(6) <> ' '
     C     T03(6)        IFNE      *BLANKS
     C* IF %clf(t03(6))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 6
     C                   Z-ADD     6             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 7
     C     PROW          ADD       7             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(7) <> ' '
     C     T03(7)        IFNE      *BLANKS
     C* IF %clf(t03(7))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 7
     C                   Z-ADD     7             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 8
     C     PROW          ADD       8             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(8) <> ' '
     C     T03(8)        IFNE      *BLANKS
     C* IF %clf(t03(8))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 8
     C                   Z-ADD     8             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 9
     C     PROW          ADD       9             NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(9) <> ' '
     C     T03(9)        IFNE      *BLANKS
     C* IF %clf(t03(9))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 9
     C                   Z-ADD     9             OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* P2ROW = prow + 10
     C     PROW          ADD       10            NRSLT0
     C                   Z-ADD     NRSLT0        P2ROW
     C* IF t03(10) <> ' '
     C     T03(10)       IFNE      *BLANKS
     C* IF %clf(t03(10))
     C* IF %CSL(P2row,PCOL,P2row,PECOL)=*YES
     C*  Cursor Location
     C                   Z-ADD     P2ROW         NARG1
     C                   Z-ADD     PCOL          NARG2
     C                   Z-ADD     P2ROW         NARG3
     C                   Z-ADD     PECOL         NARG4
     C                   EXSR      SCSL
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* OP = 10
     C                   Z-ADD     10            OP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END  ; optu ='N' or  cursor not on option select field
     C*                                                               *
     C* Preserve cursor position
     C* WKROW1 = *row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   MOVE      HALFWD        ROW1
     C                   Z-ADD     ROW1          WKROW1
     C* WKCOL1 = *col
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   MOVE      HALFWD        COL1
     C                   Z-ADD     COL1          WKCOL1
     C*                                                               *
     C* If option no selected this takes priority over cursor
     C* IF sopt <> 0
     C     SOPT          IFNE      *ZERO
     C* OPTU = 'Y'
     C                   MOVE      'Y'           OPTU
     C*                                                               *
     C* Roll Up or down until option no is found
     C* DOW (More = 'Y') *AND ((sopt < fstsel) *OR (sopt > lstsel))
     C     MORE          IFEQ      'Y'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     SOPT          IFLT      FSTSEL
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     SOPT          IFGT      LSTSEL
     C                   Z-ADD     1             NRSLT1
     C                   ELSE
     C                   Z-ADD     0             NRSLT1
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT1        OREQ      1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* IF (sopt < fstsel)
     C     SOPT          IFLT      FSTSEL
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = FST03
     C                   MOVE      FST03         SVK03
     C* SELCNT = fstsel - 1
     C     FSTSEL        SUB       1             NRSLT1
     C                   Z-ADD     NRSLT1        SELCNT
     C* EXSUBR S03ABR
     C                   EXSR      S03ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C* IF (sopt > lstsel)
     C     SOPT          IFGT      LSTSEL
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SVK03 = LST03
     C                   MOVE      LST03         SVK03
     C* SELCNT = LStsel - 1
     C     LSTSEL        SUB       1             NRSLT1
     C                   Z-ADD     NRSLT1        SELCNT
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C* END  ;
     C     MORE          IFEQ      'Y'
     C                   Z-ADD     1             NRSLT1
     C                   ELSE
     C                   Z-ADD     0             NRSLT1
     C                   END
     C     SOPT          IFLT      FSTSEL
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     SOPT          IFGT      LSTSEL
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT0        OREQ      1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT1        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT1
     C                   ELSE
     C                   Z-ADD     0             NRSLT1
     C                   END
     C                   Z-ADD     NRSLT1        RSLT01
     C                   END
     C*                                                               *
     C* If option no is greater than last one on file - error
     C* FLDATR t03(wkop),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* IF sopt > lstsel
     C     SOPT          IFGT      LSTSEL
     C* DSPERR SOPT,'MNU0017','MENUERR'
     C                   MOVEL     'MNU0017'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'SOPT    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERR = 'Y'
     C                   MOVE      'Y'           ERR
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* Y = 1
     C                   Z-ADD     1             Y
     C* IF %ALK(SEL,SOPT,Y)=*yes
     C*  Perform array Look up.
     C     SOPT          LOOKUP    SEL(Y)                                 93
     C     *IN93         IFEQ      '1'
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
     C* OP = Y
     C                   Z-ADD     Y             OP
     C* FLDATR t03(op),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* OPLST = op
     C                   Z-ADD     OP            OPLST
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If option no not used set option flag to 'N'
     C* ELSE                                                          *
     C                   ELSE
     C* OPTU = 'N'
     C                   MOVE      'N'           OPTU
     C* END  ; option no entered
     C                   END
     C*                                                               *
     C* If enter pressed once - highlight option
     C* IF (err = 'N') & (op <> 0) & (t03(op) <> ' ')
     C     ERR           IFEQ      'N'
     C     OP            ANDNE     *ZERO
     C     T03(OP)       ANDNE     *BLANKS
     C* IF oplst <> op
     C     OPLST         IFNE      OP
     C* FLDATR t03(wkop),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR t03(op),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* OPLST = op
     C                   Z-ADD     OP            OPLST
     C* ELSE                                                          *
     C                   ELSE
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* WK05A1 = wkmenu
     C                   MOVE      WKMENU        WK05A1
     C* WK05A2 = b01(op)
     C                   MOVE      B01(OP)       WK05A2
     C* GETREC D.menu,F.mnuopt,*eq,wsuser,wk05a1,wk05a2
     C*
     C                   EXSR      S009
     C* IF b01(op)<> ' '
     C     B01(OP)       IFNE      *BLANKS
     C* IF mcpgmt = ' ' | mcpgmt = 'R'
     C     WCPGMT        IFEQ      *BLANKS
     C     WCPGMT        OREQ      'R'
     C*                                                               *
     C* Set up Keywords
     C* PARM4 = mcprm4
     C                   MOVE      WCPRM4        PARM4
     C* PARM3 = mcprm3
     C                   MOVE      WCPRM3        PARM3
     C* PARM2 = mcprm2
     C                   MOVE      WCPRM2        PARM2
     C* PARM1 = mcprm1
     C                   MOVE      WCPRM1        PARM1
     C*                                                               *
     C* EXSUBR S03KEY   ; *BLANKS, *BLANK, *USERID
     C                   EXSR      S03KEY
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* IF mcprm4 <> ' '
     C     WCPRM4        IFNE      *BLANKS
     C* IF mcspgm = ' '
     C     WCSPGM        IFEQ      *BLANKS
     C* CALL mcpgmn,PARM1,PARM2,PARM3,PARM4
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL mcpgmn,mcspgm,PARM1,PARM2,PARM3,PARM4
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0003                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ; 3 parms to pass
     C                   ELSE
     C* IF McPRM3 <> ' '
     C     WCPRM3        IFNE      *BLANKS
     C* IF mcspgm = ' '
     C     WCSPGM        IFEQ      *BLANKS
     C* CALL mcpgmn,PARM1,PARM2,PARM3
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0004                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL mcpgmn,mcspgm,PARM1,PARM2,PARM3
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0005                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ; 2 parms to pass
     C                   ELSE
     C* IF McPRM2 <> ' '
     C     WCPRM2        IFNE      *BLANKS
     C* IF mcspgm = ' '
     C     WCSPGM        IFEQ      *BLANKS
     C* CALL mcpgmn,PARM1,PARM2
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0006                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL mcpgmn,mcspgm,PARM1,PARM2
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0007                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ; 1 parm to pass
     C                   ELSE
     C* IF McPRM1 <> ' '
     C     WCPRM1        IFNE      *BLANKS
     C* IF mcspgm = ' '
     C     WCSPGM        IFEQ      *BLANKS
     C* CALL mcpgmn,PARM1
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0008                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL mcpgmn,mcspgm,PARM1
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0009                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ; No Parameters
     C                   ELSE
     C* IF mcspgm = ' '
     C     WCSPGM        IFEQ      *BLANKS
     C* CALL mcpgmn
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN                               93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL mcpgmn,mcspgm
     C                   Z-ADD     1             CALLST
     C                   CALL      WCPGMN        P0010                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* END  ; mcprm1
     C                   END
     C* END  ; mcprm2
     C                   END
     C* END  ; mcprm3
     C                   END
     C* END  ; mcprm4
     C                   END
     C* END ; Option type blank
     C                   END
     C*                                                               *
     C* Call CL
     C* IF mcpgmt = 'C'
     C     WCPGMT        IFEQ      'C'
     C* WK40A1 = %APP(mcprm1,mcprm2)
     C*  Append two fields
     C                   MOVE      *BLANK        ARSLT0
     C     WCPRM1        CAT       WCPRM2        ARSLT0
     C                   MOVE      *BLANKS       WK40A1
     C                   MOVEL     ARSLT0        WK40A1
     C* WK60A1 = %app(wk40a1,mcprm3)
     C*  Append two fields
     C                   MOVE      *BLANK        ARSLT0
     C     WK40A1        CAT       WCPRM3        ARSLT0
     C                   MOVE      *BLANKS       WK60A1
     C                   MOVEL     ARSLT0        WK60A1
     C* PARM = %bct(mcpgmn,wk40a1,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C     WCPGMN        CAT(P)    WK40A1:C1     ARSLT0
     C                   MOVE      *BLANKS       PARM
     C                   MOVEL     ARSLT0        PARM
     C* WKLEN = 256
     C                   Z-ADD     256           WKLEN
     C* CALL 'QCMDEXC',parm,wklen
     C                   Z-ADD     1             CALLST
     C                   CALL      'QCMDEXC'     P0011                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C* Load new menu
     C* IF mcpgmt = 'M'
     C     WCPGMT        IFEQ      'M'
     C* FST03 = ' '
     C                   MOVEL     *BLANKS       FST03
     C* LST03 = ' '
     C                   MOVEL     *BLANKS       LST03
     C* SVK03 = ' '
     C                   MOVEL     *BLANKS       SVK03
     C* FSTSEL = 0
     C                   Z-ADD     *ZERO         FSTSEL
     C* LSTSEL = 0
     C                   Z-ADD     *ZERO         LSTSEL
     C* SEL = 0
     C                   Z-ADD     *ZERO         SEL
     C* SELCNT = 0
     C                   Z-ADD     *ZERO         SELCNT
     C* SOPT = 0
     C                   Z-ADD     *ZERO         SOPT
     C* OPTU = 'N'
     C                   MOVE      'N'           OPTU
     C* WKMENU = MCPGMN
     C                   MOVE      *BLANKS       WKMENU
     C                   MOVEL     WCPGMN        WKMENU
     C* ** Array forward read.
     C* FLDATR t03(wkop),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR t03(op),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* OP = 1
     C                   Z-ADD     1             OP
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* SOPT = 0
     C                   Z-ADD     *ZERO         SOPT
     C* END                                                           *
     C                   END
     C*                                                               *
     C* DSPMSG                                                        *
     C                   MOVE      'Y'           MSGFLG
     C* IF optu='Y'
     C     OPTU          IFEQ      'Y'
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C* ELSE                                                          *
     C                   ELSE
     C* POSCUR wkrow1,wkcol1
     C                   Z-ADD     WKROW1        LIN
     C                   Z-ADD     WKCOL1        POS
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Help text
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00010000'    *IN(9)
     C                   MOVEA     '000000'      *IN(17)
     C                   MOVEA     '1'           *IN(80)
     C* FST04 = 0
     C                   Z-ADD     *ZERO         FST04
     C* LST04 = 0
     C                   Z-ADD     *ZERO         LST04
     C* SVK04 = 0
     C                   Z-ADD     *ZERO         SVK04
     C* SVK004 = WKmenu
     C                   MOVE      WKMENU        SVK004
     C* SVK005 = WKopt
     C                   MOVE      WKOPT         SVK005
     C* S04CNT = 010
     C                   Z-ADD     010           S04CNT
     C* ** Array forward read.
     C* EXSUBR S03AFR
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
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
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* SVK04 = FST04
     C                   Z-ADD     FST04         SVK04
     C* ** Array Backwards read.
     C* EXSUBR S03ABR
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* SVK04 = LST04
     C                   Z-ADD     LST04         SVK04
     C* ** Array Forward Read.
     C* EXSUBR S03AFR
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* SPBACT - Performs all the program begin actions.
     C*****************************************************************
     C     SPBACT        BEGSR
     C*
     C* PGMBEGACT                                                     *
     C* CALL PGM(RMTOBJ/APITEL)
     C                   MOVEA     CMD(1)        CST
     C                   Z-ADD     24            C3
     C                   MOVEA     *BLANK        CST(C3)
     C                   EXSR      SCMD
     C* MROW = 5
     C                   Z-ADD     5             MROW
     C* MCOL = 4
     C                   Z-ADD     4             MCOL
     C* WKROW = mrow + 1
     C     MROW          ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        WKROW
     C* WKCOL = mcol
     C                   Z-ADD     MCOL          WKCOL
     C* END                                                           *
     C                   ENDSR
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
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0002'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0003'
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
     C* S01BKW -
     C*****************************************************************
     C     S01BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C01 = 13
     C                   Z-ADD     13            Z1
     C* GETREC d.menu,f.MNUhed,*pv,wsuser
     C*
     C                   EXSR      S010
     C* DOW %sts(d.menu,f.MNUhed)=*yes & c01 > 1
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
     C     Z1            IFGT      1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* If menu is on programs this is a sub menu
     C* do not display
     C* GETREC D.MENU,F.MNUPGM,*EQ,MBMNUC
     C*
     C                   EXSR      S012
     C* IF %STS(D.MENU,F.MNUPGM)=*NO
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* C01 = C01-1
     C     Z1            SUB       1             RN0003
     C                   Z-ADD     RN0003        Z1
     C* NUM = 12
     C                   Z-ADD     12            Z4
     C* IF c01 = 12
     C     Z1            IFEQ      12
     C* MNU = ' '
     C                   MOVEA     *BLANKS       MNU
     C* MND = ' '
     C                   MOVEA     *BLANKS       MND
     C* LAST = mbmnuc
     C                   MOVE      WBMNUC        LAST
     C* FL0002 = 'More'
     C                   MOVE      'More'        FL0002
     C* END                                                           *
     C                   END
     C* ** Save key information in key arrays.
     C* FLDATR mnd(1),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     1             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mnd(12),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     12            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted menu
     C* NUMLST = num
     C                   Z-ADD     Z4            NUMLST
     C* WKROW = num + mrow
     C     Z4            ADD       MROW          RN0003
     C                   Z-ADD     RN0003        WKROW
     C* WKCOL = mcol
     C                   Z-ADD     MCOL          WKCOL
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C* MND(C01) = mbmnud
     C                   MOVE      *BLANKS       MND(Z1)
     C                   MOVE      WBMNUD        MND(Z1)
     C* MNU(C01) = mbmnuc
     C                   MOVE      *BLANKS       MNU(Z1)
     C                   MOVE      WBMNUC        MNU(Z1)
     C* END ; Menu exists on programs file
     C                   END
     C* ** Get next menu
     C* GETREC d.menu,f.MNUhed,*pv,wsuser
     C*
     C                   EXSR      S010
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     Z1            IFGT      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C* FIRST = mnu(1)
     C                   MOVE      MNU(1)        FIRST
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01FWD -
     C*****************************************************************
     C     S01FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* FL0002 = ' '
     C                   MOVEL     *BLANKS       FL0002
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* GETREC D.menu,f.MNUhed,*Ne,wsuser
     C*
     C                   EXSR      S013
     C* DOW %sts(d.menu,f.MNUhed)=*yes & c01 < 12
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
     C     Z1            IFLT      12
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* If menu is on programs this is a sub menu
     C* do not display
     C* GETREC D.MENU,F.MNUPGM,*EQ,MBMNUC
     C*
     C                   EXSR      S012
     C* IF %STS(D.MENU,F.MNUPGM)=*NO
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C*                                                               *
     C* C01 = C01+1
     C     Z1            ADD       1             RN0003
     C                   Z-ADD     RN0003        Z1
     C* NUM = 1
     C                   Z-ADD     1             Z4
     C* IF c01 = 1
     C     Z1            IFEQ      1
     C* FIRST = mbmnuc
     C                   MOVE      WBMNUC        FIRST
     C* MNU = ' '
     C                   MOVEA     *BLANKS       MNU
     C* MND = ' '
     C                   MOVEA     *BLANKS       MND
     C* END                                                           *
     C                   END
     C* ** Save key information in key arrays.
     C* FLDATR mnd(12),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     12            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mnd(1),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'MND     '    FLDNAM
     C                   Z-ADD     1             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* *** Move cursor to highlighted menu
     C* NUMLST = num
     C                   Z-ADD     Z4            NUMLST
     C* WKROW = num + mrow
     C     Z4            ADD       MROW          RN0003
     C                   Z-ADD     RN0003        WKROW
     C* WKCOL = mcol
     C                   Z-ADD     MCOL          WKCOL
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C* MND(C01) = mbmnud
     C                   MOVE      *BLANKS       MND(Z1)
     C                   MOVE      WBMNUD        MND(Z1)
     C* MNU(C01) = mbmnuc
     C                   MOVE      *BLANKS       MNU(Z1)
     C                   MOVE      WBMNUC        MNU(Z1)
     C* END ; Menu exists on programs file
     C                   END
     C* ** Get next menu record
     C* GETREC d.menu,f.MNUhed,*Ne,wsuser
     C*
     C                   EXSR      S013
     C* END                                                           *
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     Z1            IFLT      12
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C*                                                               *
     C* LAST = mnu(12)
     C                   MOVE      MNU(12)       LAST
     C* IF %sts(d.menu,f.MNUhed)=*yes
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* FL0002 = 'More'
     C                   MOVE      'More'        FL0002
     C* END                                                           *
     C                   END
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03ABR - SCRN SUB
     C*****************************************************************
     C     S03ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* ** Set pointer to first record on screen.
     C* SETLL D.Menu,F.MNUOPT,WSUSER,WKMENU,SVK03
     C*
     C                   EXSR      S015
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.Menu,F.MNUOPT,*PV,WSUSER,WKMENU
     C*
     C                   EXSR      S016
     C* DOW (C03<S03CNT)&%STS(D.menu,F.mnuopt)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* SELCNT = selcnt - 1
     C     SELCNT        SUB       1             RN0003
     C                   Z-ADD     RN0003        SELCNT
     C* C03 = C03+1
     C     Z2            ADD       1             RN0003
     C                   Z-ADD     RN0003        Z2
     C* GETREC D.Menu,F.MNUOPT,*PV,WSUSER,WKMENU
     C*
     C                   EXSR      S016
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* OP = 10
     C                   Z-ADD     10            OP
     C* EXSUBR S03ALD
     C                   EXSR      S03ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03AB
     C                   END
     C*
     C     $S03AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - SCRN SUB
     C*****************************************************************
     C     S500          BEGSR
     C*
     C* ** Array backwards read.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Set pointer to first record on screen.
     C* SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C*
     C                   EXSR      S018
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C*
     C                   EXSR      S019
     C* DOW (C04<S04CNT)&%STS(D.MENU,F.mnuHLP)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0003
     C                   Z-ADD     RN0003        Z3
     C* GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C*
     C                   EXSR      S019
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
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
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S03ALD
     C                   EXSR      S502
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S500
     C                   END
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* S03AFR - SCRN SUB
     C*****************************************************************
     C     S03AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.Menu,F.MNUOPT,WSUSER,WKMENU,SVK03
     C*
     C                   EXSR      S015
     C* OP = 1
     C                   Z-ADD     1             OP
     C* ** Load arrays from this point.
     C* EXSUBR S03ALD
     C                   EXSR      S03ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03AF
     C                   END
     C*
     C     $S03AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S501 - SCRN SUB
     C*****************************************************************
     C     S501          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C*
     C                   EXSR      S018
     C* ** Load arrays from this point.
     C* EXSUBR S03ALD
     C                   EXSR      S502
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S501
     C                   END
     C*
     C     $S501         ENDSR
     C/EJECT
     C*****************************************************************
     C* S03ALD - SCRN SUB
     C*****************************************************************
     C     S03ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* B01 = ' '
     C                   MOVEA     *BLANKS       B01
     C* T03 = ' '
     C                   MOVEA     *BLANKS       T03
     C* PGM = ' '
     C                   MOVEA     *BLANKS       A01
     C* FL0001 = ' '
     C                   MOVEL     *BLANKS       FL0001
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* SEL = 0
     C                   Z-ADD     *ZERO         SEL
     C* FLDATR sel(1),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     1             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(2),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     2             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(3),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     3             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(4),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     4             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(5),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     5             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(6),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     6             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(7),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     7             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(8),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     8             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(9),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     9             FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR sel(10),*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     10            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Read file and load to arrays.
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* GETREC D.Menu,F.MNUOPT,*NE,WSUSER,WKMENU
     C*
     C                   EXSR      S021
     C* DOW (C03<S03CNT)&%STS(D.Menu,F.MNUOPT)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* SELCNT = selcnt + 1
     C     SELCNT        ADD       1             RN0003
     C                   Z-ADD     RN0003        SELCNT
     C* C03 = C03+1
     C     Z2            ADD       1             RN0003
     C                   Z-ADD     RN0003        Z2
     C* ** load screen array.
     C* FLDATR sel(C03),*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'SEL     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SEL(C03) = selcnt
     C                   Z-ADD     SELCNT        SEL(Z2)
     C* B01(C03) = mcoptc
     C                   MOVE      *BLANKS       B01(Z2)
     C                   MOVE      WCOPTC        B01(Z2)
     C* T03(C03) = mcoptd
     C                   MOVE      *BLANKS       T03(Z2)
     C                   MOVE      WCOPTD        T03(Z2)
     C* PGM(C03) = mcpgmn
     C                   MOVE      *BLANKS       A01(Z2)
     C                   MOVE      WCPGMN        A01(Z2)
     C* ** Save first record on screen.
     C* IF C03=1
     C     Z2            IFEQ      1
     C* FSTSEL = sel(C03)
     C                   Z-ADD     SEL(Z2)       FSTSEL
     C* FST03 = B01(C03)
     C                   MOVE      B01(Z2)       FST03
     C* END                                                           *
     C                   END
     C* IF C03<S03CNT
     C     Z2            IFLT      S03CNT
     C* GETREC D.Menu,F.MNUOPT,*NE,WSUSER,WKMENU
     C*
     C                   EXSR      S021
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C03>0
     C     Z2            IFGT      *ZERO
     C* LSTSEL = sel(C03)
     C                   Z-ADD     SEL(Z2)       LSTSEL
     C* LST03 = B01(C03)
     C                   MOVE      B01(Z2)       LST03
     C* IF op > c03
     C     OP            IFGT      Z2
     C* OP = c03
     C                   Z-ADD     Z2            OP
     C* END                                                           *
     C                   END
     C* FLDATR t03(op),*ri
     C                   MOVE      'X'           #RI
     C                   MOVEL     'T03     '    FLDNAM
     C                   Z-ADD     OP            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** move cursor to highlighted option
     C* OPLST = op
     C                   Z-ADD     OP            OPLST
     C* WKROW1 = op + prow
     C     OP            ADD       PROW          NRSLT0
     C                   Z-ADD     NRSLT0        WKROW1
     C* WKCOL1 = pcol
     C                   Z-ADD     PCOL          WKCOL1
     C* POSCUR wkrow1,wkcol1
     C                   Z-ADD     WKROW1        LIN
     C                   Z-ADD     WKCOL1        POS
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** More to display?
     C* GETREC D.Menu,F.MNUOPT,*NE,WSUSER,WKMENU
     C*
     C                   EXSR      S021
     C* IF %STS(D.Menu,F.MNUOPT)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* FL0001 = 'More'
     C                   MOVE      'More'        FL0001
     C* MORE = 'Y'
     C                   MOVE      'Y'           MORE
     C* ELSE                                                          *
     C                   ELSE
     C* MORE = 'N'
     C                   MOVE      'N'           MORE
     C* END                                                           *
     C                   END
     C*
     C     $S03AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S502 - SCRN SUB
     C*****************************************************************
     C     S502          BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* B02 = 0
     C                   Z-ADD     *ZERO         B02
     C* T05 = ' '
     C                   MOVEA     *BLANKS       T05
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Read file and load to arrays.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C*
     C                   EXSR      S023
     C* DOW (C04<S04CNT)&%STS(D.MENU,F.MNUHLP)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     RN0003        IFEQ      XYES
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0003        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0003
     C                   Z-ADD     RN0003        Z3
     C* ** Save field being prompted for.
     C* B02(C04) = mdseqn
     C                   Z-ADD     WDSEQN        B02(Z3)
     C* T05(C04) = mdtext
     C                   MOVE      *BLANKS       T05(Z3)
     C                   MOVE      WDTEXT        T05(Z3)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z3            IFEQ      1
     C* FST04 = B02(C04)
     C                   Z-ADD     B02(Z3)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z3            IFLT      S04CNT
     C* GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
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
     C     RN0003        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0003
     C                   ELSE
     C                   Z-ADD     0             RN0003
     C                   END
     C                   Z-ADD     RN0003        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C04>0
     C     Z3            IFGT      *ZERO
     C* LST04 = B02(C04)
     C                   Z-ADD     B02(Z3)       LST04
     C* END                                                           *
     C                   END
     C*
     C     $S502         ENDSR
     C/EJECT
     C*****************************************************************
     C* S03KEY - Set up Keywords
     C*****************************************************************
     C     S03KEY        BEGSR
     C*
     C*                                                               *
     C* Set up Keywords
     C* IF (mcprm4 = '*BLANKS') *OR (mcprm4 = '*BLANK')
     C     WCPRM4        IFEQ      '*BLANKS'
     C     WCPRM4        OREQ      '*BLANK'
     C* PARM4 = ' '
     C                   MOVEL     *BLANKS       PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*BLANKS') *OR (mcprm3 = '*BLANK')
     C     WCPRM3        IFEQ      '*BLANKS'
     C     WCPRM3        OREQ      '*BLANK'
     C* PARM3 = ' '
     C                   MOVEL     *BLANKS       PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*BLANKS') *OR (mcprm2 = '*BLANK')
     C     WCPRM2        IFEQ      '*BLANKS'
     C     WCPRM2        OREQ      '*BLANK'
     C* PARM2 = ' '
     C                   MOVEL     *BLANKS       PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*BLANKS') *OR (mcprm1 = '*BLANK')
     C     WCPRM1        IFEQ      '*BLANKS'
     C     WCPRM1        OREQ      '*BLANK'
     C* PARM1 = ' '
     C                   MOVEL     *BLANKS       PARM1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF (mcprm4 = '*USERID')
     C     WCPRM4        IFEQ      '*USERID'
     C* PARM4 = *USERID
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     USER          PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*USERID')
     C     WCPRM3        IFEQ      '*USERID'
     C* PARM3 = *USERID
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     USER          PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*USERID')
     C     WCPRM2        IFEQ      '*USERID'
     C* PARM2 = *USERID
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     USER          PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*USERID')
     C     WCPRM1        IFEQ      '*USERID'
     C* PARM1 = *USERID
     C                   MOVE      *BLANKS       PARM1
     C                   MOVEL     USER          PARM1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *LEV1 keyword
     C* IF prdfv1=*blanks
     C     PRDFV1        IFEQ      *BLANKS
     C* WKLEV = wkdfv1     ; set to default value
     C                   MOVE      WKDFV1        WKLEV
     C* ELSE                                                          *
     C                   ELSE
     C* WKLEV = prdfv1     ; set to selected value
     C                   MOVE      PRDFV1        WKLEV
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF (mcprm4 = '*LEV1')
     C     WCPRM4        IFEQ      '*LEV1'
     C* PARM4 = wklev
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     WKLEV         PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV1')
     C     WCPRM3        IFEQ      '*LEV1'
     C* PARM3 = wklev
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     WKLEV         PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV1')
     C     WCPRM2        IFEQ      '*LEV1'
     C* PARM2 = wklev
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     WKLEV         PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV1')
     C     WCPRM1        IFEQ      '*LEV1'
     C* PARM1 = wklev
     C                   MOVE      *BLANKS       PARM1
     C                   MOVEL     WKLEV         PARM1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *LEV2 keyword
     C* IF prdfv2=*blanks
     C     PRDFV2        IFEQ      *BLANKS
     C* WKLEV = wkdfv2     ; set to default value
     C                   MOVE      WKDFV2        WKLEV
     C* ELSE                                                          *
     C                   ELSE
     C* WKLEV = prdfv2     ; set to selected value
     C                   MOVE      PRDFV2        WKLEV
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF (mcprm4 = '*LEV2')
     C     WCPRM4        IFEQ      '*LEV2'
     C* PARM4 = wklev
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     WKLEV         PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV2')
     C     WCPRM3        IFEQ      '*LEV2'
     C* PARM3 = wklev
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     WKLEV         PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV2')
     C     WCPRM2        IFEQ      '*LEV2'
     C* PARM2 = wklev
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     WKLEV         PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV2')
     C     WCPRM1        IFEQ      '*LEV2'
     C* PARM1 = wklev
     C                   MOVE      *BLANKS       PARM1
     C                   MOVEL     WKLEV         PARM1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *LEV3 keyword
     C* IF prdfv3=*blanks
     C     PRDFV3        IFEQ      *BLANKS
     C* WKLEV = wkdfv3     ; set to default value
     C                   MOVE      WKDFV3        WKLEV
     C* ELSE                                                          *
     C                   ELSE
     C* WKLEV = prdfv3     ; set to selected value
     C                   MOVE      PRDFV3        WKLEV
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF (mcprm4 = '*LEV3')
     C     WCPRM4        IFEQ      '*LEV3'
     C* PARM4 = wklev
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     WKLEV         PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV3')
     C     WCPRM3        IFEQ      '*LEV3'
     C* PARM3 = wklev
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     WKLEV         PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV3')
     C     WCPRM2        IFEQ      '*LEV3'
     C* PARM2 = wklev
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     WKLEV         PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV3')
     C     WCPRM1        IFEQ      '*LEV3'
     C* PARM1 = wklev
     C                   MOVE      *BLANKS       PARM1
     C                   MOVEL     WKLEV         PARM1
     C* END                                                           *
     C                   END
     C*
     C     $S03KE        ENDSR
     C/EJECT
     C*****************************************************************
     C* SCSL - Checks if cursor is within the boundray of cordinates
     C*        specified and returns a result of true (1) or false (0).
     C*
     C* FUNCTION:    CURSOR_LOCATION (ROW1, COLUMN1, ROW2, COLUMN2)
     C*****************************************************************
     C     SCSL          BEGSR
     C* Get row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   Z-ADD     HALFWD        ROW1
     C* Get column
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   Z-ADD     HALFWD        COL1
     C*
     C     ROW1          IFGE      NARG1
     C     ROW1          ANDLE     NARG3
     C     COL1          ANDGE     NARG2
     C     COL1          ANDLE     NARG4
     C                   Z-ADD     1             NRSLT
     C                   ELSE
     C                   Z-ADD     0             NRSLT
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SCMD - Processes OS/400 Commands
     C*****************************************************************
     C     SCMD          BEGSR
     C*
     C                   MOVE      'N'           CMDERR                         Error flag
     C                   Z-ADD     2560          LEN
     C                   MOVE      '1'           *IN79
     C* Validate command syntax
     C*
     C                   CALL      'QCMDCHK'                            92
     C                   PARM                    CST                            CMD string
     C                   PARM                    LEN                            Length
     C* Check command syntax failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C* Execute command
     C*
     C     CMDERR        IFEQ      'N'
     C                   CALL      'QCMDEXC'                            92
     C                   PARM                    CST
     C                   PARM                    LEN
     C* Check command failure
     C*
     C     *IN92         IFEQ      '1'
     C                   MOVE      'Y'           CMDERR
     C                   END
     C                   END
     C*
     C                   MOVEA     *BLANKS       CST
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
     C* SHELP - Process help text.
     C*****************************************************************
     C     SHELP         BEGSR
     C* Get row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   Z-ADD     HALFWD        APPROW
     C* Get column
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   Z-ADD     HALFWD        APPCOL
     C* Call help processing program.
     C*
     C                   CALL      'CAHELP'      PHELP
     C                   ENDSR
     C/EJECT
     C**************************************************************************
     C* S004   - GETREC D.menu,F.mnuusr,*EQ,WSUSER
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     WSUSER        KAUS01
     C     K0001         CHAIN     MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUUSR
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUUSR
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC d.menu,f.mnuusr1,*eq,maguser
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     WK0001        KAUS01
     C     K0001         CHAIN     MNUUSR1                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SETLL D.menu,F.mnuhed,WSUSER
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUPGM
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     WSUSER        KAGU01
     C                   MOVEL     WSUSER        HBUSER                         User
     C                   MOVEL     WSUSER        MBUSER                         User
     C*
     C     K0002         SETLL     MNUHED                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - SETLL d.menu,f.mnuhed,wsuser,first
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUPGM
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     WSUSER        KAGU01
     C                   MOVEL     WSUSER        HBUSER                         User
     C                   MOVEL     WSUSER        MBUSER                         User
     C                   MOVEL     FIRST         KBMN02
     C                   MOVEL     FIRST         HBMNUC                         Menu
     C                   MOVEL     FIRST         MBMNUC                         Menu
     C*
     C     K0003         SETLL     MNUHED                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETGT D.menu,f.mnuhed,wsuser,LAST
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUPGM
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *HIVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     WSUSER        KAGU01
     C                   MOVEL     WSUSER        HBUSER                         User
     C                   MOVEL     WSUSER        MBUSER                         User
     C                   MOVEL     LAST          KBMN02
     C                   MOVEL     LAST          HBMNUC                         Menu
     C                   MOVEL     LAST          MBMNUC                         Menu
     C*
     C     K0003         SETGT     MNUHED
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.menu,F.mnuopt,*eq,wsuser,wk05a1,wk05a2
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     WSUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WK05A1        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     WK05A2        KCOP03
     C     K0004         CHAIN     MNUOPT                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC d.menu,f.MNUhed,*pv,wsuser
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WSUSER        KBUS01
     C     K0005         READPE    MNUHED                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUHED
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S011                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - Process To Reset File Pointer(BOF) - MNUHED
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.MNUHED
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0005         SETLL     MNUHED
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.MENU,F.MNUPGM,*EQ,MBMNUC
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KPPG01
     C                   MOVEL     WBMNUC        KPPG01
     C     K0006         CHAIN     MNUPGM                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUPGM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUPGM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.menu,f.MNUhed,*Ne,wsuser
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WSUSER        KBUS01
     C     K0005         READE     MNUHED                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUHED
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S014                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(EOF) - MNUHED
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.MNUHED
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUHED
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0005         SETGT     MNUHED
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - SETLL D.Menu,F.MNUOPT,WSUSER,WKMENU,SVK03
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUPGM
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HCOPTC                         Option
     C*
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     WSUSER        HCUSER                         User
     C                   MOVEL     WSUSER        MCUSER                         User
     C                   MOVEL     WKMENU        KCMN02
     C                   MOVEL     WKMENU        HCMNUC                         Menu
     C                   MOVEL     WKMENU        MCMNUC                         Menu
     C                   MOVEL     SVK03         KCOP03
     C                   MOVEL     SVK03         HCOPTC                         Option
     C                   MOVEL     SVK03         MCOPTC                         Option
     C*
     C     K0007         SETLL     MNUOPT                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETREC D.Menu,F.MNUOPT,*PV,WSUSER,WKMENU
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     WKMENU        KCMN02
     C     K0008         READPE    MNUOPT                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S017                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - Process To Reset File Pointer(BOF) - MNUOPT
     C**************************************************************************
     C     S017          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.MNUOPT
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCUS01                         User
     C                   MOVEL     MCUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02                         Menu
     C                   MOVEL     MCMNUC        KCMN02
     C     K0008         SETLL     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     *LOVAL        HDSEQN                         Sequence Number
     C*
     C                   MOVEL     SVK004        KDMN01
     C                   MOVEL     SVK004        HDMNUC                         Menu
     C                   MOVEL     SVK004        MDMNUC                         Menu
     C                   MOVEL     SVK005        KDOP02
     C                   MOVEL     SVK005        HDOPTC                         Option
     C                   MOVEL     SVK005        MDOPTC                         Option
     C                   Z-ADD     SVK04         KDSE03
     C                   Z-ADD     SVK04         HDSEQN                         Sequence Number
     C                   Z-ADD     SVK04         MDSEQN                         Sequence Number
     C*
     C     K0009         SETLL     MNUHLP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK004        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK005        KDOP02
     C     K0010         READPE    MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S020                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - Process To Reset File Pointer(BOF) - MNUHLP
     C**************************************************************************
     C     S020          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.MNUHLP
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDMN01                         Menu
     C                   MOVEL     MDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02                         Option
     C                   MOVEL     MDOPTC        KDOP02
     C     K0010         SETLL     MNUHLP
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.Menu,F.MNUOPT,*NE,WSUSER,WKMENU
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     WKMENU        KCMN02
     C     K0008         READE     MNUOPT                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S022                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - Process To Reset File Pointer(EOF) - MNUOPT
     C**************************************************************************
     C     S022          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.MNUOPT
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCUS01                         User
     C                   MOVEL     MCUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02                         Menu
     C                   MOVEL     MCMNUC        KCMN02
     C     K0008         SETGT     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK004        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK005        KDOP02
     C     K0010         READE     MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S024                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - Process To Reset File Pointer(EOF) - MNUHLP
     C**************************************************************************
     C     S024          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.MNUHLP
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDMN01                         Menu
     C                   MOVEL     MDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02                         Option
     C                   MOVEL     MDOPTC        KDOP02
     C     K0010         SETGT     MNUHLP
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
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
     C* SCLF   - CLF : Cursor Location On Field Handler
     C*****************************************************************
     C     SCLF          BEGSR
     C*
     C* FIND TABLE OFFSET BY SCREEN ID AND FIELD NAME AND FIELD INDEX
     C*
     C                   Z-ADD     1             X0
     C     #MAP          LOOKUP    DA4(X0)                                90
     C     *IN90         IFEQ      '1'                                          IF FIND
     C                   MOVE      DA5(X0)       #CLF
     C*          ------------------------------------------------------
     C*          | CALCULATE CURRENT SCREEN OFFSET
     C*          ------------------------------------------------------
     C* Get row
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   Z-ADD     HALFWD        APPROW
     C* Get column
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   Z-ADD     HALFWD        APPCOL
     C*
     C     APPROW        SUB       1             OFFSET
     C     OFFSET        MULT      80            OFFSET
     C                   ADD       APPCOL        OFFSET
     C*          ------------------------------------------------------
     C*          | CHECK OFFSET BOUNDARY
     C*          ------------------------------------------------------
     C     OFFSET        IFGE      #FROM
     C     OFFSET        ANDLE     #TO
     C                   Z-ADD     1             NRSLT
     C                   ELSE                                                   x-OFFSET GE #FR
     C                   Z-ADD     0             NRSLT
     C                   END                                                    OFFSET GE #FROM
     C*
     C                   MOVE      *BLANK        #ATRIB
     C                   END                                                    *IN90 EQ '1'
     C                   ENDSR
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
     C     WFILE#        IFEQ      1                                            MNUHED
     C     STS01         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS01                          ASSET LOCK STATU
     C                   ELSE
     C     STS01         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS01                          TRIGGER TO EXEC
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      2                                            MNUUSR
     C     STS02         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS02                          ASSET LOCK STATU
     C                   ELSE
     C     STS02         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS02                          TRIGGER TO EXEC
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      3                                            MNUUSR1
     C     STS03         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS03                          ASSET LOCK STATU
     C                   ELSE
     C     STS03         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS03                          TRIGGER TO EXEC
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      4                                            MNUPGM
     C     STS04         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS04                          ASSET LOCK STATU
     C                   ELSE
     C     STS04         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS04                          TRIGGER TO EXEC
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      5                                            MNUOPT
     C     STS05         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS05                          ASSET LOCK STATU
     C                   ELSE
     C     STS05         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS05                          TRIGGER TO EXEC
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      6                                            MNUHLP
     C     STS06         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS06                          ASSET LOCK STATU
     C                   ELSE
     C     STS06         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS06                          TRIGGER TO EXEC
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
     C*          | Move Fields From File To Work Area - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     MBMNUC        WBMNUC                         Menu
     C                   MOVEL     MBMNUD        WBMNUD                         Menu Description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     MBUSER        HBUSER                         User
     C                   MOVEL     MBMNUC        HBMNUC                         Menu
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     MACHG         WACHG                          Allow Change of
     C                   MOVEL     MADFV1        WADFV1                         Default Value fo
     C                   MOVEL     MADFV2        WADFV2                         Default Value fo
     C                   MOVEL     MADFV3        WADFV3                         Default Value fo
     C                   MOVEL     RN0001        WK0001                         Group User
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     MAUSER        HAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     MACHG         WK0002                         Allow Change of
     C                   MOVEL     MADFV1        WK0003                         Default Value fo
     C                   MOVEL     MADFV2        WK0004                         Default Value fo
     C                   MOVEL     MADFV3        WK0005                         Default Value fo
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     MAUSER        HD0001                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUPGM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     MPPGMN        HPPGMN                         Program Name
     C                   MOVEL     MPSPGM        HPSPGM                         Secondary Progra
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUOPT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     MCACTA        WCACTA                         Add
     C                   MOVEL     MCACTD        WCACTD                         Delete
     C                   MOVEL     MCACTR        WCACTR                         Revise
     C                   MOVEL     MCMNUC        WCMNUC                         Menu
     C                   MOVEL     MCOPTC        WCOPTC                         Option
     C                   MOVEL     MCOPTD        WCOPTD                         Option Descripti
     C                   MOVEL     MCPGMN        WCPGMN                         Program Name
     C                   MOVEL     MCPGMT        WCPGMT                         Program Type
     C                   MOVEL     MCPRM1        WCPRM1                         Parameter
     C                   MOVEL     MCPRM2        WCPRM2                         Parameter
     C                   MOVEL     MCPRM3        WCPRM3                         Parameter
     C                   MOVEL     MCPRM4        WCPRM4                         Parameter
     C                   MOVEL     MCSPGM        WCSPGM                         Secondary Progra
     C                   MOVEL     MCUSER        WCUSER                         User
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     MCUSER        HCUSER                         User
     C                   MOVEL     MCMNUC        HCMNUC                         Menu
     C                   MOVEL     MCOPTC        HCOPTC                         Option
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUHLP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     MDMNUC        WDMNUC                         Menu
     C                   MOVEL     MDOPTC        WDOPTC                         Option
     C                   Z-ADD     MDSEQN        WDSEQN                         Sequence Number
     C                   MOVEL     MDTEXT        WDTEXT                         Text
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     MDMNUC        HDMNUC                         Menu
     C                   MOVEL     MDOPTC        HDOPTC                         Option
     C                   Z-ADD     MDSEQN        HDSEQN                         Sequence Number
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
**  CMD -- OS/400 Commands array
CALL PGM(RMTOBJ/APITEL)
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0001    MND       000104040433
SC0001    MND       000204840513
SC0001    MND       000305640593
SC0001    MND       000406440673
SC0001    MND       000507240753
SC0001    MND       000608040833
SC0001    MND       000708840913
SC0001    MND       000809640993
SC0001    MND       000910441073
SC0001    MND       001011241153
SC0001    MND       001112041233
SC0001    MND       001212841313
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    MND       0001  01
SC0001    MND       0002  02
SC0001    MND       0003  03
SC0001    MND       0004  04
SC0001    MND       0005  05
SC0001    MND       0006  06
SC0001    MND       0007  07
SC0001    MND       0008  08
SC0001    MND       0009  09
SC0001    MND       0010  10
SC0001    MND       0011  11
SC0001    MND       0012  12
SC0002    T03       0001  13
SC0002    T03       0002  14
SC0002    T03       0003  15
SC0002    T03       0004  16
SC0002    T03       0005  17
SC0002    T03       0006  18
SC0002    T03       0007  19
SC0002    T03       0008  20
SC0002    T03       0009  21
SC0002    T03       0010  22
SC0002    SOPT      0000  1112    11                   Y
SC0002    SEL       0001            01
SC0002    SEL       0002            02
SC0002    SEL       0003            03
SC0002    SEL       0004            04
SC0002    SEL       0005            05
SC0002    SEL       0006            06
SC0002    SEL       0007            07
SC0002    SEL       0008            08
SC0002    SEL       0009            09
SC0002    SEL       0010            10
