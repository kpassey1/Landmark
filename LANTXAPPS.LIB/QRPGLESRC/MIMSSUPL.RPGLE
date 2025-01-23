     F/TITLE MIMSSUPL      Work with Suppliers
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MIMSSUPL
     F*  Application ID      -    MIMSSUPL
     F*  Application Name    -         Work with Suppliers
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  SUPLIER1    - (I/DISK   ) IMS Name seq
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  SUPLIER     - (U/DISK   ) IMS Supplier Master         SU
     F*  CCYCOD      - (I/DISK   ) IMS Currency Code           CC
     F*  MIMSSUPLD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCALPH     - List Screen for SUPLIER
     F*
     F*  01     - SCR001S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0002 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0002 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0002 : DSPATR(ND)
     F*  05     - SCR001S1 / SUNAME : DSPATR(PC)
     F*  05     - SCR001S1 / SUNAME : DSPATR(RI)
     F*  06     - SCR001S1 / RN0020 : DSPATR(PC)
     F*  06     - SCR001S1 / RN0020 : DSPATR(RI)
     F*  07     - SCR001 / CYDESC : DSPATR(PC)
     F*  07     - SCR001 / CYDESC : DSPATR(RI)
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
     F*  SC0001     - List Screen for SUPLIER
     F*
     F*  01     - SCR002S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR002S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR002S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR002S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR002 / CYDESC : DSPATR(PC)
     F*  05     - SCR002 / CYDESC : DSPATR(RI)
     F*  63     - SCR002C1 SFLDSPCTL
     F*  64     - SCR002C1 SFLDSP
     F*  65     - SCR002S1 SFLNXTCHG
     F*  66     - SCR002C1 SFLINZ
     F*  80     - SCR002S1 / FL0001 : DSPATR(PC)
     F*  99     - SCR002 OVERLAY
     F* N63     - SCR002C1 SFLCLR
     F* N64     - SCR002C1 ERASE(SCR002S1)
     F* N67     - SCR002C1 SFLEND
     F* N79     - SCR002 PUTOVR
     F* N79     - SCR002C1 PUTOVR
     F*
     F*  SC0002     - Detail Screen for SUPLIER
     F*
     F*  01     - SCR003 / RN0008 : DSPATR(PR)
     F*  01     - SCR003 / RN0010 : DSPATR(PR)
     F*  01     - SCR003 / SUCURR : DSPATR(PR)
     F*  01     - SCR003 / SUFAX : DSPATR(PR)
     F*  01     - SCR003 / SULIN1 : DSPATR(PR)
     F*  01     - SCR003 / SULIN2 : DSPATR(PR)
     F*  01     - SCR003 / SULIN3 : DSPATR(PR)
     F*  01     - SCR003 / SULIN4 : DSPATR(PR)
     F*  01     - SCR003 / SULIN5 : DSPATR(PR)
     F*  01     - SCR003 / SULIN6 : DSPATR(PR)
     F*  01     - SCR003 / SUNAME : DSPATR(PR)
     F*  01     - SCR003 / RN0012 : DSPATR(PR)
     F*  01     - SCR003 / RN0014 : DSPATR(PR)
     F*  02     - SCR003 / RN0008 : DSPATR(UL)
     F*  02     - SCR003 / RN0010 : DSPATR(UL)
     F*  02     - SCR003 / SUCURR : DSPATR(UL)
     F*  02     - SCR003 / SUFAX : DSPATR(UL)
     F*  02     - SCR003 / SULIN1 : DSPATR(UL)
     F*  02     - SCR003 / SULIN2 : DSPATR(UL)
     F*  02     - SCR003 / SULIN3 : DSPATR(UL)
     F*  02     - SCR003 / SULIN4 : DSPATR(UL)
     F*  02     - SCR003 / SULIN5 : DSPATR(UL)
     F*  02     - SCR003 / SULIN6 : DSPATR(UL)
     F*  02     - SCR003 / SUNAME : DSPATR(UL)
     F*  02     - SCR003 / RN0012 : DSPATR(UL)
     F*  02     - SCR003 / RN0014 : DSPATR(UL)
     F*  03     - SCR003 / RN0009 : DSPATR(PR)
     F*  04     - SCR003 / RN0009 : DSPATR(UL)
     F*  05     - SCR003 / RN0012 : DSPATR(PC)
     F*  05     - SCR003 / RN0012 : DSPATR(RI)
     F*  06     - SCR003 / RN0013 : DSPATR(PC)
     F*  06     - SCR003 / RN0013 : DSPATR(RI)
     F*  07     - SCR003 / RN0013 : DSPATR(PR)
     F*  08     - SCR003 / RN0013 : DSPATR(UL)
     F*  09     - SCR003 / SUCURR : DSPATR(PC)
     F*  09     - SCR003 / SUCURR : DSPATR(RI)
     F*  10     - SCR003 / SULIN1 : DSPATR(PC)
     F*  10     - SCR003 / SULIN1 : DSPATR(RI)
     F*  11     - SCR003 / SUNAME : DSPATR(PC)
     F*  11     - SCR003 / SUNAME : DSPATR(RI)
     F*  12     - SCR003 / CYDESC : DSPATR(PC)
     F*  12     - SCR003 / CYDESC : DSPATR(RI)
     F*  99     - SCR003 OVERLAY
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0003     - Valid Currencies
     F*
     F*  01     - SCR004 / T01 : DSPATR(PR)
     F*  02     - SCR004 / T01 : DSPATR(ND)
     F*  03     - SCR004 / T01 : DSPATR(PR)
     F*  04     - SCR004 / T01 : DSPATR(ND)
     F*  05     - SCR004 / T01 : DSPATR(PR)
     F*  06     - SCR004 / T01 : DSPATR(ND)
     F*  07     - SCR004 / T01 : DSPATR(PR)
     F*  08     - SCR004 / T01 : DSPATR(ND)
     F*  09     - SCR004 / T01 : DSPATR(PR)
     F*  10     - SCR004 / T01 : DSPATR(ND)
     F*  80     - SCR004 / T01 : DSPATR(PC)
     F*  80     - SCR004 / T01 : DSPATR(PC)
     F*  80     - SCR004 / T01 : DSPATR(PC)
     F*  80     - SCR004 / T01 : DSPATR(PC)
     F*  80     - SCR004 / T01 : DSPATR(PC)
     F* N79     - SCR004 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for SUPLIER
     F* S002 - List Screen for SUPLIER
     F* S003 - Detail Screen for SUPLIER
     F* S004 - Valid Currencies
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S500 - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S501 - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S502 - SCRN SUB
     F* S03ABR - SCRN SUB
     F* S03AFR - SCRN SUB
     F* S03ALD - SCRN SUB
     F* SUPC - Converts lowercase characters to uppercase.
     F* SMSG - calls message handling program to either clear, add, or
     F* S005   - GETREC d.company,f.company,*eq,prcoyno
     F* S006   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVK002
     F* S007   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKalp
     F* S008   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKALP,SVK002,SVK003
     F* S009   - SETLL D.SUPLIER,F.SUPLIER,SVK001,SVK002,SVK003
     F* S010   - GETREC D.SUPLIER,F.SUPLIER,*lock,*eq,SVK001,SVK002,SVK003
     F* S011   - GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     F* S012   - GETREC D.SUPLIER,F.SUPLIER,*eq,SVK001,SVK002,SVK003
     F* S013   - DELETE D.SUPLIER,F.SUPLIER
     F* S014   - UPDATE D.SUPLIER,F.SUPLIER
     F* S015   - WRITE D.SUPLIER,F.SUPLIER
     F* S016   - GETBLK D.SUPLIER,F.SUPLIER,*PV,prcoyno
     F* S017   - Process To Reset File Pointer(BOF) - SUPLIER
     F* S018   - Process To Reset File Pointer(EOF) - SUPLIER
     F* S019   - GETBLK D.SUPLIER1,F.SUPLIER1,*PV,prcoyno
     F* S020   - Process To Reset File Pointer(BOF) - SUPLIER1
     F* S021   - Process To Reset File Pointer(EOF) - SUPLIER1
     F* S022   - GETREC D.SUPLIER,F.SUPLIER,F.CCYCOD,*EQ,SUCOYNO,SUSUPPN,SUBRNBR
     F* S023   - SETLL D.SUPLIER,F.CCYCOD,SVK004,SVK03
     F* S024   - GETREC D.SUPLIER,F.CCYCOD,*PV,SVK004
     F* S025   - Process To Reset File Pointer(BOF) - CCYCOD
     F* S026   - GETREC D.SUPLIER,F.CCYCOD,*NE,SVK004
     F* S027   - Process To Reset File Pointer(EOF) - CCYCOD
     F* S003V - Detail Screen for SUPLIER
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
     FMIMSSUPLD CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR002S1:RRN02)
     F                                     INFDS(DSPFDS)
     FSUPLIER1  IF   E           K DISK
     F                                     RENAME(SUPLIERF:FMT001)
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FCCYCOD    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FSUPLIER   UF A E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D WKA             S              1    DIM(256)                             Alpha wrk array
     D A01             S              3    DIM(12)
     D A02             S              6    DIM(12)
     D A03             S              3    DIM(12)
     D B01             S              3    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(9) CTDATA PERRCD(1)              Alpha constants i
     D DA4             S             24    DIM(4) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(4) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(22) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(22) ALT(DA1)
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
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
     D C0005           C                   CONST('Invalid action choic-
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
     D  T02                    1     15    DIM(5)
     D  T02001                 1      3
     D  T02002                 4      6
     D  T02003                 7      9
     D  T02004                10     12
     D  T02005                13     15
     D @DS006          DS
     D  T03                    1    200    DIM(5)
     D  T03001                 1     40
     D  T03002                41     80
     D  T03003                81    120
     D  T03004               121    160
     D  T03005               161    200
     ICCYCODF
     I              CCCOYNO                     RN0001
     ICOMPANYF
     I              CYCOYNO                     RN0002
     I              CYEMPCOL                    RN0003
     I              CYEMPHEAD                   RN0004
     I              CYPRDHEAD                   RN0005
     I              CYREFHEAD                   RN0006
     I              CYSDESC                     RN0007
     ISUPLIERF
     I              SUALPHA                     RN0008
     I              SUBRNBR                     RN0009
     I              SUCONNAM                    RN0010
     I              SUCOYNO                     RN0011
     I              SUPSTCD                     RN0012
     I              SUSUPPN                     RN0013
     I              SUTELEPH                    RN0014
     IFMT001
     I              SUALPHA                     RN0015
     I              SUBRNBR                     RN0016
     I              SUCONNAM                    RN0017
     I              SUCOYNO                     RN0018
     I              SUPSTCD                     RN0019
     I              SUSUPPN                     RN0020
     I              SUTELEPH                    RN0021
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM004            3
     C                   PARM                    WKUSER
     C                   PARM                    PRACT
     C                   PARM                    PRALWD
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM004            3
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
     C                   KFLD                    KUCO01
     C                   KFLD                    KUAL02
     C*
     C     K0003         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUAL02
     C                   KFLD                    KUSU03
     C                   KFLD                    KUBR04
     C*
     C     K0004         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0005         KLIST
     C                   KFLD                    WK0005
     C                   KFLD                    XUCURR
     C*
     C     K0006         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUCU02
     C*
     C     K0007         KLIST
     C                   KFLD                    KUCO01
     C*
     C     K0008         KLIST
     C                   KFLD                    KCCO01
     C                   KFLD                    KCCU02
     C*
     C     K0009         KLIST
     C                   KFLD                    KCCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0001        WK0001                         Company number
     C     *LIKE         DEFINE    CCCURR        WCCURR                         Currency code
     C     *LIKE         DEFINE    RN0011        WK0005                         Company number
     C     *LIKE         DEFINE    RN0018        WK0011                         Company number
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    CCCURR        HCCURR
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0002        HD0002
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
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
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *BLANKS       FST03             3
     C                   MOVE      *BLANKS       F02001            3
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST03             3
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRACT             1
     C                   MOVE      *BLANKS       PRALWD            1
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *BLANKS       PRM002            6
     C                   MOVE      *BLANKS       PRM003            3
     C                   MOVE      *BLANKS       PSALPH           10
     C                   MOVE      *BLANKS       PS0102            6
     C                   MOVE      *BLANKS       PS0103            3
     C                   MOVE      *BLANKS       SVKALP           10
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002            6
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004            3
     C                   MOVE      *BLANKS       SVK005            3
     C                   MOVE      *BLANKS       SVK03             3
     C                   MOVE      *ZEROS        S03CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUAL02           10            SUALPHA
     C                   MOVE      *BLANKS       KUSU03            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR04            3            SUBRNBR
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       KUCU02            3            SUCURR
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KCCO01            3            CCCOYNO
     C                   MOVE      *BLANKS       KCCU02            3            CCCURR
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
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0022           30 9
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
     C                   MOVEL     'SCALPH'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SCALPH'      S001
     C     SCRNID        CASEQ     'SC0001'      S002
     C     SCRNID        CASEQ     'SC0002'      S003
     C     SCRNID        CASEQ     'SC0003'      S004
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
     C* S001 - List Screen for SUPLIER
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010000'     *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S005
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = prcoyno
     C                   MOVE      PRM004        SVK001
     C* SVKALP = ' '
     C                   MOVEL     *BLANKS       SVKALP
     C* Set file for list to first record in file
     C* SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVK002
     C*
     C                   EXSR      S006
     C*                                                               *
     C* Fill list Panel
     C* EXSUBR S01FWD
     C                   EXSR      S502
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
     C                   MOVEA     '000'         *IN(5)
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
     C*
     C* Number Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* GOTOSCR sc0001
     C                   MOVEL     'SC0001  '    SCRNID
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
     C                   MOVEL     'SCALPH  '    SID(SP)
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
     C* SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKalp
     C*
     C                   EXSR      S007
     C* EXSUBR S01FWD
     C                   EXSR      S502
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
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S01BKW
     C                   EXSR      S500
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
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S502
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
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C* *** Check field only if not passed as parm.
     C*                                                               *
     C* IF PSalph<>' '
     C     PSALPH        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVKALP = PSalph
     C                   MOVE      PSALPH        SVKALP
     C* Reset/clear reposition values to parms passed
     C* PSALPH = ' '
     C                   MOVEL     *BLANKS       PSALPH
     C* SVK002 = ' '
     C                   MOVEL     *BLANKS       SVK002
     C* SVK003 = ' '
     C                   MOVEL     *BLANKS       SVK003
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
     C* SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKALP,SVK002,SVK003
     C*
     C                   EXSR      S008
     C*                                                               *
     C* Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S502
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
     C* S002 - List Screen for SUPLIER
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S005
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* SUSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0007
     C* SUBRNBR = ' '
     C                   MOVEL     *BLANKS       WK0003
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = prcoyno
     C                   MOVE      PRM004        SVK001
     C* SVK002 = ' '
     C                   MOVEL     *BLANKS       SVK002
     C* SVK003 = ' '
     C                   MOVEL     *BLANKS       SVK003
     C* Set file for list to first record in file
     C* SETLL D.SUPLIER,F.SUPLIER,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S009
     C*                                                               *
     C* Fill list Panel
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
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
     C                   GOTO      $00299
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
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Alpha Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* GOTOSCR scalph
     C                   MOVEL     'SCALPH  '    SCRNID
     C                   GOTO      $00299
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
     C* SETLL D.SUPLIER,F.SUPLIER,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S009
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
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
     C                   GOTO      $00299
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S01BKW
     C                   EXSR      S01BKW
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
     C*     1. Check for selected records.
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
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
     C                   GOTO      $00299
     C                   END
     C* *** Check for reposition
     C* *** Check field only if not passed as parm.
     C*                                                               *
     C* IF (PS0103<>' ') | ps0102 <> ' '
     C     PS0103        IFNE      *BLANKS
     C     PS0102        ORNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK002 = PS0102
     C                   MOVE      PS0102        SVK002
     C* SVK003 = PS0103
     C                   MOVE      PS0103        SVK003
     C* Reset/clear reposition values to parms passed
     C* PS0102 = ' '
     C                   MOVEL     *BLANKS       PS0102
     C* PS0103 = ' '
     C                   MOVEL     *BLANKS       PS0103
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
     C* SETLL D.SUPLIER,F.SUPLIER,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S009
     C*                                                               *
     C* Fill Panel.
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - Detail Screen for SUPLIER
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* *** Check user allowed action             ibutes,
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
     C* IF pralwd = 'N'
     C     PRALWD        IFEQ      'N'
     C* DSPERR *NONE,'USR0001','ERRORS'
     C                   MOVEL     'USR0001'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00399
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
     C* SVK001 = SUCOYNO
     C                   MOVE      WK0005        SVK001
     C* SVK002 = SUSUPPN
     C                   MOVE      WK0007        SVK002
     C* SVK003 = SUBRNBR
     C                   MOVE      WK0003        SVK003
     C* SUSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0007
     C* SUBRNBR = ' '
     C                   MOVEL     *BLANKS       WK0003
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C* SULIN1 = ' '
     C                   MOVEL     *BLANKS       XULIN1
     C* SULIN2 = ' '
     C                   MOVEL     *BLANKS       XULIN2
     C* SULIN3 = ' '
     C                   MOVEL     *BLANKS       XULIN3
     C* SULIN4 = ' '
     C                   MOVEL     *BLANKS       XULIN4
     C* SULIN5 = ' '
     C                   MOVEL     *BLANKS       XULIN5
     C* SULIN6 = ' '
     C                   MOVEL     *BLANKS       XULIN6
     C* SUALPHA = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* SUPSTCD = ' '
     C                   MOVEL     *BLANKS       WK0006
     C* SUCONNAM = ' '
     C                   MOVEL     *BLANKS       WK0004
     C* SUTELEPH = ' '
     C                   MOVEL     *BLANKS       WK0008
     C* SUFAX = ' '
     C                   MOVEL     *BLANKS       XUFAX
     C* SUCURR = ' '
     C                   MOVEL     *BLANKS       XUCURR
     C* CCDESC = ' '
     C                   MOVEL     *BLANKS       XCDESC
     C* SUCOYNO = SVK001
     C                   MOVE      SVK001        WK0005
     C* SUSUPPN = SVK002
     C                   MOVE      SVK002        WK0007
     C* SUBRNBR = SVK003
     C                   MOVE      SVK003        WK0003
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR SUPLIER.SUPLIER.SUSUPPN,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SUPLIER.SUPLIER.SUBRNBR,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.SUPLIER,F.SUPLIER,*lock,*eq,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S010
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.SUPLIER,F.SUPLIER)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK03         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.SUPLIER,F.SUPLIER)=*no
     C*  Status of last file I/O
     C     STS03         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     C*
     C                   EXSR      S011
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* GRPATR input,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'INPUT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.SUPLIER,F.SUPLIER,*lock,*eq,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S010
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.SUPLIER,F.SUPLIER)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK03         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.SUPLIER,F.SUPLIER)=*no
     C*  Status of last file I/O
     C     STS03         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     C*
     C                   EXSR      S011
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.SUPLIER,F.SUPLIER,*eq,SVK001,SVK002,SVK003
     C*
     C                   EXSR      S012
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.SUPLIER,F.SUPLIER)=*no
     C*  Status of last file I/O
     C     STS03         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Get secondary records if any were selected.
     C* GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     C*
     C                   EXSR      S011
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
     C* FLDATR SUPLIER.SUPLIER.SUSUPPN,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'WK0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR SUPLIER.SUPLIER.SUBRNBR,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'WK0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SUCOYNO = prcoyno
     C                   MOVE      PRM004        WK0005
     C* SUSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0007
     C* SUBRNBR = ' '
     C                   MOVEL     *BLANKS       WK0003
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C* SULIN1 = ' '
     C                   MOVEL     *BLANKS       XULIN1
     C* SULIN2 = ' '
     C                   MOVEL     *BLANKS       XULIN2
     C* SULIN3 = ' '
     C                   MOVEL     *BLANKS       XULIN3
     C* SULIN4 = ' '
     C                   MOVEL     *BLANKS       XULIN4
     C* SULIN5 = ' '
     C                   MOVEL     *BLANKS       XULIN5
     C* SULIN6 = ' '
     C                   MOVEL     *BLANKS       XULIN6
     C* SUALPHA = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* SUPSTCD = ' '
     C                   MOVEL     *BLANKS       WK0006
     C* SUCONNAM = ' '
     C                   MOVEL     *BLANKS       WK0004
     C* SUTELEPH = ' '
     C                   MOVEL     *BLANKS       WK0008
     C* SUFAX = ' '
     C                   MOVEL     *BLANKS       XUFAX
     C* SUCURR = ' '
     C                   MOVEL     *BLANKS       XUCURR
     C* CCDESC = ' '
     C                   MOVEL     *BLANKS       XCDESC
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* IF mode = 2 | mode = 6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'INPUT   '    FLDNAM
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
     C                   EXFMT     SCR003
     C                   MOVEA     '00'          *IN(5)
     C                   MOVEA     '0000'        *IN(9)
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
     C* IF %clf(SUPLIER.SUPLIER.SUCURR)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XUCURR  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* EXSCR SC0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* SUCURR = F02001
     C                   MOVE      F02001        XUCURR
     C* END                                                           *
     C                   END
     C* CCDESC = ' '
     C                   MOVEL     *BLANKS       XCDESC
     C* GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     C*
     C                   EXSR      S011
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
     C* RLSREC D.SUPLIER,F.SUPLIER
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   UNLOCK    SUPLIER                              91      RLS LCK SUPLIER
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform updates to file on function key 14
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* SVKALP = sualpha
     C                   MOVE      WK0002        SVKALP
     C* DELETE D.SUPLIER,F.SUPLIER
     C*
     C                   EXSR      S013
     C* IF %STS(D.SUPLIER,F.SUPLIER)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S003V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF MODE<>4
     C     MODE          IFNE      4
     C*                                                               *
     C* IF sualpha = ' '
     C     WK0002        IFEQ      *BLANKS
     C* SUALPHA = %ljf(Suname)
     C*  Left Justify field into result field
     C                   MOVEL     XUNAME        WK0002
     C* SUALPHA = %upc(sualpha)
     C*  Convert to Upper Case
     C                   MOVE      *BLANKS       AARG1
     C                   MOVEL     WK0002        AARG1
     C                   EXSR      SUPC
     C                   MOVEL     ARSLT         ARSLT0
     C                   MOVE      *BLANKS       WK0002
     C                   MOVEL     ARSLT0        WK0002
     C* END                                                           *
     C                   END
     C* SVKALP = sualpha
     C                   MOVE      WK0002        SVKALP
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.SUPLIER,F.SUPLIER
     C*
     C                   EXSR      S014
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.SUPLIER,F.SUPLIER
     C*
     C                   EXSR      S015
     C* ** Set keys for first record to display.
     C* SVK001 = SUCOYNO
     C                   MOVE      WK0005        SVK001
     C* SVK002 = SUSUPPN
     C                   MOVE      WK0007        SVK002
     C* SVK003 = SUBRNBR
     C                   MOVE      WK0003        SVK003
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.SUPLIER,F.SUPLIER)=*YES
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 - Valid Currencies
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST03 = ' '
     C                   MOVEL     *BLANKS       FST03
     C* LST03 = ' '
     C                   MOVEL     *BLANKS       LST03
     C* SVK03 = ' '
     C                   MOVEL     *BLANKS       SVK03
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK004 = SUCOYNO
     C                   MOVE      WK0005        SVK004
     C* S03CNT = 005
     C                   Z-ADD     005           S03CNT
     C* ** Array forward read.
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
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
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK03 = FST03
     C                   MOVE      FST03         SVK03
     C* ** Array Backwards read.
     C* EXSUBR S03ABR
     C                   EXSR      S03ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK03 = LST03
     C                   MOVE      LST03         SVK03
     C* ** Array Forward Read.
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I03 = 1
     C                   Z-ADD     1             Z4
     C* DOW (I03<=C03)&(T01(I03)<>1)
     C     Z4            DOWLE     Z2
     C     T01(Z4)       ANDNE     1
     C* I03 = I03+1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I03<=C03)&(T01(I03)=1)
     C     Z4            IFLE      Z2
     C     T01(Z4)       ANDEQ     1
     C* F02001 = B01(I03)
     C                   MOVE      B01(Z4)       F02001
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
     C     SID(CT)       IFEQ      'SCALPH'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0001'
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR002
     C                   WRITE     SCR002C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0002'
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0003'
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SUPLIER,F.SUPLIER,*PV,prcoyno
     C*
     C                   EXSR      S016
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD03        DOUNE     'Y'                                          RD.SW.SUPLIER   CCYC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       XUNAME
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0007         READE(N)  SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.SUPLIER   CCYC
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
     C* A001(C01) = SUCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0005        A01(Z1)
     C* A002(C01) = SUSUPPN
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0007        A02(Z1)
     C* A003(C01) = SUBRNBR
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      WK0003        A03(Z1)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       XUNAME
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
     C                   EXSR      S018                                         CHK EOF
     C*
     C     $S01BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - SCRN SUB
     C*****************************************************************
     C     S500          BEGSR
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* FLDATR FL0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCALPH  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SUPLIER1,F.SUPLIER1,*PV,prcoyno
     C*
     C                   EXSR      S019
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SUPLIER1
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0010
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0007         READE     SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HD0006                         Alpha Search
     C                   MOVEL     *BLANK        HD0009                         Supplier Number
     C                   MOVEL     *BLANK        HD0007                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR FL0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCALPH  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = suplier1.suplier1.SUCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0011        A01(Z1)
     C* A002(C01) = suplier1.suplier1.SUSUPPN
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0013        A02(Z1)
     C* A003(C01) = suplier1.suplier1.SUBRNBR
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      WK0010        A03(Z1)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0010
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
     C                   EXSR      S021                                         CHK EOF
     C*
     C     $S500         ENDSR
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
     C                   Z-ADD     *ZERO         Z3
     C* DOBLK D.SUPLIER
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
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C* I01 = I01+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=2)|(FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* SUCOYNO = A001(I01)
     C                   MOVE      A01(Z3)       WK0005
     C* SUSUPPN = A002(I01)
     C                   MOVE      A02(Z3)       WK0007
     C* SUBRNBR = A003(I01)
     C                   MOVE      A03(Z3)       WK0003
     C* ** Get record and any secondary records.
     C* GETREC D.SUPLIER,F.SUPLIER,F.CCYCOD,*EQ,SUCOYNO,SUSUPPN,SUBRNBR
     C*
     C                   EXSR      S022
     C* ** Display Screen.
     C* EXSCR SC0002
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   UPDATE    SCR002S1                             90
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN02         CHAIN     SCR002S1                           9091
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* FL0001 = 0
     C                   Z-ADD     *ZERO         FL0001
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0001<>0)&(UPDFLG=0)
     C     FL0001        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0001,'Invalid action choice'
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
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR002S1                             90
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
     C     $S01ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S501 - SCRN SUB
     C*****************************************************************
     C     S501          BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I01 = 0
     C                   Z-ADD     *ZERO         Z3
     C* DOBLK D.SUPLIER1
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
     C                   MOVEA     '000'         *IN(5)
     C* I01 = I01+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0002=2)|(FL0002=4)|(FL0002=5)
     C     FL0002        IFEQ      2
     C     FL0002        OREQ      4
     C     FL0002        OREQ      5
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* ** set keys from hidden key arrays.
     C* SUCOYNO = A001(I01)
     C                   MOVE      A01(Z3)       WK0005
     C* SUSUPPN = A002(I01)
     C                   MOVE      A02(Z3)       WK0007
     C* SUBRNBR = A003(I01)
     C                   MOVE      A03(Z3)       WK0003
     C* ** Get record and any secondary records.
     C* GETREC D.SUPLIER,F.SUPLIER,F.CCYCOD,*EQ,SUCOYNO,SUSUPPN,SUBRNBR
     C*
     C                   EXSR      S022
     C* ** Display Screen.
     C* EXSCR SC0002
     C                   ADD       1             SP
     C                   MOVEL     'SCALPH  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S501
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0002<>0)&(UPDFLG=0)
     C     FL0002        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0002,'Invalid action choice'
     C                   MOVEL     C0005         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCALPH  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR001S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '000'         *IN(5)
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
     C     $S501         ENDSR
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SUPLIER,F.SUPLIER,*Ne,prcoyno
     C*
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD03        DOUNE     'Y'                                          RD.SW.SUPLIER   CCYC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       XUNAME
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0007         READE(N)  SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.SUPLIER   CCYC
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
     C* A001(C01) = SUCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0005        A01(Z1)
     C* A002(C01) = SUSUPPN
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0007        A02(Z1)
     C* A003(C01) = SUBRNBR
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      WK0003        A03(Z1)
     C* ** Set any work fields to values in
     C* ** secondary file fields.
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN01
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN02                          INCREMENT RRN
     C                   WRITE     SCR002S1                             90
     C                   ADD       1             XRN02                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN02         NXTRRN
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       WK0007
     C                   MOVEL     *BLANKS       WK0003
     C                   MOVEL     *BLANKS       XUNAME
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
     C                   EXSR      S018                                         RESET FP
     C* IF c01 = 0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S01BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01FW
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C*
     C     $S01FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S502 - SCRN SUB
     C*****************************************************************
     C     S502          BEGSR
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
     C* A003 = ' '
     C                   MOVEA     *BLANKS       A03
     C* FLDATR FL0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCALPH  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.SUPLIER1,F.SUPLIER1,*Ne,prcoyno
     C*
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SUPLIER1
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0010
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0007         READE     SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HD0006                         Alpha Search
     C                   MOVEL     *BLANK        HD0009                         Supplier Number
     C                   MOVEL     *BLANK        HD0007                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR FL0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCALPH  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = suplier1.suplier1.SUCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0011        A01(Z1)
     C* A002(C01) = suplier1.suplier1.SUSUPPN
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      WK0013        A02(Z1)
     C* A003(C01) = suplier1.suplier1.SUBRNBR
     C                   MOVE      *BLANKS       A03(Z1)
     C                   MOVE      WK0010        A03(Z1)
     C* ** Set any work fields to values in
     C* ** secondary file fields.
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN02
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN01                          INCREMENT RRN
     C                   WRITE     SCR001S1                             90
     C                   ADD       1             XRN01                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN01         NXTRRN
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0010
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
     C                   EXSR      S021                                         RESET FP
     C* IF c01 = 0
     C     Z1            IFEQ      *ZERO
     C* EXSUBR s01bkw
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S502
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C*
     C     $S502         ENDSR
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
     C* SETLL D.SUPLIER,F.CCYCOD,SVK004,SVK03
     C*
     C                   EXSR      S023
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.SUPLIER,F.CCYCOD,*PV,SVK004
     C*
     C                   EXSR      S024
     C* DOW (C03<S03CNT)&%STS(D.SUPLIER,F.CCYCOD)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C     RN0022        IFEQ      XYES
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0022        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0022
     C                   Z-ADD     RN0022        Z2
     C* GETREC D.SUPLIER,F.CCYCOD,*PV,SVK004
     C*
     C                   EXSR      S024
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
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
     C     RN0022        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C                   Z-ADD     RN0022        RSLT01
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
     C* SETLL D.SUPLIER,F.CCYCOD,SVK004,SVK03
     C*
     C                   EXSR      S023
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
     C* T01 = 0
     C                   Z-ADD     *ZERO         T01
     C* B01 = ' '
     C                   MOVEA     *BLANKS       B01
     C* T02 = ' '
     C                   MOVEA     *BLANKS       T02
     C* T03 = ' '
     C                   MOVEA     *BLANKS       T03
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* ** protect select field
     C* DOW C03<S03CNT
     C     Z2            DOWLT     S03CNT
     C* C03 = C03+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* FLDATR T01(C03),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* GETREC D.SUPLIER,F.CCYCOD,*NE,SVK004
     C*
     C                   EXSR      S026
     C* DOW (C03<S03CNT)&%STS(D.SUPLIER,F.CCYCOD)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C     RN0022        IFEQ      XYES
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0022        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0022
     C                   Z-ADD     RN0022        Z2
     C* ** Unprotect select field.
     C* FLDATR T01(C03),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C03) = SUPLIER.CCYCOD.CCCURR
     C                   MOVE      *BLANKS       B01(Z2)
     C                   MOVE      WCCURR        B01(Z2)
     C* ** load screen array.
     C* T02(C03) = SUPLIER.CCYCOD.CCCURR
     C                   MOVE      *BLANKS       T02(Z2)
     C                   MOVE      WCCURR        T02(Z2)
     C* T03(C03) = SUPLIER.CCYCOD.CCDESC
     C                   MOVE      *BLANKS       T03(Z2)
     C                   MOVE      XCDESC        T03(Z2)
     C* ** Save first record on screen.
     C* IF C03=1
     C     Z2            IFEQ      1
     C* FST03 = B01(C03)
     C                   MOVE      B01(Z2)       FST03
     C* END                                                           *
     C                   END
     C* IF C03<S03CNT
     C     Z2            IFLT      S03CNT
     C* GETREC D.SUPLIER,F.CCYCOD,*NE,SVK004
     C*
     C                   EXSR      S026
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
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
     C     RN0022        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0022
     C                   ELSE
     C                   Z-ADD     0             RN0022
     C                   END
     C                   Z-ADD     RN0022        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C03>0
     C     Z2            IFGT      *ZERO
     C* LST03 = B01(C03)
     C                   MOVE      B01(Z2)       LST03
     C* END                                                           *
     C                   END
     C*
     C     $S03AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* SUPC - Converts lowercase characters to uppercase.
     C*
     C* FUNCTION:    UPPER_CASE (ALPHA)
     C*****************************************************************
     C     SUPC          BEGSR
     C                   BITON     '07'          LIT#LA            1
     C                   BITOFF    '123456'      LIT#LA
     C                   BITON     '047'         LIT#LI            1
     C                   BITOFF    '12356'       LIT#LI
     C                   BITON     '037'         LIT#LJ            1
     C                   BITOFF    '12456'       LIT#LJ
     C                   BITON     '0347'        LIT#LR            1
     C                   BITOFF    '1256'        LIT#LR
     C                   BITON     '026'         LIT#LS            1
     C                   BITOFF    '13457'       LIT#LS
     C                   BITON     '0247'        LIT#LZ            1
     C                   BITOFF    '1356'        LIT#LZ
     C*
     C                   MOVEA     AARG1         WKA
     C                   DO        256           C1
     C* a to i
     C*          WKA,C1    IFGE 'a'
     C*          WKA,C1    ANDLE'i'
     C     WKA(C1)       IFGE      LIT#LA
     C     WKA(C1)       ANDLE     LIT#LI
     C                   BITON     '1'           WKA(C1)
     C                   END
     C* j to r
     C*          WKA,C1    IFGE 'j'
     C*          WKA,C1    ANDLE'r'
     C     WKA(C1)       IFGE      LIT#LJ
     C     WKA(C1)       ANDLE     LIT#LR
     C                   BITON     '1'           WKA(C1)
     C                   END
     C* s to z
     C*          WKA,C1    IFGE 's'
     C*          WKA,C1    ANDLE'z'
     C     WKA(C1)       IFGE      LIT#LS
     C     WKA(C1)       ANDLE     LIT#LZ
     C                   BITON     '1'           WKA(C1)
     C                   END
     C*
     C                   END
     C                   MOVEA     WKA           ARSLT
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
     C* S005   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S005          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM004        KYCO01
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
     C* S006   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVK002
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   MOVEL     *LOVAL        HD0008                         Company number
     C                   MOVEL     *LOVAL        HD0006                         Alpha Search
     C                   MOVEL     *LOVAL        HD0009                         Supplier Number
     C                   MOVEL     *LOVAL        HD0007                         Branch Number
     C*
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     SVK001        HD0008                         Company number
     C                   MOVEL     SVK001        RN0018                         Company number
     C                   MOVEL     SVK002        KUAL02
     C                   MOVEL     SVK002        HD0006                         Alpha Search
     C                   MOVEL     SVK002        RN0015                         Alpha Search
     C*
     C     K0002         SETLL     SUPLIER1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S007   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKalp
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   MOVEL     *LOVAL        HD0008                         Company number
     C                   MOVEL     *LOVAL        HD0006                         Alpha Search
     C                   MOVEL     *LOVAL        HD0009                         Supplier Number
     C                   MOVEL     *LOVAL        HD0007                         Branch Number
     C*
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     SVK001        HD0008                         Company number
     C                   MOVEL     SVK001        RN0018                         Company number
     C                   MOVEL     SVKALP        KUAL02
     C                   MOVEL     SVKALP        HD0006                         Alpha Search
     C                   MOVEL     SVKALP        RN0015                         Alpha Search
     C*
     C     K0002         SETLL     SUPLIER1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - SETLL D.SUPLIER1,F.SUPLIER1,SVK001,SVKALP,SVK002,SVK003
     C**************************************************************************
     C     S008          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   MOVEL     *LOVAL        HD0008                         Company number
     C                   MOVEL     *LOVAL        HD0006                         Alpha Search
     C                   MOVEL     *LOVAL        HD0009                         Supplier Number
     C                   MOVEL     *LOVAL        HD0007                         Branch Number
     C*
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     SVK001        HD0008                         Company number
     C                   MOVEL     SVK001        RN0018                         Company number
     C                   MOVEL     SVKALP        KUAL02
     C                   MOVEL     SVKALP        HD0006                         Alpha Search
     C                   MOVEL     SVKALP        RN0015                         Alpha Search
     C                   MOVEL     SVK002        KUSU03
     C                   MOVEL     SVK002        HD0009                         Supplier Number
     C                   MOVEL     SVK002        RN0020                         Supplier Number
     C                   MOVEL     SVK003        KUBR04
     C                   MOVEL     SVK003        HD0007                         Branch Number
     C                   MOVEL     SVK003        RN0016                         Branch Number
     C*
     C     K0003         SETLL     SUPLIER1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - SETLL D.SUPLIER,F.SUPLIER,SVK001,SVK002,SVK003
     C**************************************************************************
     C     S009          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   MOVE      'N'           SWRD04                         RD.SW.CCYCOD
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HD0005                         Supplier Number
     C                   MOVEL     *LOVAL        HD0003                         Branch Number
     C*
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     SVK001        HD0004                         Company number
     C                   MOVEL     SVK001        RN0011                         Company number
     C                   MOVEL     SVK002        KUSU02
     C                   MOVEL     SVK002        HD0005                         Supplier Number
     C                   MOVEL     SVK002        RN0013                         Supplier Number
     C                   MOVEL     SVK003        KUBR03
     C                   MOVEL     SVK003        HD0003                         Branch Number
     C                   MOVEL     SVK003        RN0009                         Branch Number
     C*
     C     K0004         SETLL     SUPLIER                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - GETREC D.SUPLIER,F.SUPLIER,*lock,*eq,SVK001,SVK002,SVK003
     C**************************************************************************
     C     S010          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     SVK002        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     SVK003        KUBR03
     C     K0004         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETREC D.SUPLIER,F.CCYCOD,*eq,SUCOYNO,SUCURR
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     WK0005        KUCO01
     C                   MOVEL     *BLANK        KUCU02
     C                   MOVEL     XUCURR        KUCU02
     C     K0006         CHAIN     CCYCOD                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.CCYCOD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.SUPLIER,F.SUPLIER,*eq,SVK001,SVK002,SVK003
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK001        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     SVK002        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     SVK003        KUBR03
     C     K0004         CHAIN(N)  SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - DELETE D.SUPLIER,F.SUPLIER
     C**************************************************************************
     C     S013          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS03
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     WK0005        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     WK0007        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     WK0003        KUBR03
     C     K0004         SETLL     SUPLIER                                      SETLL  SUPLIER
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - SUPLIER
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0004         READE     SUPLIER                              9190    READE  SUPLIER
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    SUPLIER                              91      DELETE SUPLIER
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(2)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(3)         MSGDTA                         No record found to d
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
     C     K0004         SETLL     SUPLIER                                      RESUME FILE POINTER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - UPDATE D.SUPLIER,F.SUPLIER
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     HD0004        KUCO01
     C                   MOVEL     *BLANK        KUSU02                         Supplier Number
     C                   MOVEL     HD0005        KUSU02
     C                   MOVEL     *BLANK        KUBR03                         Branch Number
     C                   MOVEL     HD0003        KUBR03
     C     K0004         CHAIN     SUPLIER                            9091      CHAIN  SUPLIER
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0008        IFEQ      WK0002
     C     RN0009        ANDEQ     WK0003
     C     RN0010        ANDEQ     WK0004
     C     RN0011        ANDEQ     WK0005
     C     SUCURR        ANDEQ     XUCURR
     C     SUFAX         ANDEQ     XUFAX
     C     SULIN1        ANDEQ     XULIN1
     C     SULIN2        ANDEQ     XULIN2
     C     SULIN3        ANDEQ     XULIN3
     C     SULIN4        ANDEQ     XULIN4
     C     SULIN5        ANDEQ     XULIN5
     C     SULIN6        ANDEQ     XULIN6
     C     SUNAME        ANDEQ     XUNAME
     C     RN0012        ANDEQ     WK0006
     C     RN0013        ANDEQ     WK0007
     C     RN0014        ANDEQ     WK0008
     C                   UNLOCK    SUPLIER                              91      RLS LCK SUPLIER
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    SUPLIERF                             90      UPDATE SUPLIER
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
     C* S015   - WRITE D.SUPLIER,F.SUPLIER
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     SUPLIERF                             90      ADD REC TO SUPLIER
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(6)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(7)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETBLK D.SUPLIER,F.SUPLIER,*PV,prcoyno
     C**************************************************************************
     C     S016          BEGSR
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD03        DOUNE     'Y'                                          RD.SW.SUPLIER   CCYC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0007         READPE(N) SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S017                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - Process To Reset File Pointer(BOF) - SUPLIER
     C**************************************************************************
     C     S017          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.SUPLIER   CCYC
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0011        KUCO01
     C     K0007         SETLL     SUPLIER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - Process To Reset File Pointer(EOF) - SUPLIER
     C**************************************************************************
     C     S018          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.SUPLIER   CCYC
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0011        KUCO01
     C     K0007         SETGT     SUPLIER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(9)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETBLK D.SUPLIER1,F.SUPLIER1,*PV,prcoyno
     C**************************************************************************
     C     S019          BEGSR
     C*
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     PRM004        KUCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.SUPLIER1
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0007         READPE    SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HD0006                         Alpha Search
     C                   MOVEL     *BLANK        HD0009                         Supplier Number
     C                   MOVEL     *BLANK        HD0007                         Branch Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S020                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - Process To Reset File Pointer(BOF) - SUPLIER1
     C**************************************************************************
     C     S020          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0018        KUCO01
     C     K0007         SETLL     SUPLIER1
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - Process To Reset File Pointer(EOF) - SUPLIER1
     C**************************************************************************
     C     S021          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.SUPLIER1
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0018        KUCO01
     C     K0007         SETGT     SUPLIER1
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ02
     C                   END
     C                   MOVEL     A1(9)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - GETREC D.SUPLIER,F.SUPLIER,F.CCYCOD,*EQ,SUCOYNO,SUSUPPN,SUBRNBR
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     WK0005        KUCO01
     C                   MOVEL     *BLANK        KUSU02
     C                   MOVEL     WK0007        KUSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     WK0003        KUBR03
     C     K0004         CHAIN(N)  SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER   CCYC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCCO01                         Company number
     C                   MOVEL     RN0011        KCCO01
     C                   MOVEL     *BLANK        KCCU02
     C                   MOVEL     SUCURR        KCCU02
     C     K0008         CHAIN     CCYCOD                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.CCYCOD
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - SETLL D.SUPLIER,F.CCYCOD,SVK004,SVK03
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C*
     C                   MOVEL     SVK004        KCCO01
     C                   MOVEL     SVK004        HD0001                         Company number
     C                   MOVEL     SVK004        RN0001                         Company number
     C                   MOVEL     SVK03         KCCU02
     C                   MOVEL     SVK03         HCCURR                         Currency code
     C                   MOVEL     SVK03         CCCURR                         Currency code
     C*
     C     K0008         SETLL     CCYCOD                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - GETREC D.SUPLIER,F.CCYCOD,*PV,SVK004
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCCO01
     C                   MOVEL     SVK004        KCCO01
     C     K0009         READPE    CCYCOD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.CCYCOD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S025                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - Process To Reset File Pointer(BOF) - CCYCOD
     C**************************************************************************
     C     S025          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.CCYCOD
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCCO01                         Company number
     C                   MOVEL     RN0001        KCCO01
     C     K0009         SETLL     CCYCOD
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - GETREC D.SUPLIER,F.CCYCOD,*NE,SVK004
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCCO01
     C                   MOVEL     SVK004        KCCO01
     C     K0009         READE     CCYCOD                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.CCYCOD
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S027                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - Process To Reset File Pointer(EOF) - CCYCOD
     C**************************************************************************
     C     S027          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.CCYCOD
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.CCYCOD
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCCO01                         Company number
     C                   MOVEL     RN0001        KCCO01
     C     K0009         SETGT     CCYCOD
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(9)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S003V - Detail Screen for SUPLIER
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S003V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     WK0007        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0007'      FLDNAM
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
     C                   MOVEL     'FLD0056'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XUNAME        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XUNAME'      FLDNAM
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
     C                   MOVEL     'FLD0028'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XULIN1        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XULIN1'      FLDNAM
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
     C                   MOVEL     'FLD0021'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0006        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0006'      FLDNAM
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
     C                   MOVEL     'USR0032'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0005         CHAIN     CCYCOD                             90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XUCURR        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XUCURR'      FLDNAM
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
     C                   MOVEL     'FIL0073'     MSGID                          Message id.
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
     C     STS03         IFEQ      1218                                         LOCK(SYS)-SUPLIER
     C     STS03         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK03                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK03                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            SUPLIER1
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
     C     WFILE#        IFEQ      4                                            CCYCOD
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
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WK0002        RN0008                         Alpha Search
     C                   MOVEL     WK0003        RN0009                         Branch Number
     C                   MOVEL     WK0004        RN0010                         Contact name
     C                   MOVEL     WK0005        RN0011                         Company number
     C                   MOVEL     XUCURR        SUCURR                         Currency code
     C                   MOVEL     XUFAX         SUFAX                          Fax number
     C                   MOVEL     XULIN1        SULIN1                         Address
     C                   MOVEL     XULIN2        SULIN2                         Line 2
     C                   MOVEL     XULIN3        SULIN3                         Line 3
     C                   MOVEL     XULIN4        SULIN4                         Line 4
     C                   MOVEL     XULIN5        SULIN5                         Line 5
     C                   MOVEL     XULIN6        SULIN6                         Line 6
     C                   MOVEL     XUNAME        SUNAME                         Supplier name
     C                   MOVEL     WK0006        RN0012                         Post code
     C                   MOVEL     WK0007        RN0013                         Supplier Number
     C                   MOVEL     WK0008        RN0014                         Telephone number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0015        WK0009                         Alpha Search
     C                   MOVEL     RN0016        WK0010                         Branch Number
     C                   MOVEL     RN0018        WK0011                         Company number
     C                   MOVEL     SUNAME        WK0012                         Customer name
     C                   MOVEL     RN0020        WK0013                         Supplier Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0018        HD0008                         Company number
     C                   MOVEL     RN0015        HD0006                         Alpha Search
     C                   MOVEL     RN0020        HD0009                         Supplier Number
     C                   MOVEL     RN0016        HD0007                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0002        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0008        WK0002                         Alpha Search
     C                   MOVEL     RN0009        WK0003                         Branch Number
     C                   MOVEL     RN0010        WK0004                         Contact name
     C                   MOVEL     RN0011        WK0005                         Company number
     C                   MOVEL     SUCURR        XUCURR                         Currency code
     C                   MOVEL     SUFAX         XUFAX                          Fax number
     C                   MOVEL     SULIN1        XULIN1                         Address
     C                   MOVEL     SULIN2        XULIN2                         Line 2
     C                   MOVEL     SULIN3        XULIN3                         Line 3
     C                   MOVEL     SULIN4        XULIN4                         Line 4
     C                   MOVEL     SULIN5        XULIN5                         Line 5
     C                   MOVEL     SULIN6        XULIN6                         Line 6
     C                   MOVEL     SUNAME        XUNAME                         Supplier name
     C                   MOVEL     RN0012        WK0006                         Post code
     C                   MOVEL     RN0013        WK0007                         Supplier Number
     C                   MOVEL     RN0014        WK0008                         Telephone number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0011        HD0004                         Company number
     C                   MOVEL     RN0013        HD0005                         Supplier Number
     C                   MOVEL     RN0009        HD0003                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - CCYCOD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0001        WK0001                         Company number
     C                   MOVEL     CCCURR        WCCURR                         Currency code
     C                   MOVEL     CCDESC        XCDESC                         Description
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0001        HD0001                         Company number
     C                   MOVEL     CCCURR        HCCURR                         Currency code
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

Record deleted from file IMS Supplier Master         SU
No record found to delete from file IMS Supplier Master         SU
Record update for file IMS Supplier Master         SU
Unable to update record for file IMS Supplier Master         SU
Record added to file IMS Supplier Master         SU
Unable to add record to file IMS Supplier Master         SU
The beginning of the file was reached
The end of the file was reached
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    XUCURR    000013861388
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCALPH    XYDESC    0000  07      07
SCALPH    WK0012    0000  05      05
SCALPH    WK0013    0000  06      06
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  12      12
SC0002    XUCURR    0000  09      09
SC0002    XULIN1    0000  10      10
SC0002    XUNAME    0000  11      11
SC0002    WK0006    0000  05      05
SC0002    WK0007    0000  0608    06  07
SCALPH    FL0002    0000  0103    010402               Y
SC0001    FL0001    0000  0103    010402               Y
SC0002    WK0003    0000    04        03
SC0002    INPUT     0000    02        01
SC0003    T01       0001            0201
SC0003    T01       0002            0403
SC0003    T01       0003            0605
SC0003    T01       0004            0807
SC0003    T01       0005            1009
