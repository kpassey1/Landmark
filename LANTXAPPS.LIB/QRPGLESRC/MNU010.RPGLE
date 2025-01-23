     F/TITLE MNU010   Work with User Menu Details
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MNU010
     F*  Application ID      -    MNU010
     F*  Application Name    -      Work with User Menu Details
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  The menu programs supplied with the software will allow
     F*  companies to set up specific menus related to a particular
     F*  user or group of users.
     F*
     F*  Initially a user is set up and all the associated menus defined for
     F*  that user are added.
     F*
     F*  Once the required menus are defined the user can then define the
     F*  required menu options.
     F*
     F*  Having defined the relevant menu options help text for each option
     F*  can be added along with help text for each menu.
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  MNUUSR      - (U/DISK   ) Menu Users                  MA
     F*  MNUUSR2     - (I/DISK   ) Users by Group Id
     F*  MNUUSR1     - (I/DISK   ) User Seq
     F*  MNUHED      - (U/DISK   ) Menu Heading file           MB
     F*  MNUOPT      - (U/DISK   ) Menu Options                MC
     F*  MNUPGM      - (I/DISK   ) Program Names               MP
     F*  MNUHLP      - (U/DISK   ) Menu Help Text              MD
     F*  MNU010D     - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - List Users
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001S1 / RN0003 : DSPATR(PC)
     F*  05     - SCR001S1 / RN0003 : DSPATR(RI)
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
     F*  SC0002     - User Entry Screen
     F*
     F*  01     - SCR002 / MACHG : DSPATR(PR)
     F*  01     - SCR002 / MADFV1 : DSPATR(PR)
     F*  01     - SCR002 / MADFV2 : DSPATR(PR)
     F*  01     - SCR002 / MADFV3 : DSPATR(PR)
     F*  01     - SCR002 / MAFORN : DSPATR(PR)
     F*  01     - SCR002 / RN0003 : DSPATR(PR)
     F*  01     - SCR002 / MASURN : DSPATR(PR)
     F*  02     - SCR002 / MACHG : DSPATR(UL)
     F*  02     - SCR002 / MADFV1 : DSPATR(UL)
     F*  02     - SCR002 / MADFV2 : DSPATR(UL)
     F*  02     - SCR002 / MADFV3 : DSPATR(UL)
     F*  02     - SCR002 / MAFORN : DSPATR(UL)
     F*  02     - SCR002 / RN0003 : DSPATR(UL)
     F*  02     - SCR002 / MASURN : DSPATR(UL)
     F*  03     - SCR002 / MAUSER : DSPATR(UL)
     F*  04     - SCR002 / RN0003 : DSPATR(PC)
     F*  04     - SCR002 / RN0003 : DSPATR(RI)
     F*  05     - SCR002 / MACHG : DSPATR(PC)
     F*  05     - SCR002 / MACHG : DSPATR(RI)
     F*  06     - SCR002 / MADFV1 : DSPATR(PC)
     F*  06     - SCR002 / MADFV1 : DSPATR(RI)
     F*  07     - SCR002 / MADFV2 : DSPATR(PC)
     F*  07     - SCR002 / MADFV2 : DSPATR(RI)
     F*  08     - SCR002 / MADFV3 : DSPATR(PC)
     F*  08     - SCR002 / MADFV3 : DSPATR(RI)
     F*  09     - SCR002 / MAUSER : DSPATR(PC)
     F*  09     - SCR002 / MAUSER : DSPATR(RI)
     F*  10     - SCR002 / MAUSER : DSPATR(PR)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     - Menu List Screen
     F*
     F*  01     - SCR003S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR003S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR003S1 / FL0002 : DSPATR(PR)
     F*  03     - SCR003S1 / FL0002 : DSPATR(UL)
     F*  04     - SCR003S1 / FL0002 : DSPATR(ND)
     F*  63     - SCR003C1 SFLDSPCTL
     F*  64     - SCR003C1 SFLDSP
     F*  65     - SCR003S1 SFLNXTCHG
     F*  66     - SCR003C1 SFLINZ
     F*  99     - SCR003 OVERLAY
     F* N63     - SCR003C1 SFLCLR
     F* N64     - SCR003C1 ERASE(SCR003S1)
     F* N67     - SCR003C1 SFLEND
     F* N79     - SCR003 PUTOVR
     F* N79     - SCR003C1 PUTOVR
     F*
     F*  SC0004     - Menu Detail Screen
     F*
     F*  01     - SCR004 / MBMNUD : DSPATR(UL)
     F*  01     - SCR004 / MBSTRT : DSPATR(UL)
     F*  02     - SCR004 / MBMNUC : DSPATR(UL)
     F*  03     - SCR004 / MBMNUC : DSPATR(PC)
     F*  03     - SCR004 / MBMNUC : DSPATR(RI)
     F*  04     - SCR004 / MBMNUC : DSPATR(PR)
     F*  05     - SCR004 / MBMNUD : DSPATR(PC)
     F*  05     - SCR004 / MBMNUD : DSPATR(RI)
     F*  06     - SCR004 / MBMNUD : DSPATR(PR)
     F*  07     - SCR004 / MBSTRT : DSPATR(PC)
     F*  07     - SCR004 / MBSTRT : DSPATR(RI)
     F*  99     - SCR004 OVERLAY
     F* N79     - SCR004 PUTOVR
     F*
     F*  SC0005     - Options List Screen
     F*
     F*  01     - SCR005S1 / FL0003 : DSPATR(PC)
     F*  01     - SCR005S1 / FL0003 : DSPATR(RI)
     F*  02     - SCR005S1 / FL0003 : DSPATR(PR)
     F*  03     - SCR005S1 / FL0003 : DSPATR(UL)
     F*  04     - SCR005S1 / FL0003 : DSPATR(ND)
     F*  63     - SCR005C1 SFLDSPCTL
     F*  64     - SCR005C1 SFLDSP
     F*  65     - SCR005S1 SFLNXTCHG
     F*  66     - SCR005C1 SFLINZ
     F*  99     - SCR005 OVERLAY
     F* N63     - SCR005C1 SFLCLR
     F* N64     - SCR005C1 ERASE(SCR005S1)
     F* N67     - SCR005C1 SFLEND
     F* N79     - SCR005 PUTOVR
     F* N79     - SCR005C1 PUTOVR
     F*
     F*  SC0006     - Options Detail Screen
     F*
     F*  01     - SCR006 / MCOPTD : DSPATR(PR)
     F*  01     - SCR006 / MCPGMN : DSPATR(PR)
     F*  01     - SCR006 / MCPGMT : DSPATR(PR)
     F*  01     - SCR006 / MCPRM1 : DSPATR(PR)
     F*  01     - SCR006 / MCPRM2 : DSPATR(PR)
     F*  01     - SCR006 / MCPRM3 : DSPATR(PR)
     F*  01     - SCR006 / MCPRM4 : DSPATR(PR)
     F*  01     - SCR006 / MCSPGM : DSPATR(PR)
     F*  02     - SCR006 / MCOPTD : DSPATR(UL)
     F*  02     - SCR006 / MCPGMN : DSPATR(UL)
     F*  02     - SCR006 / MCPGMT : DSPATR(UL)
     F*  02     - SCR006 / MCPRM1 : DSPATR(UL)
     F*  02     - SCR006 / MCPRM2 : DSPATR(UL)
     F*  02     - SCR006 / MCPRM3 : DSPATR(UL)
     F*  02     - SCR006 / MCPRM4 : DSPATR(UL)
     F*  02     - SCR006 / MCSPGM : DSPATR(UL)
     F*  03     - SCR006 / MCOPTC : DSPATR(PR)
     F*  04     - SCR006 / MCOPTC : DSPATR(UL)
     F*  05     - SCR006 / MCOPTC : DSPATR(PC)
     F*  05     - SCR006 / MCOPTC : DSPATR(RI)
     F*  06     - SCR006 / MCOPTD : DSPATR(PC)
     F*  06     - SCR006 / MCOPTD : DSPATR(RI)
     F*  07     - SCR006 / MCPGMN : DSPATR(PC)
     F*  07     - SCR006 / MCPGMN : DSPATR(RI)
     F*  08     - SCR006 / MCPGMT : DSPATR(PC)
     F*  08     - SCR006 / MCPGMT : DSPATR(RI)
     F*  09     - SCR006 / MCSPGM : DSPATR(PC)
     F*  09     - SCR006 / MCSPGM : DSPATR(RI)
     F*  99     - SCR006 OVERLAY
     F* N79     - SCR006 PUTOVR
     F*
     F*  SC0007     - Help Details
     F*
     F*  01     - SCR007S1 / FL0004 : DSPATR(PC)
     F*  01     - SCR007S1 / FL0004 : DSPATR(RI)
     F*  02     - SCR007S1 / FL0004 : DSPATR(PR)
     F*  03     - SCR007S1 / FL0004 : DSPATR(UL)
     F*  04     - SCR007 / *CNST* : DSPATR(ND)
     F*  04     - SCR007 / *CNST* : DSPATR(ND)
     F*  04     - SCR007 / *CNST* : DSPATR(ND)
     F*  05     - SCR007S1 / MDSEQN : DSPATR(PR)
     F*  06     - SCR007S1 / MDSEQN : DSPATR(UL)
     F*  07     - SCR007S1 / MDTEXT : DSPATR(PR)
     F*  08     - SCR007S1 / MDTEXT : DSPATR(UL)
     F*  63     - SCR007C1 SFLDSPCTL
     F*  64     - SCR007C1 SFLDSP
     F*  65     - SCR007S1 SFLNXTCHG
     F*  66     - SCR007C1 SFLINZ
     F*  99     - SCR007 OVERLAY
     F* N63     - SCR007C1 SFLCLR
     F* N64     - SCR007C1 ERASE(SCR007S1)
     F* N67     - SCR007C1 SFLEND
     F* N79     - SCR007 PUTOVR
     F* N79     - SCR007C1 PUTOVR
     F*
     F*  SC0008     - List of Users
     F*
     F*  01     - SCR008 / T01 : DSPATR(PR)
     F*  02     - SCR008 / T01 : DSPATR(ND)
     F*  03     - SCR008 / T01 : DSPATR(PR)
     F*  04     - SCR008 / T01 : DSPATR(ND)
     F*  05     - SCR008 / T01 : DSPATR(PR)
     F*  06     - SCR008 / T01 : DSPATR(ND)
     F*  07     - SCR008 / T01 : DSPATR(PR)
     F*  08     - SCR008 / T01 : DSPATR(ND)
     F*  09     - SCR008 / T01 : DSPATR(PR)
     F*  10     - SCR008 / T01 : DSPATR(ND)
     F*  80     - SCR008 / T01 : DSPATR(PC)
     F*  80     - SCR008 / T01 : DSPATR(PC)
     F*  80     - SCR008 / T01 : DSPATR(PC)
     F*  80     - SCR008 / T01 : DSPATR(PC)
     F*  80     - SCR008 / T01 : DSPATR(PC)
     F* N79     - SCR008 PUTOVR
     F*
     F*  SC0009     - Copy Users
     F*
     F*  01     - SCR010 / CPYMNU : DSPATR(PC)
     F*  01     - SCR010 / CPYMNU : DSPATR(RI)
     F*  02     - SCR010 / CPYOPT : DSPATR(PC)
     F*  02     - SCR010 / CPYOPT : DSPATR(RI)
     F*  03     - SCR010 / CPYOPT : DSPATR(UL)
     F*  04     - SCR010 / TOUSER : DSPATR(PC)
     F*  04     - SCR010 / TOUSER : DSPATR(RI)
     F*  05     - SCR010 / TOUSER : DSPATR(UL)
     F* N79     - SCR010 PUTOVR
     F*
     F*  SC0010     - List of Programs
     F*
     F*  01     - SCR009 / T04 : DSPATR(PR)
     F*  02     - SCR009 / T04 : DSPATR(ND)
     F*  03     - SCR009 / T04 : DSPATR(PR)
     F*  04     - SCR009 / T04 : DSPATR(ND)
     F*  05     - SCR009 / T04 : DSPATR(PR)
     F*  06     - SCR009 / T04 : DSPATR(ND)
     F*  07     - SCR009 / T04 : DSPATR(PR)
     F*  08     - SCR009 / T04 : DSPATR(ND)
     F*  09     - SCR009 / T04 : DSPATR(PR)
     F*  10     - SCR009 / T04 : DSPATR(ND)
     F* N79     - SCR009 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Users
     F* S002 - User Entry Screen
     F* S003 - Menu List Screen
     F* S004 - Menu Detail Screen
     F* S005 - Options List Screen
     F* S006 - Options Detail Screen
     F* S007 - Help Details
     F* S008 - List of Users
     F* S009 - List of Programs
     F* S010 - Copy Users
     F* SREDSP -  Redisplay Windows within stack.
     F* LEVTXT - Set Default Text
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03BKW - SCRN SUB
     F* S03EDT - SCRN SUB
     F* S03FWD - SCRN SUB
     F* S05BKW - SCRN SUB
     F* S05EDT - SCRN SUB
     F* S05FWD - SCRN SUB
     F* S07BKW - SCRN SUB
     F* S07EDT - SCRN SUB
     F* S07FWD - SCRN SUB
     F* S08ABR - SCRN SUB
     F* S08AFR - SCRN SUB
     F* S08ALD - SCRN SUB
     F* S10ABR - SCRN SUB
     F* S10AFR - SCRN SUB
     F* S10ALD - SCRN SUB
     F* SMSG - calls message handling program to either clear, add, or
     F* S011   - SETLL D.MENU,F.MNUUSR,SVK001
     F* S012   - GETREC D.MENU,F.MNUUSR,*lock,*eq,SVK001
     F* S013   - GETREC D.MENU,F.MNUUSR1,*eq,MAGUSER
     F* S014   - GETREC D.MENU,F.MNUUSR,*eq,SVK001
     F* S015   - DELETE D.MENU,F.MNUUSR,F.MNUHED,F.MNUOPT
     F* S016   - UPDATE D.MENU,F.MNUUSR
     F* S017   - WRITE D.MENU,F.MNUUSR
     F* S018   - SETLL D.MENU,F.MNUHED,SVK002,SVK003
     F* S019   - GETREC D.MENU,F.MNUHED,*lock,*eq,SVK002,SVK003
     F* S020   - GETREC D.MENU,F.MNUHED,*eq,SVK002,SVK003
     F* S021   - DELETE D.MENU,F.MNUHED,F.MNUOPT
     F* S022   - UPDATE D.MENU,F.MNUHED
     F* S023   - WRITE D.MENU,F.MNUHED
     F* S024   - SETLL D.MENU,F.MNUOPT,SVK004,SVK005,SVK006
     F* S025   - GETREC D.MENU,F.MNUOPT,*lock,*eq,SVK004,SVK005,SVK006
     F* S026   - GETREC D.MENU,F.MNUOPT,*eq,SVK004,SVK005,SVK006
     F* S027   - GETREC D.MENU,F.MNUpgm,*eq,MCPGMN,MCSPGM
     F* S028   - DELETE D.MENU,F.MNUOPT
     F* S029   - UPDATE D.MENU,F.MNUOPT
     F* S030   - WRITE D.MENU,F.MNUOPT
     F* S031   - SETLL D.MENU,F.MNUHLP,SVK007,SVK008,SVK009
     F* S032   - GETBLK D.MENU,F.MNUUSR,*PV
     F* S033   - Process To Reset File Pointer(BOF) - MNUUSR
     F* S034   - Process To Reset File Pointer(EOF) - MNUUSR
     F* S035   - GETREC d.mnuusr2,f.mnuusr2,*eq,menu.mnuusr.mauser
     F* S036   - GETREC D.MENU,F.MNUUSR,F.MNUUSR1,*EQ,:0002
     F* S037   - GETREC D.MENU,F.MNUUSR,*EQ,:0002
     F* S038   - GETBLK D.MENU,F.MNUHED,*PV,SVK002
     F* S039   - Process To Reset File Pointer(BOF) - MNUHED
     F* S040   - Process To Reset File Pointer(EOF) - MNUHED
     F* S041   - GETREC D.MENU,F.MNUHED,*EQ,MBUSER,MBMNUC
     F* S042   - GETBLK D.MENU,F.MNUOPT,*PV,SVK004,SVK005
     F* S043   - Process To Reset File Pointer(BOF) - MNUOPT
     F* S044   - Process To Reset File Pointer(EOF) - MNUOPT
     F* S045   - GETREC D.MENU,F.MNUOPT,*EQ,MCUSER,MCMNUC,MCOPTC
     F* S046   - GETBLK D.MENU,F.MNUHLP,*PV,SVK007,SVK008,*changed
     F* S047   - Process To Reset File Pointer(BOF) - MNUHLP
     F* S048   - Process To Reset File Pointer(EOF) - MNUHLP
     F* S049   - DELETE D.MENU,F.MNUHLP
     F* S050   - SETLL D.MENU,F.MNUHLP,mdmnuc,mdoptc,mdseqn
     F* S051   - UPDATE D.menu,F.mnuhlp
     F* S052   - WRITE D.menu,f.mnuhlp
     F* S053   - GETREC D.MENU,F.MNUHLP,*eq,mdmnuc,mdoptc,mdseqn
     F* S054   - SETLL D.MENU,F.MNUHLP,SVK007,SVK008,wkseqn
     F* S055   - SETLL D.MENU,F.MNUUSR1,SVK08
     F* S056   - GETREC D.MENU,F.MNUUSR1,*PV,
     F* S057   - Process To Reset File Pointer(BOF) - MNUUSR1
     F* S058   - GETREC D.MENU,F.MNUUSR1,*NX,
     F* S059   - Process To Reset File Pointer(EOF) - MNUUSR1
     F* S060   - SETLL D.MENU,F.MNUPGM,SVK10,svk11
     F* S061   - GETREC D.MENU,F.MNUPGM,*PV,
     F* S062   - Process To Reset File Pointer(BOF) - MNUPGM
     F* S063   - GETREC D.MENU,F.MNUPGM,*NX,
     F* S064   - Process To Reset File Pointer(EOF) - MNUPGM
     F* S002V - User Entry Screen
     F* *PSSR - Program Execution Errors Handler
     F* SCLF   - CLF : Cursor Location On Field Handler
     F* SATRIB - Display Attribute Handler
     F* SLOCK - Update Lock Flag
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FMNU010D   CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR003S1:RRN02)
     F                                     SFILE(SCR005S1:RRN03)
     F                                     SFILE(SCR007S1:RRN04)
     F                                     INFDS(DSPFDS)
     FMNUUSR2   IF   E           K DISK
     F                                     RENAME(MNUUSRF:FMT002)
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FMNUUSR1   IF   E           K DISK
     F                                     RENAME(MNUUSRF:FMT001)
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FMNUPGM    IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FMNUUSR    UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FMNUHED    UF A E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FMNUOPT    UF A E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FMNUHLP    UF A E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              1    DIM(17)
     D A02             S              1    DIM(15)
     D A03             S             10    DIM(11)
     D A04             S             10    DIM(10)
     D A05             S              5    DIM(10)
     D A06             S             10    DIM(9)
     D A07             S              5    DIM(9)
     D A08             S              5    DIM(9)
     D B01             S             10    DIM(5)
     D B02             S             10    DIM(5)
     D B03             S             10    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(7) CTDATA PERRCD(1)              Alpha constants i
     D DA4             S             24    DIM(6) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(6) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(44) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(44) ALT(DA1)
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D*
     D* Company Heading
     D*
     D @DS001          DS            30
     D  ZZCOMP                 1     30
     D*
     D* Level 1 Description
     D*
     D @DS002          DS            15
     D  ZZLEV1                 1     15
     D*
     D* Level 2 Description
     D*
     D @DS003          DS            15
     D  ZZLEV2                 1     15
     D*
     D* Level 3 Description
     D*
     D @DS004          DS            15
     D  ZZLEV3                 1     15
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
     D  DA6                   27     41    DIM(15)                              Fld Attr. Wrk Ary
     D  #ATRIB                11     41
     D  #FROM                 25     28  0
     D  #TO                   29     32  0
     D  #CLF                  25     32  0
     D  #MAP                   1     24
     D*
     D* Named constants
     D*
     D C0001           C                   CONST('Record not found for-
     D                                      Edit')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Delete')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Record not found for-
     D                                      Display')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Invalid cursor loc f-
     D                                     or prompt')
     D*
     D* Named constants
     D*
     D C0005           C                   CONST('F18=Insert')
     D*
     D* Named constants
     D*
     D C0006           C                   CONST('F18=Add   ')
     D*
     D* Named constants
     D*
     D C0007           C                   CONST('. . . . . . . . .')
     D*
     D* Named constants
     D*
     D C0008           C                   CONST('Invalid action choic-
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
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS009          DS
     D  T02                    1     50    DIM(5)
     D  T02001                 1     10
     D  T02002                11     20
     D  T02003                21     30
     D  T02004                31     40
     D  T02005                41     50
     D @DS010          DS
     D  T03                    1    100    DIM(5)
     D  T03001                 1     20
     D  T03002                21     40
     D  T03003                41     60
     D  T03004                61     80
     D  T03005                81    100
     D @DS011          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS012          DS
     D  T05                    1     50    DIM(5)
     D  T05001                 1     10
     D  T05002                11     20
     D  T05003                21     30
     D  T05004                31     40
     D  T05005                41     50
     D @DS013          DS
     D  T06                    1    150    DIM(5)
     D  T06001                 1     30
     D  T06002                31     60
     D  T06003                61     90
     D  T06004                91    120
     D  T06005               121    150
     D @DS014          DS
     D  T07                    1     50    DIM(5)
     D  T07001                 1     10
     D  T07002                11     20
     D  T07003                21     30
     D  T07004                31     40
     D  T07005                41     50
     IMNUUSRF
     I              MAGUSER                     RN0003
     IFMT001
     I              MAGUSER                     RN0004
     IFMT002
     I              MAGUSER                     RN0005
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    RN0002
     C                   PARM                    RN0001
     C                   PARM                    ACT
     C                   PARM                    OK
     C*
     C     P0002         PLIST
     C                   PARM                    INTER
     C                   PARM                    FL0005
     C                   PARM                    CPYMNU
     C                   PARM                    CPYOPT
     C                   PARM                    TOUSER
     C                   PARM                    YNSC9
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
     C                   KFLD                    KCPG01
     C                   KFLD                    KPSP02
     C*
     C     K0006         KLIST
     C                   KFLD                    KBMN01
     C                   KFLD                    KCOP02
     C                   KFLD                    KDSE03
     C*
     C     K0007         KLIST
     C                   KFLD                    KBUS01
     C*
     C     K0008         KLIST
     C                   KFLD                    KBUS01
     C                   KFLD                    KBMN02
     C*
     C     K0009         KLIST
     C                   KFLD                    KCUS01
     C                   KFLD                    KCMN02
     C*
     C     K0010         KLIST
     C                   KFLD                    KCUS01
     C                   KFLD                    KCMN02
     C                   KFLD                    KCOP03
     C*
     C     K0011         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C*
     C     K0012         KLIST
     C                   KFLD                    KDMN01
     C                   KFLD                    KDOP02
     C                   KFLD                    KDSE03
     C*
     C     K0013         KLIST
     C                   KFLD                    KPPG01
     C                   KFLD                    KPSP02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    MBUSER        WBUSER                         User
     C     *LIKE         DEFINE    MCACTA        WCACTA                         Add
     C     *LIKE         DEFINE    MCACTD        WCACTD                         Delete
     C     *LIKE         DEFINE    MCACTR        WCACTR                         Revise
     C     *LIKE         DEFINE    MCMNUC        WCMNUC                         Menu
     C     *LIKE         DEFINE    MCUSER        WCUSER                         User
     C     *LIKE         DEFINE    MPPGMD        WPPGMD                         Program Description
     C     *LIKE         DEFINE    MPPGMN        WPPGMN                         Program Name
     C     *LIKE         DEFINE    MPPGMT        WPPGMT                         Program Type
     C     *LIKE         DEFINE    MPPRM1        WPPRM1                         Parameter
     C     *LIKE         DEFINE    MPPRM2        WPPRM2                         Parameter
     C     *LIKE         DEFINE    MPPRM3        WPPRM3                         Parameter
     C     *LIKE         DEFINE    MPPRM4        WPPRM4                         Parameter
     C     *LIKE         DEFINE    MPSPGM        WPSPGM                         Secondary Program Na
     C     *LIKE         DEFINE    MAUSER        WAUSER                         User
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    MPPGMN        HPPGMN
     C     *LIKE         DEFINE    MPSPGM        HPSPGM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0005        HD0002
     C     *LIKE         DEFINE    MAUSER        HD0003
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    MAUSER        HD0001
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        ROW1              3 0
     C                   MOVE      *ZEROS        COL1              3 0
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
     C                   MOVE      *BLANKS       ACT               1
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *BLANKS       CPYMNU            1
     C                   MOVE      *BLANKS       CPYOPT            1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C07               3 0
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       DELERR            1
     C                   MOVE      *BLANKS       DELETE            1
     C                   MOVE      *BLANKS       ENTER             1
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *ZEROS        FL0003            1 0
     C                   MOVE      *ZEROS        FL0004            1 0
     C                   MOVE      *BLANKS       FL0005           10
     C                   MOVE      *BLANKS       FL0006           10
     C                   MOVE      *BLANKS       FL0007           10
     C                   MOVE      *BLANKS       FL0008           25
     C                   MOVE      *BLANKS       FL0009           25
     C                   MOVE      *BLANKS       FL0010           25
     C                   MOVE      *BLANKS       FST08            10
     C                   MOVE      *BLANKS       FST10            10
     C                   MOVE      *BLANKS       FST11            10
     C                   MOVE      *BLANKS       F02001           10
     C                   MOVE      *BLANKS       F10001           10
     C                   MOVE      *BLANKS       F10002           10
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *BLANKS       F18              10
     C                   MOVE      *BLANKS       INTER             1
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST08            10
     C                   MOVE      *BLANKS       LST10            10
     C                   MOVE      *BLANKS       LST11            10
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       OK                1
     C                   MOVE      *BLANKS       RN0001           10            Program Name
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001           10
     C                   MOVE      *BLANKS       PS0101           10
     C                   MOVE      *BLANKS       PS0301            5
     C                   MOVE      *BLANKS       PS0501            5
     C                   MOVE      *ZEROS        PS0701            5 0
     C                   MOVE      *BLANKS       SVK001           10
     C                   MOVE      *BLANKS       SVK002           10
     C                   MOVE      *BLANKS       SVK003            5
     C                   MOVE      *BLANKS       SVK004           10
     C                   MOVE      *BLANKS       SVK005            5
     C                   MOVE      *BLANKS       SVK006            5
     C                   MOVE      *BLANKS       SVK007            5
     C                   MOVE      *BLANKS       SVK008            5
     C                   MOVE      *ZEROS        SVK009            5 0
     C                   MOVE      *BLANKS       SVK010           10
     C                   MOVE      *BLANKS       SVK08            10
     C                   MOVE      *BLANKS       SVK10            10
     C                   MOVE      *BLANKS       SVK11            10
     C                   MOVE      *ZEROS        S08CNT            3 0
     C                   MOVE      *ZEROS        S10CNT            3 0
     C                   MOVE      *BLANKS       TOUSER           10
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       RN0002           10            User Id
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *ZEROS        WKSEQN            5 0
     C                   MOVE      *ZEROS        X                 3 0
     C                   MOVE      *BLANKS       YNSC9             1
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       IN04             99            Save Ind
     C                   MOVE      *BLANKS       IN05             99            Save Ind
     C                   MOVE      *BLANKS       IN06             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD07            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KAUS01           10            MAUSER
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       KAGU01           10            MAGUSER
     C                   MOVE      *BLANKS       KBMN02            5            MBMNUC
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       INS03            99            Savd.Ind
     C                   MOVE      *BLANKS       KCOP03            5            MCOPTC
     C                   MOVE      *BLANKS       KCPG01           10            MCPGMN
     C                   MOVE      *BLANKS       KPSP02           10            MPSPGM
     C                   MOVE      *BLANKS       INS04            99            Savd.Ind
     C                   MOVE      *BLANKS       KBMN01            5            MBMNUC
     C                   MOVE      *BLANKS       KCOP02            5            MCOPTC
     C                   MOVE      *ZEROS        KDSE03            5 0          MDSEQN
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          010
     C                   MOVE      *BLANKS       KBUS01           10            MBUSER
     C                   MOVE      *BLANKS       KCUS01           10            MCUSER
     C                   MOVE      *BLANKS       KCMN02            5            MCMNUC
     C                   MOVE      *BLANKS       KDMN01            5            MDMNUC
     C                   MOVE      *BLANKS       KDOP02            5            MDOPTC
     C                   MOVE      *BLANKS       KPPG01           10            MPPGMN
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *ZEROS        EXISTF            1 0          Existence chk flg
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
     C                   MOVE      *ZEROS        T01001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T01005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04005                         Init DS/*DTA flds
     C                   MOVEL     'LANDXAPP'    APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     1             XRN02
     C                   Z-ADD     1             XRN03
     C                   Z-ADD     1             XRN04
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
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS003            5 0
     C                   Z-ADD     *ZEROS        DAS004            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS          0100
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS          0100
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS          0100
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN03             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN03             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN03             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN04             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN04             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN04             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WRRN03            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ03            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WRRN04            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ04            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS07             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0006           30 9
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             CALLST            1 0          CALL STSword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
     C                   Z-ADD     *ZEROS        WFILE#            2 0          FILE#
     C                   END
     C                   MOVE      *BLANK        LRFLAG            1
     C                   MOVE      '0'           *IN60
     C*
     C     *DTAARA       DEFINE    MNUCOMP       @DS001
     C     *DTAARA       DEFINE    MNULEV1       @DS002
     C     *DTAARA       DEFINE    MNULEV2       @DS003
     C     *DTAARA       DEFINE    MNULEV3       @DS004
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
     C     SCRNID        CASEQ     'SC0004'      S004
     C     SCRNID        CASEQ     'SC0005'      S005
     C     SCRNID        CASEQ     'SC0006'      S006
     C     SCRNID        CASEQ     'SC0007'      S007
     C     SCRNID        CASEQ     'SC0008'      S008
     C     SCRNID        CASEQ     'SC0010'      S009
     C     SCRNID        CASEQ     'SC0009'      S010
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
     C* S001 - List Users
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* GETDTAA mnucomp
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* GETDTAA mnulev1
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* GETDTAA mnulev2
     C                   IN        @DS003                               93
     C                   Z-ADD     0             DAS003
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS003
     C                   END
     C* GETDTAA mnulev3
     C                   IN        @DS004                               93
     C                   Z-ADD     0             DAS004
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS004
     C                   END
     C*                                                               *
     C* IF zzlev1=*blanks
     C     ZZLEV1        IFEQ      *BLANKS
     C* ZZLEV1 = 'Level 1'
     C                   MOVE      *BLANKS       ZZLEV1
     C                   MOVEL     'Level 1'     ZZLEV1
     C* END                                                           *
     C                   END
     C* IF zzlev2=*blanks
     C     ZZLEV2        IFEQ      *BLANKS
     C* ZZLEV2 = 'Level 2'
     C                   MOVE      *BLANKS       ZZLEV2
     C                   MOVEL     'Level 2'     ZZLEV2
     C* END                                                           *
     C                   END
     C* IF zzlev3=*blanks
     C     ZZLEV3        IFEQ      *BLANKS
     C* ZZLEV3 = 'Level 3'
     C                   MOVE      *BLANKS       ZZLEV3
     C                   MOVEL     'Level 3'     ZZLEV3
     C* END                                                           *
     C                   END
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* MAUSER = ' '
     C                   MOVEL     *BLANKS       XAUSER
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       XASURN
     C* Set Key values to parms passed
     C* SVK001 = *blanks
     C                   MOVEL     *BLANKS       SVK001
     C* Set Reposition values to parms passed
     C* PS0101 = *blank
     C                   MOVE      *BLANKS       PS0101
     C                   MOVEL     *BLANK        PS0101
     C* Set file for list to first record in file
     C* SETLL D.MENU,F.MNUUSR,SVK001
     C*
     C                   EXSR      S011
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
     C                   MOVEA     '0'           *IN(5)
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
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SC0002
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
     C* SETLL D.MENU,F.MNUUSR,SVK001
     C*
     C                   EXSR      S011
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* **  1. Check for any selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* **  2. Fill panel.
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
     C* *** Scroll information forward on function key 8
     C* **  1. Check for selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
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
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C* IF PS0101<>' '
     C     PS0101        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK001 = PS0101
     C                   MOVE      PS0101        SVK001
     C* PS0101 = *blanks
     C                   MOVEL     *BLANKS       PS0101
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
     C* SETLL D.MENU,F.MNUUSR,SVK001
     C*
     C                   EXSR      S011
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
     C* S002 - User Entry Screen
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Check option is allowed
     C* BAT = 'I'
     C                   MOVE      'I'           BAT
     C* USER = *userid
     C                   MOVE      *BLANKS       RN0002
     C                   MOVEL     USER          RN0002
     C* PGM = 'MNU010C'
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     'MNU010C'     RN0001
     C* ACT = %ctc(Mode)
     C*  Convert To Character
     C                   MOVE      *BLANK        ACT
     C                   MOVEL     MODE          ACT
     C* OK = ' '
     C                   MOVE      *BLANKS       OK
     C* CALL 'MNU040C',bat,user,pgm,act,ok
     C                   Z-ADD     1             CALLST
     C                   CALL      'MNU040C'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF ok = 'N'
     C     OK            IFEQ      'N'
     C* DSPERR *NONE,'MNU0006','MENUERR'
     C                   MOVEL     'MNU0006'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Set Default Text
     C* AR15 = zzlev1
     C                   MOVE      *BLANKS       A02
     C                   MOVEA     ZZLEV1        A02
     C* EXSUBR levtxt
     C                   EXSR      LEVTXT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0008 = %BCT('Default',ARLEV,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     'Default'     AARG1
     C                   MOVE      *BLANKS       AARG2
     C                   MOVEA     A01           AARG2
     C     AARG1         CAT(P)    AARG2:C1      ARSLT0
     C                   MOVE      *BLANKS       FL0008
     C                   MOVEL     ARSLT0        FL0008
     C*                                                               *
     C* AR15 = zzlev2
     C                   MOVE      *BLANKS       A02
     C                   MOVEA     ZZLEV2        A02
     C* EXSUBR levtxt
     C                   EXSR      LEVTXT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0009 = %BCT('Default',ARLEV,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     'Default'     AARG1
     C                   MOVE      *BLANKS       AARG2
     C                   MOVEA     A01           AARG2
     C     AARG1         CAT(P)    AARG2:C1      ARSLT0
     C                   MOVE      *BLANKS       FL0009
     C                   MOVEL     ARSLT0        FL0009
     C*                                                               *
     C* AR15 = zzlev3
     C                   MOVE      *BLANKS       A02
     C                   MOVEA     ZZLEV3        A02
     C* EXSUBR levtxt
     C                   EXSR      LEVTXT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0010 = %BCT('Default',ARLEV,1)
     C*  Concatenate with blanks inserted
     C                   Z-ADD     1             C1
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     'Default'     AARG1
     C                   MOVE      *BLANKS       AARG2
     C                   MOVEA     A01           AARG2
     C     AARG1         CAT(P)    AARG2:C1      ARSLT0
     C                   MOVE      *BLANKS       FL0010
     C                   MOVEL     ARSLT0        FL0010
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK001 = :0002
     C                   MOVE      XAUSER        SVK001
     C* MAUSER = ' '
     C                   MOVEL     *BLANKS       XAUSER
     C* MAFORN = ' '
     C                   MOVEL     *BLANKS       XAFORN
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       XASURN
     C* MAGUSER = ' '
     C                   MOVEL     *BLANKS       WK0001
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* MADFV1 = ' '
     C                   MOVEL     *BLANKS       XADFV1
     C* MADFV2 = ' '
     C                   MOVEL     *BLANKS       XADFV2
     C* MADFV3 = ' '
     C                   MOVEL     *BLANKS       XADFV3
     C* MACHG = ' '
     C                   MOVE      *BLANKS       XACHG
     C* MAUSER = SVK001
     C                   MOVE      SVK001        XAUSER
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR MENU.MNUUSR.MAUSER,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XAUSER  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.MENU,F.MNUUSR,*lock,*eq,SVK001
     C*
     C                   EXSR      S012
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUUSR)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUUSR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.MENU,F.MNUUSR1,*eq,MAGUSER
     C*
     C                   EXSR      S013
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* GRPATR data,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'DATA    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.MENU,F.MNUUSR,*lock,*eq,SVK001
     C*
     C                   EXSR      S012
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUUSR)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK01         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUUSR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.MENU,F.MNUUSR1,*eq,MAGUSER
     C*
     C                   EXSR      S013
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.MENU,F.MNUUSR,*eq,SVK001
     C*
     C                   EXSR      S014
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUUSR)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.MENU,F.MNUUSR1,*eq,MAGUSER
     C*
     C                   EXSR      S013
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* MAUSER = ' '
     C                   MOVEL     *BLANKS       XAUSER
     C* MAFORN = ' '
     C                   MOVEL     *BLANKS       XAFORN
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       XASURN
     C* MAGUSER = ' '
     C                   MOVEL     *BLANKS       WK0001
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* MADFV1 = ' '
     C                   MOVEL     *BLANKS       XADFV1
     C* MADFV2 = ' '
     C                   MOVEL     *BLANKS       XADFV2
     C* MADFV3 = ' '
     C                   MOVEL     *BLANKS       XADFV3
     C* MACHG = ' '
     C                   MOVE      *BLANKS       XACHG
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* IF mode = 6
     C     MODE          IFEQ      6
     C* GRPATR key,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'KEY     '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'DATA    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF mode = 2
     C     MODE          IFEQ      2
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'DATA    '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   EXFMT     SCR002
     C                   MOVEA     '000000'      *IN(4)
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
     C* Prompt
     C*
     C     *INKD         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ** Check for any prompt fields.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* IF mode = 2 | mode = 6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C*                                                               *
     C* IF %clf(MENU.MNUUSR.MAgUSER)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* EXSCR SC0008
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S008
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* MAGUSER = F02001
     C                   MOVE      F02001        WK0001
     C* END                                                           *
     C                   END
     C* MASURN = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* GETREC D.MENU,F.MNUUSR1,*eq,MAgUSER
     C*
     C                   EXSR      S013
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If no fields processed for prompt
     C* ** (UPDFLG=0), display error.
     C* IF UPDFLG=0
     C     UPDFLG        IFEQ      *ZERO
     C* DSPERR *none,'Invalid cursor loc for prompt'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.MENU,F.MNUUSR
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    MNUUSR                               91      RLS LCK MNUUSR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform delete on function key 14
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.MENU,F.MNUUSR,F.MNUHED,F.MNUOPT
     C*
     C                   EXSR      S015
     C*                                                               *
     C* IF (%STS(D.MENU,F.MNUUSR) = *YES)
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S002V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* If no group F18 flag must be set
     C* IF maguser=*BLANK
     C     WK0001        IFEQ      *BLANK
     C* IF (MACHG<>'Y') *AND (MACHG<>'N')
     C     XACHG         IFNE      'Y'
     C     XACHG         ANDNE     'N'
     C* DSPERR MACHG,'MNU0016','MENUERR'
     C                   MOVEL     'MNU0016'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XACHG   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If group entered defaults & flag must be blank
     C* ELSE                                                          *
     C                   ELSE
     C* IF (MACHG<>*BLANKS)
     C     XACHG         IFNE      *BLANKS
     C* DSPERR MACHG,'MNU0018','MENUERR'
     C                   MOVEL     'MNU0018'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XACHG   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF (MADFV1<>*BLANKS)
     C     XADFV1        IFNE      *BLANKS
     C* DSPERR MADFV1,'MNU0018','MENUERR'
     C                   MOVEL     'MNU0018'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XADFV1  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF (MADFV2<>*BLANKS)
     C     XADFV2        IFNE      *BLANKS
     C* DSPERR MADFV2,'MNU0018','MENUERR'
     C                   MOVEL     'MNU0018'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XADFV2  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF (MADFV3<>*BLANKS)
     C     XADFV3        IFNE      *BLANKS
     C* DSPERR MADFV3,'MNU0018','MENUERR'
     C                   MOVEL     'MNU0018'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XADFV3  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Revise
     C* IF error='N'
     C     ERROR         IFEQ      'N'
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.MENU,F.MNUUSR
     C*
     C                   EXSR      S016
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.MENU,F.MNUUSR
     C*
     C                   EXSR      S017
     C* ** Set keys for first record to display.
     C* SVK001 = :0002
     C                   MOVE      XAUSER        SVK001
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.MENU,F.MNUUSR)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END  ; error = 'N'
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Menu List Screen
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK003 = PS0301
     C                   MOVE      PS0301        SVK003
     C*                                                               *
     C* Set Keys to values from header file.
     C* MBUSER = :0002
     C                   MOVE      XAUSER        WBUSER
     C* SVK002 = :0002
     C                   MOVE      XAUSER        SVK002
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.MENU,F.MNUHED,SVK002,SVK003
     C*
     C                   EXSR      S018
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
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
     C                   WRITE     SCR003
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
     C                   EXFMT     SCR003C1
     C     SFLRRN        IFGT      0
     C     DRN02         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN02
     C                   Z-ADD     SFLRRN        DRN02
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
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
     C                   GOTO      $00399
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
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
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
     C* SETLL D.MENU,F.MNUHED,SVK002,SVK003
     C*
     C                   EXSR      S018
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* **  1. Check for any selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S03BKW
     C                   EXSR      S03BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* **  1. Check for selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S03BKW
     C                   EXSR      S03BKW
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
     C*     1. Check for selected records.
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
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
     C* EXSUBR S03EDT
     C                   EXSR      S03EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* *** Check for reposition
     C* IF PS0301<>' '
     C     PS0301        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK003 = PS0301
     C                   MOVE      PS0301        SVK003
     C* PS0301 = ' '
     C                   MOVEL     *BLANKS       PS0301
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.MENU,F.MNUHED,SVK002,SVK003
     C*
     C                   EXSR      S018
     C* EXSUBR S03FWD
     C                   EXSR      S03FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 - Menu Detail Screen
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0000000'     *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Check option is allowed
     C* BAT = 'I'
     C                   MOVE      'I'           BAT
     C* USER = *userid
     C                   MOVE      *BLANKS       RN0002
     C                   MOVEL     USER          RN0002
     C* PGM = 'MNU010C'
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     'MNU010C'     RN0001
     C* ACT = %ctc(Mode)
     C*  Convert To Character
     C                   MOVE      *BLANK        ACT
     C                   MOVEL     MODE          ACT
     C* OK = ' '
     C                   MOVE      *BLANKS       OK
     C* CALL 'MNU040C',bat,user,pgm,act,ok
     C                   Z-ADD     1             CALLST
     C                   CALL      'MNU040C'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF ok = 'N'
     C     OK            IFEQ      'N'
     C* DSPERR *NONE,'MNU0006','MENUERR'
     C                   MOVEL     'MNU0006'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK002 = MBUSER
     C                   MOVE      WBUSER        SVK002
     C* SVK003 = MBMNUC
     C                   MOVE      XBMNUC        SVK003
     C* MBMNUC = ' '
     C                   MOVEL     *BLANKS       XBMNUC
     C* MBMNUD = ' '
     C                   MOVEL     *BLANKS       XBMNUD
     C* MBSTRT = ' '
     C                   MOVE      *BLANKS       XBSTRT
     C* MBUSER = SVK002
     C                   MOVE      SVK002        WBUSER
     C* MBMNUC = SVK003
     C                   MOVE      SVK003        XBMNUC
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR MENU.MNUHED.MBMNUC,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XBMNUC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.MENU,F.MNUHED,*lock,*eq,SVK002,SVK003
     C*
     C                   EXSR      S019
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUHED)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK04         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUHED)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR MENU.MNUHED.MBMNUD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XBMNUD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.MENU,F.MNUHED,*lock,*eq,SVK002,SVK003
     C*
     C                   EXSR      S019
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUHED)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK04         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUHED)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.MENU,F.MNUHED,*eq,SVK002,SVK003
     C*
     C                   EXSR      S020
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUHED)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* MBMNUC = ' '
     C                   MOVEL     *BLANKS       XBMNUC
     C* MBMNUD = ' '
     C                   MOVEL     *BLANKS       XBMNUD
     C* MBUSER = :0002
     C                   MOVE      XAUSER        WBUSER
     C* SVK002 = :0002
     C                   MOVE      XAUSER        SVK002
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* IF mode = 6
     C     MODE          IFEQ      6
     C* GRPATR key,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP002'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP001'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF mode = 2
     C     MODE          IFEQ      2
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP001'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   MOVEA     '0'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   MOVEA     '0'           *IN(7)
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
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.MENU,F.MNUHED
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   UNLOCK    MNUHED                               91      RLS LCK MNUHED
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform delete on function key 14
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.MENU,F.MNUHED,F.MNUOPT
     C*
     C                   EXSR      S021
     C* IF (%STS(D.MENU,F.MNUHED)=*YES)
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S004V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on function key 14
     C* IF mode <> 4
     C     MODE          IFNE      4
     C*                                                               *
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.MENU,F.MNUHED
     C*
     C                   EXSR      S022
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.MENU,F.MNUHED
     C*
     C                   EXSR      S023
     C* ** Set keys for first record to display.
     C* SVK002 = MBUSER
     C                   MOVE      WBUSER        SVK002
     C* SVK003 = MBMNUC
     C                   MOVE      XBMNUC        SVK003
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %STS(D.MENU,F.MNUHED)=*YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00499        ENDSR
     C/EJECT
     C*****************************************************************
     C* S005 - Options List Screen
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK006 = PS0501
     C                   MOVE      PS0501        SVK006
     C*                                                               *
     C* Set Keys to values from header file.
     C* MCUSER = MBUSER
     C                   MOVE      WBUSER        WCUSER
     C* MCMNUC = MBMNUC
     C                   MOVE      XBMNUC        WCMNUC
     C* SVK004 = MBUSER
     C                   MOVE      WBUSER        SVK004
     C* SVK005 = MBMNUC
     C                   MOVE      XBMNUC        SVK005
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.MENU,F.MNUOPT,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S024
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
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
     C                   WRITE     SCR005
     C* Turn off SFLDSP in case of empty subfile
     C     RRN03         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN03         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN03         DRN03
     C                   EXFMT     SCR005C1
     C     SFLRRN        IFGT      0
     C     DRN03         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN03
     C                   Z-ADD     SFLRRN        DRN03
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
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
     C                   GOTO      $00599
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
     C                   GOTO      $00599
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.MENU,F.MNUOPT,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S024
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* **  1. Check for any selected records.
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S05BKW
     C                   EXSR      S05BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* **  1. Check for selected records.
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S05BKW
     C                   EXSR      S05BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
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
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
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
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* *** Check for reposition
     C* IF PS0501<>' '
     C     PS0501        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK006 = PS0501
     C                   MOVE      PS0501        SVK006
     C* PS0501 = ' '
     C                   MOVEL     *BLANKS       PS0501
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.MENU,F.MNUOPT,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S024
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00599        ENDSR
     C/EJECT
     C*****************************************************************
     C* S006 - Options Detail Screen
     C*****************************************************************
     C     S006          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0'           *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Check option is allowed
     C* BAT = 'I'
     C                   MOVE      'I'           BAT
     C* USER = *userid
     C                   MOVE      *BLANKS       RN0002
     C                   MOVEL     USER          RN0002
     C* PGM = 'MNU010C'
     C                   MOVE      *BLANKS       RN0001
     C                   MOVEL     'MNU010C'     RN0001
     C* ACT = %ctc(Mode)
     C*  Convert To Character
     C                   MOVE      *BLANK        ACT
     C                   MOVEL     MODE          ACT
     C* OK = ' '
     C                   MOVE      *BLANKS       OK
     C* CALL 'MNU040C',bat,user,pgm,act,ok
     C                   Z-ADD     1             CALLST
     C                   CALL      'MNU040C'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF ok = 'N'
     C     OK            IFEQ      'N'
     C* DSPERR *NONE,'MNU0006','MENUERR'
     C                   MOVEL     'MNU0006'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK004 = MCUSER
     C                   MOVE      WCUSER        SVK004
     C* SVK005 = MCMNUC
     C                   MOVE      WCMNUC        SVK005
     C* SVK006 = MCOPTC
     C                   MOVE      XCOPTC        SVK006
     C* MCOPTC = ' '
     C                   MOVEL     *BLANKS       XCOPTC
     C* MCOPTD = ' '
     C                   MOVEL     *BLANKS       XCOPTD
     C* MCPGMN = ' '
     C                   MOVEL     *BLANKS       XCPGMN
     C* MCSPGM = ' '
     C                   MOVEL     *BLANKS       XCSPGM
     C* MCPGMT = ' '
     C                   MOVE      *BLANKS       XCPGMT
     C* MCPRM1 = ' '
     C                   MOVEL     *BLANKS       XCPRM1
     C* MCPRM2 = ' '
     C                   MOVEL     *BLANKS       XCPRM2
     C* MCPRM3 = ' '
     C                   MOVEL     *BLANKS       XCPRM3
     C* MCPRM4 = ' '
     C                   MOVEL     *BLANKS       XCPRM4
     C* MCACTR = ' '
     C                   MOVE      *BLANKS       WCACTR
     C* MCACTD = ' '
     C                   MOVE      *BLANKS       WCACTD
     C* MCACTA = ' '
     C                   MOVE      *BLANKS       WCACTA
     C* MCUSER = SVK004
     C                   MOVE      SVK004        WCUSER
     C* MCMNUC = SVK005
     C                   MOVE      SVK005        WCMNUC
     C* MCOPTC = SVK006
     C                   MOVE      SVK006        XCOPTC
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* GRPATR key,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'GROUP004'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.MENU,F.MNUOPT,*lock,*eq,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S025
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUOPT)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK05         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUOPT)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* GRPATR data,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'GROUP003'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.MENU,F.MNUOPT,*lock,*eq,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S025
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.MENU,F.MNUOPT)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK05         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUOPT)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.MENU,F.MNUOPT,*eq,SVK004,SVK005,SVK006
     C*
     C                   EXSR      S026
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.MENU,F.MNUOPT)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* MCOPTC = ' '
     C                   MOVEL     *BLANKS       XCOPTC
     C* MCOPTD = ' '
     C                   MOVEL     *BLANKS       XCOPTD
     C* MCPGMN = ' '
     C                   MOVEL     *BLANKS       XCPGMN
     C* MCSPGM = ' '
     C                   MOVEL     *BLANKS       XCSPGM
     C* MCPGMT = ' '
     C                   MOVE      *BLANKS       XCPGMT
     C* MCPRM1 = ' '
     C                   MOVEL     *BLANKS       XCPRM1
     C* MCPRM2 = ' '
     C                   MOVEL     *BLANKS       XCPRM2
     C* MCPRM3 = ' '
     C                   MOVEL     *BLANKS       XCPRM3
     C* MCPRM4 = ' '
     C                   MOVEL     *BLANKS       XCPRM4
     C* MCACTR = ' '
     C                   MOVE      *BLANKS       WCACTR
     C* MCACTD = ' '
     C                   MOVE      *BLANKS       WCACTD
     C* MCACTA = ' '
     C                   MOVE      *BLANKS       WCACTA
     C* MCUSER = MBUSER
     C                   MOVE      WBUSER        WCUSER
     C* MCMNUC = MBMNUC
     C                   MOVE      XBMNUC        WCMNUC
     C* SVK004 = MBUSER
     C                   MOVE      WBUSER        SVK004
     C* SVK005 = MBMNUC
     C                   MOVE      XBMNUC        SVK005
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* IF mode = 6
     C     MODE          IFEQ      6
     C* GRPATR key,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP004'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP003'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF mode = 2
     C     MODE          IFEQ      2
     C* GRPATR data,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP003'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   EXFMT     SCR006
     C                   MOVEA     '00000'       *IN(5)
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
     C* Prompt
     C*
     C     *INKD         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ** Check for any prompt fields.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* IF mode = 2 | mode = 6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C*                                                               *
     C* IF %clf(MENU.MNUOPT.MCPGMN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XCPGMN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F10001 = ' '
     C                   MOVEL     *BLANKS       F10001
     C* F10002 = ' '
     C                   MOVEL     *BLANKS       F10002
     C* EXSCR SC0010
     C                   ADD       1             SP
     C                   MOVEL     'SC0006  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   EXSR      S009
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F10001<>' '
     C     F10001        IFNE      *BLANKS
     C* MCPGMN = F10001
     C                   MOVE      F10001        XCPGMN
     C* MCSPGM = f10002
     C                   MOVE      F10002        XCSPGM
     C* MCOPTD = ' '
     C                   MOVEL     *BLANKS       XCOPTD
     C* GETREC D.MENU,F.MNUpgm,*eq,MCPGMN,MCSPGM
     C*
     C                   EXSR      S027
     C* MCPRM1 = mpprm1
     C                   MOVE      WPPRM1        XCPRM1
     C* MCPRM2 = mpprm2
     C                   MOVE      WPPRM2        XCPRM2
     C* MCPRM3 = mpprm3
     C                   MOVE      WPPRM3        XCPRM3
     C* MCPRM4 = mpprm4
     C                   MOVE      WPPRM4        XCPRM4
     C* MCPGMT = mppgmt
     C                   MOVE      WPPGMT        XCPGMT
     C* MCOPTD = mppgmd
     C                   MOVE      WPPGMD        XCOPTD
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If no fields processed for prompt
     C* ** (UPDFLG=0), display error.
     C* IF UPDFLG=0
     C     UPDFLG        IFEQ      *ZERO
     C* DSPERR *none,'Invalid cursor loc for prompt'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.MENU,F.MNUOPT
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   UNLOCK    MNUOPT                               91      RLS LCK MNUOPT
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform delete on function key 14
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.MENU,F.MNUOPT
     C*
     C                   EXSR      S028
     C* IF %STS(D.MENU,F.MNUOPT)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S006V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on function key 14
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* IF mcpgmt = 'R'
     C     XCPGMT        IFEQ      'R'
     C* GETREC D.MENU,F.MNUPGM,*EQ,MCPGMN,MCSPGM
     C*
     C                   EXSR      S027
     C* IF %sts(d.menu,f.mnupgm) = *No
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
     C* DSPERR MCPGMN,'MNU0011','MENUERR'
     C                   MOVEL     'MNU0011'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XCPGMN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* DSPERR MCSPGM,'MNU0011','MENUERR'
     C                   MOVEL     'MNU0011'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XCSPGM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Revise
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.MENU,F.MNUOPT
     C*
     C                   EXSR      S029
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.MENU,F.MNUOPT
     C*
     C                   EXSR      S030
     C* ** Set keys for first record to display.
     C* SVK004 = MCUSER
     C                   MOVE      WCUSER        SVK004
     C* SVK005 = MCMNUC
     C                   MOVE      WCMNUC        SVK005
     C* SVK006 = MCOPTC
     C                   MOVE      XCOPTC        SVK006
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %STS(D.MENU,F.MNUOPT)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00699        ENDSR
     C/EJECT
     C*****************************************************************
     C* S007 - Help Details
     C*****************************************************************
     C     S007          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C* SVK009 = PS0701
     C                   Z-ADD     PS0701        SVK009
     C*                                                               *
     C* DELETE = 'N'
     C                   MOVE      'N'           DELETE
     C* ENTER = 'Y'
     C                   MOVE      'Y'           ENTER
     C* F18 = 'F18=Insert'
     C                   MOVE      *BLANKS       F18
     C                   MOVEL     C0005         F18
     C* Set Keys to values from header file.
     C* MDMNUC = MCMNUC
     C                   MOVE      WCMNUC        XDMNUC
     C* MDOPTC = MCOPTC
     C                   MOVE      XCOPTC        XDOPTC
     C* SVK007 = MCMNUC
     C                   MOVE      WCMNUC        SVK007
     C* SVK008 = MCOPTC
     C                   MOVE      XCOPTC        SVK008
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S031
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
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
     C                   WRITE     SCR007
     C* Turn off SFLDSP in case of empty subfile
     C     RRN04         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN04         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN04         DRN04
     C                   EXFMT     SCR007C1
     C     SFLRRN        IFGT      0
     C     DRN04         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN04
     C                   Z-ADD     SFLRRN        DRN04
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
     C                   GOTO      $00799
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen
     C* *** on function key 12
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* DELETE = 'N'
     C                   MOVE      'N'           DELETE
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,svk009
     C*
     C                   EXSR      S031
     C* EXSUBR s07fwd
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* EXTSCR                                                        *
     C                   GOTO      $00799
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Allow Delt
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Allow delete on Function key 14
     C* IF delete <> 'Y'
     C     DELETE        IFNE      'Y'
     C* DELETE = 'Y'
     C                   MOVE      'Y'           DELETE
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,svk009
     C*
     C                   EXSR      S031
     C* EXSUBR s07fwd
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* END                                                           *
     C                   END
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Add/Insert
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Toggle between insert and add mode
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* DELETE = 'N'
     C                   MOVE      'N'           DELETE
     C* END                                                           *
     C                   END
     C* IF enter = 'Y'
     C     ENTER         IFEQ      'Y'
     C* ENTER = 'N'
     C                   MOVE      'N'           ENTER
     C* F18 = 'F18=Add   '
     C                   MOVE      *BLANKS       F18
     C                   MOVEL     C0006         F18
     C* ELSE                                                          *
     C                   ELSE
     C* ENTER = 'Y'
     C                   MOVE      'Y'           ENTER
     C* F18 = 'F18=Insert'
     C                   MOVE      *BLANKS       F18
     C                   MOVEL     C0005         F18
     C* END                                                           *
     C                   END
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,svk009
     C*
     C                   EXSR      S031
     C* EXSUBR s07fwd
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* **  1. Check for any selected records.
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S07BKW
     C                   EXSR      S07BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* **  1. Check for selected records.
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* **  2. Fill panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*     1. Check for any selected records.
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S07BKW
     C                   EXSR      S07BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
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
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0701<>0
     C     PS0701        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK009 = PS0701
     C                   Z-ADD     PS0701        SVK009
     C* PS0701 = 0
     C                   Z-ADD     *ZERO         PS0701
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S031
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C                   END
     C                   END
     C                   END
     C     $00799        ENDSR
     C/EJECT
     C*****************************************************************
     C* S008 - List of Users
     C*****************************************************************
     C     S008          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST08 = ' '
     C                   MOVEL     *BLANKS       FST08
     C* LST08 = ' '
     C                   MOVEL     *BLANKS       LST08
     C* SVK08 = ' '
     C                   MOVEL     *BLANKS       SVK08
     C* ** set prompt file keys to values
     C* ** from header file.
     C* S08CNT = 005
     C                   Z-ADD     005           S08CNT
     C* ** Array forward read.
     C* EXSUBR S08AFR
     C                   EXSR      S08AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
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
     C                   EXFMT     SCR008
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
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00899
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* SVK08 = FST08
     C                   MOVE      FST08         SVK08
     C* ** Array Backwards read.
     C* EXSUBR S08ABR
     C                   EXSR      S08ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* SVK08 = LST08
     C                   MOVE      LST08         SVK08
     C* ** Array Forward read.
     C* EXSUBR S08AFR
     C                   EXSR      S08AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* SVK08 = FST08
     C                   MOVE      FST08         SVK08
     C* ** Array Backwards read.
     C* EXSUBR S08ABR
     C                   EXSR      S08ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* SVK08 = LST08
     C                   MOVE      LST08         SVK08
     C* ** Array Forward Read.
     C* EXSUBR S08AFR
     C                   EXSR      S08AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I08 = 1
     C                   Z-ADD     1             Z9
     C* DOW (I08<=C08)&(T01(I08)<>1)
     C     Z9            DOWLE     Z4
     C     T01(Z9)       ANDNE     1
     C* I08 = I08+1
     C     Z9            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z9
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I08<=C08)&(T01(I08)=1)
     C     Z9            IFLE      Z4
     C     T01(Z9)       ANDEQ     1
     C* F02001 = B01(I08)
     C                   MOVE      B01(Z9)       F02001
     C* EXTSCR                                                        *
     C                   GOTO      $00899
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00899        ENDSR
     C/EJECT
     C*****************************************************************
     C* S009 - List of Programs
     C*****************************************************************
     C     S009          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST10 = ' '
     C                   MOVEL     *BLANKS       FST10
     C* LST10 = ' '
     C                   MOVEL     *BLANKS       LST10
     C* SVK10 = ' '
     C                   MOVEL     *BLANKS       SVK10
     C* FST11 = ' '
     C                   MOVEL     *BLANKS       FST11
     C* LST11 = ' '
     C                   MOVEL     *BLANKS       LST11
     C* SVK11 = ' '
     C                   MOVEL     *BLANKS       SVK11
     C* ** set prompt file keys to values
     C* ** from header file.
     C* S10CNT = 005
     C                   Z-ADD     005           S10CNT
     C* ** Array forward read.
     C* EXSUBR S10AFR
     C                   EXSR      S10AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
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
     C                   EXFMT     SCR009
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
     C* Cancel
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00999
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backward on function key 7
     C* SVK10 = FST10
     C                   MOVE      FST10         SVK10
     C* SVK11 = FST11
     C                   MOVE      FST11         SVK11
     C* ** Array Backwards read.
     C* EXSUBR S10ABR
     C                   EXSR      S10ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forward on function key 8
     C* SVK10 = LST10
     C                   MOVE      LST10         SVK10
     C* SVK11 = LST11
     C                   MOVE      LST11         SVK11
     C* ** Array Forward read.
     C* EXSUBR S10AFR
     C                   EXSR      S10AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C* SVK10 = FST10
     C                   MOVE      FST10         SVK10
     C* SVK11 = FST11
     C                   MOVE      FST11         SVK11
     C* ** Array Backwards read.
     C* EXSUBR S10ABR
     C                   EXSR      S10ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C* SVK10 = LST10
     C                   MOVE      LST10         SVK10
     C* SVK11 = LST11
     C                   MOVE      LST11         SVK11
     C* ** Array Forward Read.
     C* EXSUBR S10AFR
     C                   EXSR      S10AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I10 = 1
     C                   Z-ADD     1             Y1
     C* DOW (I10<=C10)&(T04(I10)<>1)
     C     Y1            DOWLE     Z5
     C     T04(Y1)       ANDNE     1
     C* I10 = I10+1
     C     Y1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I10<=C10)&(T04(I10)=1)
     C     Y1            IFLE      Z5
     C     T04(Y1)       ANDEQ     1
     C* F10001 = B02(I10)
     C                   MOVE      B02(Y1)       F10001
     C* F10002 = B03(I10)
     C                   MOVE      B03(Y1)       F10002
     C* EXTSCR                                                        *
     C                   GOTO      $00999
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Position To
     C* IF (fl0006 <> *blanks) | (fl0007 <> *blanks)
     C     FL0006        IFNE      *BLANKS
     C     FL0007        ORNE      *BLANKS
     C* SVK10 = fl0006
     C                   MOVE      FL0006        SVK10
     C* SVK11 = fl0007
     C                   MOVE      FL0007        SVK11
     C* FL0006 = *blanks
     C                   MOVEL     *BLANKS       FL0006
     C* FL0007 = *blanks
     C                   MOVEL     *BLANKS       FL0007
     C* EXSUBR s10afr
     C                   EXSR      S10AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00999        ENDSR
     C/EJECT
     C*****************************************************************
     C* S010 - Copy Users
     C*****************************************************************
     C     S010          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00101'       *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* ** Default Copy Flags to Yes
     C* CPYMNU = 'Y'
     C                   MOVE      'Y'           CPYMNU
     C* CPYOPT = 'Y'
     C                   MOVE      'Y'           CPYOPT
     C*                                                               *
     C* FL0005 = MAUSER
     C                   MOVE      XAUSER        FL0005
     C* TOUSER = ' '
     C                   MOVEL     *BLANKS       TOUSER
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
     C                   EXFMT     SCR010
     C                   MOVEA     '00101'       *IN(1)
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
     C* Prompt
     C*
     C     *INKD         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ** Check for any prompt fields.
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
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C*                                                               *
     C* IF %CLF(TOUSER)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'TOUSER  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* EXSCR SC0008
     C                   ADD       1             SP
     C                   MOVEL     'SC0009  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN06
     C                   EXSR      S008
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C                   MOVEA     IN06          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* TOUSER = F02001
     C                   MOVE      F02001        TOUSER
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* POSCUR wkrow,wkcol
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C*                                                               *
     C* ** If no fields processed for prompt
     C* ** (UPDFLG=0), display error.
     C* IF UPDFLG=0
     C     UPDFLG        IFEQ      *ZERO
     C* DSPERR *none,'Invalid cursor loc for prompt'
     C                   MOVEL     C0004         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
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
     C                   GOTO      $01099
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S010V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Display next detail panel on post-enter
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* IF fl0005 = touser
     C     FL0005        IFEQ      TOUSER
     C* DSPERR touser,'mnu0007','menuerr'
     C                   MOVEL     'mnu0007'     MSGID
     C                   MOVEL     'menuerr'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'TOUSER  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If No Errors Copy Details
     C* IF error <> 'Y'
     C     ERROR         IFNE      'Y'
     C* INTER = 'I'
     C                   MOVE      'I'           INTER
     C* CALL 'MNU030C',INTER,FL0005,CPYMNU,CPYOPT,touser,YNSC9
     C                   Z-ADD     1             CALLST
     C                   CALL      'MNU030C'     P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* *** exit screen if copy OK
     C* IF YNSC9='Y'
     C     YNSC9         IFEQ      'Y'
     C* POSCUR 0,0
     C                   Z-ADD     *ZERO         LIN
     C                   Z-ADD     *ZERO         POS
     C                   MOVE      '1'           *IN79
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR *NONE,'MNU0009','MENUERR'
     C                   MOVEL     'MNU0009'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01099        ENDSR
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
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0003'
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   WRITE     SCR003C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0004'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0005'
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR005
     C                   WRITE     SCR005C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0006'
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR006
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0007'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR007
     C                   WRITE     SCR007C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0008'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR008
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0010'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR009
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0009'
     C                   MOVEA     IN06          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR010
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
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
     C* LEVTXT - Set Default Text
     C*****************************************************************
     C     LEVTXT        BEGSR
     C*
     C*                                                               *
     C* Move Description over . . .
     C* ARLEV = '. . . . . . . . .'
     C                   MOVE      *BLANKS       A01
     C                   MOVEA     C0007         A01
     C* X = 1
     C                   Z-ADD     1             X
     C* DOW x<=15 *and ar15(x)<>*blanks
     C     X             DOWLE     15
     C     A02(X)        ANDNE     *BLANKS
     C* ARLEV(X) = ar15(X)
     C                   MOVE      *BLANKS       A01(X)
     C                   MOVE      A02(X)        A01(X)
     C* X = x + 1
     C     X             ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        X
     C* END                                                           *
     C                   END
     C* ARLEV(X) = ' '
     C                   MOVE      *BLANKS       A01(X)
     C*
     C     $LEVTX        ENDSR
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
     C                   MOVEA     *BLANKS       A03
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUUSR,*PV
     C*
     C                   EXSR      S032
     C*
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.MNUUSR    MNUU
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XAUSER
     C                   MOVEL     *BLANKS       XASURN
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   READ(N)   MNUUSR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HAUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = :0002
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      XAUSER        A03(Z1)
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
     C                   MOVEL     *BLANKS       XAUSER
     C                   MOVEL     *BLANKS       XASURN
     C                   MOVEL     *BLANKS       WK0001
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
     C                   EXSR      S034                                         CHK EOF
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S01EDT - SCRN SUB
     C*****************************************************************
     C     S01EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I01 = 0
     C                   Z-ADD     *ZERO         Z6
     C* DOBLK D.MENU
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
     C                   MOVEA     '0'           *IN(5)
     C* I01 = I01+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=2)|(FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* :0002 = A001(I01)
     C                   MOVE      A03(Z6)       XAUSER
     C*                                                               *
     C* Display error if user is used as a group by another user
     C* DELERR = 'N'
     C                   MOVE      'N'           DELERR
     C* IF mode = 4
     C     MODE          IFEQ      4
     C* GETREC d.mnuusr2,f.mnuusr2,*eq,menu.mnuusr.mauser
     C*
     C                   EXSR      S035
     C* IF %sts(d.mnuusr2,f.mnuusr2) = *yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* DSPERR FL0001,'MNU0013','MENUERR',*LIBL
     C                   MOVEL     'MNU0013'     MSGID
     C                   MOVEL     'MENUERR'     MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* DELERR = 'Y'
     C                   MOVE      'Y'           DELERR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Get record and any secondary records.
     C* IF delerr = 'N'
     C     DELERR        IFEQ      'N'
     C* GETREC D.MENU,F.MNUUSR,F.MNUUSR1,*EQ,:0002
     C*
     C                   EXSR      S036
     C* ** Display Screen.
     C* EXSCR SC0002
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* IF FL0001=06
     C     FL0001        IFEQ      06
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* :0002 = A001(I01)
     C                   MOVE      A03(Z6)       XAUSER
     C* SVK001 = A001(I01)
     C                   MOVE      A03(Z6)       SVK001
     C* GETREC D.MENU,F.MNUUSR,*EQ,:0002
     C*
     C                   EXSR      S037
     C* EXSCR SC0003
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
     C* *** copy
     C* IF fl0001 =3
     C     FL0001        IFEQ      3
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* MAUSER = A001(I01)
     C                   MOVE      A03(Z6)       XAUSER
     C* YNSC9 = 'N'
     C                   MOVE      'N'           YNSC9
     C* EXSCR SC0009
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S010
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
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
     C                   MOVEL     C0008         MSGDTA
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
     C                   MOVEA     '0'           *IN(5)
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
     C                   MOVEA     *BLANKS       A03
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUUSR,*NX
     C*
     C*
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.MNUUSR    MNUU
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XAUSER
     C                   MOVEL     *BLANKS       XASURN
     C                   MOVEL     *BLANKS       WK0001
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   READ(N)   MNUUSR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HAUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = :0002
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      XAUSER        A03(Z1)
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
     C                   MOVEL     *BLANKS       XAUSER
     C                   MOVEL     *BLANKS       XASURN
     C                   MOVEL     *BLANKS       WK0001
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
     C                   EXSR      S034                                         RESET FP
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
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A04
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A05
     C* FLDATR fl0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUHED,*PV,SVK002
     C*
     C                   EXSR      S038
     C*
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     SVK002        KBUS01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR003S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR003C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD04        DOUNE     'Y'                                          RD.SW.MNUHED    MNUO
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       XBMNUD
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0007         READE(N)  MNUHED                               9190
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
     C*
     C* FLDATR fl0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* A002(C03) = MBUSER
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WBUSER        A04(Z2)
     C* A003(C03) = MBMNUC
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVE      XBMNUC        A05(Z2)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       XBMNUD
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR003S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S040                                         CHK EOF
     C*
     C     $S03BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03EDT - SCRN SUB
     C*****************************************************************
     C     S03EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I03 = 0
     C                   Z-ADD     *ZERO         Z7
     C* DOBLK D.MENU
     C*
     C                   Z-ADD     RRN02         SRN02                          Save RRN
     C                   Z-ADD     1             RRN02                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS02
     C     SRN02         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR003S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* I03 = I03+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0002=2)|(FL0002=4)|(FL0002=5)
     C     FL0002        IFEQ      2
     C     FL0002        OREQ      4
     C     FL0002        OREQ      5
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* ** set keys from hidden key arrays.
     C* MBUSER = A002(I03)
     C                   MOVE      A04(Z7)       WBUSER
     C* MBMNUC = A003(I03)
     C                   MOVE      A05(Z7)       XBMNUC
     C* ** Get record and any secondary records.
     C* GETREC D.MENU,F.MNUHED,*EQ,MBUSER,MBMNUC
     C*
     C                   EXSR      S041
     C* ** Display Screen.
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR003S1                             90
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03ED
     C                   END
     C     RRN02         CHAIN     SCR003S1                           9091
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Otions
     C* IF FL0002=06
     C     FL0002        IFEQ      06
     C* MBUSER = A002(I03)
     C                   MOVE      A04(Z7)       WBUSER
     C* MBMNUC = A003(I03)
     C                   MOVE      A05(Z7)       XBMNUC
     C* SVK003 = A003(I03)
     C                   MOVE      A05(Z7)       SVK003
     C* GETREC D.MENU,F.MNUHED,*EQ,MBUSER,MBMNUC
     C*
     C                   EXSR      S041
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR003S1                             90
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03ED
     C                   END
     C     RRN02         CHAIN     SCR003S1                           9091
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Help
     C* IF FL0002=07
     C     FL0002        IFEQ      07
     C* MBUSER = A002(I03)
     C                   MOVE      A04(Z7)       WBUSER
     C* MBMNUC = A003(I03)
     C                   MOVE      A05(Z7)       XBMNUC
     C* SVK003 = A003(I03)
     C                   MOVE      A05(Z7)       SVK003
     C* GETREC D.MENU,F.MNUHED,*EQ,MBUSER,MBMNUC
     C*
     C                   EXSR      S041
     C* MCMNUC = mbmnuc
     C                   MOVE      XBMNUC        WCMNUC
     C* MCOPTC = *blank
     C                   MOVE      *BLANKS       XCOPTC
     C                   MOVEL     *BLANK        XCOPTC
     C* EXSCR SC0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR003S1                             90
     C                   EXSR      S007
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S03ED
     C                   END
     C     RRN02         CHAIN     SCR003S1                           9091
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0002<>0)&(UPDFLG=0)
     C     FL0002        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0002,'Invalid action choice'
     C                   MOVEL     C0008         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C*
     C*
     C*
     C     $S03ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03FWD - SCRN SUB
     C*****************************************************************
     C     S03FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A04
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A05
     C* FLDATR fl0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUHED,*NE,SVK002
     C*
     C*
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     SVK002        KBUS01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR003S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR003C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN02
     C*
     C                   Z-ADD     1             XRN02                          Init Next RRN
     C                   Z-ADD     XRN02         SRN02
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS02
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD04        DOUNE     'Y'                                          RD.SW.MNUHED    MNUO
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       XBMNUD
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0007         READE(N)  MNUHED                               9190
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
     C* FLDATR fl0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* A002(C03) = MBUSER
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WBUSER        A04(Z2)
     C* A003(C03) = MBMNUC
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVE      XBMNUC        A05(Z2)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XBMNUC
     C                   MOVEL     *BLANKS       XBMNUD
     C                   MOVEA     INS02         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR003S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR003S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR003S1                             90
     C                   MOVEA     INS02         *IN
     C                   END
     C     RRN02         IFGT      SRN02
     C                   Z-ADD     SRN02         RRN02
     C                   END
     C                   EXSR      S040                                         RESET FP
     C* IF c03 = 0
     C     Z2            IFEQ      *ZERO
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
     C* S05BKW - SCRN SUB
     C*****************************************************************
     C     S05BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z3
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A06
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A07
     C* A006 = ' '
     C                   MOVEA     *BLANKS       A08
     C* FLDATR fl0003,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUOPT,*PV,SVK004,SVK005
     C*
     C                   EXSR      S042
     C*
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     SVK004        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     SVK005        KCMN02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR005S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR005C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN03
     C*
     C                   Z-ADD     1             XRN03                          Init Next RRN
     C                   Z-ADD     XRN03         SRN03
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS03
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD05        DOUNE     'Y'                                          RD.SW.MNUOPT    MNUP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0003
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       XCOPTD
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0009         READE(N)  MNUOPT                               9190
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
     C*
     C* FLDATR fl0003,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C* A004(C05) = MCUSER
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WCUSER        A06(Z3)
     C* A005(C05) = MCMNUC
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      WCMNUC        A07(Z3)
     C* A006(C05) = MCOPTC
     C                   MOVE      *BLANKS       A08(Z3)
     C                   MOVE      XCOPTC        A08(Z3)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN03
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR005S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN03         NXTRRN
     C                   Z-ADD     *ZEROS        FL0003
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       XCOPTD
     C                   MOVEA     INS03         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR005S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR005S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR005S1                             90
     C                   MOVEA     INS03         *IN
     C                   END
     C     RRN03         IFGT      SRN03
     C                   Z-ADD     SRN03         RRN03
     C                   END
     C                   EXSR      S044                                         CHK EOF
     C*
     C     $S05BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05EDT - SCRN SUB
     C*****************************************************************
     C     S05EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I05 = 0
     C                   Z-ADD     *ZERO         Z8
     C* DOBLK D.MENU
     C*
     C                   Z-ADD     RRN03         SRN03                          Save RRN
     C                   Z-ADD     1             RRN03                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS03
     C     SRN03         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR005S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* I05 = I05+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0003=2)|(FL0003=4)|(FL0003=5)
     C     FL0003        IFEQ      2
     C     FL0003        OREQ      4
     C     FL0003        OREQ      5
     C* MODE = FL0003
     C                   Z-ADD     FL0003        MODE
     C* ** set keys from hidden key arrays.
     C* MCUSER = A004(I05)
     C                   MOVE      A06(Z8)       WCUSER
     C* MCMNUC = A005(I05)
     C                   MOVE      A07(Z8)       WCMNUC
     C* MCOPTC = A006(I05)
     C                   MOVE      A08(Z8)       XCOPTC
     C* ** Get record and any secondary records.
     C* GETREC D.MENU,F.MNUOPT,*EQ,MCUSER,MCMNUC,MCOPTC
     C*
     C                   EXSR      S045
     C* ** Display Screen.
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   UPDATE    SCR005S1                             90
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05ED
     C                   END
     C     RRN03         CHAIN     SCR005S1                           9091
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* FL0003 = 0
     C                   Z-ADD     *ZERO         FL0003
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* IF FL0003=06
     C     FL0003        IFEQ      06
     C* MODE = FL0003
     C                   Z-ADD     FL0003        MODE
     C* MCUSER = A004(I05)
     C                   MOVE      A06(Z8)       WCUSER
     C* MCMNUC = A005(I05)
     C                   MOVE      A07(Z8)       WCMNUC
     C* MCOPTC = A006(I05)
     C                   MOVE      A08(Z8)       XCOPTC
     C* SVK006 = A006(I05)
     C                   MOVE      A08(Z8)       SVK006
     C* GETREC D.MENU,F.MNUOPT,*EQ,MCUSER,MCMNUC,MCOPTC
     C*
     C                   EXSR      S045
     C* EXSCR SC0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   UPDATE    SCR005S1                             90
     C                   EXSR      S007
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05ED
     C                   END
     C     RRN03         CHAIN     SCR005S1                           9091
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* FL0003 = 0
     C                   Z-ADD     *ZERO         FL0003
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0003<>0)&(UPDFLG=0)
     C     FL0003        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0003,'Invalid action choice'
     C                   MOVEL     C0008         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR005S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN03         RRN03
     C                   MOVEA     INS03         *IN
     C*
     C*
     C*
     C     $S05ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05FWD - SCRN SUB
     C*****************************************************************
     C     S05FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z3
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A06
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A07
     C* A006 = ' '
     C                   MOVEA     *BLANKS       A08
     C* FLDATR fl0003,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.MENU,F.MNUOPT,*NE,SVK004,SVK005
     C*
     C*
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     SVK004        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     SVK005        KCMN02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR005S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR005C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN03
     C*
     C                   Z-ADD     1             XRN03                          Init Next RRN
     C                   Z-ADD     XRN03         SRN03
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS03
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD05        DOUNE     'Y'                                          RD.SW.MNUOPT    MNUP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0003
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       XCOPTD
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0009         READE(N)  MNUOPT                               9190
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
     C* FLDATR fl0003,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C* A004(C05) = MCUSER
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WCUSER        A06(Z3)
     C* A005(C05) = MCMNUC
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      WCMNUC        A07(Z3)
     C* A006(C05) = MCOPTC
     C                   MOVE      *BLANKS       A08(Z3)
     C                   MOVE      XCOPTC        A08(Z3)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN03
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR005S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN03         NXTRRN
     C                   Z-ADD     *ZEROS        FL0003
     C                   MOVEL     *BLANKS       XCOPTC
     C                   MOVEL     *BLANKS       XCOPTD
     C                   MOVEA     INS03         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR005S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR005S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR005S1                             90
     C                   MOVEA     INS03         *IN
     C                   END
     C     RRN03         IFGT      SRN03
     C                   Z-ADD     SRN03         RRN03
     C                   END
     C                   EXSR      S044                                         RESET FP
     C* IF c05 = 0
     C     Z3            IFEQ      *ZERO
     C* EXSUBR s05bkw
     C                   EXSR      S05BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S05FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07BKW - SCRN SUB
     C*****************************************************************
     C     S07BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C07 = 0
     C                   Z-ADD     *ZERO         C07
     C* GRPATR grpdel,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'GRPDEL  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0004,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdseqn,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* FLDATR mdseqn,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* GRPATR grpdel,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'GRPDEL  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF enter = 'Y'
     C     ENTER         IFEQ      'Y'
     C* FLDATR mdseqn,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR mdseqn,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* GETBLK D.MENU,F.MNUHLP,*PV,SVK007,SVK008,*changed
     C*
     C                   EXSR      S046
     C*
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK007        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK008        KDOP02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     8             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR007S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR007C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1100'        *IN(63)                        DSP,DSPCTL
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD07        DOUNE     'Y'                                          RD.SW.MNUHLP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XDOPTC
     C                   MOVEL     *BLANKS       XDMNUC
     C                   Z-ADD     *ZEROS        FL0004
     C                   Z-ADD     *ZEROS        XDSEQN
     C                   MOVEL     *BLANKS       XDTEXT
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     K0011         READE(N)  MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC07                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HDMNUC                         Menu
     C                   MOVEL     *BLANK        HDOPTC                         Option
     C                   Z-ADD     *ZERO         HDSEQN                         Sequence Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   END
     C*
     C     SWRD07        IFEQ      'Y'                                          RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* FLDATR fl0004,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0004,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF c07 = 0
     C     C07           IFEQ      *ZERO
     C* SVK009 = mdseqn
     C                   Z-ADD     XDSEQN        SVK009
     C* END                                                           *
     C                   END
     C* C07 = 1
     C                   Z-ADD     1             C07
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN04
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR007S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN04         NXTRRN
     C                   MOVEL     *BLANKS       XDOPTC
     C                   MOVEL     *BLANKS       XDMNUC
     C                   Z-ADD     *ZEROS        FL0004
     C                   Z-ADD     *ZEROS        XDSEQN
     C                   MOVEL     *BLANKS       XDTEXT
     C                   MOVEA     INS04         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR007S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR007S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR007S1                             90
     C                   MOVEA     INS04         *IN
     C                   END
     C     RRN04         IFGT      SRN04
     C                   Z-ADD     SRN04         RRN04
     C                   END
     C                   EXSR      S048                                         CHK EOF
     C*
     C     $S07BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07EDT - SCRN SUB
     C*****************************************************************
     C     S07EDT        BEGSR
     C*
     C* **   Process Maintenance List Panel (ML)
     C* **   1. Check for any selected records,
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* DOBLK D.MENU
     C*
     C                   Z-ADD     RRN04         SRN04                          Save RRN
     C                   Z-ADD     1             RRN04                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS04
     C     SRN04         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR007S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C*                                                               *
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* IF FL0004=4
     C     FL0004        IFEQ      4
     C* DELETE D.MENU,F.MNUHLP
     C*
     C                   EXSR      S049
     C* FL0004 = 0
     C                   Z-ADD     *ZERO         FL0004
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ELSE  ; delete = 'N'
     C                   ELSE
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* SETLL D.MENU,F.MNUHLP,mdmnuc,mdoptc,mdseqn
     C*
     C                   EXSR      S050
     C* IF %sts(D.menu,f.mnuhlp)=*yes
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C* UPDATE D.menu,F.mnuhlp
     C*
     C                   EXSR      S051
     C* ELSE                                                          *
     C                   ELSE
     C* WKSEQN = mdseqn
     C                   Z-ADD     XDSEQN        WKSEQN
     C* MDMNUC = mcmnuc
     C                   MOVE      WCMNUC        XDMNUC
     C* MDOPTC = mcoptc
     C                   MOVE      XCOPTC        XDOPTC
     C* WRITE D.menu,f.mnuhlp
     C*
     C                   EXSR      S052
     C* If sequence number entered use it
     C* IF wkseqn <> 0
     C     WKSEQN        IFNE      *ZERO
     C* GETREC D.MENU,F.MNUHLP,*eq,mdmnuc,mdoptc,mdseqn
     C*
     C                   EXSR      S053
     C* MDSEQN = wkseqn
     C                   Z-ADD     WKSEQN        XDSEQN
     C* UPDATE D.menu,f.mnuhlp
     C*
     C                   EXSR      S051
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0004<>0)&(UPDFLG=0)
     C     FL0004        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0004,'Invalid action choice'
     C                   MOVEL     C0008         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR007S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN04         RRN04
     C                   MOVEA     INS04         *IN
     C*
     C*
     C*
     C     $S07ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07FWD - SCRN SUB
     C*****************************************************************
     C     S07FWD        BEGSR
     C*
     C* ***  Scroll information forwards
     C*                                                               *
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* TAG :start
     C     START         TAG
     C* C07 = 0
     C                   Z-ADD     *ZERO         C07
     C* GRPATR grpdel,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'GRPDEL  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0004,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdseqn,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* FLDATR mdseqn,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* GRPATR grpdel,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'GRPDEL  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR mdtext,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XDTEXT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* IF enter = 'Y'
     C     ENTER         IFEQ      'Y'
     C* FLDATR mdseqn,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR mdseqn,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XDSEQN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* GETBLK D.MENU,F.MNUHLP,*ne,SVK007,SVK008,*changed
     C*
     C*
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK007        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK008        KDOP02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     8             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR007S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR007C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1100'        *IN(63)                        DSP,DSPCTL
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD07        DOUNE     'Y'                                          RD.SW.MNUHLP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XDOPTC
     C                   MOVEL     *BLANKS       XDMNUC
     C                   Z-ADD     *ZEROS        FL0004
     C                   Z-ADD     *ZEROS        XDSEQN
     C                   MOVEL     *BLANKS       XDTEXT
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     K0011         READE(N)  MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC07                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HDMNUC                         Menu
     C                   MOVEL     *BLANK        HDOPTC                         Option
     C                   Z-ADD     *ZERO         HDSEQN                         Sequence Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   END
     C*
     C     SWRD07        IFEQ      'Y'                                          RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* IF delete = 'Y'
     C     DELETE        IFEQ      'Y'
     C* FLDATR fl0004,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0004,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF c07 = 0
     C     C07           IFEQ      *ZERO
     C* SVK009 = mdseqn
     C                   Z-ADD     XDSEQN        SVK009
     C* END                                                           *
     C                   END
     C* C07 = c07 + 1
     C     C07           ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        C07
     C* WKSEQN = mdseqn
     C                   Z-ADD     XDSEQN        WKSEQN
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN04
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR007S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN04         NXTRRN
     C                   MOVEL     *BLANKS       XDOPTC
     C                   MOVEL     *BLANKS       XDMNUC
     C                   Z-ADD     *ZEROS        FL0004
     C                   Z-ADD     *ZEROS        XDSEQN
     C                   MOVEL     *BLANKS       XDTEXT
     C                   MOVEA     INS04         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR007S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR007S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR007S1                             90
     C                   MOVEA     INS04         *IN
     C                   END
     C     RRN04         IFGT      SRN04
     C                   Z-ADD     SRN04         RRN04
     C                   END
     C                   EXSR      S048                                         RESET FP
     C* *** Scroll information forward
     C*                                                               *
     C* IF C07 = 0 & first = 'Y'
     C     C07           IFEQ      *ZERO
     C     FIRST         ANDEQ     'Y'
     C* SETLL D.MENU,F.MNUHLP,SVK007,SVK008,wkseqn
     C*
     C                   EXSR      S054
     C* FIRST = 'N'
     C                   MOVE      'N'           FIRST
     C* GOTO :start
     C                   GOTO      START
     C* END                                                           *
     C                   END
     C*
     C     $S07FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S08ABR - SCRN SUB
     C*****************************************************************
     C     S08ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** Set pointer to first record on screen.
     C* SETLL D.MENU,F.MNUUSR1,SVK08
     C*
     C                   EXSR      S055
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.MENU,F.MNUUSR1,*PV,
     C*
     C                   EXSR      S056
     C* DOW (C08<S08CNT)&%STS(D.MENU,F.MNUUSR1)=*YES
     C     Z4            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     RN0006        IFEQ      XYES
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0006        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z4            ADD       1             RN0006
     C                   Z-ADD     RN0006        Z4
     C* GETREC D.MENU,F.MNUUSR1,*PV,
     C*
     C                   EXSR      S056
     C* END                                                           *
     C     Z4            IFLT      S08CNT
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0006        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C                   Z-ADD     RN0006        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S08ALD
     C                   EXSR      S08ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S08AB
     C                   END
     C*
     C     $S08AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S08AFR - SCRN SUB
     C*****************************************************************
     C     S08AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.MENU,F.MNUUSR1,SVK08
     C*
     C                   EXSR      S055
     C* ** Load arrays from this point.
     C* EXSUBR S08ALD
     C                   EXSR      S08ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S08AF
     C                   END
     C*
     C     $S08AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S08ALD - SCRN SUB
     C*****************************************************************
     C     S08ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T01 = 0
     C                   Z-ADD     *ZERO         T01
     C* B01 = ' '
     C                   MOVEA     *BLANKS       B01
     C* T02 = ' '
     C                   MOVEA     *BLANKS       T02
     C* T03 = ' '
     C                   MOVEA     *BLANKS       T03
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** protect select field
     C* DOW C08<S08CNT
     C     Z4            DOWLT     S08CNT
     C* C08 = C08+1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* FLDATR T01(C08),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z4
     C* GETREC D.MENU,F.MNUUSR1,*NX,
     C*
     C                   EXSR      S058
     C* DOW (C08<S08CNT)&%STS(D.MENU,F.MNUUSR1)=*YES
     C     Z4            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     RN0006        IFEQ      XYES
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0006        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z4            ADD       1             RN0006
     C                   Z-ADD     RN0006        Z4
     C* ** Unprotect select field.
     C* FLDATR T01(C08),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C08) = MENU.MNUUSR1.MAUSER
     C                   MOVE      *BLANKS       B01(Z4)
     C                   MOVE      WAUSER        B01(Z4)
     C* ** load screen array.
     C* T02(C08) = MENU.MNUUSR1.MAUSER
     C                   MOVE      *BLANKS       T02(Z4)
     C                   MOVE      WAUSER        T02(Z4)
     C* T03(C08) = MENU.MNUUSR1.MASURN
     C                   MOVE      *BLANKS       T03(Z4)
     C                   MOVE      WK0002        T03(Z4)
     C* ** Save first record on screen.
     C* IF C08=1
     C     Z4            IFEQ      1
     C* FST08 = B01(C08)
     C                   MOVE      B01(Z4)       FST08
     C* END                                                           *
     C                   END
     C* IF C08<S08CNT
     C     Z4            IFLT      S08CNT
     C* GETREC D.MENU,F.MNUUSR1,*NX,
     C*
     C                   EXSR      S058
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z4            IFLT      S08CNT
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0006        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C                   Z-ADD     RN0006        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C08>0
     C     Z4            IFGT      *ZERO
     C* LST08 = B01(C08)
     C                   MOVE      B01(Z4)       LST08
     C* END                                                           *
     C                   END
     C*
     C     $S08AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S10ABR - SCRN SUB
     C*****************************************************************
     C     S10ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z5
     C* ** Set pointer to first record on screen.
     C* SETLL D.MENU,F.MNUPGM,SVK10,svk11
     C*
     C                   EXSR      S060
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.MENU,F.MNUPGM,*PV,
     C*
     C                   EXSR      S061
     C* DOW (C10<S10CNT)&%STS(D.MENU,F.MNUPGM)=*YES
     C     Z5            IFLT      S10CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     RN0006        IFEQ      XYES
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0006        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C10 = C10+1
     C     Z5            ADD       1             RN0006
     C                   Z-ADD     RN0006        Z5
     C* GETREC D.MENU,F.MNUPGM,*PV,
     C*
     C                   EXSR      S061
     C* END                                                           *
     C     Z5            IFLT      S10CNT
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
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
     C     RN0006        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C                   Z-ADD     RN0006        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S10ALD
     C                   EXSR      S10ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S10AB
     C                   END
     C*
     C     $S10AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S10AFR - SCRN SUB
     C*****************************************************************
     C     S10AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.MENU,F.MNUPGM,SVK10,svk11
     C*
     C                   EXSR      S060
     C* ** Load arrays from this point.
     C* EXSUBR S10ALD
     C                   EXSR      S10ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S10AF
     C                   END
     C*
     C     $S10AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S10ALD - SCRN SUB
     C*****************************************************************
     C     S10ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T04 = 0
     C                   Z-ADD     *ZERO         T04
     C* B02 = ' '
     C                   MOVEA     *BLANKS       B02
     C* B03 = ' '
     C                   MOVEA     *BLANKS       B03
     C* T05 = ' '
     C                   MOVEA     *BLANKS       T05
     C* T06 = ' '
     C                   MOVEA     *BLANKS       T06
     C* T07 = ' '
     C                   MOVEA     *BLANKS       T07
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z5
     C* ** protect select field
     C* DOW C10<S10CNT
     C     Z5            DOWLT     S10CNT
     C* C10 = C10+1
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C* FLDATR T04(C10),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z5
     C* GETREC D.MENU,F.MNUPGM,*NX,
     C*
     C                   EXSR      S063
     C* DOW (C10<S10CNT)&%STS(D.MENU,F.MNUPGM)=*YES
     C     Z5            IFLT      S10CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     RN0006        IFEQ      XYES
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0006        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C10 = C10+1
     C     Z5            ADD       1             RN0006
     C                   Z-ADD     RN0006        Z5
     C* ** Unprotect select field.
     C* FLDATR T04(C10),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C10) = MENU.MNUPGM.MPPGMN
     C                   MOVE      *BLANKS       B02(Z5)
     C                   MOVE      WPPGMN        B02(Z5)
     C* B03(C10) = menu.mnupgm.mpspgm
     C                   MOVE      *BLANKS       B03(Z5)
     C                   MOVE      WPSPGM        B03(Z5)
     C* ** load screen array.
     C* T05(C10) = MENU.MNUPGM.MPPGMN
     C                   MOVE      *BLANKS       T05(Z5)
     C                   MOVE      WPPGMN        T05(Z5)
     C* T06(C10) = %LJF(MENU.MNUPGM.MPPGMD)
     C*  Left Justify field into result field
     C                   MOVEL     WPPGMD        T06(Z5)
     C* T07(C10) = menu.mnupgm.mpspgm
     C                   MOVE      *BLANKS       T07(Z5)
     C                   MOVE      WPSPGM        T07(Z5)
     C* ** Save first record on screen.
     C* IF C10=1
     C     Z5            IFEQ      1
     C* FST10 = B02(C10)
     C                   MOVE      B02(Z5)       FST10
     C* FST11 = B03(C10)
     C                   MOVE      B03(Z5)       FST11
     C* END                                                           *
     C                   END
     C* IF C10<S10CNT
     C     Z5            IFLT      S10CNT
     C* GETREC D.MENU,F.MNUPGM,*NX,
     C*
     C                   EXSR      S063
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z5            IFLT      S10CNT
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
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
     C     RN0006        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0006
     C                   ELSE
     C                   Z-ADD     0             RN0006
     C                   END
     C                   Z-ADD     RN0006        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C10>0
     C     Z5            IFGT      *ZERO
     C* LST10 = B02(C10)
     C                   MOVE      B02(Z5)       LST10
     C* LST11 = B03(C10)
     C                   MOVE      B03(Z5)       LST11
     C* END                                                           *
     C                   END
     C*
     C     $S10AL        ENDSR
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
     C* S011   - SETLL D.MENU,F.MNUUSR,SVK001
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C*
     C                   MOVEL     SVK001        KAUS01
     C                   MOVEL     SVK001        HAUSER                         User
     C                   MOVEL     SVK001        MAUSER                         User
     C*
     C     K0001         SETLL     MNUUSR                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.MENU,F.MNUUSR,*lock,*eq,SVK001
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     SVK001        KAUS01
     C     K0001         CHAIN     MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.MENU,F.MNUUSR1,*eq,MAGUSER
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     WK0001        KAUS01
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
     C* S014   - GETREC D.MENU,F.MNUUSR,*eq,SVK001
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     SVK001        KAUS01
     C     K0001         CHAIN(N)  MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - DELETE D.MENU,F.MNUUSR,F.MNUHED,F.MNUOPT
     C**************************************************************************
     C     S015          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     XAUSER        KAUS01
     C     K0001         SETLL     MNUUSR                                       SETLL  MNUUSR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUUSR
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0001         READE     MNUUSR                               9190    READE  MNUUSR
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   MOVE      *HIVAL        SVS04
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     MAUSER        KAGU01
     C     K0002         SETLL     MNUHED                                       SETLL  MNUHED
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUHED
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0002         READE     MNUHED                               9190    READE  MNUHED
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   MOVE      *HIVAL        SVS05
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     MBUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     MBMNUC        KBMN02
     C     K0003         SETLL     MNUOPT                                       SETLL  MNUOPT
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUOPT
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0003         READE     MNUOPT                               9190    READE  MNUOPT
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    MNUOPT                               91      DELETE MNUOPT
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C                   DELETE    MNUHED                               91      DELETE MNUHED
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C                   DELETE    MNUUSR                               91      DELETE MNUUSR
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0001         SETLL     MNUUSR                                       RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C     K0002         SETLL     MNUHED                                       RESUME FILE POINTER
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C     K0003         SETLL     MNUOPT                                       RESUME FILE POINTER
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - UPDATE D.MENU,F.MNUUSR
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01                         User
     C                   MOVEL     HAUSER        KAUS01
     C     K0001         CHAIN     MNUUSR                             9091      CHAIN  MNUUSR
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     MACHG         IFEQ      XACHG
     C     MADFV1        ANDEQ     XADFV1
     C     MADFV2        ANDEQ     XADFV2
     C     MADFV3        ANDEQ     XADFV3
     C     MAFORN        ANDEQ     XAFORN
     C     RN0003        ANDEQ     WK0001
     C     MASURN        ANDEQ     XASURN
     C     MAUSER        ANDEQ     XAUSER
     C                   UNLOCK    MNUUSR                               91      RLS LCK MNUUSR
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    MNUUSRF                              90      UPDATE MNUUSR
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
     C* S017   - WRITE D.MENU,F.MNUUSR
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANKS       MAACTA                         Add
     C                   MOVEL     *BLANKS       MAACTD                         Delete
     C                   MOVEL     *BLANKS       MAACTR                         Revise
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUUSRF                              90      ADD REC TO MNUUSR
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - SETLL D.MENU,F.MNUHED,SVK002,SVK003
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HBMNUC                         Menu
     C*
     C                   MOVEL     SVK002        KAGU01
     C                   MOVEL     SVK002        HBUSER                         User
     C                   MOVEL     SVK002        MBUSER                         User
     C                   MOVEL     SVK003        KBMN02
     C                   MOVEL     SVK003        HBMNUC                         Menu
     C                   MOVEL     SVK003        MBMNUC                         Menu
     C*
     C     K0003         SETLL     MNUHED                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.MENU,F.MNUHED,*lock,*eq,SVK002,SVK003
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     SVK002        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     SVK003        KBMN02
     C     K0003         CHAIN     MNUHED                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
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
     C* S020   - GETREC D.MENU,F.MNUHED,*eq,SVK002,SVK003
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     SVK002        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     SVK003        KBMN02
     C     K0003         CHAIN(N)  MNUHED                             9091
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
     C* S021   - DELETE D.MENU,F.MNUHED,F.MNUOPT
     C**************************************************************************
     C     S021          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS04
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     WBUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     XBMNUC        KBMN02
     C     K0003         SETLL     MNUHED                                       SETLL  MNUHED
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUHED
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0003         READE     MNUHED                               9190    READE  MNUHED
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   MOVE      *HIVAL        SVS05
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     MBUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     MBMNUC        KBMN02
     C     K0003         SETLL     MNUOPT                                       SETLL  MNUOPT
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUOPT
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0003         READE     MNUOPT                               9190    READE  MNUOPT
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    MNUOPT                               91      DELETE MNUOPT
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C                   DELETE    MNUHED                               91      DELETE MNUHED
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0003         SETLL     MNUHED                                       RESUME FILE POINTER
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C     K0003         SETLL     MNUOPT                                       RESUME FILE POINTER
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - UPDATE D.MENU,F.MNUHED
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01                         User
     C                   MOVEL     HBUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02                         Menu
     C                   MOVEL     HBMNUC        KBMN02
     C     K0003         CHAIN     MNUHED                             9091      CHAIN  MNUHED
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     MBMNUC        IFEQ      XBMNUC
     C     MBMNUD        ANDEQ     XBMNUD
     C     MBSTRT        ANDEQ     XBSTRT
     C     MBUSER        ANDEQ     WBUSER
     C                   UNLOCK    MNUHED                               91      RLS LCK MNUHED
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    MNUHEDF                              90      UPDATE MNUHED
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
     C* S023   - WRITE D.MENU,F.MNUHED
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUHEDF                              90      ADD REC TO MNUHED
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - SETLL D.MENU,F.MNUOPT,SVK004,SVK005,SVK006
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HCOPTC                         Option
     C*
     C                   MOVEL     SVK004        KAGU01
     C                   MOVEL     SVK004        HCUSER                         User
     C                   MOVEL     SVK004        MCUSER                         User
     C                   MOVEL     SVK005        KBMN02
     C                   MOVEL     SVK005        HCMNUC                         Menu
     C                   MOVEL     SVK005        MCMNUC                         Menu
     C                   MOVEL     SVK006        KCOP03
     C                   MOVEL     SVK006        HCOPTC                         Option
     C                   MOVEL     SVK006        MCOPTC                         Option
     C*
     C     K0004         SETLL     MNUOPT                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - GETREC D.MENU,F.MNUOPT,*lock,*eq,SVK004,SVK005,SVK006
     C**************************************************************************
     C     S025          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     SVK004        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     SVK005        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     SVK006        KCOP03
     C     K0004         CHAIN     MNUOPT                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
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
     C* S026   - GETREC D.MENU,F.MNUOPT,*eq,SVK004,SVK005,SVK006
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     SVK004        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     SVK005        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     SVK006        KCOP03
     C     K0004         CHAIN(N)  MNUOPT                             9091
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
     C* S027   - GETREC D.MENU,F.MNUpgm,*eq,MCPGMN,MCSPGM
     C**************************************************************************
     C     S027          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCPG01
     C                   MOVEL     XCPGMN        KCPG01
     C                   MOVEL     *BLANK        KPSP02
     C                   MOVEL     XCSPGM        KPSP02
     C     K0005         CHAIN     MNUPGM                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - DELETE D.MENU,F.MNUOPT
     C**************************************************************************
     C     S028          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS05
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     WCUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     WCMNUC        KBMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     XCOPTC        KCOP03
     C     K0004         SETLL     MNUOPT                                       SETLL  MNUOPT
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUOPT
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0004         READE     MNUOPT                               9190    READE  MNUOPT
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    MNUOPT                               91      DELETE MNUOPT
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0004         SETLL     MNUOPT                                       RESUME FILE POINTER
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - UPDATE D.MENU,F.MNUOPT
     C**************************************************************************
     C     S029          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01                         User
     C                   MOVEL     HCUSER        KAGU01
     C                   MOVEL     *BLANK        KBMN02                         Menu
     C                   MOVEL     HCMNUC        KBMN02
     C                   MOVEL     *BLANK        KCOP03                         Option
     C                   MOVEL     HCOPTC        KCOP03
     C     K0004         CHAIN     MNUOPT                             9091      CHAIN  MNUOPT
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     MCACTA        IFEQ      WCACTA
     C     MCACTD        ANDEQ     WCACTD
     C     MCACTR        ANDEQ     WCACTR
     C     MCMNUC        ANDEQ     WCMNUC
     C     MCOPTC        ANDEQ     XCOPTC
     C     MCOPTD        ANDEQ     XCOPTD
     C     MCPGMN        ANDEQ     XCPGMN
     C     MCPGMT        ANDEQ     XCPGMT
     C     MCPRM1        ANDEQ     XCPRM1
     C     MCPRM2        ANDEQ     XCPRM2
     C     MCPRM3        ANDEQ     XCPRM3
     C     MCPRM4        ANDEQ     XCPRM4
     C     MCSPGM        ANDEQ     XCSPGM
     C     MCUSER        ANDEQ     WCUSER
     C                   UNLOCK    MNUOPT                               91      RLS LCK MNUOPT
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    MNUOPTF                              90      UPDATE MNUOPT
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
     C* S030   - WRITE D.MENU,F.MNUOPT
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUOPTF                              90      ADD REC TO MNUOPT
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - SETLL D.MENU,F.MNUHLP,SVK007,SVK008,SVK009
     C**************************************************************************
     C     S031          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *LOVAL        HDSEQN                         Sequence Number
     C*
     C                   MOVEL     SVK007        KBMN01
     C                   MOVEL     SVK007        HDMNUC                         Menu
     C                   MOVEL     SVK007        MDMNUC                         Menu
     C                   MOVEL     SVK008        KCOP02
     C                   MOVEL     SVK008        HDOPTC                         Option
     C                   MOVEL     SVK008        MDOPTC                         Option
     C                   Z-ADD     SVK009        KDSE03
     C                   Z-ADD     SVK009        HDSEQN                         Sequence Number
     C                   Z-ADD     SVK009        MDSEQN                         Sequence Number
     C*
     C     K0006         SETLL     MNUHLP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - GETBLK D.MENU,F.MNUUSR,*PV
     C**************************************************************************
     C     S032          BEGSR
     C*
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.MNUUSR    MNUU
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   READP(N)  MNUUSR                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HAUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S033                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - Process To Reset File Pointer(BOF) - MNUUSR
     C**************************************************************************
     C     S033          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.MNUUSR    MNUU
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAUS01                         User
     C                   MOVEL     MAUSER        KAUS01
     C     K0001         SETLL     MNUUSR
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - Process To Reset File Pointer(EOF) - MNUUSR
     C**************************************************************************
     C     S034          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.MNUUSR    MNUU
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAUS01                         User
     C                   MOVEL     MAUSER        KAUS01
     C     K0001         SETGT     MNUUSR
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       11            WADJ01
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - GETREC d.mnuusr2,f.mnuusr2,*eq,menu.mnuusr.mauser
     C**************************************************************************
     C     S035          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAGU01
     C                   MOVEL     XAUSER        KAGU01
     C     K0002         CHAIN     MNUUSR2                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.MNUUSR2
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.MNUUSR2
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - GETREC D.MENU,F.MNUUSR,F.MNUUSR1,*EQ,:0002
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     XAUSER        KAUS01
     C     K0001         CHAIN(N)  MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01                         Group User
     C                   MOVEL     RN0003        KAUS01
     C     K0001         CHAIN     MNUUSR1                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - GETREC D.MENU,F.MNUUSR,*EQ,:0002
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KAUS01
     C                   MOVEL     XAUSER        KAUS01
     C     K0001         CHAIN(N)  MNUUSR                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.MNUUSR    MNUU
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S038   - GETBLK D.MENU,F.MNUHED,*PV,SVK002
     C**************************************************************************
     C     S038          BEGSR
     C*
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     SVK002        KBUS01
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.MNUHED    MNUO
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0007         READPE(N) MNUHED                               9190
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
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S039                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - Process To Reset File Pointer(BOF) - MNUHED
     C**************************************************************************
     C     S039          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.MNUHED    MNUO
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0007         SETLL     MNUHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - Process To Reset File Pointer(EOF) - MNUHED
     C**************************************************************************
     C     S040          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.MNUHED    MNUO
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KBUS01                         User
     C                   MOVEL     MBUSER        KBUS01
     C     K0007         SETGT     MNUHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       9             WADJ02
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - GETREC D.MENU,F.MNUHED,*EQ,MBUSER,MBMNUC
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KBUS01
     C                   MOVEL     WBUSER        KBUS01
     C                   MOVEL     *BLANK        KBMN02
     C                   MOVEL     XBMNUC        KBMN02
     C     K0008         CHAIN(N)  MNUHED                             9091
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
     C* S042   - GETBLK D.MENU,F.MNUOPT,*PV,SVK004,SVK005
     C**************************************************************************
     C     S042          BEGSR
     C*
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     SVK004        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     SVK005        KCMN02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN03        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ03        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD05        DOUNE     'Y'                                          RD.SW.MNUOPT    MNUP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0009         READPE(N) MNUOPT                               9190
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
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S043                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S043   - Process To Reset File Pointer(BOF) - MNUOPT
     C**************************************************************************
     C     S043          BEGSR
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
     C     K0009         SETLL     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - Process To Reset File Pointer(EOF) - MNUOPT
     C**************************************************************************
     C     S044          BEGSR
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
     C     K0009         SETGT     MNUOPT
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ03
     C     WCNTR         IFNE      *ZERO
     C                   ADD       9             WADJ03
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN03        WADJ03
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S045   - GETREC D.MENU,F.MNUOPT,*EQ,MCUSER,MCMNUC,MCOPTC
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCUS01
     C                   MOVEL     WCUSER        KCUS01
     C                   MOVEL     *BLANK        KCMN02
     C                   MOVEL     WCMNUC        KCMN02
     C                   MOVEL     *BLANK        KCOP03
     C                   MOVEL     XCOPTC        KCOP03
     C     K0010         CHAIN(N)  MNUOPT                             9091
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
     C* S046   - GETBLK D.MENU,F.MNUHLP,*PV,SVK007,SVK008,*changed
     C**************************************************************************
     C     S046          BEGSR
     C*
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     SVK007        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     SVK008        KDOP02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN04        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ04        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD07        DOUNE     'Y'                                          RD.SW.MNUHLP
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     K0011         READPE(N) MNUHLP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC07                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HDMNUC                         Menu
     C                   MOVEL     *BLANK        HDOPTC                         Option
     C                   Z-ADD     *ZERO         HDSEQN                         Sequence Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   END
     C*
     C     SWRD07        IFEQ      'Y'                                          RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S047                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S047   - Process To Reset File Pointer(BOF) - MNUHLP
     C**************************************************************************
     C     S047          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.MNUHLP
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDMN01                         Menu
     C                   MOVEL     MDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02                         Option
     C                   MOVEL     MDOPTC        KDOP02
     C     K0011         SETLL     MNUHLP
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - Process To Reset File Pointer(EOF) - MNUHLP
     C**************************************************************************
     C     S048          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.MNUHLP
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDMN01                         Menu
     C                   MOVEL     MDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02                         Option
     C                   MOVEL     MDOPTC        KDOP02
     C     K0011         SETGT     MNUHLP
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ04
     C     WCNTR         IFNE      *ZERO
     C                   ADD       8             WADJ04
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN04        WADJ04
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S049   - DELETE D.MENU,F.MNUHLP
     C**************************************************************************
     C     S049          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS07
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     XDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     XDOPTC        KDOP02
     C                   Z-ADD     XDSEQN        KDSE03
     C     K0012         SETLL     MNUHLP                                       SETLL  MNUHLP
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - MNUHLP
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C     K0012         READE     MNUHLP                               9190    READE  MNUHLP
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    MNUHLP                               91      DELETE MNUHLP
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0012         SETLL     MNUHLP                                       RESUME FILE POINTER
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - SETLL D.MENU,F.MNUHLP,mdmnuc,mdoptc,mdseqn
     C**************************************************************************
     C     S050          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *LOVAL        HDSEQN                         Sequence Number
     C*
     C                   MOVEL     XDMNUC        KDMN01
     C                   MOVEL     XDMNUC        HDMNUC                         Menu
     C                   MOVEL     XDMNUC        MDMNUC                         Menu
     C                   MOVEL     XDOPTC        KDOP02
     C                   MOVEL     XDOPTC        HDOPTC                         Option
     C                   MOVEL     XDOPTC        MDOPTC                         Option
     C                   Z-ADD     XDSEQN        KDSE03
     C                   Z-ADD     XDSEQN        HDSEQN                         Sequence Number
     C                   Z-ADD     XDSEQN        MDSEQN                         Sequence Number
     C*
     C     K0012         SETLL     MNUHLP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - UPDATE D.menu,F.mnuhlp
     C**************************************************************************
     C     S051          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01                         Menu
     C                   MOVEL     HDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02                         Option
     C                   MOVEL     HDOPTC        KDOP02
     C                   Z-ADD     HDSEQN        KDSE03                         Sequence Number
     C     K0012         CHAIN     MNUHLP                             9091      CHAIN  MNUHLP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     MDMNUC        IFEQ      XDMNUC
     C     MDOPTC        ANDEQ     XDOPTC
     C     MDSEQN        ANDEQ     XDSEQN
     C     MDTEXT        ANDEQ     XDTEXT
     C                   UNLOCK    MNUHLP                               91      RLS LCK MNUHLP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    MNUHLPF                              90      UPDATE MNUHLP
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
     C* S052   - WRITE D.menu,f.mnuhlp
     C**************************************************************************
     C     S052          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     XDMNUC        KBMN01                         INITIALIZE KBMN01
     C                   MOVEL     XDOPTC        KCOP02                         INITIALIZE KCOP02
     C                   Z-ADD     *HIVAL        KDSE03                         INITIALIZE KDSE03
     C     K0006         SETGT     MNUHLP
     C                   READP(N)  MNUHLP                               9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     MDMNUC        ANDEQ     KBMN01                                       Menu
     C     MDOPTC        ANDEQ     KCOP02                                       Option
     C     MDSEQN        ADD       5             XDSEQN                         Sequence Number
     C                   ELSE
     C                   Z-ADD     5             XDSEQN
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     MNUHLPF                              90      ADD REC TO MNUHLP
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - GETREC D.MENU,F.MNUHLP,*eq,mdmnuc,mdoptc,mdseqn
     C**************************************************************************
     C     S053          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDMN01
     C                   MOVEL     XDMNUC        KDMN01
     C                   MOVEL     *BLANK        KDOP02
     C                   MOVEL     XDOPTC        KDOP02
     C                   Z-ADD     XDSEQN        KDSE03
     C     K0012         CHAIN(N)  MNUHLP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S054   - SETLL D.MENU,F.MNUHLP,SVK007,SVK008,wkseqn
     C**************************************************************************
     C     S054          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.MNUHLP
     C                   Z-ADD     *LOVAL        HDSEQN                         Sequence Number
     C*
     C                   MOVEL     SVK007        KDMN01
     C                   MOVEL     SVK007        HDMNUC                         Menu
     C                   MOVEL     SVK007        MDMNUC                         Menu
     C                   MOVEL     SVK008        KDOP02
     C                   MOVEL     SVK008        HDOPTC                         Option
     C                   MOVEL     SVK008        MDOPTC                         Option
     C                   Z-ADD     WKSEQN        KDSE03
     C                   Z-ADD     WKSEQN        HDSEQN                         Sequence Number
     C                   Z-ADD     WKSEQN        MDSEQN                         Sequence Number
     C*
     C     K0012         SETLL     MNUHLP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S055   - SETLL D.MENU,F.MNUUSR1,SVK08
     C**************************************************************************
     C     S055          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   MOVE      'N'           SWRD04                         RD.SW.MNUHED    MNUO
     C                   MOVE      'N'           SWRD05                         RD.SW.MNUOPT    MNUP
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C*
     C                   MOVEL     SVK08         KAUS01
     C                   MOVEL     SVK08         HD0001                         User
     C                   MOVEL     SVK08         MAUSER                         User
     C*
     C     K0001         SETLL     MNUUSR1                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S056   - GETREC D.MENU,F.MNUUSR1,*PV,
     C**************************************************************************
     C     S056          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   READP     MNUUSR1                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S057                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S057   - Process To Reset File Pointer(BOF) - MNUUSR1
     C**************************************************************************
     C     S057          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.MNUUSR1   MNUH
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAUS01                         User
     C                   MOVEL     MAUSER        KAUS01
     C     K0001         SETLL     MNUUSR1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S058   - GETREC D.MENU,F.MNUUSR1,*NX,
     C**************************************************************************
     C     S058          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   READ      MNUUSR1                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S059                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S059   - Process To Reset File Pointer(EOF) - MNUUSR1
     C**************************************************************************
     C     S059          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.MNUUSR1   MNUH
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.MNUUSR1   MNUH
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KAUS01                         User
     C                   MOVEL     MAUSER        KAUS01
     C     K0001         SETGT     MNUUSR1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S060   - SETLL D.MENU,F.MNUPGM,SVK10,svk11
     C**************************************************************************
     C     S060          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   MOVE      'N'           SWRD07                         RD.SW.MNUHLP
     C                   MOVEL     *LOVAL        HPSPGM                         Secondary Program Na
     C*
     C                   MOVEL     SVK10         KPPG01
     C                   MOVEL     SVK10         HPPGMN                         Program Name
     C                   MOVEL     SVK10         MPPGMN                         Program Name
     C                   MOVEL     SVK11         KPSP02
     C                   MOVEL     SVK11         HPSPGM                         Secondary Program Na
     C                   MOVEL     SVK11         MPSPGM                         Secondary Program Na
     C*
     C     K0013         SETLL     MNUPGM                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S061   - GETREC D.MENU,F.MNUPGM,*PV,
     C**************************************************************************
     C     S061          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   READP     MNUPGM                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S062                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S062   - Process To Reset File Pointer(BOF) - MNUPGM
     C**************************************************************************
     C     S062          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.MNUPGM    MNUH
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KPPG01                         Program Name
     C                   MOVEL     MPPGMN        KPPG01
     C                   MOVEL     *BLANK        KPSP02                         Secondary Program Na
     C                   MOVEL     MPSPGM        KPSP02
     C     K0013         SETLL     MNUPGM
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S063   - GETREC D.MENU,F.MNUPGM,*NX,
     C**************************************************************************
     C     S063          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   READ      MNUPGM                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S064                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S064   - Process To Reset File Pointer(EOF) - MNUPGM
     C**************************************************************************
     C     S064          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.MNUPGM    MNUH
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.MNUPGM    MNUH
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KPPG01                         Program Name
     C                   MOVEL     MPPGMN        KPPG01
     C                   MOVEL     *BLANK        KPSP02                         Secondary Program Na
     C                   MOVEL     MPSPGM        KPSP02
     C     K0013         SETGT     MNUPGM
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - User Entry Screen
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XAUSER        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XAUSER'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0005'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0001        CHAIN     MNUUSR1                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     WK0001        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0001'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
     C     EXISTF        IFEQ      1                                            Field existence chec
     C     LISTF         OREQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0008'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S004V - Menu Detail Screen
     C* Validation subroutine for -- SC0004
     C**************************************************************************
     C     S004V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XBMNUC        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XBMNUC'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0003'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XBMNUD        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XBMNUD'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'AAA0001'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XBSTRT        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XBSTRT        OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XBSTRT'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     A1(4)         MSGDTA                         Message text
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S006V - Options Detail Screen
     C* Validation subroutine for -- SC0006
     C**************************************************************************
     C     S006V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XCOPTC        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XCOPTC'      FLDNAM
     C                   MOVEL     'SC0006'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0004'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XCOPTD        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XCOPTD'      FLDNAM
     C                   MOVEL     'SC0006'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'AAA0001'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XCPGMN        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XCPGMN'      FLDNAM
     C                   MOVEL     'SC0006'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0002'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XCPGMT        IFEQ      A1(5)                                        Lst Valid/Invalid va
     C     XCPGMT        OREQ      A1(6)                                        Valid value
     C     XCPGMT        OREQ      A1(7)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XCPGMT'      FLDNAM
     C                   MOVEL     'SC0006'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0010'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S010V - Copy Users
     C* Validation subroutine for -- SC0009
     C**************************************************************************
     C     S010V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     CPYOPT        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     CPYOPT        OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'CPYOPT'      FLDNAM
     C                   MOVEL     'SC0009'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0001'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     TOUSER        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'TOUSER'      FLDNAM
     C                   MOVEL     'SC0009'      FLDSCR
     C     LISTF         IFEQ      1                                            Lst Valid/Invalid va
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'MNU0005'     MSGID                          Message id.
     C                   MOVEL     'MENUERR'     MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     VALIDF        IFNE      1
     C                   MOVE      *ZEROS        LIN
     C                   MOVE      *ZEROS        POS
     C                   END
     C*
     C                   ENDSR
     C**************************************************************************
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
     C* SLOCK - Update Lock Flag
     C*****************************************************************
     C     SLOCK         BEGSR
     C     STS01         IFEQ      1218                                         LOCK(SYS)-MNUUSR
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
     C     STS04         IFEQ      1218                                         LOCK(SYS)-MNUHED
     C     STS04         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK04                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK04                          SET ON LOCK FLAG
     C                   END
     C     STS05         IFEQ      1218                                         LOCK(SYS)-MNUOPT
     C     STS05         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK05                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK05                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            MNUUSR
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
     C     WFILE#        IFEQ      2                                            MNUUSR2
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
     C     WFILE#        IFEQ      6                                            MNUPGM
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
     C     WFILE#        IFEQ      7                                            MNUHLP
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
     C*          | Move Fields From Work Area To File - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     XACHG         MACHG                          Allow Change of Loca
     C                   MOVEL     XADFV1        MADFV1                         Default Value for Le
     C                   MOVEL     XADFV2        MADFV2                         Default Value for Le
     C                   MOVEL     XADFV3        MADFV3                         Default Value for Le
     C                   MOVEL     XAFORN        MAFORN                         Forename
     C                   MOVEL     WK0001        RN0003                         Group User
     C                   MOVEL     XASURN        MASURN                         Surname
     C                   MOVEL     XAUSER        MAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     XBMNUC        MBMNUC                         Menu
     C                   MOVEL     XBMNUD        MBMNUD                         Menu Description
     C                   MOVEL     XBSTRT        MBSTRT                         Start Menu
     C                   MOVEL     WBUSER        MBUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - MNUOPT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     WCACTA        MCACTA                         Add
     C                   MOVEL     WCACTD        MCACTD                         Delete
     C                   MOVEL     WCACTR        MCACTR                         Revise
     C                   MOVEL     WCMNUC        MCMNUC                         Menu
     C                   MOVEL     XCOPTC        MCOPTC                         Option
     C                   MOVEL     XCOPTD        MCOPTD                         Option Description
     C                   MOVEL     XCPGMN        MCPGMN                         Program Name
     C                   MOVEL     XCPGMT        MCPGMT                         Program Type
     C                   MOVEL     XCPRM1        MCPRM1                         Parameter
     C                   MOVEL     XCPRM2        MCPRM2                         Parameter
     C                   MOVEL     XCPRM3        MCPRM3                         Parameter
     C                   MOVEL     XCPRM4        MCPRM4                         Parameter
     C                   MOVEL     XCSPGM        MCSPGM                         Secondary Program Na
     C                   MOVEL     WCUSER        MCUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - MNUHLP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     XDMNUC        MDMNUC                         Menu
     C                   MOVEL     XDOPTC        MDOPTC                         Option
     C                   Z-ADD     XDSEQN        MDSEQN                         Sequence Number
     C                   MOVEL     XDTEXT        MDTEXT                         Text
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
     C*          | Move Fields From File To Work Area - MNUUSR
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     MACHG         XACHG                          Allow Change of Loca
     C                   MOVEL     MADFV1        XADFV1                         Default Value for Le
     C                   MOVEL     MADFV2        XADFV2                         Default Value for Le
     C                   MOVEL     MADFV3        XADFV3                         Default Value for Le
     C                   MOVEL     MAFORN        XAFORN                         Forename
     C                   MOVEL     RN0003        WK0001                         Group User
     C                   MOVEL     MASURN        XASURN                         Surname
     C                   MOVEL     MAUSER        XAUSER                         User
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     MAUSER        HAUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR2
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0005        HD0002                         Group User
     C                   MOVEL     MAUSER        HD0003                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUUSR1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     MASURN        WK0002                         Surname
     C                   MOVEL     MAUSER        WAUSER                         User
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     MAUSER        HD0001                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     MBMNUC        XBMNUC                         Menu
     C                   MOVEL     MBMNUD        XBMNUD                         Menu Description
     C                   MOVEL     MBSTRT        XBSTRT                         Start Menu
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
     C                   MOVEL     MCUSER        WCUSER                         User
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     MCUSER        HCUSER                         User
     C                   MOVEL     MCMNUC        HCMNUC                         Menu
     C                   MOVEL     MCOPTC        HCOPTC                         Option
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUPGM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     MPPGMD        WPPGMD                         Program Description
     C                   MOVEL     MPPGMN        WPPGMN                         Program Name
     C                   MOVEL     MPPGMT        WPPGMT                         Program Type
     C                   MOVEL     MPPRM1        WPPRM1                         Parameter
     C                   MOVEL     MPPRM2        WPPRM2                         Parameter
     C                   MOVEL     MPPRM3        WPPRM3                         Parameter
     C                   MOVEL     MPPRM4        WPPRM4                         Parameter
     C                   MOVEL     MPSPGM        WPSPGM                         Secondary Program Na
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     MPPGMN        HPPGMN                         Program Name
     C                   MOVEL     MPSPGM        HPSPGM                         Secondary Program Na
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - MNUHLP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     MDMNUC        XDMNUC                         Menu
     C                   MOVEL     MDOPTC        XDOPTC                         Option
     C                   Z-ADD     MDSEQN        XDSEQN                         Sequence Number
     C                   MOVEL     MDTEXT        XDTEXT                         Text
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     MDMNUC        HDMNUC                         Menu
     C                   MOVEL     MDOPTC        HDOPTC                         Option
     C                   Z-ADD     MDSEQN        HDSEQN                         Sequence Number
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

Y
N
Invalid response
C
R
M
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    WK0001    000006690678
SC0006    XCPGMN    000008280837
SC0009    TOUSER    000014181427
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    WK0001    0000  05      05
SC0002    WK0001    0000  04      04
SC0002    XAUSER    0000  09      09  10
SC0004    XBMNUC    0000  03      03  04
SC0004    XBMNUD    0000  05      05  06
SC0004    XBSTRT    0000  07      07
SC0006    XCOPTC    0000  05      05
SC0006    XCOPTD    0000  06      06
SC0006    XCPGMN    0000  07      07
SC0006    XCPGMT    0000  08      08
SC0009    CPYMNU    0000  01      01
SC0009    CPYOPT    0000  0203    02                   Y
SC0009    TOUSER    0000  0405    04                   Y
SC0001    FL0001    0000  0103    010402               Y
SC0002    XACHG     0000  05      05
SC0002    XADFV1    0000  06      06
SC0002    XADFV2    0000  07      07
SC0002    XADFV3    0000  08      08
SC0002    DATA      0000    02        01
SC0002    KEY       0000    03
SC0003    FL0002    0000  0103    010402               Y
SC0004    GROUP002  0000    02
SC0004    GROUP001  0000    01
SC0005    FL0003    0000  0103    010402               Y
SC0006    XCSPGM    0000  09      09
SC0006    GROUP004  0000    04        03
SC0006    GROUP003  0000    02        01
SC0007    GRPDEL    0000            04
SC0007    FL0004    0000  0103    01  02
SC0007    XDSEQN    0000    06        05
SC0007    XDTEXT    0000    08        07
SC0008    T01       0001            0201
SC0008    T01       0002            0403
SC0008    T01       0003            0605
SC0008    T01       0004            0807
SC0008    T01       0005            1009
SC0010    T04       0001            0201
SC0010    T04       0002            0403
SC0010    T04       0003            0605
SC0010    T04       0004            0807
SC0010    T04       0005            1009
