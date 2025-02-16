     F/TITLE MSECURTY   Work with Security Details
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MSECURTY
     F*  Application ID      -    MSECURTY
     F*  Application Name    -      Work with Security Details
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F* Program Description - Work with Security Details
     F********************************************************************
     F*  Files Usage
     F*
     F*  SECIMS      - (U/DISK   ) IMS User Security           US
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  SECITP      - (U/DISK   ) IMS User allowed types      UT
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  MSECURTYD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - List Screen for SECIMS
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001 / CYDESC : DSPATR(PC)
     F*  05     - SCR001 / CYDESC : DSPATR(RI)
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
     F*  SC0002     - Detail Screen for SECIMS
     F*
     F*  01     - SCR002 / USADD : DSPATR(UL)
     F*  01     - SCR002 / USDEL : DSPATR(UL)
     F*  01     - SCR002 / USENQ : DSPATR(UL)
     F*  01     - SCR002 / USMAIN : DSPATR(UL)
     F*  01     - SCR002 / USSTKU : DSPATR(UL)
     F*  01     - SCR002 / USUGRP : DSPATR(UL)
     F*  01     - SCR002 / USWHSE : DSPATR(UL)
     F*  02     - SCR002 / USADD : DSPATR(PC)
     F*  02     - SCR002 / USADD : DSPATR(RI)
     F*  03     - SCR002 / USADD : DSPATR(PR)
     F*  04     - SCR002 / USDEL : DSPATR(PC)
     F*  04     - SCR002 / USDEL : DSPATR(RI)
     F*  05     - SCR002 / USDEL : DSPATR(PR)
     F*  06     - SCR002 / USENQ : DSPATR(PC)
     F*  06     - SCR002 / USENQ : DSPATR(RI)
     F*  07     - SCR002 / USENQ : DSPATR(PR)
     F*  08     - SCR002 / USMAIN : DSPATR(PC)
     F*  08     - SCR002 / USMAIN : DSPATR(RI)
     F*  09     - SCR002 / USMAIN : DSPATR(PR)
     F*  10     - SCR002 / USSTKU : DSPATR(PC)
     F*  10     - SCR002 / USSTKU : DSPATR(RI)
     F*  11     - SCR002 / USSTKU : DSPATR(PR)
     F*  12     - SCR002 / USUGRP : DSPATR(PC)
     F*  12     - SCR002 / USUGRP : DSPATR(RI)
     F*  13     - SCR002 / USUGRP : DSPATR(PR)
     F*  14     - SCR002 / USUSER : DSPATR(PC)
     F*  14     - SCR002 / USUSER : DSPATR(RI)
     F*  15     - SCR002 / USUSER : DSPATR(PR)
     F*  16     - SCR002 / USUSER : DSPATR(UL)
     F*  17     - SCR002 / USWHSE : DSPATR(PC)
     F*  17     - SCR002 / USWHSE : DSPATR(RI)
     F*  18     - SCR002 / USWHSE : DSPATR(PR)
     F*  19     - SCR002 / CYDESC : DSPATR(PC)
     F*  19     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     - List Screen for SECITP
     F*
     F*  01     - SCR003S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR003S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR003S1 / FL0002 : DSPATR(PR)
     F*  03     - SCR003S1 / FL0002 : DSPATR(UL)
     F*  04     - SCR003S1 / FL0002 : DSPATR(ND)
     F*  05     - SCR003 / CYDESC : DSPATR(PC)
     F*  05     - SCR003 / CYDESC : DSPATR(RI)
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
     F*  SC0004     - Detail Screen for SECITP
     F*
     F*  01     - SCR004 / UTTRNC : DSPATR(PC)
     F*  01     - SCR004 / UTTRNC : DSPATR(RI)
     F*  02     - SCR004 / UTTRNC : DSPATR(UL)
     F*  03     - SCR004 / CYDESC : DSPATR(PC)
     F*  03     - SCR004 / CYDESC : DSPATR(RI)
     F*  99     - SCR004 OVERLAY
     F* N79     - SCR004 PUTOVR
     F*
     F*  SC0005     -   List of Transaction Types
     F*
     F*  01     - SCR005 / T01 : DSPATR(PR)
     F*  02     - SCR005 / T01 : DSPATR(ND)
     F*  03     - SCR005 / T01 : DSPATR(PR)
     F*  04     - SCR005 / T01 : DSPATR(ND)
     F*  05     - SCR005 / T01 : DSPATR(PR)
     F*  06     - SCR005 / T01 : DSPATR(ND)
     F*  07     - SCR005 / T01 : DSPATR(PR)
     F*  08     - SCR005 / T01 : DSPATR(ND)
     F*  09     - SCR005 / T01 : DSPATR(PR)
     F*  10     - SCR005 / T01 : DSPATR(ND)
     F*  80     - SCR005 / T01 : DSPATR(PC)
     F*  80     - SCR005 / T01 : DSPATR(PC)
     F*  80     - SCR005 / T01 : DSPATR(PC)
     F*  80     - SCR005 / T01 : DSPATR(PC)
     F*  80     - SCR005 / T01 : DSPATR(PC)
     F* N79     - SCR005 PUTOVR
     F*
     F*  SC0006     -      List of Warehouses
     F*
     F*  01     - SCR006 / T04 : DSPATR(PR)
     F*  02     - SCR006 / T04 : DSPATR(ND)
     F*  03     - SCR006 / T04 : DSPATR(PR)
     F*  04     - SCR006 / T04 : DSPATR(ND)
     F*  05     - SCR006 / T04 : DSPATR(PR)
     F*  06     - SCR006 / T04 : DSPATR(ND)
     F*  07     - SCR006 / T04 : DSPATR(PR)
     F*  08     - SCR006 / T04 : DSPATR(ND)
     F*  09     - SCR006 / T04 : DSPATR(PR)
     F*  10     - SCR006 / T04 : DSPATR(ND)
     F*  80     - SCR006 / T04 : DSPATR(PC)
     F*  80     - SCR006 / T04 : DSPATR(PC)
     F*  80     - SCR006 / T04 : DSPATR(PC)
     F*  80     - SCR006 / T04 : DSPATR(PC)
     F*  80     - SCR006 / T04 : DSPATR(PC)
     F* N79     - SCR006 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for SECIMS
     F* S002 - Detail Screen for SECIMS
     F* S003 - List Screen for SECITP
     F* S004 - Detail Screen for SECITP
     F* S005 -   List of Transaction Types
     F* S006 -      List of Warehouses
     F* SPBACT - Performs all the program begin actions.
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03BKW - SCRN SUB
     F* S03EDT - SCRN SUB
     F* S03FWD - SCRN SUB
     F* S05ABR - SCRN SUB
     F* S05AFR - SCRN SUB
     F* S05ALD - SCRN SUB
     F* S06ABR - SCRN SUB
     F* S06AFR - SCRN SUB
     F* S06ALD - SCRN SUB
     F* SMSG - calls message handling program to either clear, add, or
     F* S007   - SETLL D.SECURTY,F.SECIMS,SVK001,SVK002
     F* S008   - GETREC D.SECURTY,F.SECIMS,*lock,*eq,SVK001,SVK002
     F* S009   - GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     F* S010   - GETREC D.SECURTY,F.SECIMS,*eq,SVK001,SVK002
     F* S011   - DELETE D.SECURTY,F.SECIMS,f.secitp
     F* S012   - GETREC d.securty,f.secims,*eq,prm001,usugrp
     F* S013   - GETREC d.securty,f.secims,*eq,prm001,wkuser
     F* S014   - UPDATE D.SECURTY,F.SECIMS
     F* S015   - WRITE D.SECURTY,F.SECIMS
     F* S016   - SETLL D.SECURTY,F.SECITP,SVK003,SVK004,SVK005
     F* S017   - GETREC D.SECURTY,F.SECITP,*lock,*eq,SVK003,SVK004,SVK005
     F* S018   - GETREC D.SECURTY,F.IMSTRN,*eq,UTCOYNO,UTTRNC
     F* S019   - GETREC D.SECURTY,F.IMSTRN,*eq,USCOYNO,UTTRNC
     F* S020   - DELETE D.SECURTY,F.SECITP
     F* S021   - WRITE D.SECURTY,F.SECITP
     F* S022   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     F* S023   - GETBLK D.SECURTY,F.SECIMS,F.WAREHED,*PV,SVK001
     F* S024   - Process To Reset File Pointer(BOF) - SECIMS    WAREHED
     F* S025   - Process To Reset File Pointer(EOF) - SECIMS    WAREHED
     F* S026   - GETREC D.SECURTY,F.SECIMS,F.WAREHED,*EQ,USCOYNO,USUSER
     F* S027   - GETBLK D.SECURTY,F.SECITP,F.IMSTRN,*PV,SVK003,SVK004
     F* S028   - Process To Reset File Pointer(BOF) - SECITP    IMSTRN
     F* S029   - Process To Reset File Pointer(EOF) - SECITP    IMSTRN
     F* S030   - GETREC D.SECURTY,F.SECITP,F.IMSTRN,*EQ,UTCOYNO,UTUSER,UTTRNC
     F* S031   - SETLL D.SECURTY,F.IMSTRN,SVK006,SVK05
     F* S032   - GETREC D.SECURTY,F.IMSTRN,*PV,SVK006
     F* S033   - Process To Reset File Pointer(BOF) - IMSTRN
     F* S034   - GETREC D.SECURTY,F.IMSTRN,*NE,SVK006
     F* S035   - Process To Reset File Pointer(EOF) - IMSTRN
     F* S036   - SETLL D.SECURTY,F.WAREHED,SVK008,SVK06
     F* S037   - GETREC D.SECURTY,F.WAREHED,*PV,SVK008
     F* S038   - Process To Reset File Pointer(BOF) - WAREHED
     F* S039   - GETREC D.SECURTY,F.WAREHED,*NE,SVK008
     F* S040   - Process To Reset File Pointer(EOF) - WAREHED
     F* S002V - Detail Screen for SECIMS
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
     FFILE0001  CF   E             WORKSTN
     F                                     EXTDESC('MSECURTYD')
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR003S1:RRN02)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSECIMS    UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FSECITP    UF A E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(12)
     D A02             S             10    DIM(12)
     D A03             S              3    DIM(10)
     D A04             S             10    DIM(10)
     D A05             S              2    DIM(10)
     D B01             S              2    DIM(5)
     D B02             S              3    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(15) CTDATA PERRCD(1)             Alpha constants i
     D DA4             S             24    DIM(5) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(5) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(29) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(29) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
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
     D C0005           C                   CONST('Record Not Found')
     D*
     D* Named constants
     D*
     D C0006           C                   CONST('Invalid action choic-
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
     D @DS004          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS005          DS
     D  T02                    1     10    DIM(5)
     D  T02001                 1      2
     D  T02002                 3      4
     D  T02003                 5      6
     D  T02004                 7      8
     D  T02005                 9     10
     D @DS006          DS
     D  T03                    1    200    DIM(5)
     D  T03001                 1     40
     D  T03002                41     80
     D  T03003                81    120
     D  T03004               121    160
     D  T03005               161    200
     D @DS007          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS008          DS
     D  T05                    1     15    DIM(5)
     D  T05001                 1      3
     D  T05002                 4      6
     D  T05003                 7      9
     D  T05004                10     12
     D  T05005                13     15
     D @DS009          DS
     D  T06                    1    200    DIM(5)
     D  T06001                 1     40
     D  T06002                41     80
     D  T06003                81    120
     D  T06004               121    160
     D  T06005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0001
     I              CYEMPCOL                    RN0002
     I              CYEMPHEAD                   RN0003
     I              CYPRDHEAD                   RN0004
     I              CYREFHEAD                   RN0005
     I              CYSDESC                     RN0006
     IIMSTRMF
     I              TTCOYNO                     RN0007
     ISECIMSF
     I              USCOYNO                     RN0008
     ISECITPF
     I              UTCOYNO                     RN0009
     IWAREHEDF
     I              WHCOYNO                     RN0010
     I              WHWDESC                     RN0011
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM001            3
     C                   PARM                    WKUSER
     C                   PARM                    PRACT
     C                   PARM                    PRALWD
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM001            3
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
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C*
     C     K0002         KLIST
     C                   KFLD                    WK0002
     C                   KFLD                    XSWHSE
     C*
     C     K0003         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSWH02
     C*
     C     K0004         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C                   KFLD                    KTTR03
     C*
     C     K0005         KLIST
     C                   KFLD                    WK0003
     C                   KFLD                    XTTRNC
     C*
     C     K0006         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KTTR02
     C*
     C     K0007         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0008         KLIST
     C                   KFLD                    KSCO01
     C*
     C     K0009         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0010         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTUS02
     C*
     C     K0011         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTTR04
     C*
     C     K0012         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTUS02
     C                   KFLD                    KTTR03
     C*
     C     K0013         KLIST
     C                   KFLD                    KTCO02
     C*
     C     K0014         KLIST
     C                   KFLD                    KHCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0007        WK0001                         Company number
     C     *LIKE         DEFINE    TTTRNC        WTTRNC                         Transaction Type
     C     *LIKE         DEFINE    RN0008        WK0002                         Company number
     C     *LIKE         DEFINE    RN0009        WK0003                         Company number
     C     *LIKE         DEFINE    UTUSER        WTUSER                         User
     C     *LIKE         DEFINE    RN0010        WK0004                         Company number
     C     *LIKE         DEFINE    WHWHSE        WK0006                         Warehouse Number
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0001        HD0001
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
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        SVCY              4 0          Save days
     C                   MOVE      *ZEROS        SVCC              2 0          Save century
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *BLANKS       FL0003           40
     C                   MOVE      *BLANKS       FST05             2
     C                   MOVE      *BLANKS       FST06             3
     C                   MOVE      *BLANKS       F02001            3
     C                   MOVE      *BLANKS       F05001            2
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST05             2
     C                   MOVE      *BLANKS       LST06             3
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRACT             1
     C                   MOVE      *BLANKS       PRALWD            1
     C                   MOVE      *BLANKS       PRM002           10
     C                   MOVE      *BLANKS       PS0102           10
     C                   MOVE      *BLANKS       PS0301            2
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002           10
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004           10
     C                   MOVE      *BLANKS       SVK005            2
     C                   MOVE      *BLANKS       SVK006            3
     C                   MOVE      *BLANKS       SVK007            2
     C                   MOVE      *BLANKS       SVK008            3
     C                   MOVE      *BLANKS       SVK009            3
     C                   MOVE      *BLANKS       SVK05             2
     C                   MOVE      *BLANKS       SVK06             3
     C                   MOVE      *ZEROS        S05CNT            3 0
     C                   MOVE      *ZEROS        S06CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       WKADD             1
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *BLANKS       WKDEL             1
     C                   MOVE      *BLANKS       WKENQ             1
     C                   MOVE      *BLANKS       WKMAIN            1
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *BLANKS       WKSTKU            1
     C                   MOVE      *BLANKS       WKUGRP           10
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *BLANKS       WKWHSE            3
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       IN04             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD01            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       SWRD03            1            RD STS
     C                   MOVE      *BLANKS       KSCO01            3            USCOYNO
     C                   MOVE      *BLANKS       KSUS02           10            USUSER
     C                   MOVE      *BLANKS       KSWH02            3            USWHSE
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       KTTR03            2            UTTRNC
     C                   MOVE      *BLANKS       KTTR02            2            UTTRNC
     C                   MOVE      *BLANKS       SWRD02            1            RD STS IMS User allo
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KTCO01            3            UTCOYNO
     C                   MOVE      *BLANKS       KTUS02           10            UTUSER
     C                   MOVE      *BLANKS       KTCO02            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR04            2            TTTRNC
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
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS m file IMS Us
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
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
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        RN0012           30 9
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             CALLST            1 0          CALL STSword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
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
     C                   EXSR      SPBACT
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0002'      S002
     C     SCRNID        CASEQ     'SC0003'      S003
     C     SCRNID        CASEQ     'SC0004'      S004
     C     SCRNID        CASEQ     'SC0005'      S005
     C     SCRNID        CASEQ     'SC0006'      S006
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
     C* S001 - List Screen for SECIMS
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Get Company description at start.
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* USUSER = ' '
     C                   MOVEL     *BLANKS       XSUSER
     C* USADD = ' '
     C                   MOVE      *BLANKS       XSADD
     C* USDEL = ' '
     C                   MOVE      *BLANKS       XSDEL
     C* USMAIN = ' '
     C                   MOVE      *BLANKS       XSMAIN
     C* USENQ = ' '
     C                   MOVE      *BLANKS       XSENQ
     C* USUGRP = ' '
     C                   MOVEL     *BLANKS       XSUGRP
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = PRM001
     C                   MOVE      PRM001        SVK001
     C* SVK002 = PRM002
     C                   MOVE      PRM002        SVK002
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.SECURTY,F.SECIMS,SVK001,SVK002
     C*
     C                   EXSR      S007
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
     C* SETLL D.SECURTY,F.SECIMS,SVK001,SVK002
     C*
     C                   EXSR      S007
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
     C* *** Check field only if not passed as parm.
     C*                                                               *
     C* IF (PS0102<>' ')
     C     PS0102        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK002 = PS0102
     C                   MOVE      PS0102        SVK002
     C* Reset/clear reposition values to parms passed
     C* PS0102 = ' '
     C                   MOVEL     *BLANKS       PS0102
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
     C* SETLL D.SECURTY,F.SECIMS,SVK001,SVK002
     C*
     C                   EXSR      S007
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
     C* S002 - Detail Screen for SECIMS
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00000000'    *IN(9)
     C                   MOVEA     '000'         *IN(17)
     C                   MOVEA     '1'           *IN(80)
     C* *** Check user allowed action.
     C* IF *USERID <> 'QSECOFR'
     C     USER          IFNE      'QSECOFR'
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
     C* CALL 'BSECIMS',bat,prm001,wkuser,pract,pralwd
     C                   Z-ADD     1             CALLST
     C                   CALL      'BSECIMS'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pralwd = 'N'
     C     PRALWD        IFEQ      'N'
     C* DSPERR *NONE,'USR0001','ERRORS'
     C                   MOVEL     'USR0001'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* PRALWD = 'Y'
     C                   MOVE      'Y'           PRALWD
     C* END                                                           *
     C                   END
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
     C* SVK001 = USCOYNO
     C                   MOVE      WK0002        SVK001
     C* SVK002 = USUSER
     C                   MOVE      XSUSER        SVK002
     C* USUSER = ' '
     C                   MOVEL     *BLANKS       XSUSER
     C* USADD = ' '
     C                   MOVE      *BLANKS       XSADD
     C* USDEL = ' '
     C                   MOVE      *BLANKS       XSDEL
     C* USMAIN = ' '
     C                   MOVE      *BLANKS       XSMAIN
     C* USENQ = ' '
     C                   MOVE      *BLANKS       XSENQ
     C* USSTKU = ' '
     C                   MOVE      *BLANKS       XSSTKU
     C* USWHSE = ' '
     C                   MOVEL     *BLANKS       XSWHSE
     C* USUGRP = ' '
     C                   MOVEL     *BLANKS       XSUGRP
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* USCOYNO = SVK001
     C                   MOVE      SVK001        WK0002
     C* USUSER = SVK002
     C                   MOVE      SVK002        XSUSER
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR SECURTY.SECIMS.USUSER,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSUSER  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.SECURTY,F.SECIMS,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S008
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.SECURTY,F.SECIMS)=*yes
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
     C* IF %sts(D.SECURTY,F.SECIMS)=*no
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
     C* GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     C*
     C                   EXSR      S009
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* GRPATR IFIELDS,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'IFIELDS '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR SECURTY.SECIMS.USADD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSADD   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USDEL,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSDEL   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USMAIN,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSMAIN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USENQ,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSENQ   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USSTKU,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSSTKU  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USWHSE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SECURTY.SECIMS.USUGRP,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XSUGRP  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.SECURTY,F.SECIMS,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S008
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.SECURTY,F.SECIMS)=*yes
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
     C* IF %sts(D.SECURTY,F.SECIMS)=*no
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
     C* GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     C*
     C                   EXSR      S009
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.SECURTY,F.SECIMS,*eq,SVK001,SVK002
     C*
     C                   EXSR      S010
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.SECURTY,F.SECIMS)=*no
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
     C* GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     C*
     C                   EXSR      S009
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
     C* USCOYNO = PRM001
     C                   MOVE      PRM001        WK0002
     C* USUSER = ' '
     C                   MOVEL     *BLANKS       XSUSER
     C* USADD = ' '
     C                   MOVE      *BLANKS       XSADD
     C* USDEL = ' '
     C                   MOVE      *BLANKS       XSDEL
     C* USMAIN = ' '
     C                   MOVE      *BLANKS       XSMAIN
     C* USENQ = ' '
     C                   MOVE      *BLANKS       XSENQ
     C* USSTKU = ' '
     C                   MOVE      *BLANKS       XSSTKU
     C* USWHSE = ' '
     C                   MOVEL     *BLANKS       XSWHSE
     C* USUGRP = ' '
     C                   MOVEL     *BLANKS       XSUGRP
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C*                                                               *
     C* *** Underline input fields
     C* GRPATR IFIELDS,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'IFIELDS '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR USUSER,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XSUSER  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
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
     C                   MOVEA     '0'           *IN(2)
     C                   MOVEA     '0'           *IN(4)
     C                   MOVEA     '0'           *IN(6)
     C                   MOVEA     '0'           *IN(8)
     C                   MOVEA     '0'           *IN(10)
     C                   MOVEA     '0'           *IN(12)
     C                   MOVEA     '0'           *IN(14)
     C                   MOVEA     '0'           *IN(17)
     C                   MOVEA     '0'           *IN(19)
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
     C*                                                               *
     C* *** Store cursor position.
     C* WKROW = *ROW
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   MOVE      HALFWD        ROW1
     C                   Z-ADD     ROW1          WKROW
     C* WKCOL = *COL
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   MOVE      HALFWD        COL1
     C                   Z-ADD     COL1          WKCOL
     C* ** check detail fields for prompt
     C*                                                               *
     C* IF %clf(SECURTY.SECIMS.USWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XSWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* ** Display prompt window.
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* USWHSE = F02001
     C                   MOVE      F02001        XSWHSE
     C* END                                                           *
     C                   END
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     C*
     C                   EXSR      S009
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Place cursor on stored position.
     C* POSCUR WKROW,WKCOL
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
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.SECURTY,F.SECIMS
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    SECIMS                               91      RLS LCK SECIMS
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
     C* *** Perform deletes to file on function key 14
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.SECURTY,F.SECIMS,f.secitp
     C*
     C                   EXSR      S011
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.SECURTY,F.SECIMS)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* IF mode = 2 | mode = 6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C* *** Check group is valid
     C* IF usugrp <> ' '
     C     XSUGRP        IFNE      *BLANKS
     C* WKUSER = ususer
     C                   MOVE      XSUSER        WKUSER
     C* WKADD = usadd
     C                   MOVE      XSADD         WKADD
     C* WKDEL = usdel
     C                   MOVE      XSDEL         WKDEL
     C* WKMAIN = usmain
     C                   MOVE      XSMAIN        WKMAIN
     C* WKENQ = usenq
     C                   MOVE      XSENQ         WKENQ
     C* WKSTKU = usstku
     C                   MOVE      XSSTKU        WKSTKU
     C* WKWHSE = uswhse
     C                   MOVE      XSWHSE        WKWHSE
     C* WKUGRP = usugrp
     C                   MOVE      XSUGRP        WKUGRP
     C* GETREC d.securty,f.secims,*eq,prm001,usugrp
     C*
     C                   EXSR      S012
     C* IF %sts(d.securty,f.secims)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR usugrp,'fil0064','errors'
     C                   MOVEL     'fil0064'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XSUGRP  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* IF mode = 2
     C     MODE          IFEQ      2
     C* GETREC d.securty,f.secims,*eq,prm001,wkuser
     C*
     C                   EXSR      S013
     C* END                                                           *
     C                   END
     C* USUSER = wkuser
     C                   MOVE      WKUSER        XSUSER
     C* USADD = wkadd
     C                   MOVE      WKADD         XSADD
     C* USDEL = wkdel
     C                   MOVE      WKDEL         XSDEL
     C* USMAIN = wkmain
     C                   MOVE      WKMAIN        XSMAIN
     C* USENQ = wkenq
     C                   MOVE      WKENQ         XSENQ
     C* USSTKU = wkstku
     C                   MOVE      WKSTKU        XSSTKU
     C* USWHSE = wkwhse
     C                   MOVE      WKWHSE        XSWHSE
     C* USUGRP = wkugrp
     C                   MOVE      WKUGRP        XSUGRP
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* ** UPdate file if details valid
     C* IF mode <> 4 & error = 'N'
     C     MODE          IFNE      4
     C     ERROR         ANDEQ     'N'
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.SECURTY,F.SECIMS
     C*
     C                   EXSR      S014
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.SECURTY,F.SECIMS
     C*
     C                   EXSR      S015
     C* ** Set keys for first record to display.
     C* SVK001 = USCOYNO
     C                   MOVE      WK0002        SVK001
     C* SVK002 = USUSER
     C                   MOVE      XSUSER        SVK002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.SECURTY,F.SECIMS)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - List Screen for SECITP
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK005 = PS0301
     C                   MOVE      PS0301        SVK005
     C*                                                               *
     C* Set Keys to values from header file.
     C* UTCOYNO = USCOYNO
     C                   MOVE      WK0002        WK0003
     C* UTUSER = USUSER
     C                   MOVE      XSUSER        WTUSER
     C* SVK003 = USCOYNO
     C                   MOVE      WK0002        SVK003
     C* SVK004 = USUSER
     C                   MOVE      XSUSER        SVK004
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.SECURTY,F.SECITP,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S016
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
     C                   GOTO      $00399
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
     C* SETLL D.SECURTY,F.SECITP,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S016
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
     C*                                                               *
     C* IF PS0301<>' '
     C     PS0301        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK005 = PS0301
     C                   MOVE      PS0301        SVK005
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
     C* SETLL D.SECURTY,F.SECITP,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S016
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
     C* S004 - Detail Screen for SECITP
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '000'         *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* *** Check user allowed action.
     C* IF *USERID <> 'QSECOFR'
     C     USER          IFNE      'QSECOFR'
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
     C* CALL 'BSECIMS',bat,prm001,wkuser,pract,pralwd
     C                   Z-ADD     1             CALLST
     C                   CALL      'BSECIMS'     P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pralwd = 'N'
     C     PRALWD        IFEQ      'N'
     C* DSPERR *NONE,'USR0001','ERRORS'
     C                   MOVEL     'USR0001'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* PRALWD = 'Y'
     C                   MOVE      'Y'           PRALWD
     C* END                                                           *
     C                   END
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=4
     C     MODE          IFEQ      4
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK003 = UTCOYNO
     C                   MOVE      WK0003        SVK003
     C* SVK004 = UTUSER
     C                   MOVE      WTUSER        SVK004
     C* SVK005 = UTTRNC
     C                   MOVE      XTTRNC        SVK005
     C* UTTRNC = ' '
     C                   MOVEL     *BLANKS       XTTRNC
     C* TTDESC = ' '
     C                   MOVEL     *BLANKS       XTDESC
     C* UTCOYNO = SVK003
     C                   MOVE      SVK003        WK0003
     C* UTUSER = SVK004
     C                   MOVE      SVK004        WTUSER
     C* UTTRNC = SVK005
     C                   MOVE      SVK005        XTTRNC
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* GETREC D.SECURTY,F.SECITP,*lock,*eq,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S017
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.SECURTY,F.SECITP)=*yes
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
     C* IF %sts(D.SECURTY,F.SECITP)=*no
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
     C* GETREC D.SECURTY,F.IMSTRN,*eq,UTCOYNO,UTTRNC
     C*
     C                   EXSR      S018
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* UTCOYNO = PRM001
     C                   MOVE      PRM001        WK0003
     C* UTTRNC = ' '
     C                   MOVEL     *BLANKS       XTTRNC
     C* TTDESC = ' '
     C                   MOVEL     *BLANKS       XTDESC
     C* UTCOYNO = USCOYNO
     C                   MOVE      WK0002        WK0003
     C* UTUSER = USUSER
     C                   MOVE      XSUSER        WTUSER
     C* SVK003 = USCOYNO
     C                   MOVE      WK0002        SVK003
     C* SVK004 = USUSER
     C                   MOVE      XSUSER        SVK004
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* FLDATR UTTRNC,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XTTRNC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
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
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '0'           *IN(3)
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
     C*                                                               *
     C* *** Store cursor position.
     C* WKROW = *ROW
     C                   Z-ADD     0             HALFWD
     C                   MOVE      ROW           BYTE2
     C                   MOVE      HALFWD        ROW1
     C                   Z-ADD     ROW1          WKROW
     C* WKCOL = *COL
     C                   Z-ADD     0             HALFWD
     C                   MOVE      COL           BYTE2
     C                   MOVE      HALFWD        COL1
     C                   Z-ADD     COL1          WKCOL
     C*                                                               *
     C* IF %clf(SECURTY.SECITP.UTTRNC)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTTRNC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F05001 = ' '
     C                   MOVEL     *BLANKS       F05001
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F05001<>' '
     C     F05001        IFNE      *BLANKS
     C* UTTRNC = F05001
     C                   MOVE      F05001        XTTRNC
     C* END                                                           *
     C                   END
     C* TTDESC = ' '
     C                   MOVEL     *BLANKS       XTDESC
     C* GETREC D.SECURTY,F.IMSTRN,*eq,USCOYNO,UTTRNC
     C*
     C                   EXSR      S019
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Place cursor on stored position.
     C* POSCUR WKROW,WKCOL
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
     C* *** Return to list panel on function key 12
     C* Set exit flag to signal previous screen
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C*                                                               *
     C* Release record if edit or delete functions
     C* IF mode=2 | mode=4
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C* RLSREC D.SECURTY,F.SECITP
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   UNLOCK    SECITP                               91      RLS LCK SECITP
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
     C* *** Perform deletes to file on function key 14
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.SECURTY,F.SECITP
     C*
     C                   EXSR      S020
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.SECURTY,F.SECITP)=*YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
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
     C* *** Perform add on enter
     C*                                                               *
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.SECURTY,F.SECITP
     C*
     C                   EXSR      S021
     C* ** Set keys for first record to display.
     C* SVK003 = UTCOYNO
     C                   MOVE      WK0003        SVK003
     C* SVK004 = UTUSER
     C                   MOVE      WTUSER        SVK004
     C* SVK005 = UTTRNC
     C                   MOVE      XTTRNC        SVK005
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.SECURTY,F.SECITP)=*YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00499        ENDSR
     C/EJECT
     C*****************************************************************
     C* S005 -   List of Transaction Types
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST05 = ' '
     C                   MOVEL     *BLANKS       FST05
     C* LST05 = ' '
     C                   MOVEL     *BLANKS       LST05
     C* SVK05 = ' '
     C                   MOVEL     *BLANKS       SVK05
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK006 = UTCOYNO
     C                   MOVE      WK0003        SVK006
     C* S05CNT = 005
     C                   Z-ADD     005           S05CNT
     C* ** Array forward read.
     C* EXSUBR S05AFR
     C                   EXSR      S05AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
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
     C                   EXFMT     SCR005
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
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK05 = FST05
     C                   MOVE      FST05         SVK05
     C* ** Array Backwards read.
     C* EXSUBR S05ABR
     C                   EXSR      S05ABR
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
     C* SVK05 = LST05
     C                   MOVE      LST05         SVK05
     C* ** Array Forward read.
     C* EXSUBR S05AFR
     C                   EXSR      S05AFR
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
     C* SVK05 = FST05
     C                   MOVE      FST05         SVK05
     C* ** Array Backwards read.
     C* EXSUBR S05ABR
     C                   EXSR      S05ABR
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
     C* SVK05 = LST05
     C                   MOVE      LST05         SVK05
     C* ** Array Forward Read.
     C* EXSUBR S05AFR
     C                   EXSR      S05AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I05 = 1
     C                   Z-ADD     1             Z7
     C* DOW (I05<=C05)&(T01(I05)<>1)
     C     Z7            DOWLE     Z3
     C     T01(Z7)       ANDNE     1
     C* I05 = I05+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I05<=C05)&(T01(I05)=1)
     C     Z7            IFLE      Z3
     C     T01(Z7)       ANDEQ     1
     C* F05001 = B01(I05)
     C                   MOVE      B01(Z7)       F05001
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00599        ENDSR
     C/EJECT
     C*****************************************************************
     C* S006 -      List of Warehouses
     C*****************************************************************
     C     S006          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST06 = ' '
     C                   MOVEL     *BLANKS       FST06
     C* LST06 = ' '
     C                   MOVEL     *BLANKS       LST06
     C* SVK06 = ' '
     C                   MOVEL     *BLANKS       SVK06
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK008 = USCOYNO
     C                   MOVE      WK0002        SVK008
     C* S06CNT = 005
     C                   Z-ADD     005           S06CNT
     C* ** Array forward read.
     C* EXSUBR S06AFR
     C                   EXSR      S06AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
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
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *INKG         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = FST06
     C                   MOVE      FST06         SVK06
     C* ** Array Backwards read.
     C* EXSUBR S06ABR
     C                   EXSR      S06ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *INKH         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = LST06
     C                   MOVE      LST06         SVK06
     C* ** Array Forward read.
     C* EXSUBR S06AFR
     C                   EXSR      S06AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = FST06
     C                   MOVE      FST06         SVK06
     C* ** Array Backwards read.
     C* EXSUBR S06ABR
     C                   EXSR      S06ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK06 = LST06
     C                   MOVE      LST06         SVK06
     C* ** Array Forward Read.
     C* EXSUBR S06AFR
     C                   EXSR      S06AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I06 = 1
     C                   Z-ADD     1             Z8
     C* DOW (I06<=C06)&(T04(I06)<>1)
     C     Z8            DOWLE     Z4
     C     T04(Z8)       ANDNE     1
     C* I06 = I06+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I06<=C06)&(T04(I06)=1)
     C     Z8            IFLE      Z4
     C     T04(Z8)       ANDEQ     1
     C* F02001 = B02(I06)
     C                   MOVE      B02(Z8)       F02001
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00699        ENDSR
     C/EJECT
     C*****************************************************************
     C* SPBACT - Performs all the program begin actions.
     C*****************************************************************
     C     SPBACT        BEGSR
     C*
     C* PGMBEGACT                                                     *
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C*
     C                   EXSR      S022
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
     C                   WRITE     SCR001C1
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
     C                   WRITE     SCR003C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0004'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0005'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR005
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0006'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR006
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
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C*                                                               *
     C* FLDATR FL0001,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SECURTY,F.SECIMS,F.WAREHED,*PV,SVK001
     C*
     C                   EXSR      S023
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK001        KSCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SECIMS    WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XSUSER
     C                   MOVEL     *BLANKS       XSADD
     C                   MOVEL     *BLANKS       XSDEL
     C                   MOVEL     *BLANKS       XSMAIN
     C                   MOVEL     *BLANKS       XSENQ
     C                   MOVEL     *BLANKS       XSUGRP
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0008         READE(N)  SECIMS                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   MOVEL     *BLANK        HSUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0008        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     USWHSE        KHWH02
     C     K0009         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* FLDATR FL0001,*DS
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
     C* A001(C01) = USCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = USUSER
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XSUSER        A02(Z1)
     C* ** Fill any possible work fields in list
     C* ** panel with secondary file fields.
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
     C                   MOVEL     *BLANKS       XSUSER
     C                   MOVEL     *BLANKS       XSADD
     C                   MOVEL     *BLANKS       XSDEL
     C                   MOVEL     *BLANKS       XSMAIN
     C                   MOVEL     *BLANKS       XSENQ
     C                   MOVEL     *BLANKS       XSUGRP
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
     C                   EXSR      S025                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Z5
     C* DOBLK D.SECURTY
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
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=2)|(FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* USCOYNO = A001(I01)
     C                   MOVE      A01(Z5)       WK0002
     C* USUSER = A002(I01)
     C                   MOVE      A02(Z5)       XSUSER
     C* ** Get record and any secondary records.
     C* GETREC D.SECURTY,F.SECIMS,F.WAREHED,*EQ,USCOYNO,USUSER
     C*
     C                   EXSR      S026
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
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
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
     C* USCOYNO = A001(I01)
     C                   MOVE      A01(Z5)       WK0002
     C* USUSER = A002(I01)
     C                   MOVE      A02(Z5)       XSUSER
     C* GETREC D.SECURTY,F.SECIMS,F.WAREHED,*EQ,USCOYNO,USUSER
     C*
     C                   EXSR      S026
     C* IF %STS(D.SECURTY,F.SECIMS)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
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
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR FL0001,'Record Not Found'
     C                   MOVEL     C0005         MSGDTA
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ELSE                                                          *
     C                   ELSE
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
     C                   MOVEL     C0006         MSGDTA
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
     C                   MOVEA     *BLANKS       A01
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C*                                                               *
     C* FLDATR FL0001,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SECURTY,F.SECIMS,F.WAREHED,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK001        KSCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SECIMS    WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XSUSER
     C                   MOVEL     *BLANKS       XSADD
     C                   MOVEL     *BLANKS       XSDEL
     C                   MOVEL     *BLANKS       XSMAIN
     C                   MOVEL     *BLANKS       XSENQ
     C                   MOVEL     *BLANKS       XSUGRP
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0008         READE(N)  SECIMS                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   MOVEL     *BLANK        HSUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0008        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     USWHSE        KHWH02
     C     K0009         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* FLDATR FL0001,*DS
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
     C* A001(C01) = USCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0002        A01(Z1)
     C* A002(C01) = USUSER
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XSUSER        A02(Z1)
     C* ** Set any work fields to values in
     C* ** secondary file fields.
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
     C                   MOVEL     *BLANKS       XSUSER
     C                   MOVEL     *BLANKS       XSADD
     C                   MOVEL     *BLANKS       XSDEL
     C                   MOVEL     *BLANKS       XSMAIN
     C                   MOVEL     *BLANKS       XSENQ
     C                   MOVEL     *BLANKS       XSUGRP
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
     C                   EXSR      S025                                         RESET FP
     C*                                                               *
     C* IF C01=0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR S01BKW
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A04
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A05
     C* FLDATR FL0002,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SECURTY,F.SECITP,F.IMSTRN,*PV,SVK003,SVK004
     C*
     C                   EXSR      S027
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK003        KTCO01
     C                   MOVEL     *BLANK        KTUS02
     C                   MOVEL     SVK004        KTUS02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     10            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.SECITP    IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0010         READE(N)  SECITP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTUSER                         User
     C                   MOVEL     *BLANK        HD0005                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0009        KTCO02
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     UTTRNC        KTTR04
     C     K0011         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* FLDATR FL0002,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* A003(C03) = UTCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0003        A03(Z2)
     C* A004(C03) = UTUSER
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WTUSER        A04(Z2)
     C* A005(C03) = UTTRNC
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVE      XTTRNC        A05(Z2)
     C* IF %STS(D.SECURTY,F.IMSTRN)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* FL0003 = TTDESC
     C                   MOVE      XTDESC        FL0003
     C* END                                                           *
     C                   END
     C*                                                               *
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0003
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
     C                   EXSR      S029                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Z6
     C* DOBLK D.SECURTY
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
     C                   MOVEA     '0'           *IN(5)
     C* I03 = I03+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0002=4)
     C     FL0002        IFEQ      4
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* ** set keys from hidden key arrays.
     C* UTCOYNO = A003(I03)
     C                   MOVE      A03(Z6)       WK0003
     C* UTUSER = A004(I03)
     C                   MOVE      A04(Z6)       WTUSER
     C* UTTRNC = A005(I03)
     C                   MOVE      A05(Z6)       XTTRNC
     C* ** Get record and any secondary records.
     C* GETREC D.SECURTY,F.SECITP,F.IMSTRN,*EQ,UTCOYNO,UTUSER,UTTRNC
     C*
     C                   EXSR      S030
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
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0002<>0)&(UPDFLG=0)
     C     FL0002        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0002,'Invalid action choice'
     C                   MOVEL     C0006         MSGDTA
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
     C                   MOVEA     '0'           *IN(5)
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* A004 = ' '
     C                   MOVEA     *BLANKS       A04
     C* A005 = ' '
     C                   MOVEA     *BLANKS       A05
     C* FLDATR FL0002,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SECURTY,F.SECITP,F.IMSTRN,*NE,SVK003,SVK004
     C*
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK003        KTCO01
     C                   MOVEL     *BLANK        KTUS02
     C                   MOVEL     SVK004        KTUS02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     10            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.SECITP    IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0010         READE(N)  SECITP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTUSER                         User
     C                   MOVEL     *BLANK        HD0005                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0009        KTCO02
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     UTTRNC        KTTR04
     C     K0011         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* FLDATR FL0002,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* A003(C03) = UTCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0003        A03(Z2)
     C* A004(C03) = UTUSER
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WTUSER        A04(Z2)
     C* A005(C03) = UTTRNC
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVE      XTTRNC        A05(Z2)
     C* IF %STS(D.SECURTY,F.IMSTRN)=*YES
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C* FL0003 = TTDESC
     C                   MOVE      XTDESC        FL0003
     C* END                                                           *
     C                   END
     C*                                                               *
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0003
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
     C                   EXSR      S029                                         RESET FP
     C*                                                               *
     C* IF c03=0
     C     Z2            IFEQ      *ZERO
     C* EXSUBR S03BKW
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
     C* S05ABR - SCRN SUB
     C*****************************************************************
     C     S05ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Set pointer to first record on screen.
     C* SETLL D.SECURTY,F.IMSTRN,SVK006,SVK05
     C*
     C                   EXSR      S031
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.SECURTY,F.IMSTRN,*PV,SVK006
     C*
     C                   EXSR      S032
     C* DOW (C05<S05CNT)&%STS(D.SECURTY,F.IMSTRN)=*YES
     C     Z3            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     RN0012        IFEQ      XYES
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0012        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z3            ADD       1             RN0012
     C                   Z-ADD     RN0012        Z3
     C* GETREC D.SECURTY,F.IMSTRN,*PV,SVK006
     C*
     C                   EXSR      S032
     C* END                                                           *
     C     Z3            IFLT      S05CNT
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
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
     C     RN0012        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C                   Z-ADD     RN0012        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S05ALD
     C                   EXSR      S05ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05AB
     C                   END
     C*
     C     $S05AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05AFR - SCRN SUB
     C*****************************************************************
     C     S05AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.SECURTY,F.IMSTRN,SVK006,SVK05
     C*
     C                   EXSR      S031
     C* ** Load arrays from this point.
     C* EXSUBR S05ALD
     C                   EXSR      S05ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05AF
     C                   END
     C*
     C     $S05AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05ALD - SCRN SUB
     C*****************************************************************
     C     S05ALD        BEGSR
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
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** protect select field
     C* DOW C05<S05CNT
     C     Z3            DOWLT     S05CNT
     C* C05 = C05+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C* FLDATR T01(C05),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z3
     C* GETREC D.SECURTY,F.IMSTRN,*NE,SVK006
     C*
     C                   EXSR      S034
     C* DOW (C05<S05CNT)&%STS(D.SECURTY,F.IMSTRN)=*YES
     C     Z3            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     RN0012        IFEQ      XYES
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0012        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z3            ADD       1             RN0012
     C                   Z-ADD     RN0012        Z3
     C* ** Unprotect select field.
     C* FLDATR T01(C05),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C05) = SECURTY.IMSTRN.TTTRNC
     C                   MOVE      *BLANKS       B01(Z3)
     C                   MOVE      WTTRNC        B01(Z3)
     C* ** load screen array.
     C* T02(C05) = SECURTY.IMSTRN.TTTRNC
     C                   MOVE      *BLANKS       T02(Z3)
     C                   MOVE      WTTRNC        T02(Z3)
     C* T03(C05) = SECURTY.IMSTRN.TTDESC
     C                   MOVE      *BLANKS       T03(Z3)
     C                   MOVE      XTDESC        T03(Z3)
     C* ** Save first record on screen.
     C* IF C05=1
     C     Z3            IFEQ      1
     C* FST05 = B01(C05)
     C                   MOVE      B01(Z3)       FST05
     C* END                                                           *
     C                   END
     C* IF C05<S05CNT
     C     Z3            IFLT      S05CNT
     C* GETREC D.SECURTY,F.IMSTRN,*NE,SVK006
     C*
     C                   EXSR      S034
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S05CNT
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
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
     C     RN0012        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C                   Z-ADD     RN0012        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C05>0
     C     Z3            IFGT      *ZERO
     C* LST05 = B01(C05)
     C                   MOVE      B01(Z3)       LST05
     C* END                                                           *
     C                   END
     C*
     C     $S05AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06ABR - SCRN SUB
     C*****************************************************************
     C     S06ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** Set pointer to first record on screen.
     C* SETLL D.SECURTY,F.WAREHED,SVK008,SVK06
     C*
     C                   EXSR      S036
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.SECURTY,F.WAREHED,*PV,SVK008
     C*
     C                   EXSR      S037
     C* DOW (C06<S06CNT)&%STS(D.SECURTY,F.WAREHED)=*YES
     C     Z4            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     RN0012        IFEQ      XYES
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0012        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z4            ADD       1             RN0012
     C                   Z-ADD     RN0012        Z4
     C* GETREC D.SECURTY,F.WAREHED,*PV,SVK008
     C*
     C                   EXSR      S037
     C* END                                                           *
     C     Z4            IFLT      S06CNT
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
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
     C     RN0012        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C                   Z-ADD     RN0012        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S06ALD
     C                   EXSR      S06ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S06AB
     C                   END
     C*
     C     $S06AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06AFR - SCRN SUB
     C*****************************************************************
     C     S06AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.SECURTY,F.WAREHED,SVK008,SVK06
     C*
     C                   EXSR      S036
     C* ** Load arrays from this point.
     C* EXSUBR S06ALD
     C                   EXSR      S06ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S06AF
     C                   END
     C*
     C     $S06AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S06ALD - SCRN SUB
     C*****************************************************************
     C     S06ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T04 = 0
     C                   Z-ADD     *ZERO         T04
     C* B02 = ' '
     C                   MOVEA     *BLANKS       B02
     C* T05 = ' '
     C                   MOVEA     *BLANKS       T05
     C* T06 = ' '
     C                   MOVEA     *BLANKS       T06
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** protect select field
     C* DOW C06<S06CNT
     C     Z4            DOWLT     S06CNT
     C* C06 = C06+1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* FLDATR T04(C06),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z4
     C* GETREC D.SECURTY,F.WAREHED,*NE,SVK008
     C*
     C                   EXSR      S039
     C* DOW (C06<S06CNT)&%STS(D.SECURTY,F.WAREHED)=*YES
     C     Z4            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     RN0012        IFEQ      XYES
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0012        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z4            ADD       1             RN0012
     C                   Z-ADD     RN0012        Z4
     C* ** Unprotect select field.
     C* FLDATR T04(C06),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C06) = SECURTY.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       B02(Z4)
     C                   MOVE      WK0006        B02(Z4)
     C* ** load screen array.
     C* T05(C06) = SECURTY.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       T05(Z4)
     C                   MOVE      WK0006        T05(Z4)
     C* T06(C06) = SECURTY.WAREHED.WHWDESC
     C                   MOVE      *BLANKS       T06(Z4)
     C                   MOVE      WK0005        T06(Z4)
     C* ** Save first record on screen.
     C* IF C06=1
     C     Z4            IFEQ      1
     C* FST06 = B02(C06)
     C                   MOVE      B02(Z4)       FST06
     C* END                                                           *
     C                   END
     C* IF C06<S06CNT
     C     Z4            IFLT      S06CNT
     C* GETREC D.SECURTY,F.WAREHED,*NE,SVK008
     C*
     C                   EXSR      S039
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z4            IFLT      S06CNT
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
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
     C     RN0012        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0012
     C                   ELSE
     C                   Z-ADD     0             RN0012
     C                   END
     C                   Z-ADD     RN0012        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C06>0
     C     Z4            IFGT      *ZERO
     C* LST06 = B02(C06)
     C                   MOVE      B02(Z4)       LST06
     C* END                                                           *
     C                   END
     C*
     C     $S06AL        ENDSR
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
     C* S007   - SETLL D.SECURTY,F.SECIMS,SVK001,SVK002
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   MOVEL     *LOVAL        HD0003                         Company number
     C                   MOVEL     *LOVAL        HSUSER                         User
     C*
     C                   MOVEL     SVK001        KSCO01
     C                   MOVEL     SVK001        HD0003                         Company number
     C                   MOVEL     SVK001        RN0008                         Company number
     C                   MOVEL     SVK002        KSUS02
     C                   MOVEL     SVK002        HSUSER                         User
     C                   MOVEL     SVK002        USUSER                         User
     C*
     C     K0001         SETLL     SECIMS                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - GETREC D.SECURTY,F.SECIMS,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     SVK002        KSUS02
     C     K0001         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETREC D.SECURTY,F.WAREHED,*eq,USCOYNO,USWHSE
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0002        KSCO01
     C                   MOVEL     *BLANK        KSWH02
     C                   MOVEL     XSWHSE        KSWH02
     C     K0003         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.SECURTY,F.SECIMS,*eq,SVK001,SVK002
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     SVK002        KSUS02
     C     K0001         CHAIN(N)  SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - DELETE D.SECURTY,F.SECIMS,f.secitp
     C**************************************************************************
     C     S011          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     XSUSER        KSUS02
     C     K0001         SETLL     SECIMS                                       SETLL  SECIMS
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - SECIMS
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0001         READE     SECIMS                               9190    READE  SECIMS
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   MOVE      *HIVAL        SVS04
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     RN0008        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     USUSER        KSUS02
     C     K0001         SETLL     SECITP                                       SETLL  SECITP
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - SECITP
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0001         READE     SECITP                               9190    READE  SECITP
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    SECITP                               91      DELETE SECITP
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(4)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(5)         MSGDTA                         No record found to d
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVE      'Y'           MSGFLG                         SET ON ERROR FLAG
     C                   END                                                    READ KEY FILE FAIL
     C*
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C                   DELETE    SECIMS                               91      DELETE SECIMS
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(6)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(7)         MSGDTA                         No record found to d
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
     C     K0001         SETLL     SECIMS                                       RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C     K0001         SETLL     SECITP                                       RESUME FILE POINTER
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC d.securty,f.secims,*eq,prm001,usugrp
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     XSUGRP        KSUS02
     C     K0001         CHAIN(N)  SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC d.securty,f.secims,*eq,prm001,wkuser
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     WKUSER        KSUS02
     C     K0001         CHAIN(N)  SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - UPDATE D.SECURTY,F.SECIMS
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     HD0003        KSCO01
     C                   MOVEL     *BLANK        KSUS02                         User
     C                   MOVEL     HSUSER        KSUS02
     C     K0001         CHAIN     SECIMS                             9091      CHAIN  SECIMS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     USADD         IFEQ      XSADD
     C     RN0008        ANDEQ     WK0002
     C     USDEL         ANDEQ     XSDEL
     C     USENQ         ANDEQ     XSENQ
     C     USMAIN        ANDEQ     XSMAIN
     C     USSTKU        ANDEQ     XSSTKU
     C     USUGRP        ANDEQ     XSUGRP
     C     USUSER        ANDEQ     XSUSER
     C     USWHSE        ANDEQ     XSWHSE
     C                   UNLOCK    SECIMS                               91      RLS LCK SECIMS
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    SECIMSF                              90      UPDATE SECIMS
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
     C* S015   - WRITE D.SECURTY,F.SECIMS
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     SECIMSF                              90      ADD REC TO SECIMS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(10)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(11)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - SETLL D.SECURTY,F.SECITP,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   MOVEL     *LOVAL        HD0005                         Transaction Type
     C*
     C                   MOVEL     SVK003        KSCO01
     C                   MOVEL     SVK003        HD0004                         Company number
     C                   MOVEL     SVK003        RN0009                         Company number
     C                   MOVEL     SVK004        KSUS02
     C                   MOVEL     SVK004        HTUSER                         User
     C                   MOVEL     SVK004        UTUSER                         User
     C                   MOVEL     SVK005        KTTR03
     C                   MOVEL     SVK005        HD0005                         Transaction Type
     C                   MOVEL     SVK005        UTTRNC                         Transaction Type
     C*
     C     K0004         SETLL     SECITP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - GETREC D.SECURTY,F.SECITP,*lock,*eq,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK003        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     SVK004        KSUS02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     SVK005        KTTR03
     C     K0004         CHAIN     SECITP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - GETREC D.SECURTY,F.IMSTRN,*eq,UTCOYNO,UTTRNC
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0003        KSCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     XTTRNC        KTTR02
     C     K0006         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.SECURTY,F.IMSTRN,*eq,USCOYNO,UTTRNC
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0002        KSCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     XTTRNC        KTTR02
     C     K0006         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - DELETE D.SECURTY,F.SECITP
     C**************************************************************************
     C     S020          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS04
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0003        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     WTUSER        KSUS02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     XTTRNC        KTTR03
     C     K0004         SETLL     SECITP                                       SETLL  SECITP
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - SECITP
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0004         READE     SECITP                               9190    READE  SECITP
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    SECITP                               91      DELETE SECITP
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(4)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(5)         MSGDTA                         No record found to d
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
     C     K0004         SETLL     SECITP                                       RESUME FILE POINTER
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - WRITE D.SECURTY,F.SECITP
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     SECITPF                              90      ADD REC TO SECITP
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
     C* S022   - GETREC D.COMPANY,F.COMPANY,*EQ,PRM001
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0007         CHAIN     COMPANY                            9091
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
     C* S023   - GETBLK D.SECURTY,F.SECIMS,F.WAREHED,*PV,SVK001
     C**************************************************************************
     C     S023          BEGSR
     C*
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     SVK001        KSCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SECIMS    WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0008         READPE(N) SECIMS                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0003                         Company number
     C                   MOVEL     *BLANK        HSUSER                         User
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0008        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     USWHSE        KHWH02
     C     K0009         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S024                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - Process To Reset File Pointer(BOF) - SECIMS    WAREHED
     C**************************************************************************
     C     S024          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.SECIMS    WARE
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     RN0008        KSCO01
     C     K0008         SETLL     SECIMS
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0010        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WHWHSE        KHWH02
     C     K0009         SETLL     WAREHED
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(14)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - Process To Reset File Pointer(EOF) - SECIMS    WAREHED
     C**************************************************************************
     C     S025          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.SECIMS    WARE
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KSCO01                         Company number
     C                   MOVEL     RN0008        KSCO01
     C     K0008         SETGT     SECIMS
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0010        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WHWHSE        KHWH02
     C     K0009         SETGT     WAREHED
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(15)        MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - GETREC D.SECURTY,F.SECIMS,F.WAREHED,*EQ,USCOYNO,USUSER
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     WK0002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     XSUSER        KSUS02
     C     K0001         CHAIN(N)  SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SECIMS    WARE
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0008        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     USWHSE        KHWH02
     C     K0009         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - GETBLK D.SECURTY,F.SECITP,F.IMSTRN,*PV,SVK003,SVK004
     C**************************************************************************
     C     S027          BEGSR
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK003        KTCO01
     C                   MOVEL     *BLANK        KTUS02
     C                   MOVEL     SVK004        KTUS02
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
     C     SWRD04        DOUNE     'Y'                                          RD.SW.SECITP    IMST
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C     K0010         READPE(N) SECITP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     *ZERO         HRC04                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTUSER                         User
     C                   MOVEL     *BLANK        HD0005                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   END
     C*
     C     SWRD04        IFEQ      'Y'                                          RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0009        KTCO02
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     UTTRNC        KTTR04
     C     K0011         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S028                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - Process To Reset File Pointer(BOF) - SECITP    IMSTRN
     C**************************************************************************
     C     S028          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.SECITP    IMST
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0009        KTCO01
     C                   MOVEL     *BLANK        KTUS02                         User
     C                   MOVEL     UTUSER        KTUS02
     C     K0010         SETLL     SECITP
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0007        KTCO02
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     TTTRNC        KTTR04
     C     K0011         SETLL     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(14)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - Process To Reset File Pointer(EOF) - SECITP    IMSTRN
     C**************************************************************************
     C     S029          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.SECITP    IMST
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0009        KTCO01
     C                   MOVEL     *BLANK        KTUS02                         User
     C                   MOVEL     UTUSER        KTUS02
     C     K0010         SETGT     SECITP
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0007        KTCO02
     C                   MOVEL     *BLANK        KTTR04                         Transaction Type
     C                   MOVEL     TTTRNC        KTTR04
     C     K0011         SETGT     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       10            WADJ02
     C                   END
     C                   MOVEL     A1(15)        MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - GETREC D.SECURTY,F.SECITP,F.IMSTRN,*EQ,UTCOYNO,UTUSER,UTTRNC
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     WK0003        KTCO01
     C                   MOVEL     *BLANK        KTUS02
     C                   MOVEL     WTUSER        KTUS02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     XTTRNC        KTTR03
     C     K0012         CHAIN(N)  SECITP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0009        KTCO02
     C                   MOVEL     *BLANK        KTTR04
     C                   MOVEL     UTTRNC        KTTR04
     C     K0011         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - SETLL D.SECURTY,F.IMSTRN,SVK006,SVK05
     C**************************************************************************
     C     S031          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C*
     C                   MOVEL     SVK006        KTCO02
     C                   MOVEL     SVK006        HD0002                         Company number
     C                   MOVEL     SVK006        RN0007                         Company number
     C                   MOVEL     SVK05         KTTR04
     C                   MOVEL     SVK05         HTTRNC                         Transaction Type
     C                   MOVEL     SVK05         TTTRNC                         Transaction Type
     C*
     C     K0011         SETLL     IMSTRN                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - GETREC D.SECURTY,F.IMSTRN,*PV,SVK006
     C**************************************************************************
     C     S032          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK006        KTCO02
     C     K0013         READPE    IMSTRN                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S033                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - Process To Reset File Pointer(BOF) - IMSTRN
     C**************************************************************************
     C     S033          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IMSTRN
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0007        KTCO02
     C     K0013         SETLL     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(14)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - GETREC D.SECURTY,F.IMSTRN,*NE,SVK006
     C**************************************************************************
     C     S034          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK006        KTCO02
     C     K0013         READE     IMSTRN                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S035                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - Process To Reset File Pointer(EOF) - IMSTRN
     C**************************************************************************
     C     S035          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IMSTRN
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0007        KTCO02
     C     K0013         SETGT     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(15)        MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - SETLL D.SECURTY,F.WAREHED,SVK008,SVK06
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   MOVE      'N'           SWRD04                         RD.SW.SECITP    IMST
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C*
     C                   MOVEL     SVK008        KHCO01
     C                   MOVEL     SVK008        HD0006                         Company number
     C                   MOVEL     SVK008        RN0010                         Company number
     C                   MOVEL     SVK06         KHWH02
     C                   MOVEL     SVK06         HHWHSE                         Warehouse Number
     C                   MOVEL     SVK06         WHWHSE                         Warehouse Number
     C*
     C     K0009         SETLL     WAREHED                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - GETREC D.SECURTY,F.WAREHED,*PV,SVK008
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK008        KHCO01
     C     K0014         READPE    WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S038                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S038   - Process To Reset File Pointer(BOF) - WAREHED
     C**************************************************************************
     C     S038          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WAREHED   SECI
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0010        KHCO01
     C     K0014         SETLL     WAREHED
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(14)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - GETREC D.SECURTY,F.WAREHED,*NE,SVK008
     C**************************************************************************
     C     S039          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK008        KHCO01
     C     K0014         READE     WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.WAREHED   SECI
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S040                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - Process To Reset File Pointer(EOF) - WAREHED
     C**************************************************************************
     C     S040          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.WAREHED   SECI
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.WAREHED   SECI
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0010        KHCO01
     C     K0014         SETGT     WAREHED
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(15)        MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for SECIMS
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XSUSER        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSUSER'      FLDNAM
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
     C                   MOVEL     'FLD0064'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XSADD         IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XSADD         OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSADD'       FLDNAM
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
     C                   MOVEL     'FLD0002'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XSDEL         IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XSDEL         OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSDEL'       FLDNAM
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
     C                   MOVEL     'FLD0009'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XSMAIN        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XSMAIN        OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSMAIN'      FLDNAM
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
     C                   MOVEL     'FLD0025'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XSENQ         IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XSENQ         OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSENQ'       FLDNAM
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
     C                   MOVEL     'FLD0013'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XSSTKU        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XSSTKU        OREQ      A1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSSTKU'      FLDNAM
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
     C                   MOVEL     'FLD0050'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0002         CHAIN     WAREHED                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XSWHSE        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XSWHSE'      FLDNAM
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
     C                   MOVEL     'FIL0068'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
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
     C**************************************************************************
     C* S004V - Detail Screen for SECITP
     C* Validation subroutine for -- SC0004
     C**************************************************************************
     C     S004V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     K0005         CHAIN     IMSTRN                             90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTTRNC'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
     C     EXISTF        IFEQ      1                                            Field existence chec
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'FIL0058'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
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
     C     STS01         IFEQ      1218                                         LOCK(SYS)-SECIMS
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
     C     STS04         IFEQ      1218                                         LOCK(SYS)-SECITP
     C     STS04         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK04                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK04                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            SECIMS
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
     C     WFILE#        IFEQ      3                                            WAREHED
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
     C     WFILE#        IFEQ      4                                            SECITP
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
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     XSADD         USADD                          Add
     C                   MOVEL     WK0002        RN0008                         Company number
     C                   MOVEL     XSDEL         USDEL                          Delete
     C                   MOVEL     XSENQ         USENQ                          Enquiry
     C                   MOVEL     XSMAIN        USMAIN                         Amend
     C                   MOVEL     XSSTKU        USSTKU                         Stock take Update
     C                   MOVEL     XSUGRP        USUGRP                         Group User
     C                   MOVEL     XSUSER        USUSER                         User
     C                   MOVEL     XSWHSE        USWHSE                         Allowed Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - SECITP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     WK0003        RN0009                         Company number
     C                   MOVEL     XTTRNC        UTTRNC                         Transaction Type
     C                   MOVEL     WTUSER        UTUSER                         User
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     USADD         XSADD                          Add
     C                   MOVEL     RN0008        WK0002                         Company number
     C                   MOVEL     USDEL         XSDEL                          Delete
     C                   MOVEL     USENQ         XSENQ                          Enquiry
     C                   MOVEL     USMAIN        XSMAIN                         Amend
     C                   MOVEL     USSTKU        XSSTKU                         Stock take Update
     C                   MOVEL     USUGRP        XSUGRP                         Group User
     C                   MOVEL     USUSER        XSUSER                         User
     C                   MOVEL     USWHSE        XSWHSE                         Allowed Warehouse
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0008        HD0003                         Company number
     C                   MOVEL     USUSER        HSUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0010        WK0004                         Company number
     C                   MOVEL     RN0011        WK0005                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        WK0006                         Warehouse Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0010        HD0006                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECITP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0009        WK0003                         Company number
     C                   MOVEL     UTTRNC        XTTRNC                         Transaction Type
     C                   MOVEL     UTUSER        WTUSER                         User
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0009        HD0004                         Company number
     C                   MOVEL     UTUSER        HTUSER                         User
     C                   MOVEL     UTTRNC        HD0005                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0007        WK0001                         Company number
     C                   MOVEL     TTDESC        XTDESC                         Description
     C                   MOVEL     TTTRNC        WTTRNC                         Transaction Type
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0007        HD0002                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
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
Record deleted from file IMS User allowed types      UT
No record found to delete from file IMS User allowed types      UT
Record deleted from file IMS User Security           US
No record found to delete from file IMS User Security           US
Record update for file IMS User Security           US
Unable to update record for file IMS User Security           US
Record added to file IMS User Security           US
Unable to add record to file IMS User Security           US
Record added to file IMS User allowed types      UT
Unable to add record to file IMS User allowed types      UT
The beginning of the file was reached
The end of the file was reached
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    XSWHSE    000009110913
SC0004    XTTRNC    000005060507
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  19      19
SC0002    XSADD     0000  02      02  03
SC0002    XSDEL     0000  04      04  05
SC0002    XSENQ     0000  06      06  07
SC0002    XSMAIN    0000  08      08  09
SC0002    XSSTKU    0000  10      10  11
SC0002    XSUSER    0000  1416    14  15
SC0002    XSWHSE    0000  17      17  18
SC0003    XYDESC    0000  05      05
SC0004    XYDESC    0000  03      03
SC0004    XTTRNC    0000  0102    01
SC0001    FL0001    0000  0103    010402               Y
SC0002    XSUGRP    0000  12      12  13
SC0002    IFIELDS   0000    01
SC0003    FL0002    0000  0103    010402               Y
SC0005    T01       0001            0201
SC0005    T01       0002            0403
SC0005    T01       0003            0605
SC0005    T01       0004            0807
SC0005    T01       0005            1009
SC0006    T04       0001            0201
SC0006    T04       0002            0403
SC0006    T04       0003            0605
SC0006    T04       0004            0807
SC0006    T04       0005            1009
