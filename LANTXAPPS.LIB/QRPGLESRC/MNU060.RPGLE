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
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  MNUUSR      - (I/DISK   ) Menu Users                  MA
     F*  MNUUSR1     - (I/DISK   ) User Seq
     F*  MNUHED      - (I/DISK   ) Menu Heading file           MB
     F*  MNUOPT      - (I/DISK   ) Menu Options                MC
     F*  MNUHLP      - (I/DISK   ) Menu Help Text              MD
     F*  MNU060D     - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - Menu selection
     F*
     F*  01     - SCR001C1 / ##SELC : DSPATR(PC)
     F*  01     - SCR001C1 / ##SELC : DSPATR(RI)
     F*  02     - SCR001C1 / ##SELC : DSPATR(UL)
     F*  03     - SCR001C1 / RN0002 : DSPATR(PC)
     F*  03     - SCR001C1 / RN0002 : DSPATR(RI)
     F*  04     - SCR001C1 / RN0002 : DSPATR(UL)
     F*  05     - SCR001S1 / MBMNUD : DSPATR(PC)
     F*  05     - SCR001S1 / MBMNUD : DSPATR(RI)
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
     F*  SC0002     - Options for menu
     F*
     F*  01     - SCR002C1 / SOPT : DSPATR(PC)
     F*  01     - SCR002C1 / SOPT : DSPATR(RI)
     F*  02     - SCR002C1 / SOPT : DSPATR(UL)
     F*  03     - SCR002S1 / MCOPTD : DSPATR(PC)
     F*  03     - SCR002S1 / MCOPTD : DSPATR(RI)
     F*  63     - SCR002C1 SFLDSPCTL
     F*  64     - SCR002C1 SFLDSP
     F*  65     - SCR002S1 SFLNXTCHG
     F*  66     - SCR002C1 SFLINZ
     F* N63     - SCR002C1 SFLCLR
     F* N64     - SCR002C1 ERASE(SCR002S1)
     F* N67     - SCR002C1 SFLEND
     F* N79     - SCR002 PUTOVR
     F* N79     - SCR002C1 PUTOVR
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
     F* SREDSP -  Redisplay Windows within stack.
     F* S01FWD -
     F* S500 - SCRN SUB
     F* S03ABR - SCRN SUB
     F* S03AFR - SCRN SUB
     F* S03ALD - SCRN SUB
     F* S03KEY - Set up Keywords
     F* SLEN - Computes the number of characters in the alpha string.
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S004   - GETREC D.MENU,F.MNUUSR,*EQ,WSUSER
     F* S005   - GETREC D.MENU,F.MNUUSR1,*EQ,MAGUSER
     F* S006   - SHOWPAGE D.MENU,F.MNUHED,1
     F* S007   - GETREC D.COMPANY,F.COMPANY,*EQ,DSPNUMB
     F* S008   - GETREC D.MENU,F.MNUOPT,*EQ,WSUSER,WK05A1,WK05A2
     F* S009   - SETLL D.MENU,F.MNUHED,WSUSER
     F* S010   - Process To Reset File Pointer(EOF) - MNUHED
     F* S011   - Process To Reset File Pointer(EOF) - MNUHED
     F* S012   - SETLL D.MENU,F.MNUOPT,WSUSER,WKMENU
     F* S013   - Process To Reset File Pointer(EOF) - MNUOPT
     F* S014   - Process To Reset File Pointer(EOF) - MNUOPT
     F* S015   - SHOWPAGE D.MENU,F.MNUOPT,1
     F* S016   - GETREC D.MENU,F.MNUHED,*EQ,WSUSER,WKMENU
     F* S017   - SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     F* S018   - GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     F* S019   - Process To Reset File Pointer(BOF) - MNUHLP
     F* S020   - GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     F* S021   - Process To Reset File Pointer(EOF) - MNUHLP
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
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR002S1:RRN02)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FMNUUSR    IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FMNUUSR1   IF   E           K DISK
     F                                     RENAME(MNUUSRF:FMT001)
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FMNUHED    IF   E           K DISK
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
     D WK2             S              1    DIM(256)                             Alpha wrk array
     D WKA             S              1    DIM(256)                             Alpha wrk array
     D B02             S              2  0 DIM(10)
     D MM              S              5    DIM(99)
     D MND             S             30    DIM(12)
     D MNU             S              5    DIM(12)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D DA4             S             24    DIM(4) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(4) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(8) CTDATA PERRCD(1)              Fld Attr. Indic t
     D DA2             S             34    DIM(8) ALT(DA1)
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D*
     D* Company Number
     D*
     D @DS001          DS             3
     D*
     D* Software Application
     D*
     D @DS002          DS            30
     D  ZZSOFT                 1     30
     D*
     D* Company Heading
     D*
     D @DS003          DS            30
     D  ZZCOMP                 1     30
     D*
     D* Description for level 1
     D*
     D @DS004          DS            15
     D  ZZLEV1                 1     15
     D*
     D* Description for level2
     D*
     D @DS005          DS            15
     D*
     D* Description for level 3
     D*
     D @DS006          DS            15
     D*
     D* F18 Selection Program
     D*
     D @DS007          DS            10
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
     D @DS008          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS009          DS
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
     D C0001           C                   CONST('F21=Command')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Option must be enter-
     D                                     ed')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Invalid cursor loc f-
     D                                     or prompt')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Invalid company. Ple-
     D                                     ase rekey.')
     D*
     D* Named constants
     D*
     D C0005           C                   CONST('Invalid option selec-
     D                                     ted')
     D*
     D* Named constants
     D*
     D C0006           C                   CONST('Incorrect option sel-
     D                                     ected')
     D*
     D* Named constants
     D*
     D C0007           C                   CONST('No more menus can be-
     D                                      displayed')
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
     D @DS010          DS
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
     ICOMPANYF
     I              CYCOYNO                     RN0005
     I              CYEMPCOL                    RN0006
     I              CYEMPHEAD                   RN0007
     I              CYPRDHEAD                   RN0008
     I              CYREFHEAD                   RN0009
     I              CYSDESC                     RN0010
     IMNUUSRF
     I              MAGUSER                     RN0011
     IFMT001
     I              MAGUSER                     RN0012
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    RN0002
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
     C                   PARM                    XCSPGM           10
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
     C                   PARM                    XCSPGM           10
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C                   PARM                    PARM3
     C*
     C     P0006         PLIST
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C*
     C     P0007         PLIST
     C                   PARM                    XCSPGM           10
     C                   PARM                    PARM1
     C                   PARM                    PARM2
     C*
     C     P0008         PLIST
     C                   PARM                    PARM1
     C*
     C     P0009         PLIST
     C                   PARM                    XCSPGM           10
     C                   PARM                    PARM1
     C*
     C     P0010         PLIST
     C                   PARM                    XCSPGM           10
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
     C                   KFLD                    KYCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KAGU01
     C                   KFLD                    KBMN02
     C                   KFLD                    KCOP03
     C*
     C     K0004         KLIST
     C                   KFLD                    KBUS01
     C*
     C     K0005         KLIST
     C                   KFLD                    KCUS01
     C                   KFLD                    KCMN02
     C*
     C     K0006         KLIST
     C                   KFLD                    KBUS01
     C                   KFLD                    KBMN02
     C*
     C     K0007         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C                   KFLD                    KDSE03
     C*
     C     K0008         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYCGAS        WYCGAS                         External Ledgers
     C     *LIKE         DEFINE    RN0005        WK0001                         Company number
     C     *LIKE         DEFINE    CYDESC        WYDESC                         Company description
     C     *LIKE         DEFINE    RN0006        WK0002                         Employee column head
     C     *LIKE         DEFINE    RN0007        WK0003                         Employee description
     C     *LIKE         DEFINE    RN0008        WK0004                         Product description
     C     *LIKE         DEFINE    RN0009        WK0005                         Reference descriptio
     C     *LIKE         DEFINE    RN0010        WK0006                         Short Description
     C     *LIKE         DEFINE    MBSTRT        WBSTRT                         Start Menu
     C     *LIKE         DEFINE    MBUSER        WBUSER                         User
     C     *LIKE         DEFINE    MDMNUC        WDMNUC                         Menu
     C     *LIKE         DEFINE    MDOPTC        WDOPTC                         Option
     C     *LIKE         DEFINE    MDSEQN        WDSEQN                         Sequence Number
     C     *LIKE         DEFINE    MDTEXT        WDTEXT                         Text
     C     *LIKE         DEFINE    MCACTA        WCACTA                         Add
     C     *LIKE         DEFINE    MCACTD        WCACTD                         Delete
     C     *LIKE         DEFINE    MCACTR        WCACTR                         Revise
     C     *LIKE         DEFINE    MCMNUC        WCMNUC                         Menu
     C     *LIKE         DEFINE    MAACTA        WAACTA                         Add
     C     *LIKE         DEFINE    MAACTD        WAACTD                         Delete
     C     *LIKE         DEFINE    MAACTR        WAACTR                         Revise
     C     *LIKE         DEFINE    MACHG         WACHG                          Allow Change of Loca
     C     *LIKE         DEFINE    MADFV1        WADFV1                         Default Value for Le
     C     *LIKE         DEFINE    MADFV2        WADFV2                         Default Value for Le
     C     *LIKE         DEFINE    MADFV3        WADFV3                         Default Value for Le
     C     *LIKE         DEFINE    MAFORN        WAFORN                         Forename
     C     *LIKE         DEFINE    RN0011        WK0007                         Group User
     C     *LIKE         DEFINE    MASURN        WASURN                         Surname
     C     *LIKE         DEFINE    MAUSER        WAUSER                         User
     C     *LIKE         DEFINE    MAACTA        WK0008                         Add
     C     *LIKE         DEFINE    MAACTD        WK0009                         Delete
     C     *LIKE         DEFINE    MAACTR        WK0010                         Revise
     C     *LIKE         DEFINE    MACHG         WK0011                         Allow Change of Loca
     C     *LIKE         DEFINE    MADFV1        WK0012                         Default Value for Le
     C     *LIKE         DEFINE    MADFV2        WK0013                         Default Value for Le
     C     *LIKE         DEFINE    MADFV3        WK0014                         Default Value for Le
     C     *LIKE         DEFINE    MAFORN        WK0015                         Forename
     C     *LIKE         DEFINE    RN0012        WK0016                         Group User
     C     *LIKE         DEFINE    MASURN        WK0017                         Surname
     C     *LIKE         DEFINE    MAUSER        WK0018                         User
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0005        HD0001
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    MDMNUC        HDMNUC
     C     *LIKE         DEFINE    MDOPTC        HDOPTC
     C     *LIKE         DEFINE    MDSEQN        HDSEQN
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    MAUSER        HAUSER
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    MAUSER        HD0002
     C                   MOVE      *ZEROS        NARG2            30 9          Numer argument2
     C                   MOVE      *ZEROS        NARG3            30 9          Numer argument3
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        C2                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *ZEROS        NRSLT            30 9          Numeric result
     C                   MOVE      *ZEROS        NARG1            30 9          Numer argument1
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
     C                   MOVE      *BLANKS       ##ACN             2
     C                   MOVE      *ZEROS        ##CNT             2 0
     C                   MOVE      *ZEROS        ##CNT2            2 0
     C                   MOVE      *ZEROS        ##NCNT            6 0
     C                   MOVE      *ZEROS        RN0001            6 0          ##NCNT
     C                   MOVE      *BLANKS       ##NUM             3
     C                   MOVE      *BLANKS       ##OK              1
     C                   MOVE      *BLANKS       ##OPT             3
     C                   MOVE      *ZEROS        ##SELC            2 0
     C                   MOVE      *BLANKS       CENHED           50
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       RN0002            3            SAVNUMB
     C                   MOVE      *ZEROS        FST04             5 0
     C                   MOVE      *BLANKS       RN0003           11            FL0001
     C                   MOVE      *ZEROS        Z2                4 0          LENHED
     C                   MOVE      *ZEROS        LST04             5 0
     C                   MOVE      *ZEROS        MC                3 0
     C                   MOVE      *BLANKS       MORE              1
     C                   MOVE      *BLANKS       PARM            256
     C                   MOVE      *BLANKS       PARM1            50
     C                   MOVE      *BLANKS       PARM2            50
     C                   MOVE      *BLANKS       PARM3            50
     C                   MOVE      *BLANKS       PARM4            50
     C                   MOVE      *BLANKS       PRDFV1           10
     C                   MOVE      *BLANKS       PRDFV2           10
     C                   MOVE      *BLANKS       PRDFV3           10
     C                   MOVE      *BLANKS       RN0004            3            SAVNUMB
     C                   MOVE      *ZEROS        SOPT              2 0
     C                   MOVE      *BLANKS       SVK004            5
     C                   MOVE      *BLANKS       SVK005            5
     C                   MOVE      *ZEROS        SVK04             5 0
     C                   MOVE      *ZEROS        S04CNT            3 0
     C                   MOVE      *BLANKS       WKCHG             1
     C                   MOVE      *BLANKS       WKDFV1           10
     C                   MOVE      *BLANKS       WKDFV2           10
     C                   MOVE      *BLANKS       WKDFV3           10
     C                   MOVE      *ZEROS        WKLEN            15 5
     C                   MOVE      *BLANKS       WKLEV            10
     C                   MOVE      *BLANKS       WKMENU            5
     C                   MOVE      *BLANKS       WKOPT             5
     C                   MOVE      *BLANKS       WK05A1            5
     C                   MOVE      *BLANKS       WK05A2            5
     C                   MOVE      *BLANKS       WK40A1          101
     C                   MOVE      *BLANKS       WK60A1          152
     C                   MOVE      *BLANKS       WK80A1          203
     C                   MOVE      *BLANKS       WSUSER           10
     C                   MOVE      *ZEROS        X                 3 0
     C                   MOVE      *ZEROS        Z                 3 0
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *BLANKS       MPPGMD           50            Program Description
     C                   MOVE      *BLANKS       MPPGMN           10            Program Name
     C                   MOVE      *BLANKS       MPPGMT            1            Program Type
     C                   MOVE      *BLANKS       MPPRM1           50            Parameter
     C                   MOVE      *BLANKS       MPPRM2           50            Parameter
     C                   MOVE      *BLANKS       MPPRM3           50            Parameter
     C                   MOVE      *BLANKS       MPPRM4           50            Parameter
     C                   MOVE      *BLANKS       MPSPGM           10            Secondary Program Na
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KAUS01           10            MAUSER
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       KAGU01           10            MAGUSER
     C                   MOVE      *BLANKS       KBMN02            5            MBMNUC
     C                   MOVE      *BLANKS       KCOP03            5            MCOPTC
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KBUS01           10            MBUSER
     C                   MOVE      *BLANKS       KCUS01           10            MCUSER
     C                   MOVE      *BLANKS       KCMN02            5            MCMNUC
     C                   MOVE      *BLANKS       KDMN01            5            MDMNUC
     C                   MOVE      *BLANKS       KDOP02            5            MDOPTC
     C                   MOVE      *ZEROS        KDSE03            5 0          MDSEQN
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      *ZEROS        RSLT01            1 0
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
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     1             XRN02
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        X1                3 0          INDEX 1
     C                   Z-ADD     *ZEROS        OFFSET            4 0          OFFSET
     C                   Z-ADD     *ZEROS        NRSLT            30 9          RESULT
     C                   Z-ADD     *ZEROS        X0                4 0          INDEX 0
     C                   Z-ADD     *ZEROS        SP                3 0          Stk ptr
     C                   Z-ADD     *ZEROS        CT                3 0          Counter
     C                   Z-ADD     *ZEROS        SRN01             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN01             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN01             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        DAS003            5 0
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS004            5 0
     C                   Z-ADD     *ZEROS        DAS005            5 0
     C                   Z-ADD     *ZEROS        DAS006            5 0
     C                   Z-ADD     *ZEROS        DAS007            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          d'            EXITBL
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN         0100
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ         0100
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0100
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0100
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0100
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0100
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0100
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          displayed'    SKIPRE
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN         0100
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ         0100
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0013           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             C3                5 0          *CST INDEX
     C                   Z-ADD     1             CALLST            1 0          CALL STSEX
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        LEN              15 5
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    COMPNUMB      @DS001
     C     *DTAARA       DEFINE    MNUAPP        @DS002
     C     *DTAARA       DEFINE    MNUCOMP       @DS003
     C     *DTAARA       DEFINE    MNULEV1       @DS004
     C     *DTAARA       DEFINE    MNULEV2       @DS005
     C     *DTAARA       DEFINE    MNULEV3       @DS006
     C     *DTAARA       DEFINE    MNUPGM1       @DS007
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
     C                   MOVEA     '01010'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* GETDTAA compnumb
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* GETDTAA MNUCOMP
     C                   IN        @DS003                               93
     C                   Z-ADD     0             DAS003
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS003
     C                   END
     C* GETDTAA MNUAPP
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* GETDTAA MNULEV1
     C                   IN        @DS004                               93
     C                   Z-ADD     0             DAS004
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS004
     C                   END
     C* GETDTAA MNULEV2
     C                   IN        @DS005                               93
     C                   Z-ADD     0             DAS005
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS005
     C                   END
     C* GETDTAA MNULEV3
     C                   IN        @DS006                               93
     C                   Z-ADD     0             DAS006
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS006
     C                   END
     C* GETDTAA MNUPGM1
     C                   IN        @DS007                               93
     C                   Z-ADD     0             DAS007
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS007
     C                   END
     C* PRDFV1 = *BLANKS
     C                   MOVEL     *BLANKS       PRDFV1
     C* PRDFV2 = *BLANKS
     C                   MOVEL     *BLANKS       PRDFV2
     C* PRDFV3 = *BLANKS
     C                   MOVEL     *BLANKS       PRDFV3
     C*                                                               *
     C*                                                               *
     C* ** Retrieve User Details for menu
     C* WSUSER = *USERID
     C                   MOVE      *BLANKS       WSUSER
     C                   MOVEL     USER          WSUSER
     C* GETREC D.MENU,F.MNUUSR,*EQ,WSUSER
     C*
     C                   EXSR      S004
     C* IF %STS(D.MENU,F.MNUUSR)=*NO
     C*  Status of last file I/O
     C     STS02         IFNE      *ZERO
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If user belongs to a group use group values
     C* IF MAGUSER <> *BLANKS
     C     WK0007        IFNE      *BLANKS
     C* WSUSER = MAGUSER
     C                   MOVE      WK0007        WSUSER
     C* GETREC D.MENU,F.MNUUSR1,*EQ,MAGUSER
     C*
     C                   EXSR      S005
     C* WKDFV1 = MENU.MNUUSR1.MADFV1
     C                   MOVE      WK0012        WKDFV1
     C* WKDFV2 = MENU.MNUUSR1.MADFV2
     C                   MOVE      WK0013        WKDFV2
     C* WKDFV3 = MENU.MNUUSR1.MADFV3
     C                   MOVE      WK0014        WKDFV3
     C* WKCHG = MENU.MNUUSR1.MACHG
     C                   MOVE      WK0011        WKCHG
     C* ELSE                                                          *
     C                   ELSE
     C* WKDFV1 = MENU.MNUUSR.MADFV1
     C                   MOVE      WADFV1        WKDFV1
     C* WKDFV2 = MENU.MNUUSR.MADFV2
     C                   MOVE      WADFV2        WKDFV2
     C* WKDFV3 = MENU.MNUUSR.MADFV3
     C                   MOVE      WADFV3        WKDFV3
     C* WKCHG = MENU.MNUUSR.MACHG
     C                   MOVE      WACHG         WKCHG
     C* END                                                           *
     C                   END
     C* MNU = *BLANKS
     C                   MOVEA     *BLANKS       MNU
     C* MND = *BLANKS
     C                   MOVEA     *BLANKS       MND
     C*                                                               *
     C* IF WKCHG='Y'
     C     WKCHG         IFEQ      'Y'
     C* F21LINE = 'F21=Command'
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     C0001         RN0003
     C* ELSE                                                          *
     C                   ELSE
     C* F21LINE = *BLANKS
     C                   MOVEL     *BLANKS       RN0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Save companu number
     C* SAVNUMB = COMPNUMB
     C                   MOVE      @DS001        RN0004
     C* DSPNUMB = COMPNUMB
     C                   MOVE      @DS001        RN0002
     C*                                                               *
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* SHOWPAGE D.MENU,F.MNUHED,1
     C*
     C                   EXSR      S006
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
     C                   MOVEA     '01010'       *IN(1)
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
     C* Help
     C*
     C     *INKA         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* ##OK = 'N'
     C                   MOVE      'N'           ##OK
     C* ##NCNT = *ZEROS
     C                   Z-ADD     *ZEROS        ##NCNT
     C* IF ##SELC = *ZEROS *OR ##SELC > ##CNT
     C     ##SELC        IFEQ      *ZEROS
     C     ##SELC        ORGT      ##CNT
     C* DSPERR ##SELC,'Option must be entered'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     '##SELC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* ##OK = 'Y'
     C                   MOVE      'Y'           ##OK
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ##OK = 'Y'
     C     ##OK          IFEQ      'Y'
     C* DOBLK D.MENU,F.MNUHED
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
     C                   MOVEA     '01010'       *IN(1)
     C* ##NCNT = ##NCNT + 1
     C     ##NCNT        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##NCNT
     C* IF ##NCNT = ##SELC
     C     ##NCNT        IFEQ      ##SELC
     C* EXITBLK                                                       *
     C                   Z-ADD     1             SWEXBL
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '01010'       *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*                                                               *
     C* WKMENU = MBMNUC
     C                   MOVE      XBMNUC        WKMENU
     C* WKOPT = *BLANKS
     C                   MOVEL     *BLANKS       WKOPT
     C* EXSCR SC0003
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
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
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
     C* Prompt
     C*
     C     *INKD         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* IF %CLF(DSPNUMB)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'RN0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C*                                                               *
     C* ** Invalid prompt location
     C* CALL zzpgm1,DSPNUMB,prdfv2,prdfv3
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
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR *NONE,'Invalid cursor loc for prompt'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
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
     C* Command
     C*
     C     *INKV         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* IF WKCHG='Y'
     C     WKCHG         IFEQ      'Y'
     C* CALL 'QUSCMDLN'
     C                   Z-ADD     1             CALLST
     C                   CALL      'QUSCMDLN'                           93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ##OK = 'Y'
     C                   MOVE      'Y'           ##OK
     C*                                                               *
     C* ** If company number blanks
     C* IF DSPNUMB = *BLANKS
     C     RN0002        IFEQ      *BLANKS
     C* DSPNUMB = SAVNUMB
     C                   MOVE      RN0004        RN0002
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Update company number
     C* IF DSPNUMB <> SAVNUMB
     C     RN0002        IFNE      RN0004
     C* GETREC D.COMPANY,F.COMPANY,*EQ,DSPNUMB
     C*
     C                   EXSR      S007
     C* IF %STS(D.COMPANY,F.COMPANY) = *YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* SAVNUMB = DSPNUMB
     C                   MOVE      RN0002        RN0004
     C* GETDTAA COMPNUMB,*LOCK
     C     *LOCK         IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* COMPNUMB = DSPNUMB
     C                   MOVE      RN0002        @DS001
     C* UPDDTAA COMPNUMB
     C                   OUT       @DS001                               93
     C* ELSE                                                          *
     C                   ELSE
     C* ##OK = 'N'
     C                   MOVE      'N'           ##OK
     C* DSPERR DSPNUMB,'Invalid company. Please rekey.'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ##NCNT = *ZEROS
     C                   Z-ADD     *ZEROS        ##NCNT
     C* IF ##SELC = *ZEROS *OR ##SELC > ##CNT
     C     ##SELC        IFEQ      *ZEROS
     C     ##SELC        ORGT      ##CNT
     C* DSPERR ##SELC,'Invalid option selected'
     C                   MOVEL     C0005         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     '##SELC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* ##OK = 'N'
     C                   MOVE      'N'           ##OK
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ##OK = 'Y'
     C     ##OK          IFEQ      'Y'
     C* DOBLK D.MENU,F.MNUHED
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
     C                   MOVEA     '01010'       *IN(1)
     C* ##NCNT = ##NCNT + 1
     C     ##NCNT        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##NCNT
     C* IF ##NCNT = ##SELC
     C     ##NCNT        IFEQ      ##SELC
     C* EXITBLK                                                       *
     C                   Z-ADD     1             SWEXBL
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '01010'       *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN01         RRN01
     C                   MOVEA     INS01         *IN
     C*
     C*
     C*                                                               *
     C* ##SELC = *ZEROS
     C                   Z-ADD     *ZEROS        ##SELC
     C* MC = 1
     C                   Z-ADD     1             MC
     C* MM(MC) = MBMNUC
     C                   MOVE      *BLANKS       MM(MC)
     C                   MOVE      XBMNUC        MM(MC)
     C* GOTOSCR SC0002
     C                   MOVEL     'SC0002  '    SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
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
     C                   MOVEA     '010'         *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C*                                                               *
     C* IF WKCHG='Y'
     C     WKCHG         IFEQ      'Y'
     C* F21LINE = 'F21=Command'
     C                   MOVE      *BLANKS       RN0003
     C                   MOVEL     C0001         RN0003
     C* ELSE                                                          *
     C                   ELSE
     C* F21LINE = *BLANKS
     C                   MOVEL     *BLANKS       RN0003
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXSUBR S01FWD
     C                   EXSR      S500
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
     C                   MOVEA     '010'         *IN(1)
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
     C* Help
     C*
     C     *INKA         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* WKOPT = *BLANKS
     C                   MOVEL     *BLANKS       WKOPT
     C* ##OK = 'N'
     C                   MOVE      'N'           ##OK
     C* ##NCNT2 = *ZEROS
     C                   Z-ADD     *ZEROS        RN0001
     C* IF SOPT > ##CNT2
     C     SOPT          IFGT      ##CNT2
     C* DSPERR SOPT,'Incorrect option selected'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'SOPT    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* ##OK = 'Y'
     C                   MOVE      'Y'           ##OK
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ##OK = 'Y' *AND SOPT <> *ZEROS
     C     ##OK          IFEQ      'Y'
     C     SOPT          ANDNE     *ZEROS
     C* DOBLK D.MENU,F.MNUOPT
     C*
     C                   Z-ADD     RRN02         SRN02                          Save RRN
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS02
     C     SRN02         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR002S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '010'         *IN(1)
     C* ##NCNT2 = ##NCNT2 + 1
     C     RN0001        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        RN0001
     C* IF ##NCNT2 = SOPT
     C     RN0001        IFEQ      SOPT
     C* EXITBLK                                                       *
     C                   Z-ADD     1             SWEXBL
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     '010'         *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C*
     C*
     C* WKOPT = MCOPTC
     C                   MOVE      XCOPTC        WKOPT
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ##OK = 'Y' *OR SOPT = *ZEROS
     C     ##OK          IFEQ      'Y'
     C     SOPT          OREQ      *ZEROS
     C* EXSCR SC0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Exit
     C*
     C     *INKC         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C* MC = *ZEROS
     C                   Z-ADD     *ZEROS        MC
     C* GOTOSCR SC0001
     C                   MOVEL     'SC0001  '    SCRNID
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C* MC = MC - 1
     C     MC            SUB       1             NRSLT0
     C                   Z-ADD     NRSLT0        MC
     C* IF MC = *ZEROS
     C     MC            IFEQ      *ZEROS
     C* GOTOSCR SC0001
     C                   MOVEL     'SC0001  '    SCRNID
     C                   GOTO      $00299
     C* ELSE                                                          *
     C                   ELSE
     C* GOTOSCR SC0002
     C                   MOVEL     'SC0002  '    SCRNID
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* CMD Line
     C*
     C     *INKV         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* IF WKCHG='Y'
     C     WKCHG         IFEQ      'Y'
     C* CALL 'QUSCMDLN'
     C                   Z-ADD     1             CALLST
     C                   CALL      'QUSCMDLN'                           93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* ##OK = 'N'
     C                   MOVE      'N'           ##OK
     C* ##NCNT2 = *ZEROS
     C                   Z-ADD     *ZEROS        RN0001
     C* IF SOPT = *ZEROS *OR SOPT > ##CNT2
     C     SOPT          IFEQ      *ZEROS
     C     SOPT          ORGT      ##CNT2
     C* DSPERR SOPT,'Incorrect option selected'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'SOPT    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* ##OK = 'Y'
     C                   MOVE      'Y'           ##OK
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ##OK = 'Y'
     C     ##OK          IFEQ      'Y'
     C* DOBLK D.MENU,F.MNUOPT
     C*
     C                   Z-ADD     RRN02         SRN02                          Save RRN
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS02
     C     SRN02         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR002S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '010'         *IN(1)
     C* ##NCNT2 = ##NCNT2 + 1
     C     RN0001        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        RN0001
     C* IF ##NCNT2 = SOPT
     C     RN0001        IFEQ      SOPT
     C* EXITBLK                                                       *
     C                   Z-ADD     1             SWEXBL
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR002S1                             90
     C                   MOVEA     '010'         *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C*
     C*
     C*                                                               *
     C* WK05A1 = WKMENU
     C                   MOVE      WKMENU        WK05A1
     C* WK05A2 = MCOPTC
     C                   MOVE      XCOPTC        WK05A2
     C* GETREC D.MENU,F.MNUOPT,*EQ,WSUSER,WK05A1,WK05A2
     C*
     C                   EXSR      S008
     C* IF MCPGMT = *BLANKS | MCPGMT = 'R'
     C     XCPGMT        IFEQ      *BLANKS
     C     XCPGMT        OREQ      'R'
     C*                                                               *
     C* Set up Keywords
     C* PARM4 = MCPRM4
     C                   MOVE      XCPRM4        PARM4
     C* PARM3 = MCPRM3
     C                   MOVE      XCPRM3        PARM3
     C* PARM2 = MCPRM2
     C                   MOVE      XCPRM2        PARM2
     C* PARM1 = MCPRM1
     C                   MOVE      XCPRM1        PARM1
     C*                                                               *
     C* EXSUBR S03KEY
     C                   EXSR      S03KEY
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* IF MCPRM4 <> *BLANKS
     C     XCPRM4        IFNE      *BLANKS
     C* IF MCSPGM =  *BLANKS
     C     XCSPGM        IFEQ      *BLANKS
     C* CALL MCPGMN,PARM1,PARM2,PARM3,PARM4
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL MCPGMN,MCSPGM,PARM1,PARM2,PARM3,PARM4
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0003                  93
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
     C* IF MCPRM3 <> *BLANKS
     C     XCPRM3        IFNE      *BLANKS
     C* IF MCSPGM =  *BLANKS
     C     XCSPGM        IFEQ      *BLANKS
     C* CALL MCPGMN,PARM1,PARM2,PARM3
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0004                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL MCPGMN,MCSPGM,PARM1,PARM2,PARM3
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0005                  93
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
     C* IF McPRM2 <> *BLANKS
     C     XCPRM2        IFNE      *BLANKS
     C* IF mcspgm =  *BLANKS
     C     XCSPGM        IFEQ      *BLANKS
     C* CALL MCPGMN,PARM1,PARM2
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0006                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL MCPGMN,MCSPGM,PARM1,PARM2
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0007                  93
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
     C* IF MCPRM1 <> *BLANKS
     C     XCPRM1        IFNE      *BLANKS
     C* IF MCSPGM =  *BLANKS
     C     XCSPGM        IFEQ      *BLANKS
     C* CALL MCPGMN,PARM1
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0008                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL MCPGMN,MCSPGM,PARM1
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0009                  93
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
     C* IF MCSPGM = ' '
     C     XCSPGM        IFEQ      *BLANKS
     C* CALL MCPGMN
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN                               93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CALL MCPGMN,MCSPGM
     C                   Z-ADD     1             CALLST
     C                   CALL      XCPGMN        P0010                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END  ; mcprm1
     C                   END
     C* END  ; mcprm2
     C                   END
     C* END  ; mcprm3
     C                   END
     C* END  ; mcprm4
     C                   END
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C* END ; Option type blank
     C                   END
     C*                                                               *
     C* Call CL
     C* IF MCPGMT = 'C'
     C     XCPGMT        IFEQ      'C'
     C* WK40A1 = %BCT(MCPRM1,MCPRM2,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C     XCPRM1        CAT(P)    XCPRM2:C1     ARSLT0
     C                   MOVE      *BLANKS       WK40A1
     C                   MOVEL     ARSLT0        WK40A1
     C* WK60A1 = %BCT(WK40A1,MCPRM3,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C     WK40A1        CAT(P)    XCPRM3:C1     ARSLT0
     C                   MOVE      *BLANKS       WK60A1
     C                   MOVEL     ARSLT0        WK60A1
     C* WK80A1 = %BCT(WK60A1,MCPRM4,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C     WK60A1        CAT(P)    XCPRM4:C1     ARSLT0
     C                   MOVE      *BLANKS       WK80A1
     C                   MOVEL     ARSLT0        WK80A1
     C* PARM = %BCT(MCPGMN,WK80A1,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C     XCPGMN        CAT(P)    WK80A1:C1     ARSLT0
     C                   MOVE      *BLANKS       PARM
     C                   MOVEL     ARSLT0        PARM
     C* WKLEN = 256
     C                   Z-ADD     256           WKLEN
     C* CALL 'QCMDEXC',PARM,WKLEN
     C                   Z-ADD     1             CALLST
     C                   CALL      'QCMDEXC'     P0011                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Call Menu
     C* IF MCPGMT = 'M'
     C     XCPGMT        IFEQ      'M'
     C* SOPT = *ZEROS
     C                   Z-ADD     *ZEROS        SOPT
     C* MC = MC + 1
     C     MC            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        MC
     C* IF MC > 99
     C     MC            IFGT      99
     C* MC = 99
     C                   Z-ADD     99            MC
     C* DSPERR *NONE,'No more menus can be displayed'
     C                   MOVEL     C0007         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* ELSE                                                          *
     C                   ELSE
     C* MM(MC) = %LJF(MCPGMN)
     C*  Left Justify field into result field
     C                   MOVEL     XCPGMN        MM(MC)
     C* GOTOSCR SC0002
     C                   MOVEL     'SC0002  '    SCRNID
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
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
     C                   MOVEA     '010'         *IN(1)
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
     C                   EXSR      S03AFR
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
     C                   EXSR      S03ABR
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
     C                   EXSR      S03AFR
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
     C     SID(CT)       IFEQ      'SC0002'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   WRITE     SCR002C1
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
     C* S01FWD -
     C*****************************************************************
     C     S01FWD        BEGSR
     C*
     C*                                                               *
     C* ** Fill sub file
     C* SETENDBLK D.MENU,F.MNUHED,*OFF
     C*
     C                   Z-ADD     0             ERN01                          SET SFLEND FLG
     C* ##CNT = *ZEROS
     C                   Z-ADD     *ZEROS        ##CNT
     C* SETLL D.MENU,F.MNUHED,WSUSER
     C*
     C                   EXSR      S009
     C* GETBLK D.MENU,F.MNUHED,*NE,WSUSER
     C*
     C*
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WSUSER        KBUS01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.MNUHED    MNUO
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       ##OPT
     C                   MOVEL     *BLANKS       XBMNUD
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0004         READE     MNUHED                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HBUSER                         User
     C                   MOVEL     *BLANK        HBMNUC                         Menu
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.MNUHED    MNUO
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* IF MBSTRT = 'N'
     C     WBSTRT        IFEQ      'N'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF MBSTRT = 'Y'
     C     WBSTRT        IFEQ      'Y'
     C* ##CNT = ##CNT + 1
     C     ##CNT         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##CNT
     C* ##ACN = %CTC(##CNT)
     C*  Convert To Character
     C                   MOVE      *BLANK        ##ACN
     C                   MOVEL     ##CNT         ##ACN
     C* IF %SUB(##ACN,1,1) = '0'
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     1             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  ##ACN:C1      ARSLT0
     C                   END
     C     ARSLT0        IFEQ      '0'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* ##ACN = %LJF(' ')
     C*  Left Justify field into result field
     C                   MOVEL     ' '           ##ACN
     C* END                                                           *
     C                   END
     C* ##OPT = %LJF(##ACN)
     C*  Left Justify field into result field
     C                   MOVEL     ##ACN         ##OPT
     C* ##OPT = %RJF('.')
     C*  Right Justify field into result field
     C                   MOVE      '.'           ##OPT
     C* END                                                           *
     C                   END
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
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       ##OPT
     C                   MOVEL     *BLANKS       XBMNUD
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
     C*                                                               *
     C* DOW %STS(D.MENU,F.MNUHED) = *YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
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
     C* ADDBLK D.MENU,F.MNUHED,*NE,WSUSER
     C*
     C*
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WSUSER        KBUS01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR001S1
     C*          ---------------------------------------------------------------
     C     XRN01         SUB       1             RRN01
     C*
     C                   Z-ADD     XRN01         SRN01
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS01
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD04        DOUNE     'Y'                                          RD.SW.MNUHED    MNUO
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       ##OPT
     C                   MOVEL     *BLANKS       XBMNUD
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0004         READE     MNUHED                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HBUSER                         User
     C                   MOVEL     *BLANK        HBMNUC                         Menu
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.MNUHED    MNUO
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* IF MBSTRT = 'N'
     C     WBSTRT        IFEQ      'N'
     C* SKIPREC                                                       *
     C                   Z-ADD     1             SWSKPR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF MBSTRT = 'Y'
     C     WBSTRT        IFEQ      'Y'
     C* ##CNT = ##CNT + 1
     C     ##CNT         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##CNT
     C* ##ACN = %CTC(##CNT)
     C*  Convert To Character
     C                   MOVE      *BLANK        ##ACN
     C                   MOVEL     ##CNT         ##ACN
     C* IF %SUB(##ACN,1,1) = '0'
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     1             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  ##ACN:C1      ARSLT0
     C                   END
     C     ARSLT0        IFEQ      '0'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* ##ACN = %LJF(' ')
     C*  Left Justify field into result field
     C                   MOVEL     ' '           ##ACN
     C* END                                                           *
     C                   END
     C* ##OPT = %LJF(##ACN)
     C*  Left Justify field into result field
     C                   MOVEL     ##ACN         ##OPT
     C* ##OPT = %RJF('.')
     C*  Right Justify field into result field
     C                   MOVE      '.'           ##OPT
     C* END                                                           *
     C                   END
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
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       ##OPT
     C                   MOVEL     *BLANKS       XBMNUD
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
     C* END                                                           *
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
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
     C* SHOWPAGE D.MENU,F.MNUHED,1
     C*
     C                   EXSR      S006
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - SCRN SUB
     C*****************************************************************
     C     S500          BEGSR
     C*
     C*                                                               *
     C* ** Fill sub file
     C* ##CNT2 = *ZEROS
     C                   Z-ADD     *ZEROS        ##CNT2
     C* WKMENU = MM(MC)
     C                   MOVE      MM(MC)        WKMENU
     C* SETLL D.MENU,F.MNUOPT,WSUSER,WKMENU
     C*
     C                   EXSR      S012
     C* SETENDBLK D.MENU,F.MNUOPT,*ON
     C*
     C                   Z-ADD     1             ERN02                          SET SFLEND FLG
     C* GETBLK D.MENU,F.MNUOPT,*NE,WSUSER,WKMENU
     C*
     C*
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     WKMENU        KCMN02
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
     C     SWRD05        DOUNE     'Y'                                          RD.SW.MNUOPT    MNUP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XCUSER
     C                   MOVEL     *BLANKS       XCSPGM
     C                   MOVEL     *BLANKS       XCPRM4
     C                   MOVEL     *BLANKS       XCPRM3
     C                   MOVEL     *BLANKS       XCPRM2
     C                   MOVEL     *BLANKS       XCPRM1
     C                   MOVEL     *BLANKS       XCPGMT
     C                   MOVEL     *BLANKS       XCPGMN
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       ##NUM
     C                   MOVEL     *BLANKS       XCOPTD
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0005         READE     MNUOPT                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     *ZERO         HRC05                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HCUSER                         User
     C                   MOVEL     *BLANK        HCMNUC                         Menu
     C                   MOVEL     *BLANK        HCOPTC                         Option
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   END
     C*
     C     SWRD05        IFEQ      'Y'                                          RD.SW.MNUOPT    MNUP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*                                                               *
     C* ##CNT2 = ##CNT2 + 1
     C     ##CNT2        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##CNT2
     C* ##ACN = %CTC(##CNT2)
     C*  Convert To Character
     C                   MOVE      *BLANK        ##ACN
     C                   MOVEL     ##CNT2        ##ACN
     C* IF %SUB(##ACN,1,1) = '0'
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     1             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  ##ACN:C1      ARSLT0
     C                   END
     C     ARSLT0        IFEQ      '0'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* ##ACN = %LJF(' ')
     C*  Left Justify field into result field
     C                   MOVEL     ' '           ##ACN
     C* END                                                           *
     C                   END
     C* ##NUM = %LJF(##ACN)
     C*  Left Justify field into result field
     C                   MOVEL     ##ACN         ##NUM
     C* ##NUM = %RJF('.')
     C*  Right Justify field into result field
     C                   MOVE      '.'           ##NUM
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
     C                   MOVEL     *BLANKS       XCUSER
     C                   MOVEL     *BLANKS       XCSPGM
     C                   MOVEL     *BLANKS       XCPRM4
     C                   MOVEL     *BLANKS       XCPRM3
     C                   MOVEL     *BLANKS       XCPRM2
     C                   MOVEL     *BLANKS       XCPRM1
     C                   MOVEL     *BLANKS       XCPGMT
     C                   MOVEL     *BLANKS       XCPGMN
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       ##NUM
     C                   MOVEL     *BLANKS       XCOPTD
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
     C                   EXSR      S013                                         CHK EOF
     C*                                                               *
     C* DOW %STS(D.MENU,F.MNUOPT) = *YES
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
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* ADDBLK D.MENU,F.MNUOPT,*NE,WSUSER,WKMENU
     C*
     C*
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     WKMENU        KCMN02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     14            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR002S1
     C*          ---------------------------------------------------------------
     C     XRN02         SUB       1             RRN02
     C*
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD05        DOUNE     'Y'                                          RD.SW.MNUOPT    MNUP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XCUSER
     C                   MOVEL     *BLANKS       XCSPGM
     C                   MOVEL     *BLANKS       XCPRM4
     C                   MOVEL     *BLANKS       XCPRM3
     C                   MOVEL     *BLANKS       XCPRM2
     C                   MOVEL     *BLANKS       XCPRM1
     C                   MOVEL     *BLANKS       XCPGMT
     C                   MOVEL     *BLANKS       XCPGMN
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       ##NUM
     C                   MOVEL     *BLANKS       XCOPTD
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0005         READE     MNUOPT                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     *ZERO         HRC05                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HCUSER                         User
     C                   MOVEL     *BLANK        HCMNUC                         Menu
     C                   MOVEL     *BLANK        HCOPTC                         Option
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   END
     C*
     C     SWRD05        IFEQ      'Y'                                          RD.SW.MNUOPT    MNUP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*                                                               *
     C* ##CNT2 = ##CNT2 + 1
     C     ##CNT2        ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        ##CNT2
     C* ##ACN = %CTC(##CNT2)
     C*  Convert To Character
     C                   MOVE      *BLANK        ##ACN
     C                   MOVEL     ##CNT2        ##ACN
     C* IF %SUB(##ACN,1,1) = '0'
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     1             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  ##ACN:C1      ARSLT0
     C                   END
     C     ARSLT0        IFEQ      '0'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* ##ACN = %LJF(' ')
     C*  Left Justify field into result field
     C                   MOVEL     ' '           ##ACN
     C* END                                                           *
     C                   END
     C* ##NUM = %LJF(##ACN)
     C*  Left Justify field into result field
     C                   MOVEL     ##ACN         ##NUM
     C* ##NUM = %RJF('.')
     C*  Right Justify field into result field
     C                   MOVE      '.'           ##NUM
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
     C                   MOVEL     *BLANKS       XCUSER
     C                   MOVEL     *BLANKS       XCSPGM
     C                   MOVEL     *BLANKS       XCPRM4
     C                   MOVEL     *BLANKS       XCPRM3
     C                   MOVEL     *BLANKS       XCPRM2
     C                   MOVEL     *BLANKS       XCPRM1
     C                   MOVEL     *BLANKS       XCPGMT
     C                   MOVEL     *BLANKS       XCPGMN
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       ##NUM
     C                   MOVEL     *BLANKS       XCOPTD
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
     C                   EXSR      S014                                         CHK EOF
     C* END                                                           *
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
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* SETENDBLK D.MENU,F.MNUOPT,*OFF
     C*
     C                   Z-ADD     0             ERN02                          SET SFLEND FLG
     C* SHOWPAGE D.MENU,F.MNUOPT,1
     C*
     C                   EXSR      S015
     C*                                                               *
     C* ** Set  menu title
     C* GETREC D.MENU,F.MNUHED,*EQ,WSUSER,WKMENU
     C*
     C                   EXSR      S016
     C* IF %STS(D.MENU,F.MNUHED) = *YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* CENHED = *BLANKS
     C                   MOVEL     *BLANKS       CENHED
     C* LENHED = %LEN(MBMNUD)
     C*  Length
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     XBMNUD        AARG1
     C                   EXSR      SLEN
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* LENHED = 50 - LENHED
     C     50            SUB       Z2            NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* LENHED = LENHED/2
     C     Z2            DIV       2             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* IF LENHED < 1
     C     Z2            IFLT      1
     C* CENHED = MBMNUD
     C                   MOVE      XBMNUD        CENHED
     C* ELSE                                                          *
     C                   ELSE
     C* CENHED = %BCT(CENHED,MBMNUD,LENHED)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     Z2            C1
     C     CENHED        CAT(P)    XBMNUD:C1     ARSLT0
     C                   MOVE      *BLANKS       CENHED
     C                   MOVEL     ARSLT0        CENHED
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* CENHED = *BLANKS
     C                   MOVEL     *BLANKS       CENHED
     C* END                                                           *
     C                   END
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* S03ABR - SCRN SUB
     C*****************************************************************
     C     S03ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Set pointer to first record on screen.
     C* SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C*
     C                   EXSR      S017
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C*
     C                   EXSR      S018
     C* DOW (C04<S04CNT)&%STS(D.MENU,F.mnuHLP)=*YES
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C     RN0013        IFEQ      XYES
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0013        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z1            ADD       1             RN0013
     C                   Z-ADD     RN0013        Z1
     C* GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C*
     C                   EXSR      S018
     C* END                                                           *
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
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
     C     RN0013        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C                   Z-ADD     RN0013        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S03ALD
     C                   EXSR      S03ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03AB
     C                   END
     C*
     C     $S03AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03AFR - SCRN SUB
     C*****************************************************************
     C     S03AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C*
     C                   EXSR      S017
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
     C* S03ALD - SCRN SUB
     C*****************************************************************
     C     S03ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* B02 = 0
     C                   Z-ADD     *ZERO         B02
     C* T05 = ' '
     C                   MOVEA     *BLANKS       T05
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Read file and load to arrays.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C*
     C                   EXSR      S020
     C* DOW (C04<S04CNT)&%STS(D.MENU,F.MNUHLP)=*YES
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C     RN0013        IFEQ      XYES
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0013        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z1            ADD       1             RN0013
     C                   Z-ADD     RN0013        Z1
     C* ** Save field being prompted for.
     C* B02(C04) = mdseqn
     C                   Z-ADD     WDSEQN        B02(Z1)
     C* T05(C04) = mdtext
     C                   MOVE      *BLANKS       T05(Z1)
     C                   MOVE      WDTEXT        T05(Z1)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z1            IFEQ      1
     C* FST04 = B02(C04)
     C                   Z-ADD     B02(Z1)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z1            IFLT      S04CNT
     C* GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C*
     C                   EXSR      S020
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
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
     C     RN0013        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0013
     C                   ELSE
     C                   Z-ADD     0             RN0013
     C                   END
     C                   Z-ADD     RN0013        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C04>0
     C     Z1            IFGT      *ZERO
     C* LST04 = B02(C04)
     C                   Z-ADD     B02(Z1)       LST04
     C* END                                                           *
     C                   END
     C*
     C     $S03AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03KEY - Set up Keywords
     C*****************************************************************
     C     S03KEY        BEGSR
     C*
     C*                                                               *
     C* Set up Keywords
     C* IF (mcprm4 = '*BLANKS') *OR (mcprm4 = '*BLANK')
     C     XCPRM4        IFEQ      '*BLANKS'
     C     XCPRM4        OREQ      '*BLANK'
     C* PARM4 = ' '
     C                   MOVEL     *BLANKS       PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*BLANKS') *OR (mcprm3 = '*BLANK')
     C     XCPRM3        IFEQ      '*BLANKS'
     C     XCPRM3        OREQ      '*BLANK'
     C* PARM3 = ' '
     C                   MOVEL     *BLANKS       PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*BLANKS') *OR (mcprm2 = '*BLANK')
     C     XCPRM2        IFEQ      '*BLANKS'
     C     XCPRM2        OREQ      '*BLANK'
     C* PARM2 = ' '
     C                   MOVEL     *BLANKS       PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*BLANKS') *OR (mcprm1 = '*BLANK')
     C     XCPRM1        IFEQ      '*BLANKS'
     C     XCPRM1        OREQ      '*BLANK'
     C* PARM1 = ' '
     C                   MOVEL     *BLANKS       PARM1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF (mcprm4 = '*USERID')
     C     XCPRM4        IFEQ      '*USERID'
     C* PARM4 = *USERID
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     USER          PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*USERID')
     C     XCPRM3        IFEQ      '*USERID'
     C* PARM3 = *USERID
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     USER          PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*USERID')
     C     XCPRM2        IFEQ      '*USERID'
     C* PARM2 = *USERID
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     USER          PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*USERID')
     C     XCPRM1        IFEQ      '*USERID'
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
     C     XCPRM4        IFEQ      '*LEV1'
     C* PARM4 = *BLANKS
     C                   MOVEL     *BLANKS       PARM4
     C* PARM4 = %LJF(DSPNUMB)
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV1')
     C     XCPRM3        IFEQ      '*LEV1'
     C* PARM3 = *BLANKS
     C                   MOVEL     *BLANKS       PARM3
     C* PARM3 = %LJF(DSPNUMB)
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV1')
     C     XCPRM2        IFEQ      '*LEV1'
     C* PARM2 = *BLANKS
     C                   MOVEL     *BLANKS       PARM2
     C* PARM2 = %LJF(DSPNUMB)
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV1')
     C     XCPRM1        IFEQ      '*LEV1'
     C* PARM1 = *BLANKS
     C                   MOVEL     *BLANKS       PARM1
     C* PARM1 = %LJF(DSPNUMB)
     C*  Left Justify field into result field
     C                   MOVEL     RN0002        PARM1
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
     C     XCPRM4        IFEQ      '*LEV2'
     C* PARM4 = wklev
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     WKLEV         PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV2')
     C     XCPRM3        IFEQ      '*LEV2'
     C* PARM3 = wklev
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     WKLEV         PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV2')
     C     XCPRM2        IFEQ      '*LEV2'
     C* PARM2 = wklev
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     WKLEV         PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV2')
     C     XCPRM1        IFEQ      '*LEV2'
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
     C     XCPRM4        IFEQ      '*LEV3'
     C* PARM4 = wklev
     C                   MOVE      *BLANKS       PARM4
     C                   MOVEL     WKLEV         PARM4
     C* END                                                           *
     C                   END
     C* IF (mcprm3 = '*LEV3')
     C     XCPRM3        IFEQ      '*LEV3'
     C* PARM3 = wklev
     C                   MOVE      *BLANKS       PARM3
     C                   MOVEL     WKLEV         PARM3
     C* END                                                           *
     C                   END
     C* IF (mcprm2 = '*LEV3')
     C     XCPRM2        IFEQ      '*LEV3'
     C* PARM2 = wklev
     C                   MOVE      *BLANKS       PARM2
     C                   MOVEL     WKLEV         PARM2
     C* END                                                           *
     C                   END
     C* IF (mcprm1 = '*LEV3')
     C     XCPRM1        IFEQ      '*LEV3'
     C* PARM1 = wklev
     C                   MOVE      *BLANKS       PARM1
     C                   MOVEL     WKLEV         PARM1
     C* END                                                           *
     C                   END
     C*
     C     $S03KE        ENDSR
     C/EJECT
     C*****************************************************************
     C* SLEN - Computes the number of characters in the alpha string.
     C*        Any trailing blanks in the alpha value are ignored.
     C*
     C* FUNCTION:    LENGTH (ALPHA)
     C*****************************************************************
     C     SLEN          BEGSR
     C*
     C                   MOVEA     AARG1         WKA
     C                   Z-ADD     256           C1
     C     C1            DOWGE     1
     C     WKA(C1)       ANDEQ     *BLANK
     C                   SUB       1             C1
     C                   END
     C*
     C                   Z-ADD     C1            NRSLT
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
     C**************************************************************************
     C* S004   - GETREC D.MENU,F.MNUUSR,*EQ,WSUSER
     C**************************************************************************
     C     S004          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     WSUSER        KAUS01
     C     K0001         CHAIN     MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - GETREC D.MENU,F.MNUUSR1,*EQ,MAGUSER
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     WK0007        KAUS01
     C     K0001         CHAIN     MNUUSR1                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - SHOWPAGE D.MENU,F.MNUHED,1
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             RRN01                          INIT RRN
     C     RRN01         IFGE      XRN01                                        After last rec
     C     XRN01         SUB       1             RRN01                          INIT RRN
     C                   END
     C     RRN01         IFLT      1                                            Before 1st rec
     C                   Z-ADD     1             RRN01                          INIT RRN
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - GETREC D.COMPANY,F.COMPANY,*EQ,DSPNUMB
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     RN0002        KYCO01
     C     K0002         CHAIN     COMPANY                            9091
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
     C**************************************************************************
     C* S008   - GETREC D.MENU,F.MNUOPT,*EQ,WSUSER,WK05A1,WK05A2
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     WSUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WK05A1        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     WK05A2        KCOP03
     C     K0003         CHAIN     MNUOPT                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - SETLL D.MENU,F.MNUHED,WSUSER
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     WSUSER        KBUS01
     C                   MOVEL     WSUSER        HBUSER                         User
     C                   MOVEL     WSUSER        MBUSER                         User
     C*
     C     K0004         SETLL     MNUHED                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(EOF) - MNUHED
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.MNUHED    MNUO
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0004         SETGT     MNUHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       14            WADJ01
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - Process To Reset File Pointer(EOF) - MNUHED
     C**************************************************************************
     C     S011          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.MNUHED    MNUO
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0004         SETGT     MNUHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - SETLL D.MENU,F.MNUOPT,WSUSER,WKMENU
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HCOPTC                         Option
     C*
     C                   MOVEL     WSUSER        KCUS01
     C                   MOVEL     WSUSER        HCUSER                         User
     C                   MOVEL     WSUSER        MCUSER                         User
     C                   MOVEL     WKMENU        KCMN02
     C                   MOVEL     WKMENU        HCMNUC                         Menu
     C                   MOVEL     WKMENU        MCMNUC                         Menu
     C*
     C     K0005         SETLL     MNUOPT                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - Process To Reset File Pointer(EOF) - MNUOPT
     C**************************************************************************
     C     S013          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.MNUOPT    MNUP
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCUS01                         User
     C                   MOVEL     MCUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02                         Menu
     C                   MOVEL     MCMNUC        KCMN02
     C     K0005         SETGT     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       14            WADJ02
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - Process To Reset File Pointer(EOF) - MNUOPT
     C**************************************************************************
     C     S014          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.MNUOPT    MNUP
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCUS01                         User
     C                   MOVEL     MCUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02                         Menu
     C                   MOVEL     MCMNUC        KCMN02
     C     K0005         SETGT     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - SHOWPAGE D.MENU,F.MNUOPT,1
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     1             RRN02                          INIT RRN
     C     RRN02         IFGE      XRN02                                        After last rec
     C     XRN02         SUB       1             RRN02                          INIT RRN
     C                   END
     C     RRN02         IFLT      1                                            Before 1st rec
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETREC D.MENU,F.MNUHED,*EQ,WSUSER,WKMENU
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WSUSER        KBUS01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WKMENU        KBMN02
     C     K0006         CHAIN     MNUHED                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - SETLL D.MENU,F.mnuHLP,SVK004,SVK005,SVK04
     C**************************************************************************
     C     S017          BEGSR
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
     C     K0007         SETLL     MNUHLP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - GETREC D.MENU,F.mnuHLP,*PV,SVK004,SVK005
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK004        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK005        KDOP02
     C     K0008         READPE    MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S019                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - Process To Reset File Pointer(BOF) - MNUHLP
     C**************************************************************************
     C     S019          BEGSR
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
     C     K0008         SETLL     MNUHLP
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - GETREC D.MENU,F.MNUHLP,*NE,SVK004,SVK005
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK004        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK005        KDOP02
     C     K0008         READE     MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S021                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - Process To Reset File Pointer(EOF) - MNUHLP
     C**************************************************************************
     C     S021          BEGSR
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
     C     K0008         SETGT     MNUHLP
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
     C     WFILE#        IFEQ      2                                            MNUUSR
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
     C     WFILE#        IFEQ      3                                            MNUUSR1
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
     C     WFILE#        IFEQ      4                                            MNUHED
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
     C     WFILE#        IFEQ      5                                            MNUOPT
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
     C     WFILE#        IFEQ      6                                            MNUHLP
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
     C                   MOVEL     CYCGAS        WYCGAS                         External Ledgers
     C                   MOVEL     RN0005        WK0001                         Company number
     C                   MOVEL     CYDESC        WYDESC                         Company description
     C                   MOVEL     RN0006        WK0002                         Employee column head
     C                   MOVEL     RN0007        WK0003                         Employee description
     C                   MOVEL     RN0008        WK0004                         Product description
     C                   MOVEL     RN0009        WK0005                         Reference descriptio
     C                   MOVEL     RN0010        WK0006                         Short Description
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0005        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     MAACTA        WAACTA                         Add
     C                   MOVEL     MAACTD        WAACTD                         Delete
     C                   MOVEL     MAACTR        WAACTR                         Revise
     C                   MOVEL     MACHG         WACHG                          Allow Change of Loca
     C                   MOVEL     MADFV1        WADFV1                         Default Value for Le
     C                   MOVEL     MADFV2        WADFV2                         Default Value for Le
     C                   MOVEL     MADFV3        WADFV3                         Default Value for Le
     C                   MOVEL     MAFORN        WAFORN                         Forename
     C                   MOVEL     RN0011        WK0007                         Group User
     C                   MOVEL     MASURN        WASURN                         Surname
     C                   MOVEL     MAUSER        WAUSER                         User
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     MAUSER        HAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     MAACTA        WK0008                         Add
     C                   MOVEL     MAACTD        WK0009                         Delete
     C                   MOVEL     MAACTR        WK0010                         Revise
     C                   MOVEL     MACHG         WK0011                         Allow Change of Loca
     C                   MOVEL     MADFV1        WK0012                         Default Value for Le
     C                   MOVEL     MADFV2        WK0013                         Default Value for Le
     C                   MOVEL     MADFV3        WK0014                         Default Value for Le
     C                   MOVEL     MAFORN        WK0015                         Forename
     C                   MOVEL     RN0012        WK0016                         Group User
     C                   MOVEL     MASURN        WK0017                         Surname
     C                   MOVEL     MAUSER        WK0018                         User
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     MAUSER        HD0002                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     MBMNUC        XBMNUC                         Menu
     C                   MOVEL     MBMNUD        XBMNUD                         Menu Description
     C                   MOVEL     MBSTRT        WBSTRT                         Start Menu
     C                   MOVEL     MBUSER        WBUSER                         User
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     MBUSER        HBUSER                         User
     C                   MOVEL     MBMNUC        HBMNUC                         Menu
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUOPT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     MCACTA        WCACTA                         Add
     C                   MOVEL     MCACTD        WCACTD                         Delete
     C                   MOVEL     MCACTR        WCACTR                         Revise
     C                   MOVEL     MCMNUC        WCMNUC                         Menu
     C                   MOVEL     MCOPTC        XCOPTC                         Option
     C                   MOVEL     MCOPTD        XCOPTD                         Option Description
     C                   MOVEL     MCPGMN        XCPGMN                         Program Name
     C                   MOVEL     MCPGMT        XCPGMT                         Program Type
     C                   MOVEL     MCPRM1        XCPRM1                         Parameter
     C                   MOVEL     MCPRM2        XCPRM2                         Parameter
     C                   MOVEL     MCPRM3        XCPRM3                         Parameter
     C                   MOVEL     MCPRM4        XCPRM4                         Parameter
     C                   MOVEL     MCSPGM        XCSPGM                         Secondary Program Na
     C                   MOVEL     MCUSER        XCUSER                         User
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
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0001    RN0002    000016741676
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XBMNUD    0000  05      05
SC0002    XCOPTD    0000  03      03
SC0001    RN0002    0000  0304    03                   Y
SC0001    ##SELC    0000  0102    01                   Y
SC0002    SOPT      0000  0102    01                   Y
