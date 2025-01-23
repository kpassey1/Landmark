     F/TITLE MIPSITEM    Work with Supplier Items
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MIPSITEM
     F*  Application ID      -    MIPSITEM
     F*  Application Name    -       Work with Supplier Items
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  IPSITEM     - (U/DISK   ) IPS Supplied Items
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IPSCPYD     - (I/DISK   ) IPS Company Details         CD
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  ITMCLAS     - (I/DISK   ) IMS Item class parameters   IC
     F*  ITMTYP      - (I/DISK   ) IMS Item Type               TP
     F*  STANYS      - (I/DISK   ) IMS Stock analysis codes    SA
     F*  STIGRP      - (I/DISK   ) IMS Stock Inventory group   SI
     F*  STOKGRP     - (I/DISK   ) IMS Stock group codes       SG
     F*  STVGRP      - (I/DISK   ) IMS Stock value group       VG
     F*  UOM         - (I/DISK   ) IMS Unit of measure         UM
     F*  VATCOD      - (I/DISK   ) IMS VAT code
     F*  MIPSITEMD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCR001     - Initial list panel
     F*
     F*  01     - SCR001S1 / ACTION : DSPATR(PC)
     F*  01     - SCR001S1 / ACTION : DSPATR(RI)
     F*  02     - SCR001S1 / ACTION : DSPATR(PR)
     F*  03     - SCR001S1 / ACTION : DSPATR(UL)
     F*  04     - SCR001S1 / ACTION : DSPATR(ND)
     F*  05     - SCR001S1 / PIITEM : DSPATR(PC)
     F*  05     - SCR001S1 / PIITEM : DSPATR(RI)
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
     F*  SCR002     - Detail panel
     F*
     F*  01     - SCR002 / RN0014 : DSPATR(PR)
     F*  02     - SCR002 / RN0015 : DSPATR(PC)
     F*  02     - SCR002 / RN0015 : DSPATR(RI)
     F*  03     - SCR002 / RN0015 : DSPATR(PR)
     F*  04     - SCR002 / RN0015 : DSPATR(UL)
     F*  05     - SCR002 / RN0017 : DSPATR(PR)
     F*  06     - SCR002 / RN0021 : DSPATR(PC)
     F*  06     - SCR002 / RN0021 : DSPATR(RI)
     F*  07     - SCR002 / RN0021 : DSPATR(PR)
     F*  08     - SCR002 / RN0021 : DSPATR(UL)
     F*  09     - SCR002 / RN0022 : DSPATR(PR)
     F*  10     - SCR002 / RN0028 : DSPATR(PC)
     F*  10     - SCR002 / RN0028 : DSPATR(RI)
     F*  11     - SCR002 / RN0028 : DSPATR(PR)
     F*  12     - SCR002 / RN0028 : DSPATR(UL)
     F*  13     - SCR002 / PICNV : DSPATR(PR)
     F*  14     - SCR002 / PICOST : DSPATR(PR)
     F*  15     - SCR002 / PIDESC : DSPATR(PR)
     F*  16     - SCR002 / PIITEM : DSPATR(PC)
     F*  16     - SCR002 / PIITEM : DSPATR(RI)
     F*  17     - SCR002 / PIITEM : DSPATR(PR)
     F*  18     - SCR002 / PIITEM : DSPATR(UL)
     F*  19     - SCR002 / PILTIM : DSPATR(PC)
     F*  19     - SCR002 / PILTIM : DSPATR(RI)
     F*  20     - SCR002 / PILTIM : DSPATR(PR)
     F*  21     - SCR002 / PILTIM : DSPATR(UL)
     F*  22     - SCR002 / PIPYTD : DSPATR(PR)
     F*  23     - SCR002 / PIQFIX : DSPATR(PR)
     F*  24     - SCR002 / PIUOM : DSPATR(PR)
     F*  25     - SCR002 / PIWGT : DSPATR(PR)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     -         List of Items
     F*
     F*  01     - SCR003 / T04 : DSPATR(PR)
     F*  02     - SCR003 / T04 : DSPATR(ND)
     F*  03     - SCR003 / T04 : DSPATR(PR)
     F*  04     - SCR003 / T04 : DSPATR(ND)
     F*  05     - SCR003 / T04 : DSPATR(PR)
     F*  06     - SCR003 / T04 : DSPATR(ND)
     F*  07     - SCR003 / T04 : DSPATR(PR)
     F*  08     - SCR003 / T04 : DSPATR(ND)
     F*  09     - SCR003 / T04 : DSPATR(PR)
     F*  10     - SCR003 / T04 : DSPATR(ND)
     F*  80     - SCR003 / T04 : DSPATR(PC)
     F*  80     - SCR003 / T04 : DSPATR(PC)
     F*  80     - SCR003 / T04 : DSPATR(PC)
     F*  80     - SCR003 / T04 : DSPATR(PC)
     F*  80     - SCR003 / T04 : DSPATR(PC)
     F* N79     - SCR003 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - Initial list panel
     F* S002 - Detail panel
     F* S003 -         List of Items
     F* SREDSP -  Redisplay Windows within stack.
     F* S04ABR - SCRN SUB
     F* S04AFR - SCRN SUB
     F* S04ALD - SCRN SUB
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S004   - CLRSCR SCR001
     F* S005   - Process To Initialize SubFile - SCR001S1
     F* S006   - GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     F* S007   - SETLL D.IPSITEM,F.IPSITEM,SVK001,SVK002,SVK003,SVK004
     F* S008   - Process To Reset File Pointer(EOF) - IPSITEM
     F* S009   - GETBLK D.IPSITEM,F.IPSITEM,*PV,SVK001
     F* S010   - Process To Reset File Pointer(BOF) - IPSITEM
     F* S011   - GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     F* S012   - CLRSCR SCR002
     F* S013   - GETREC D.IPSITEM,F.IPSITEM,*lock,*eq,SVK001,SVK002,SVK003,SVK00
     F* S014   - GETREC D.IPSITEM,F.IPSITEM,*eq,SVK001,SVK002,SVK003,SVK004
     F* S015   - DELETE D.IPSITEM,F.IPSITEM
     F* S016   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     F* S017   - GETREC d.itmmast,*eq,COYNO#,piitem
     F* S018   - UPDATE D.IPSITEM,F.IPSITEM
     F* S019   - WRITE D.IPSITEM,F.IPSITEM
     F* S020   - SETLL D.STOKREQ,F.ITMMAST,SVK001,SVK04
     F* S021   - GETREC D.STOKREQ,F.ITMMAST,*PV,SVK001
     F* S022   - Process To Reset File Pointer(BOF) - ITMMAST
     F* S023   - GETREC D.STOKREQ,F.ITMMAST,*NE,SVK001
     F* S024   - Process To Reset File Pointer(EOF) - ITMMAST
     F* S002V - Detail panel
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
     FMIPSITEMD CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FIPSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMCLAS   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FITMTYP    IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FSTANYS    IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FSTIGRP    IF   E           K DISK
     F                                     RENAME(STIGRP:FMT001)
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FSTOKGRP   IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FSTVGRP    IF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FUOM       IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FVATCOD    IF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FIPSITEM   UF A E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D B02             S             15    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D A1              S             80    DIM(11) CTDATA PERRCD(1)             Alpha constants i
     D N1              S             30  9 DIM(2) CTDATA PERRCD(1)              Numeric constants
     D DA4             S             24    DIM(4) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(4) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(25) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(25) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D*
     D* Company Number
     D*
     D @DS001          DS             3
     D  COYNO#                 1      3
     D*
     D* KDPKEY3
     D*
     D @DS002          DS            27
     D  KDPKEY                 1     27
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
     D @DS003          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS004          DS
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
     D C0001           C                   CONST('Action must be 2, 4,-
     D                                      or 5')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Edit')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Record not found for-
     D                                      Delete')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('Record not found for-
     D                                      Display')
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
     D @DS006          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS007          DS
     D  T05                    1    100    DIM(5)
     D  T05001                 1     20
     D  T05002                21     40
     D  T05003                41     60
     D  T05004                61     80
     D  T05005                81    100
     D @DS008          DS
     D  T06                    1    200    DIM(5)
     D  T06001                 1     40
     D  T06002                41     80
     D  T06003                81    120
     D  T06004               121    160
     D  T06005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0002
     I              CYEMPCOL                    RN0003
     I              CYEMPHEAD                   RN0004
     I              CYPRDHEAD                   RN0005
     I              CYREFHEAD                   RN0006
     I              CYSDESC                     RN0007
     IIPSCPYDF
     I              CDAUDAM                     RN0008
     I              CDAUDGR                     RN0009
     I              CDAUDOR                     RN0010
     I              CDAUDPR                     RN0011
     I              CDAUDRE                     RN0012
     I              CDCOYNO                     RN0013
     IIPSITEMF
     I              PIBRNBR                     RN0014
     I              PICNVCDE                    RN0015
     I              PICOYNO                     RN0016
     I              PIPBRK1                     RN0017
     I              PIPBRK2                     RN0018
     I              PIPBRK3                     RN0019
     I              PIPBRK4                     RN0020
     I              PIPRCOD                     RN0021
     I              PIQBRK1                     RN0022
     I              PIQBRK2                     RN0023
     I              PIQBRK3                     RN0024
     I              PIQBRK4                     RN0025
     I              PISDESC                     RN0026
     I              PISPITM                     RN0027
     I              PISUPPN                     RN0028
     IITMCLASF
     I              ICCOYNO                     RN0029
     IITMSTRF
     I              ITALPHA                     RN0030
     I              ITCOYNO                     RN0031
     I              ITIDESC                     RN0032
     IITMTYPF
     I              BACOYNO                     RN0033
     ISTANYSF
     I              SACOYNO                     RN0034
     IFMT001
     I              SICOYNO                     RN0035
     ISTOKGRPF
     I              SGCOYNO                     RN0036
     I              SGSDESC                     RN0037
     ISTVGRPF
     I              VGCOYNO                     RN0038
     I              VGSVALG                     RN0039
     IUOMF
     I              UMCOYNO                     RN0040
     IVATCODF
     I              VCCOYNO                     RN0041
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PGO
     C                   PARM                    KDPKEY           27
     C                   PARM                    WK0601
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM002            6
     C                   PARM                    PRM003            3
     C                   PARM                    PRM004           15
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
     C     K0002         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0003         KLIST
     C                   KFLD                    KICO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KDCO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTCL02
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT03
     C*
     C     K0008         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSA02
     C*
     C     K0009         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSI02
     C*
     C     K0010         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIG02
     C*
     C     K0011         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTSV02
     C*
     C     K0012         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTUO02
     C*
     C     K0013         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTVA02
     C*
     C     K0014         KLIST
     C                   KFLD                    KTCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CDIMS         WDIMS                          IMS to be used
     C     *LIKE         DEFINE    RN0016        WK0003                         Company number
     C     *LIKE         DEFINE    RN0032        WK0016                         Item Description
     C     *LIKE         DEFINE    ITITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0002        HD0001
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0013        HD0002
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0029        HD0006
     C     *LIKE         DEFINE    ICCLAS        HCCLAS
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0031        HD0007
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0033        HD0008
     C     *LIKE         DEFINE    BAITYP        HAITYP
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0034        HD0009
     C     *LIKE         DEFINE    SASANL        HASANL
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0035        HD0010
     C     *LIKE         DEFINE    SISTIG        HISTIG
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0036        HD0011
     C     *LIKE         DEFINE    SGSGRP        HGSGRP
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0038        HD0012
     C     *LIKE         DEFINE    RN0039        HD0013
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0040        HD0014
     C     *LIKE         DEFINE    UMUOM         HMUOM
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    RN0041        HD0015
     C     *LIKE         DEFINE    VCVATC        HCVATC
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
     C                   MOVE      *ZEROS        ACTION            1 0
     C                   MOVE      *ZEROS        COUNT             5 0
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *BLANKS       FST04            15
     C                   MOVE      *BLANKS       F02002           15
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST04            15
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       POS001            3
     C                   MOVE      *BLANKS       POS002            6
     C                   MOVE      *BLANKS       POS003            3
     C                   MOVE      *BLANKS       POS004           20
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *BLANKS       RN0001           20            SRTITEM
     C                   MOVE      *BLANKS       SVDESC           40
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002            6
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004           15
     C                   MOVE      *BLANKS       SVK04            15
     C                   MOVE      *ZEROS        S04CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD03            1            RD STS m file IPS Su
     C                   MOVE      *BLANKS       KDCO01            3            CDCOYNO
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          003
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       KTCL02            3            ITCLAS
     C                   MOVE      *BLANKS       KTIT03            1            ITITYP
     C                   MOVE      *BLANKS       KTSA02            1            ITSANL
     C                   MOVE      *BLANKS       KTSI02            2            ITSIG
     C                   MOVE      *BLANKS       KTIG02            3            ITIGRP
     C                   MOVE      *BLANKS       KTSV02            1            ITSVG
     C                   MOVE      *BLANKS       KTUO02            5            ITUOM
     C                   MOVE      *BLANKS       KTVA02            2            ITVATC
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *BLANKS       CMDERR            1
     C                   MOVE      *ZEROS        RSLT01            1 0
     C                   MOVE      *ZEROS        X1CDAT                         Init DS/*DTA flds
     C                   MOVE      'N'           MSGFLG            1            Display Msg Flg
     C                   MOVE      *BLANKS       APPSET           10
     C                   MOVE      'D'           APPTYP            1
     C                   MOVE      *BLANKS       APPSCR           10
     C                   MOVE      *ZEROS        APPROW            3 0
     C                   MOVE      *ZEROS        APPCOL            3 0
     C                   MOVE      *ZEROS        UERCNT            1 0
     C                   MOVE      *BLANKS       URSUME            6
     C                   MOVE      *ZEROS        T04001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T04005                         Init DS/*DTA flds
     C                   MOVEL     'LANDIPS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
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
     C                   Z-ADD     *ZEROS        DAS002            5 0
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN         0030
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ         0030
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0042           30 9
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
     C     *DTAARA       DEFINE    KDPKEY3       @DS002
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
     C* S001 - Initial list panel
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* WK0601 = *ymd
     C                   Z-ADD     XYMD          WK0601
     C* PGO = ' '
     C                   MOVEL     *BLANKS       PGO
     C* GETDTAA KDPKEY3
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* CALL 'MITMKV',pgo,KDPKEY,wk0601
     C                   Z-ADD     1             CALLST
     C                   CALL      'MITMKV'      P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pgo <> '@@*'
     C     PGO           IFNE      '@@*'
     C* SIGNOFF                                                       *
     C                   MOVEA     *BLANKS       CST
     C                   MOVEA     'SIGNOFF '    CST
     C                   EXSR      SCMD
     C* END                                                           *
     C                   END
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* GETDTAA compnumb
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* CLRSCR SCR001
     C*
     C                   EXSR      S004
     C*                                                               *
     C* GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     C*
     C                   EXSR      S006
     C* SVDESC = CYDESC
     C                   MOVE      XYDESC        SVDESC
     C* Set Key values to parms passed
     C* SVK001 = COYNO#
     C                   MOVE      COYNO#        SVK001
     C* SVK002 = PRM002
     C                   MOVE      PRM002        SVK002
     C* SVK003 = PRM003
     C                   MOVE      PRM003        SVK003
     C* SVK004 = PRM004
     C                   MOVE      PRM004        SVK004
     C*                                                               *
     C* Set Reposition values to parms passed
     C* POS001 = COYNO#
     C                   MOVE      COYNO#        POS001
     C* POS002 = PRM002
     C                   MOVE      PRM002        POS002
     C* POS003 = PRM003
     C                   MOVE      PRM003        POS003
     C* POS004 = PRM004
     C                   MOVE      *BLANKS       POS004
     C                   MOVEL     PRM004        POS004
     C*                                                               *
     C* SETLL D.IPSITEM,F.IPSITEM,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S007
     C*                                                               *
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         CHK EOF
     C*                                                               *
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
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* UPDFLG = *zeros
     C                   Z-ADD     *ZEROS        UPDFLG
     C* MODE = 6
     C                   Z-ADD     6             MODE
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
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF updflg=1
     C     UPDFLG        IFEQ      1
     C*                                                               *
     C* SETLL D.IPSITEM,F.IPSITEM,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S007
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         RESET FP
     C*                                                               *
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
     C* Backward
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
     C*                                                               *
     C* DOBLK D.IPSITEM
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
     C* IF ACTION=2 | ACTION=4 | ACTION=5
     C     ACTION        IFEQ      2
     C     ACTION        OREQ      4
     C     ACTION        OREQ      5
     C* MODE = ACTION
     C                   Z-ADD     ACTION        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         ACTION
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     ACTION        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 2, 4, or 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
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
     C*                                                               *
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*PV,SVK001
     C*
     C                   EXSR      S009
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         RESET FP
     C*                                                               *
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Forward
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*                                                               *
     C* DOBLK D.IPSITEM
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
     C* IF ACTION=2 | ACTION=4 | ACTION=5
     C     ACTION        IFEQ      2
     C     ACTION        OREQ      4
     C     ACTION        OREQ      5
     C* MODE = ACTION
     C                   Z-ADD     ACTION        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         ACTION
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     ACTION        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 2, 4, or 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
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
     C*                                                               *
     C* COUNT = 0
     C                   Z-ADD     *ZERO         COUNT
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* COUNT = COUNT+1
     C     COUNT         ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        COUNT
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         RESET FP
     C*                                                               *
     C* IF COUNT=0
     C     COUNT         IFEQ      *ZERO
     C*                                                               *
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C*
     C                   EXSR      S011
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* Reset reposition flag and update flag
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C*                                                               *
     C* DOBLK D.IPSITEM
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
     C* IF ACTION=2 | ACTION=4 | ACTION=5
     C     ACTION        IFEQ      2
     C     ACTION        OREQ      4
     C     ACTION        OREQ      5
     C* MODE = ACTION
     C                   Z-ADD     ACTION        MODE
     C* EXSCR SCR002
     C                   ADD       1             SP
     C                   MOVEL     'SCR001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ACTION = 0
     C                   Z-ADD     *ZERO         ACTION
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ELSE                                                          *
     C                   ELSE
     C* IF ACTION<>0
     C     ACTION        IFNE      *ZERO
     C* DSPERR ACTION,'Action must be 2, 4, or 5'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
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
     C* *** Check for reposition
     C*                                                               *
     C* IF (POS004<>' ')&(PRM004=' ')
     C     POS004        IFNE      *BLANKS
     C     PRM004        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF (POS003<>' ')&(PRM003=' ')
     C     POS003        IFNE      *BLANKS
     C     PRM003        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF (POS002<>' ')&(PRM002=' ')
     C     POS002        IFNE      *BLANKS
     C     PRM002        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF (POS001<>' ')&(COYNO#=' ')
     C     POS001        IFNE      *BLANKS
     C     COYNO#        ANDEQ     *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK001 = POS001
     C                   MOVE      POS001        SVK001
     C* SVK002 = POS002
     C                   MOVE      POS002        SVK002
     C* SVK003 = POS003
     C                   MOVE      POS003        SVK003
     C* SVK004 = POS004
     C                   MOVE      *BLANKS       SVK004
     C                   MOVEL     POS004        SVK004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C*                                                               *
     C* SETLL D.IPSITEM,F.IPSITEM,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S007
     C* FLDATR ACTION,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR ACTION,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'ACTION  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR001  '    FLDSCR
     C                   EXSR      SATRIB
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         RESET FP
     C*                                                               *
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S002 - Detail panel
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00010001'    *IN(1)
     C                   MOVEA     '00010000'    *IN(9)
     C                   MOVEA     '01001000'    *IN(17)
     C                   MOVEA     '0'           *IN(25)
     C                   MOVEA     '1'           *IN(80)
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
     C* SVK001 = PICOYNO
     C                   MOVE      WK0003        SVK001
     C* SVK002 = PISUPPN
     C                   MOVE      WK0015        SVK002
     C* SVK003 = PIBRNBR
     C                   MOVE      WK0001        SVK003
     C* SVK004 = PIITEM
     C                   MOVE      *BLANKS       SVK004
     C                   MOVEL     XIITEM        SVK004
     C* CLRSCR SCR002
     C*
     C                   EXSR      S012
     C* PICOYNO = SVK001
     C                   MOVE      SVK001        WK0003
     C* PISUPPN = SVK002
     C                   MOVE      SVK002        WK0015
     C* PIBRNBR = SVK003
     C                   MOVE      SVK003        WK0001
     C* PIITEM = SVK004
     C                   MOVE      *BLANKS       XIITEM
     C                   MOVEL     SVK004        XIITEM
     C* CYDESC = SVDESC
     C                   MOVE      SVDESC        XYDESC
     C*                                                               *
     C* Protect key fields from being changed.
     C* FLDATR PISUPPN,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0015  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIBRNBR,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIITEM,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.IPSITEM,F.IPSITEM,*lock,*eq,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S013
     C*                                                               *
     C* If record locked, Display lock message
     C* from OS/400 and return.
     C* IF %lock(D.IPSITEM,F.IPSITEM)=*yes
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
     C* IF %sts(D.IPSITEM,F.IPSITEM)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
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
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR PIDESC,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIDESC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PICNVCDE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PICNV,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XICNV   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PICOST,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XICOST  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIPBRK1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIPRCOD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0008  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIQBRK1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0009  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIQFIX,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIQFIX  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIPYTD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIPYTD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIUOM,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIUOM   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIWGT,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIWGT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PIltim,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XILTIM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.IPSITEM,F.IPSITEM,*lock,*eq,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S013
     C*                                                               *
     C* If record locked, Display lock message
     C* from OS/400 and return.
     C* IF %lock(D.IPSITEM,F.IPSITEM)=*yes
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
     C* IF %sts(D.IPSITEM,F.IPSITEM)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
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
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.IPSITEM,F.IPSITEM,*eq,SVK001,SVK002,SVK003,SVK004
     C*
     C                   EXSR      S014
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.IPSITEM,F.IPSITEM)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0004         MSGDTA
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
     C* CLRSCR SCR002
     C*
     C                   EXSR      S012
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* PICOYNO = COYNO#
     C                   MOVE      COYNO#        WK0003
     C* CYDESC = SVDESC
     C                   MOVE      SVDESC        XYDESC
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
     C                   MOVEA     '1'           *IN(4)
     C                   MOVEA     '0'           *IN(6)
     C                   MOVEA     '1'           *IN(8)
     C                   MOVEA     '0'           *IN(10)
     C                   MOVEA     '1'           *IN(12)
     C                   MOVEA     '0'           *IN(16)
     C                   MOVEA     '10'          *IN(18)
     C                   MOVEA     '1'           *IN(21)
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
     C* IF %clf(PIITEM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02002 = ' '
     C                   MOVEL     *BLANKS       F02002
     C* EXSCR SC0003
     C                   ADD       1             SP
     C                   MOVEL     'SCR002  '    SID(SP)
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02002<>' '
     C     F02002        IFNE      *BLANKS
     C* PIITEM = F02002
     C                   MOVE      *BLANKS       XIITEM
     C                   MOVEL     F02002        XIITEM
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
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
     C* RLSREC D.IPSITEM,F.IPSITEM
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   UNLOCK    IPSITEM                              91      RLS LCK IPSITEM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S002V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C*
     C* Delete
     C*
     C     *INKN         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.IPSITEM,F.IPSITEM
     C*
     C                   EXSR      S015
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Item must be in item master
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* *** Get Purchasing contol record
     C*                                                               *
     C* GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     C*
     C                   EXSR      S016
     C*                                                               *
     C* *** Only validate item if IMS is used
     C*                                                               *
     C* IF CDIMS='Y'
     C     WDIMS         IFEQ      'Y'
     C* GETREC d.itmmast,*eq,COYNO#,piitem
     C*
     C                   EXSR      S017
     C* IF %sts(d.itmmast,f.itmmast)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* DSPERR PIITEM,'USR1015','ERRORS',*libl
     C                   MOVEL     'USR2077'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCR002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Perform updates to file if valid
     C*                                                               *
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* IF pidesc = ' '
     C     XIDESC        IFEQ      *BLANKS
     C* PIDESC = itidesc
     C                   MOVE      WK0016        XIDESC
     C* END                                                           *
     C                   END
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.IPSITEM,F.IPSITEM
     C*
     C                   EXSR      S018
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* WRITE D.IPSITEM,F.IPSITEM
     C*
     C                   EXSR      S019
     C* SVK001 = PICOYNO
     C                   MOVE      WK0003        SVK001
     C* SVK002 = PISUPPN
     C                   MOVE      WK0015        SVK002
     C* SVK003 = PIBRNBR
     C                   MOVE      WK0001        SVK003
     C* SVK004 = PIITEM
     C                   MOVE      *BLANKS       SVK004
     C                   MOVEL     XIITEM        SVK004
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 -         List of Items
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST04 = ' '
     C                   MOVEL     *BLANKS       FST04
     C* LST04 = ' '
     C                   MOVEL     *BLANKS       LST04
     C* SVK04 = ' '
     C                   MOVEL     *BLANKS       SVK04
     C* ** set prompt file keys to values
     C* ** from header file.
     C* S04CNT = 005
     C                   Z-ADD     005           S04CNT
     C* ** Array forward read.
     C* EXSUBR S04AFR
     C                   EXSR      S04AFR
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
     C                   GOTO      $00399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK04 = FST04
     C                   MOVE      FST04         SVK04
     C* ** Array Backwards read.
     C* EXSUBR S04ABR
     C                   EXSR      S04ABR
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
     C* SVK04 = LST04
     C                   MOVE      LST04         SVK04
     C* ** Array Forward Read.
     C* EXSUBR S04AFR
     C                   EXSR      S04AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I04 = 1
     C                   Z-ADD     1             Z2
     C* DOW (I04<=C04)&(T04(I04)<>1)
     C     Z2            DOWLE     Z1
     C     T04(Z2)       ANDNE     1
     C* I04 = I04+1
     C     Z2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I04<=C04)&(T04(I04)=1)
     C     Z2            IFLE      Z1
     C     T04(Z2)       ANDEQ     1
     C* F02002 = B02(I04)
     C                   MOVE      B02(Z2)       F02002
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C                   END
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
     C     SID(CT)       IFEQ      'SCR001'
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR001
     C                   WRITE     SCR001C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SCR002'
     C                   MOVEA     IN02          *IN
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
     C* S04ABR - SCRN SUB
     C*****************************************************************
     C     S04ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.ITMMAST,SVK001,SVK04
     C*
     C                   EXSR      S020
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.ITMMAST,*PV,SVK001
     C*
     C                   EXSR      S021
     C* DOW (C04<S04CNT)&%STS(D.STOKREQ,F.ITMMAST)=*YES
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C     RN0042        IFEQ      XYES
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0042        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z1            ADD       1             RN0042
     C                   Z-ADD     RN0042        Z1
     C* GETREC D.STOKREQ,F.ITMMAST,*PV,SVK001
     C*
     C                   EXSR      S021
     C* END                                                           *
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
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
     C     RN0042        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C                   Z-ADD     RN0042        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S04ALD
     C                   EXSR      S04ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S04AB
     C                   END
     C*
     C     $S04AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S04AFR - SCRN SUB
     C*****************************************************************
     C     S04AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKREQ,F.ITMMAST,SVK001,SVK04
     C*
     C                   EXSR      S020
     C* ** Load arrays from this point.
     C* EXSUBR S04ALD
     C                   EXSR      S04ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S04AF
     C                   END
     C*
     C     $S04AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S04ALD - SCRN SUB
     C*****************************************************************
     C     S04ALD        BEGSR
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
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** protect select field
     C* DOW C04<S04CNT
     C     Z1            DOWLT     S04CNT
     C* C04 = C04+1
     C     Z1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z1
     C* FLDATR T04(C04),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z1            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z1
     C* GETREC D.STOKREQ,F.ITMMAST,*NE,SVK001
     C*
     C                   EXSR      S023
     C* DOW (C04<S04CNT)&%STS(D.STOKREQ,F.ITMMAST)=*YES
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C     RN0042        IFEQ      XYES
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0042        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z1            ADD       1             RN0042
     C                   Z-ADD     RN0042        Z1
     C* ** Unprotect select field.
     C* FLDATR T04(C04),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z1            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C04) = STOKREQ.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       B02(Z1)
     C                   MOVEL     WTITEM        B02(Z1)
     C* ** load screen array.
     C* T05(C04) = STOKREQ.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       T05(Z1)
     C                   MOVE      WTITEM        T05(Z1)
     C* T06(C04) = STOKREQ.ITMMAST.ITIDESC
     C                   MOVE      *BLANKS       T06(Z1)
     C                   MOVE      WK0016        T06(Z1)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z1            IFEQ      1
     C* FST04 = B02(C04)
     C                   MOVE      B02(Z1)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z1            IFLT      S04CNT
     C* GETREC D.STOKREQ,F.ITMMAST,*NE,SVK001
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z1            IFLT      S04CNT
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
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
     C     RN0042        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0042
     C                   ELSE
     C                   Z-ADD     0             RN0042
     C                   END
     C                   Z-ADD     RN0042        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C04>0
     C     Z1            IFGT      *ZERO
     C* LST04 = B02(C04)
     C                   MOVE      B02(Z1)       LST04
     C* END                                                           *
     C                   END
     C*
     C     $S04AL        ENDSR
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
     C* S004   - CLRSCR SCR001
     C**************************************************************************
     C     S004          BEGSR
     C                   MOVEL     *BLANK        POS002                         INZ POS002
     C                   MOVEL     *BLANK        POS003                         INZ POS003
     C                   MOVEL     *BLANK        POS004                         INZ POS004
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   Z-ADD     *ZEROS        ACTION                         INZ ACTION
     C                   MOVEL     *BLANK        XIDESC                         INZ XIDESC
     C                   MOVEL     *BLANK        XIITEM                         INZ XIITEM
     C                   MOVEL     *BLANK        WK0001                         INZ WK0001
     C                   MOVEL     *BLANK        WK0015                         INZ WK0015
     C                   EXSR      S005                                         INZ SFL
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S005   - Process To Initialize SubFile - SCR001S1
     C**************************************************************************
     C     S005          BEGSR
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR001C1                                     CLEAR SUBFILE
     C*
     C                   MOVEA     '1110'        *IN(63)                        SFLCLR SFLDSP
     C                   MOVEA     *IN           INSAV1
     C     1             DO        12            RRN01
     C                   WRITE     SCR001S1                             90
     C                   END
     C*
     C                   Z-ADD     1             RRN01
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S006   - GETREC D.COMPANY,F.COMPANY,*EQ,COYNO#
     C**************************************************************************
     C     S006          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     COYNO#        KYCO01
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
     C* S007   - SETLL D.IPSITEM,F.IPSITEM,SVK001,SVK002,SVK003,SVK004
     C**************************************************************************
     C     S007          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HD0005                         Supplier Number
     C                   MOVEL     *LOVAL        HD0003                         Branch Number
     C                   MOVEL     *LOVAL        HIITEM                         Item Number
     C*
     C                   MOVEL     SVK001        KICO01
     C                   MOVEL     SVK001        HD0004                         Company number
     C                   MOVEL     SVK001        RN0016                         Company number
     C                   MOVEL     SVK002        KISU02
     C                   MOVEL     SVK002        HD0005                         Supplier Number
     C                   MOVEL     SVK002        RN0028                         Supplier Number
     C                   MOVEL     SVK003        KIBR03
     C                   MOVEL     SVK003        HD0003                         Branch Number
     C                   MOVEL     SVK003        RN0014                         Branch Number
     C                   MOVEL     SVK004        KIIT04
     C                   MOVEL     SVK004        HIITEM                         Item Number
     C                   MOVEL     SVK004        PIITEM                         Item Number
     C*
     C     K0002         SETLL     IPSITEM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S008   - Process To Reset File Pointer(EOF) - IPSITEM
     C**************************************************************************
     C     S008          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.IPSITEM
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0016        KICO01
     C     K0003         SETGT     IPSITEM
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S009   - GETBLK D.IPSITEM,F.IPSITEM,*PV,SVK001
     C**************************************************************************
     C     S009          BEGSR
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READPE(N) IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S010                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S010   - Process To Reset File Pointer(BOF) - IPSITEM
     C**************************************************************************
     C     S010          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.IPSITEM
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0016        KICO01
     C     K0003         SETLL     IPSITEM
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S011   - GETBLK D.IPSITEM,F.IPSITEM,*NE,SVK001
     C**************************************************************************
     C     S011          BEGSR
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.IPSITEM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE(N)  IPSITEM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HD0005                         Supplier Number
     C                   MOVEL     *BLANK        HD0003                         Branch Number
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
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
     C                   Z-ADD     *ZEROS        ACTION
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0001
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       XIDESC
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
     C                   EXSR      S008                                         RESET FP
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - CLRSCR SCR002
     C**************************************************************************
     C     S012          BEGSR
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   Z-ADD     *ZEROS        XICNV                          INZ XICNV
     C                   Z-ADD     *ZEROS        XICOST                         INZ XICOST
     C                   MOVEL     *BLANK        XIDESC                         INZ XIDESC
     C                   MOVEL     *BLANK        XIITEM                         INZ XIITEM
     C                   Z-ADD     *ZEROS        XILTIM                         INZ XILTIM
     C                   Z-ADD     *ZEROS        XIPYTD                         INZ XIPYTD
     C                   Z-ADD     *ZEROS        XIQFIX                         INZ XIQFIX
     C                   MOVEL     *BLANK        XIUOM                          INZ XIUOM
     C                   Z-ADD     *ZEROS        XIWGT                          INZ XIWGT
     C                   MOVEL     *BLANK        WK0001                         INZ WK0001
     C                   MOVEL     *BLANK        WK0002                         INZ WK0002
     C                   Z-ADD     *ZEROS        WK0004                         INZ WK0004
     C                   Z-ADD     *ZEROS        WK0005                         INZ WK0005
     C                   Z-ADD     *ZEROS        WK0006                         INZ WK0006
     C                   Z-ADD     *ZEROS        WK0007                         INZ WK0007
     C                   MOVEL     *BLANK        WK0008                         INZ WK0008
     C                   Z-ADD     *ZEROS        WK0009                         INZ WK0009
     C                   Z-ADD     *ZEROS        WK0010                         INZ WK0010
     C                   Z-ADD     *ZEROS        WK0011                         INZ WK0011
     C                   Z-ADD     *ZEROS        WK0012                         INZ WK0012
     C                   MOVEL     *BLANK        WK0013                         INZ WK0013
     C                   MOVEL     *BLANK        WK0014                         INZ WK0014
     C                   MOVEL     *BLANK        WK0015                         INZ WK0015
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S013   - GETREC D.IPSITEM,F.IPSITEM,*lock,*eq,SVK001,SVK002,SVK003,SVK00
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     SVK002        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     SVK003        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     SVK004        KIIT04
     C     K0002         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC D.IPSITEM,F.IPSITEM,*eq,SVK001,SVK002,SVK003,SVK004
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK001        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     SVK002        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     SVK003        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     SVK004        KIIT04
     C     K0002         CHAIN(N)  IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - DELETE D.IPSITEM,F.IPSITEM
     C**************************************************************************
     C     S015          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0003        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     WK0015        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0001        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     XIITEM        KIIT04
     C     K0002         SETLL     IPSITEM                                      SETLL  IPSITEM
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - IPSITEM
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     IPSITEM                              9190    READE  IPSITEM
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    IPSITEM                              91      DELETE IPSITEM
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
     C     K0002         SETLL     IPSITEM                                      RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0004         CHAIN     IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - GETREC d.itmmast,*eq,COYNO#,piitem
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     COYNO#        KTCO01
     C                   MOVEL     *BLANK        KTIT02
     C                   MOVEL     XIITEM        KTIT02
     C     K0005         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   ITMC
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTCL02
     C                   MOVEL     ITCLAS        KTCL02
     C     K0006         CHAIN     ITMCLAS                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMCLAS   ITMT
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMCLAS   ITMT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     ITITYP        KTIT03
     C     K0007         CHAIN     ITMTYP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.ITMTYP    STAN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.ITMTYP    STAN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTSA02
     C                   MOVEL     ITSANL        KTSA02
     C     K0008         CHAIN     STANYS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.STANYS    STIG
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.STANYS    STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTSI02
     C                   MOVEL     ITSIG         KTSI02
     C     K0009         CHAIN     STIGRP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.STIGRP    STOK
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.STIGRP    STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTIG02
     C                   MOVEL     ITIGRP        KTIG02
     C     K0010         CHAIN     STOKGRP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.STOKGRP   STVG
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.STOKGRP   STVG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTSV02
     C                   MOVEL     ITSVG         KTSV02
     C     K0011         CHAIN     STVGRP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.STVGRP    UOM
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.STVGRP    UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTUO02
     C                   MOVEL     ITUOM         KTUO02
     C     K0012         CHAIN     UOM                                9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.UOM       VATC
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.UOM       VATC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C                   MOVEL     *BLANK        KTVA02
     C                   MOVEL     ITVATC        KTVA02
     C     K0013         CHAIN     VATCOD                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.VATCOD
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.VATCOD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - UPDATE D.IPSITEM,F.IPSITEM
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     HD0004        KICO01
     C                   MOVEL     *BLANK        KISU02                         Supplier Number
     C                   MOVEL     HD0005        KISU02
     C                   MOVEL     *BLANK        KIBR03                         Branch Number
     C                   MOVEL     HD0003        KIBR03
     C                   MOVEL     *BLANK        KIIT04                         Item Number
     C                   MOVEL     HIITEM        KIIT04
     C     K0002         CHAIN     IPSITEM                            9091      CHAIN  IPSITEM
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0014        IFEQ      WK0001
     C     PICNV         ANDEQ     XICNV
     C     RN0015        ANDEQ     WK0002
     C     PICOST        ANDEQ     XICOST
     C     RN0016        ANDEQ     WK0003
     C     PIDESC        ANDEQ     XIDESC
     C     PIITEM        ANDEQ     XIITEM
     C     PILTIM        ANDEQ     XILTIM
     C     RN0017        ANDEQ     WK0004
     C     RN0018        ANDEQ     WK0005
     C     RN0019        ANDEQ     WK0006
     C     RN0020        ANDEQ     WK0007
     C     RN0021        ANDEQ     WK0008
     C     PIPYTD        ANDEQ     XIPYTD
     C     RN0022        ANDEQ     WK0009
     C     RN0023        ANDEQ     WK0010
     C     RN0024        ANDEQ     WK0011
     C     RN0025        ANDEQ     WK0012
     C     PIQFIX        ANDEQ     XIQFIX
     C     RN0026        ANDEQ     WK0013
     C     RN0027        ANDEQ     WK0014
     C     RN0028        ANDEQ     WK0015
     C     PIUOM         ANDEQ     XIUOM
     C     PIWGT         ANDEQ     XIWGT
     C                   UNLOCK    IPSITEM                              91      RLS LCK IPSITEM
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSITEMF                             90      UPDATE IPSITEM
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
     C* S019   - WRITE D.IPSITEM,F.IPSITEM
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     IPSITEMF                             90      ADD REC TO IPSITEM
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
     C* S020   - SETLL D.STOKREQ,F.ITMMAST,SVK001,SVK04
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   MOVE      'N'           SWRD08                         RD.SW.STIGRP    STOK
     C                   MOVE      'N'           SWRD09                         RD.SW.STOKGRP   SUPL
     C*
     C                   MOVEL     SVK001        KTCO01
     C                   MOVEL     SVK001        HD0007                         Company number
     C                   MOVEL     SVK001        RN0031                         Company number
     C                   MOVEL     SVK04         KTIT02
     C                   MOVEL     SVK04         HTITEM                         Item Number
     C                   MOVEL     SVK04         ITITEM                         Item Number
     C*
     C     K0005         SETLL     ITMMAST                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.STOKREQ,F.ITMMAST,*PV,SVK001
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK001        KTCO01
     C     K0014         READPE    ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S022                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - Process To Reset File Pointer(BOF) - ITMMAST
     C**************************************************************************
     C     S022          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.ITMMAST   STIG
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C     K0014         SETLL     ITMMAST
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.STOKREQ,F.ITMMAST,*NE,SVK001
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK001        KTCO01
     C     K0014         READE     ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S024                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - Process To Reset File Pointer(EOF) - ITMMAST
     C**************************************************************************
     C     S024          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.ITMMAST   STIG
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0031        KTCO01
     C     K0014         SETGT     ITMMAST
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(1)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail panel
     C* Validation subroutine for -- SCR002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     WK0015        IFEQ      A1(3)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0015'      FLDNAM
     C                   MOVEL     'SCR002'      FLDSCR
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
     C                   MOVEL     'FLD0081'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XIITEM        IFEQ      A1(3)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XIITEM'      FLDNAM
     C                   MOVEL     'SCR002'      FLDSCR
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
     C                   MOVEL     'USR0137'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0002        IFEQ      A1(4)                                        Lst Valid/Invalid va
     C     WK0002        OREQ      A1(5)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0002'      FLDNAM
     C                   MOVEL     'SCR002'      FLDSCR
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
     C                   MOVEL     'FLD0078'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0008        IFEQ      A1(4)                                        Lst Valid/Invalid va
     C     WK0008        OREQ      A1(5)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0008'      FLDNAM
     C                   MOVEL     'SCR002'      FLDSCR
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
     C                   MOVEL     'FLD0079'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XILTIM        IFLE      N1(1)                                        High value
     C     XILTIM        ANDGE     N1(2)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XILTIM'      FLDNAM
     C                   MOVEL     'SCR002'      FLDSCR
     C     RANGEF        IFEQ      1                                            Range check
     C                   MOVE      'R'           DSPERR
     C                   EXSR      SATRIB
     C                   ELSE
     C                   Z-ADD     0             VALIDF                         Validation failed
     C                   MOVE      *BLANKS       MSGID                          Message id.
     C                   MOVE      *BLANKS       MSGF                           Message file
     C                   MOVE      *BLANKS       MSGFL                          Message library
     C                   MOVE      *BLANKS       MSGDTA                         Message text
     C                   MOVE      'A'           MSGACT                         Message action
     C                   MOVEL     'FLD0080'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
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
     C     STS01         IFEQ      1218                                         LOCK(SYS)-IPSITEM
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            IPSITEM
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
     C     WFILE#        IFEQ      3                                            IPSCPYD
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
     C     WFILE#        IFEQ      4                                            ITMMAST
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
     C     WFILE#        IFEQ      5                                            ITMCLAS
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
     C     WFILE#        IFEQ      6                                            ITMTYP
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
     C     WFILE#        IFEQ      7                                            STANYS
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
     C     WFILE#        IFEQ      8                                            STIGRP
     C     STS08         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS08                          ASSET LOCK STATUS
     C                   ELSE
     C     STS08         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS08                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      9                                            STOKGRP
     C     STS09         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS09                          ASSET LOCK STATUS
     C                   ELSE
     C     STS09         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS09                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      10                                           STVGRP
     C     STS10         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS10                          ASSET LOCK STATUS
     C                   ELSE
     C     STS10         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS10                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      11                                           UOM
     C     STS11         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS11                          ASSET LOCK STATUS
     C                   ELSE
     C     STS11         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS11                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      12                                           VATCOD
     C     STS12         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS12                          ASSET LOCK STATUS
     C                   ELSE
     C     STS12         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS12                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0001        RN0014                         Branch Number
     C                   Z-ADD     XICNV         PICNV                          Conversion Qty
     C                   MOVEL     WK0002        RN0015                         Conversion Code
     C                   Z-ADD     XICOST        PICOST                         Cost Price
     C                   MOVEL     WK0003        RN0016                         Company number
     C                   MOVEL     XIDESC        PIDESC                         Description
     C                   MOVEL     XIITEM        PIITEM                         Item Number
     C                   Z-ADD     XILTIM        PILTIM                         Lead Time
     C                   Z-ADD     WK0004        RN0017                         Break Price 1
     C                   Z-ADD     WK0005        RN0018                         Break Price 2
     C                   Z-ADD     WK0006        RN0019                         Break Price 3
     C                   Z-ADD     WK0007        RN0020                         Break Price 4
     C                   MOVEL     WK0008        RN0021                         Pricing Code
     C                   Z-ADD     XIPYTD        PIPYTD                         Purchase Value YTD
     C                   Z-ADD     WK0009        RN0022                         Qty Break 1
     C                   Z-ADD     WK0010        RN0023                         Qty Break 2
     C                   Z-ADD     WK0011        RN0024                         Qty Break 3
     C                   Z-ADD     WK0012        RN0025                         Qty break 4
     C                   Z-ADD     XIQFIX        PIQFIX                         Fixed order Qty
     C                   MOVEL     WK0013        RN0026                         Description
     C                   MOVEL     WK0014        RN0027                         Item Number
     C                   MOVEL     WK0015        RN0028                         Supplier Number
     C                   MOVEL     XIUOM         PIUOM                          Unit of Measure
     C                   Z-ADD     XIWGT         PIWGT                          Weight
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0014        WK0001                         Branch Number
     C                   Z-ADD     PICNV         XICNV                          Conversion Qty
     C                   MOVEL     RN0015        WK0002                         Conversion Code
     C                   Z-ADD     PICOST        XICOST                         Cost Price
     C                   MOVEL     RN0016        WK0003                         Company number
     C                   MOVEL     PIDESC        XIDESC                         Description
     C                   MOVEL     PIITEM        XIITEM                         Item Number
     C                   Z-ADD     PILTIM        XILTIM                         Lead Time
     C                   Z-ADD     RN0017        WK0004                         Break Price 1
     C                   Z-ADD     RN0018        WK0005                         Break Price 2
     C                   Z-ADD     RN0019        WK0006                         Break Price 3
     C                   Z-ADD     RN0020        WK0007                         Break Price 4
     C                   MOVEL     RN0021        WK0008                         Pricing Code
     C                   Z-ADD     PIPYTD        XIPYTD                         Purchase Value YTD
     C                   Z-ADD     RN0022        WK0009                         Qty Break 1
     C                   Z-ADD     RN0023        WK0010                         Qty Break 2
     C                   Z-ADD     RN0024        WK0011                         Qty Break 3
     C                   Z-ADD     RN0025        WK0012                         Qty break 4
     C                   Z-ADD     PIQFIX        XIQFIX                         Fixed order Qty
     C                   MOVEL     RN0026        WK0013                         Description
     C                   MOVEL     RN0027        WK0014                         Item Number
     C                   MOVEL     RN0028        WK0015                         Supplier Number
     C                   MOVEL     PIUOM         XIUOM                          Unit of Measure
     C                   Z-ADD     PIWGT         XIWGT                          Weight
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0016        HD0004                         Company number
     C                   MOVEL     RN0028        HD0005                         Supplier Number
     C                   MOVEL     RN0014        HD0003                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0002        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     CDIMS         WDIMS                          IMS to be used
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0013        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0032        WK0016                         Item Description
     C                   MOVEL     ITITEM        WTITEM                         Item Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0031        HD0007                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMCLAS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0029        HD0006                         Company number
     C                   MOVEL     ICCLAS        HCCLAS                         Item Class
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0033        HD0008                         Company number
     C                   MOVEL     BAITYP        HAITYP                         Item Type - business
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STANYS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0034        HD0009                         Company number
     C                   MOVEL     SASANL        HASANL                         Stock Analysis Code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STIGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0035        HD0010                         Company number
     C                   MOVEL     SISTIG        HISTIG                         Stock Inventory Grou
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0036        HD0011                         Company number
     C                   MOVEL     SGSGRP        HGSGRP                         Stock Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STVGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0038        HD0012                         Company number
     C                   MOVEL     RN0039        HD0013                         Stock Value Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - UOM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0040        HD0014                         Company number
     C                   MOVEL     UMUOM         HMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - VATCOD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     RN0041        HD0015                         Company number
     C                   MOVEL     VCVATC        HCVATC                         VAT Code
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
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1
The end of the file was reached
The beginning of the file was reached

0
1
Record deleted from file IPS Supplied Items
No record found to delete from file IPS Supplied Items
Record update for file IPS Supplied Items
Unable to update record for file IPS Supplied Items
Record added to file IPS Supplied Items
Unable to add record to file IPS Supplied Items
**   Numeric Constant Array - N1
000000000000000000999000000000
000000000000000000000000000000
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SCR002    XIITEM    000005080527
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCR001    XIITEM    0000  05      05
SCR002    WK0002    0000  0204    02  03               Y
SCR002    XIITEM    0000  1618    16  17               Y
SCR002    XILTIM    0000  1921    19  20               Y
SCR002    WK0008    0000  0608    06  07               Y
SCR002    WK0015    0000  1012    10  11               Y
SCR001    ACTION    0000  0103    010402               Y
SCR002    WK0001    0000              01
SCR002    XIDESC    0000              15
SCR002    XICNV     0000              13
SCR002    XICOST    0000              14
SCR002    WK0004    0000              05
SCR002    WK0009    0000              09
SCR002    XIQFIX    0000              23
SCR002    XIPYTD    0000              22
SCR002    XIUOM     0000              24
SCR002    XIWGT     0000              25
SC0003    T04       0001            0201
SC0003    T04       0002            0403
SC0003    T04       0003            0605
SC0003    T04       0004            0807
SC0003    T04       0005            1009
