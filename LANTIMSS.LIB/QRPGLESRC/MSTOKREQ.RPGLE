     F/TITLE MSTOKREQ Work with Stock Take Requests
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MSTOKREQ
     F*  Application ID      -    MSTOKREQ
     F*  Application Name    -    Work with Stock Take Requests
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  STOKREQ     - (I/DISK   ) IMS Stock take request      SR
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  STOKSEL     - (U/DISK   ) IMS Stocktake items rqustd  SS
     F*  ITMCLAS     - (I/DISK   ) IMS Item class parameters   IC
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  STIGRP      - (I/DISK   ) IMS Stock Inventory group   SI
     F*  STOKGRP     - (I/DISK   ) IMS Stock group codes       SG
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  STOKREQX    - (U/DISK   ) IMS Stock take request      SR
     F*  MSTOKREQD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SC0001     - List Screen for STOKREQ
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
     F*  SC0002     - Detail Screen for STOKREQ
     F*
     F*  01     - SCR002 / RN0016 : DSPATR(PR)
     F*  01     - SCR002 / RN0017 : DSPATR(PR)
     F*  01     - SCR002 / RN0018 : DSPATR(PR)
     F*  01     - SCR002 / RN0019 : DSPATR(PR)
     F*  01     - SCR002 / RN0020 : DSPATR(PR)
     F*  01     - SCR002 / RN0021 : DSPATR(PR)
     F*  01     - SCR002 / RN0022 : DSPATR(PR)
     F*  01     - SCR002 / RN0023 : DSPATR(PR)
     F*  01     - SCR002 / RN0024 : DSPATR(PR)
     F*  01     - SCR002 / RN0025 : DSPATR(PR)
     F*  01     - SCR002 / RN0026 : DSPATR(PR)
     F*  01     - SCR002 / RN0027 : DSPATR(PR)
     F*  01     - SCR002 / RN0028 : DSPATR(PR)
     F*  01     - SCR002 / RN0029 : DSPATR(PR)
     F*  01     - SCR002 / RN0030 : DSPATR(PR)
     F*  01     - SCR002 / RN0031 : DSPATR(PR)
     F*  02     - SCR002 / RN0016 : DSPATR(UL)
     F*  02     - SCR002 / RN0017 : DSPATR(UL)
     F*  02     - SCR002 / RN0018 : DSPATR(UL)
     F*  02     - SCR002 / RN0019 : DSPATR(UL)
     F*  02     - SCR002 / RN0020 : DSPATR(UL)
     F*  02     - SCR002 / RN0021 : DSPATR(UL)
     F*  02     - SCR002 / RN0022 : DSPATR(UL)
     F*  02     - SCR002 / RN0023 : DSPATR(UL)
     F*  02     - SCR002 / RN0024 : DSPATR(UL)
     F*  02     - SCR002 / RN0025 : DSPATR(UL)
     F*  02     - SCR002 / RN0026 : DSPATR(UL)
     F*  02     - SCR002 / RN0027 : DSPATR(UL)
     F*  02     - SCR002 / RN0028 : DSPATR(UL)
     F*  02     - SCR002 / RN0029 : DSPATR(UL)
     F*  02     - SCR002 / RN0030 : DSPATR(UL)
     F*  02     - SCR002 / RN0031 : DSPATR(UL)
     F*  03     - SCR002 / CYDESC : DSPATR(PC)
     F*  03     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     -      List of Item Classes
     F*
     F*  01     - SCR003 / T01 : DSPATR(PR)
     F*  02     - SCR003 / T01 : DSPATR(ND)
     F*  03     - SCR003 / T01 : DSPATR(PR)
     F*  04     - SCR003 / T01 : DSPATR(ND)
     F*  05     - SCR003 / T01 : DSPATR(PR)
     F*  06     - SCR003 / T01 : DSPATR(ND)
     F*  07     - SCR003 / T01 : DSPATR(PR)
     F*  08     - SCR003 / T01 : DSPATR(ND)
     F*  09     - SCR003 / T01 : DSPATR(PR)
     F*  10     - SCR003 / T01 : DSPATR(ND)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0004     -         List of Items
     F*
     F*  01     - SCR004 / T04 : DSPATR(PR)
     F*  02     - SCR004 / T04 : DSPATR(ND)
     F*  03     - SCR004 / T04 : DSPATR(PR)
     F*  04     - SCR004 / T04 : DSPATR(ND)
     F*  05     - SCR004 / T04 : DSPATR(PR)
     F*  06     - SCR004 / T04 : DSPATR(ND)
     F*  07     - SCR004 / T04 : DSPATR(PR)
     F*  08     - SCR004 / T04 : DSPATR(ND)
     F*  09     - SCR004 / T04 : DSPATR(PR)
     F*  10     - SCR004 / T04 : DSPATR(ND)
     F*  80     - SCR004 / T04 : DSPATR(PC)
     F*  80     - SCR004 / T04 : DSPATR(PC)
     F*  80     - SCR004 / T04 : DSPATR(PC)
     F*  80     - SCR004 / T04 : DSPATR(PC)
     F*  80     - SCR004 / T04 : DSPATR(PC)
     F* N79     - SCR004 PUTOVR
     F*
     F*  SC0005     -    List of Inventory Groups
     F*
     F*  01     - SCR005 / T07 : DSPATR(PR)
     F*  02     - SCR005 / T07 : DSPATR(ND)
     F*  03     - SCR005 / T07 : DSPATR(PR)
     F*  04     - SCR005 / T07 : DSPATR(ND)
     F*  05     - SCR005 / T07 : DSPATR(PR)
     F*  06     - SCR005 / T07 : DSPATR(ND)
     F*  07     - SCR005 / T07 : DSPATR(PR)
     F*  08     - SCR005 / T07 : DSPATR(ND)
     F*  09     - SCR005 / T07 : DSPATR(PR)
     F*  10     - SCR005 / T07 : DSPATR(ND)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F* N79     - SCR005 PUTOVR
     F*
     F*  SC0006     -      List of Stock Groups
     F*
     F*  01     - SCR006 / T10 : DSPATR(PR)
     F*  02     - SCR006 / T10 : DSPATR(ND)
     F*  03     - SCR006 / T10 : DSPATR(PR)
     F*  04     - SCR006 / T10 : DSPATR(ND)
     F*  05     - SCR006 / T10 : DSPATR(PR)
     F*  06     - SCR006 / T10 : DSPATR(ND)
     F*  07     - SCR006 / T10 : DSPATR(PR)
     F*  08     - SCR006 / T10 : DSPATR(ND)
     F*  09     - SCR006 / T10 : DSPATR(PR)
     F*  10     - SCR006 / T10 : DSPATR(ND)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F* N79     - SCR006 PUTOVR
     F*
     F*  SC0007     -       List of Suppliers
     F*
     F*  01     - SCR007 / T13 : DSPATR(PR)
     F*  02     - SCR007 / T13 : DSPATR(ND)
     F*  03     - SCR007 / T13 : DSPATR(PR)
     F*  04     - SCR007 / T13 : DSPATR(ND)
     F*  05     - SCR007 / T13 : DSPATR(PR)
     F*  06     - SCR007 / T13 : DSPATR(ND)
     F*  07     - SCR007 / T13 : DSPATR(PR)
     F*  08     - SCR007 / T13 : DSPATR(ND)
     F*  09     - SCR007 / T13 : DSPATR(PR)
     F*  10     - SCR007 / T13 : DSPATR(ND)
     F*  80     - SCR007 / T13 : DSPATR(PC)
     F*  80     - SCR007 / T13 : DSPATR(PC)
     F*  80     - SCR007 / T13 : DSPATR(PC)
     F*  80     - SCR007 / T13 : DSPATR(PC)
     F*  80     - SCR007 / T13 : DSPATR(PC)
     F* N79     - SCR007 PUTOVR
     F*
     F*  SC0008     -       List of Warehouses
     F*
     F*  01     - SCR008 / T17 : DSPATR(PR)
     F*  02     - SCR008 / T17 : DSPATR(ND)
     F*  03     - SCR008 / T17 : DSPATR(PR)
     F*  04     - SCR008 / T17 : DSPATR(ND)
     F*  05     - SCR008 / T17 : DSPATR(PR)
     F*  06     - SCR008 / T17 : DSPATR(ND)
     F*  07     - SCR008 / T17 : DSPATR(PR)
     F*  08     - SCR008 / T17 : DSPATR(ND)
     F*  09     - SCR008 / T17 : DSPATR(PR)
     F*  10     - SCR008 / T17 : DSPATR(ND)
     F*  80     - SCR008 / T17 : DSPATR(PC)
     F*  80     - SCR008 / T17 : DSPATR(PC)
     F*  80     - SCR008 / T17 : DSPATR(PC)
     F*  80     - SCR008 / T17 : DSPATR(PC)
     F*  80     - SCR008 / T17 : DSPATR(PC)
     F* N79     - SCR008 PUTOVR
     F*
     F*  SC0009     - List of Locations in Warehouse
     F*
     F*  01     - SCR009 / T20 : DSPATR(PR)
     F*  02     - SCR009 / T20 : DSPATR(ND)
     F*  03     - SCR009 / T20 : DSPATR(PR)
     F*  04     - SCR009 / T20 : DSPATR(ND)
     F*  05     - SCR009 / T20 : DSPATR(PR)
     F*  06     - SCR009 / T20 : DSPATR(ND)
     F*  07     - SCR009 / T20 : DSPATR(PR)
     F*  08     - SCR009 / T20 : DSPATR(ND)
     F*  09     - SCR009 / T20 : DSPATR(PR)
     F*  10     - SCR009 / T20 : DSPATR(ND)
     F*  80     - SCR009 / T20 : DSPATR(PC)
     F*  80     - SCR009 / T20 : DSPATR(PC)
     F*  80     - SCR009 / T20 : DSPATR(PC)
     F*  80     - SCR009 / T20 : DSPATR(PC)
     F*  80     - SCR009 / T20 : DSPATR(PC)
     F* N79     - SCR009 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for STOKREQ
     F* S002 - Detail Screen for STOKREQ
     F* S003 -      List of Item Classes
     F* S004 -         List of Items
     F* S005 -    List of Inventory Groups
     F* S006 -      List of Stock Groups
     F* S007 -       List of Suppliers
     F* S008 -       List of Warehouses
     F* S009 - List of Locations in Warehouse
     F* SREDSP -  Redisplay Windows within stack.
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03ABR - SCRN SUB
     F* S03AFR - SCRN SUB
     F* S03ALD - SCRN SUB
     F* S04ABR - SCRN SUB
     F* S04AFR - SCRN SUB
     F* S04ALD - SCRN SUB
     F* S05ABR - SCRN SUB
     F* S05AFR - SCRN SUB
     F* S05ALD - SCRN SUB
     F* S06ABR - SCRN SUB
     F* S06AFR - SCRN SUB
     F* S06ALD - SCRN SUB
     F* S07ABR - SCRN SUB
     F* S07AFR - SCRN SUB
     F* S07ALD - SCRN SUB
     F* S08ABR - SCRN SUB
     F* S08AFR - SCRN SUB
     F* S08ALD - SCRN SUB
     F* S09ABR - SCRN SUB
     F* S09AFR - SCRN SUB
     F* S09ALD - SCRN SUB
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S010   - GETREC d.company,f.company,*eq,prcoyno
     F* S011   - SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     F* S012   - GETREC D.STOKREQ,F.STOKREQ,*lock,*eq,SVK001,SVK002
     F* S013   - GETREC D.STOKREQ,F.STOKREQ,*eq,SVK001,SVK002
     F* S014   - DELETE D.STOKREQ,F.STOKREQ,f.stoksel
     F* S015   - WRITE D.STOKREQ,F.STOKREQ
     F* S016   - GETBLK D.STOKREQ,F.STOKREQ,*PV,PRCOYNO
     F* S017   - Process To Reset File Pointer(BOF) - STOKREQ
     F* S018   - Process To Reset File Pointer(EOF) - STOKREQ
     F* S019   - GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     F* S020   - SETLL D.STOKREQ,F.ITMCLAS,SVK003,SVK03
     F* S021   - GETREC D.STOKREQ,F.ITMCLAS,*PV,SVK003
     F* S022   - Process To Reset File Pointer(BOF) - ITMCLAS
     F* S023   - GETREC D.STOKREQ,F.ITMCLAS,*NE,SVK003
     F* S024   - Process To Reset File Pointer(EOF) - ITMCLAS
     F* S025   - SETLL D.STOKREQ,F.ITMMAST,SVK005,SVK04
     F* S026   - GETREC D.STOKREQ,F.ITMMAST,*PV,SVK005
     F* S027   - Process To Reset File Pointer(BOF) - ITMMAST
     F* S028   - GETREC D.STOKREQ,F.ITMMAST,*NE,SVK005
     F* S029   - Process To Reset File Pointer(EOF) - ITMMAST
     F* S030   - SETLL D.STOKREQ,F.STIGRP,SVK007,SVK05
     F* S031   - GETREC D.STOKREQ,F.STIGRP,*PV,SVK007
     F* S032   - Process To Reset File Pointer(BOF) - STIGRP
     F* S033   - GETREC D.STOKREQ,F.STIGRP,*NE,SVK007
     F* S034   - Process To Reset File Pointer(EOF) - STIGRP
     F* S035   - SETLL D.STOKREQ,F.STOKGRP,SVK009,SVK06
     F* S036   - GETREC D.STOKREQ,F.STOKGRP,*PV,SVK009
     F* S037   - Process To Reset File Pointer(BOF) - STOKGRP
     F* S038   - GETREC D.STOKREQ,F.STOKGRP,*NE,SVK009
     F* S039   - Process To Reset File Pointer(EOF) - STOKGRP
     F* S040   - SETLL D.STOKREQ,F.SUPLIER,SVK011,SVK07,svkbrn
     F* S041   - GETREC D.STOKREQ,F.SUPLIER,*PV,SVK011
     F* S042   - Process To Reset File Pointer(BOF) - SUPLIER
     F* S043   - GETREC D.STOKREQ,F.SUPLIER,*NE,SVK011
     F* S044   - Process To Reset File Pointer(EOF) - SUPLIER
     F* S045   - SETLL D.STOKREQ,F.WAREHED,SVK014,SVK08
     F* S046   - GETREC D.STOKREQ,F.WAREHED,*PV,SVK014
     F* S047   - Process To Reset File Pointer(BOF) - WAREHED
     F* S048   - GETREC D.STOKREQ,F.WAREHED,*NE,SVK014
     F* S049   - Process To Reset File Pointer(EOF) - WAREHED
     F* S050   - SETLL D.STOKREQ,F.WARELOC,SVK016,SVK017,SVK09
     F* S051   - GETREC D.STOKREQ,F.WARELOC,*PV,SVK016,SVK017
     F* S052   - Process To Reset File Pointer(BOF) - WARELOC
     F* S053   - GETREC D.STOKREQ,F.WARELOC,*NE,SVK016,SVK017
     F* S054   - Process To Reset File Pointer(EOF) - WARELOC
     F* *PSSR - Program Execution Errors Handler
     F* SCLF   - CLF : Cursor Location On Field Handler
     F* SATRIB - Display Attribute Handler
     F* SLOCK - Update Lock Flag
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FFILE0001  CF   E             WORKSTN
     F                                     EXTDESC('*LIBL/MSTOKREQD')
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FSTOKREQ   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FITMCLAS   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSTIGRP    IF   E           K DISK
     F                                     RENAME(STIGRP:FMT001)
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FSTOKGRP   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FSTOKSEL   UF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FSTOKREQX  UF A E             DISK
     F                                     EXTDESC('*LIBL/STOKREQ')
     F                                     INFDS(FIDS11)
     F                                     RENAME(STOKREQF:FMT002)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(6)
     D A02             S              5  0 DIM(6)
     D B01             S              3    DIM(5)
     D B02             S             15    DIM(5)
     D B03             S              2    DIM(5)
     D B04             S              3    DIM(5)
     D B05             S              6    DIM(5)
     D B06             S              3    DIM(5)
     D B07             S             10    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D A1              S             80    DIM(8) CTDATA PERRCD(1)              Alpha constants i
     D DA4             S             24    DIM(17) CTDATA PERRCD(1)             CLF : Cursor Loca
     D DA5             S              8    DIM(17) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(42) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(42) ALT(DA1)
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
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
     D*
     D* KDPKEY3
     D*
     D @DS001          DS            27
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
     D @DS002          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS003          DS
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
     D                                      Delete')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Record not found for-
     D                                      Display')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Invalid cursor loc f-
     D                                     or prompt')
     D*
     D* Named constants
     D*
     D C0004           C                   CONST('BSTOKREQC')
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
     D @DS004          DS
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
     D @DS005          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS006          DS
     D  T02                    1     15    DIM(5)
     D  T02001                 1      3
     D  T02002                 4      6
     D  T02003                 7      9
     D  T02004                10     12
     D  T02005                13     15
     D @DS007          DS
     D  T03                    1    200    DIM(5)
     D  T03001                 1     40
     D  T03002                41     80
     D  T03003                81    120
     D  T03004               121    160
     D  T03005               161    200
     D @DS008          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS009          DS
     D  T05                    1    100    DIM(5)
     D  T05001                 1     20
     D  T05002                21     40
     D  T05003                41     60
     D  T05004                61     80
     D  T05005                81    100
     D @DS010          DS
     D  T06                    1    200    DIM(5)
     D  T06001                 1     40
     D  T06002                41     80
     D  T06003                81    120
     D  T06004               121    160
     D  T06005               161    200
     D @DS011          DS
     D  T07                    1      5P 0 DIM(5)
     D  T07001                 1      1P 0
     D  T07002                 2      2P 0
     D  T07003                 3      3P 0
     D  T07004                 4      4P 0
     D  T07005                 5      5P 0
     D @DS012          DS
     D  T08                    1     10    DIM(5)
     D  T08001                 1      2
     D  T08002                 3      4
     D  T08003                 5      6
     D  T08004                 7      8
     D  T08005                 9     10
     D @DS013          DS
     D  T09                    1    200    DIM(5)
     D  T09001                 1     40
     D  T09002                41     80
     D  T09003                81    120
     D  T09004               121    160
     D  T09005               161    200
     D @DS014          DS
     D  T10                    1      5P 0 DIM(5)
     D  T10001                 1      1P 0
     D  T10002                 2      2P 0
     D  T10003                 3      3P 0
     D  T10004                 4      4P 0
     D  T10005                 5      5P 0
     D @DS015          DS
     D  T11                    1     15    DIM(5)
     D  T11001                 1      3
     D  T11002                 4      6
     D  T11003                 7      9
     D  T11004                10     12
     D  T11005                13     15
     D @DS016          DS
     D  T12                    1    200    DIM(5)
     D  T12001                 1     40
     D  T12002                41     80
     D  T12003                81    120
     D  T12004               121    160
     D  T12005               161    200
     D @DS017          DS
     D  T13                    1      5P 0 DIM(5)
     D  T13001                 1      1P 0
     D  T13002                 2      2P 0
     D  T13003                 3      3P 0
     D  T13004                 4      4P 0
     D  T13005                 5      5P 0
     D @DS018          DS
     D  T14                    1     30    DIM(5)
     D  T14001                 1      6
     D  T14002                 7     12
     D  T14003                13     18
     D  T14004                19     24
     D  T14005                25     30
     D @DS019          DS
     D  T15                    1     15    DIM(5)
     D  T15001                 1      3
     D  T15002                 4      6
     D  T15003                 7      9
     D  T15004                10     12
     D  T15005                13     15
     D @DS020          DS
     D  T16                    1    200    DIM(5)
     D  T16001                 1     40
     D  T16002                41     80
     D  T16003                81    120
     D  T16004               121    160
     D  T16005               161    200
     D @DS021          DS
     D  T17                    1      5P 0 DIM(5)
     D  T17001                 1      1P 0
     D  T17002                 2      2P 0
     D  T17003                 3      3P 0
     D  T17004                 4      4P 0
     D  T17005                 5      5P 0
     D @DS022          DS
     D  T18                    1     15    DIM(5)
     D  T18001                 1      3
     D  T18002                 4      6
     D  T18003                 7      9
     D  T18004                10     12
     D  T18005                13     15
     D @DS023          DS
     D  T19                    1    200    DIM(5)
     D  T19001                 1     40
     D  T19002                41     80
     D  T19003                81    120
     D  T19004               121    160
     D  T19005               161    200
     D @DS024          DS
     D  T20                    1      5P 0 DIM(5)
     D  T20001                 1      1P 0
     D  T20002                 2      2P 0
     D  T20003                 3      3P 0
     D  T20004                 4      4P 0
     D  T20005                 5      5P 0
     D @DS025          DS
     D  T21                    1     15    DIM(5)
     D  T21001                 1      3
     D  T21002                 4      6
     D  T21003                 7      9
     D  T21004                10     12
     D  T21005                13     15
     D @DS026          DS
     D  T22                    1     50    DIM(5)
     D  T22001                 1     10
     D  T22002                11     20
     D  T22003                21     30
     D  T22004                31     40
     D  T22005                41     50
     D @DS027          DS
     D  T23                    1    200    DIM(5)
     D  T23001                 1     40
     D  T23002                41     80
     D  T23003                81    120
     D  T23004               121    160
     D  T23005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0001
     I              CYEMPCOL                    RN0002
     I              CYEMPHEAD                   RN0003
     I              CYPRDHEAD                   RN0004
     I              CYREFHEAD                   RN0005
     I              CYSDESC                     RN0006
     IITMCLASF
     I              ICCOYNO                     RN0007
     IITMSTRF
     I              ITALPHA                     RN0008
     I              ITCOYNO                     RN0009
     I              ITIDESC                     RN0010
     IFMT001
     I              SICOYNO                     RN0011
     ISTOKGRPF
     I              SGCOYNO                     RN0012
     I              SGSDESC                     RN0013
     ISTOKREQF
     I              SRBFLAG                     RN0014
     I              SRCOYNO                     RN0015
     I              SRFCLAS                     RN0016
     I              SRFITEM                     RN0017
     I              SRFLOCN                     RN0018
     I              SRFSBRN                     RN0019
     I              SRFSGRP                     RN0020
     I              SRFSTIG                     RN0021
     I              SRFSUPPN                    RN0022
     I              SRFWHSE                     RN0023
     I              SRTCLAS                     RN0024
     I              SRTITEM                     RN0025
     I              SRTLOCN                     RN0026
     I              SRTSBRN                     RN0027
     I              SRTSGRP                     RN0028
     I              SRTSTIG                     RN0029
     I              SRTSUPPN                    RN0030
     I              SRTWHSE                     RN0031
     ISTOKSELF
     I              SSCOYNO                     RN0032
     I              SSQUANT                     RN0033
     ISUPLIERF
     I              SUALPHA                     RN0034
     I              SUBRNBR                     RN0035
     I              SUCONNAM                    RN0036
     I              SUCOYNO                     RN0037
     I              SUPSTCD                     RN0038
     I              SUSUPPN                     RN0039
     I              SUTELEPH                    RN0040
     IWAREHEDF
     I              WHCOYNO                     RN0041
     I              WHWDESC                     RN0042
     IWARELOCF
     I              WLCOYNO                     RN0043
     IFMT002
     I              SRBFLAG                     RN0014
     I              SRCOYNO                     RN0015
     I              SRFCLAS                     RN0016
     I              SRFITEM                     RN0017
     I              SRFLOCN                     RN0018
     I              SRFSBRN                     RN0019
     I              SRFSGRP                     RN0020
     I              SRFSTIG                     RN0021
     I              SRFSUPPN                    RN0022
     I              SRFWHSE                     RN0023
     I              SRTCLAS                     RN0024
     I              SRTITEM                     RN0025
     I              SRTLOCN                     RN0026
     I              SRTSBRN                     RN0027
     I              SRTSGRP                     RN0028
     I              SRTSTIG                     RN0029
     I              SRTSUPPN                    RN0030
     I              SRTWHSE                     RN0031
     C********************************************************************
     C*            P a r a m e t e r     L i s t
     C********************************************************************
     C*
     C     P0001         PLIST
     C                   PARM                    PGO
     C                   PARM                    KDPKEY           27
     C                   PARM                    WK0601
     C*
     C     P0002         PLIST
     C                   PARM                    BAT
     C                   PARM                    PRM003            3
     C                   PARM                    PRSEQ
     C*
     C     *ENTRY        PLIST
     C                   PARM                    PRM003            3
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
     C                   KFLD                    KRCO01
     C                   KFLD                    KRSE02
     C*
     C     K0003         KLIST
     C                   KFLD                    KRCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KCCO01
     C                   KFLD                    KCCL02
     C*
     C     K0005         KLIST
     C                   KFLD                    KCCO01
     C*
     C     K0006         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0007         KLIST
     C                   KFLD                    KTCO01
     C*
     C     K0008         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIST02
     C*
     C     K0009         KLIST
     C                   KFLD                    KICO01
     C*
     C     K0010         KLIST
     C                   KFLD                    KGCO01
     C                   KFLD                    KGSG02
     C*
     C     K0011         KLIST
     C                   KFLD                    KGCO01
     C*
     C     K0012         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0013         KLIST
     C                   KFLD                    KUCO01
     C*
     C     K0014         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0015         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0016         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C                   KFLD                    KLLO03
     C*
     C     K0017         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    ICCLAS        WCCLAS                         Item Class
     C     *LIKE         DEFINE    RN0007        WK0001                         Company number
     C     *LIKE         DEFINE    ICDESC        WCDESC                         Item Class Descripti
     C     *LIKE         DEFINE    RN0009        WK0002                         Company number
     C     *LIKE         DEFINE    RN0010        WK0003                         Item Description
     C     *LIKE         DEFINE    ITITEM        WTITEM                         Item Number
     C     *LIKE         DEFINE    RN0011        WK0004                         Company number
     C     *LIKE         DEFINE    SIDESC        WIDESC                         S.I.G. Description
     C     *LIKE         DEFINE    SISTIG        WISTIG                         Stock Inventory Grou
     C     *LIKE         DEFINE    RN0012        WK0005                         Company number
     C     *LIKE         DEFINE    RN0013        WK0006                         Stock Group Descript
     C     *LIKE         DEFINE    SGSGRP        WGSGRP                         Stock Group
     C     *LIKE         DEFINE    RN0015        WK0008                         Company number
     C     *LIKE         DEFINE    RN0035        WK0025                         Branch Number
     C     *LIKE         DEFINE    RN0037        WK0026                         Company number
     C     *LIKE         DEFINE    SUNAME        WUNAME                         Customer name
     C     *LIKE         DEFINE    RN0039        WK0027                         Supplier Number
     C     *LIKE         DEFINE    RN0041        WK0028                         Company number
     C     *LIKE         DEFINE    RN0042        WK0029                         Warehouse Descriptio
     C     *LIKE         DEFINE    WHWHSE        WK0030                         Warehouse Number
     C     *LIKE         DEFINE    RN0043        WK0031                         Company number
     C     *LIKE         DEFINE    WLDESC        WK0032                         Location Description
     C     *LIKE         DEFINE    WLLOCN        WK0033                         Location
     C     *LIKE         DEFINE    WLWHSE        WK0034                         Warehouse Number
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0001        HD0001
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0007        HD0002
     C     *LIKE         DEFINE    ICCLAS        HCCLAS
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0009        HD0003
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0011        HD0004
     C     *LIKE         DEFINE    SISTIG        HISTIG
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0012        HD0005
     C     *LIKE         DEFINE    SGSGRP        HGSGRP
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0032        HD0007
     C     *LIKE         DEFINE    SSSEQ         HSSEQ
     C     *LIKE         DEFINE    SSWHSE        HSWHSE
     C     *LIKE         DEFINE    SSPCKR        HSPCKR
     C     *LIKE         DEFINE    SSLOCN        HSLOCN
     C     *LIKE         DEFINE    SSITEM        HSITEM
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0037        HD0009
     C     *LIKE         DEFINE    RN0039        HD0010
     C     *LIKE         DEFINE    RN0035        HD0008
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0041        HD0011
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0043        HD0012
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
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
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       DTWHSE            3
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *BLANKS       FSTBRN            3
     C                   MOVE      *BLANKS       FST03             3
     C                   MOVE      *BLANKS       FST04            15
     C                   MOVE      *BLANKS       FST05             2
     C                   MOVE      *BLANKS       FST06             3
     C                   MOVE      *BLANKS       FST07             6
     C                   MOVE      *BLANKS       FST08             3
     C                   MOVE      *BLANKS       FST09            10
     C                   MOVE      *BLANKS       F02BRN            3
     C                   MOVE      *BLANKS       F02001            3
     C                   MOVE      *BLANKS       F02002           15
     C                   MOVE      *BLANKS       F02003            2
     C                   MOVE      *BLANKS       F02004            3
     C                   MOVE      *BLANKS       F02005            6
     C                   MOVE      *BLANKS       F02006            3
     C                   MOVE      *BLANKS       F02007           10
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Z9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LSTBRN            3
     C                   MOVE      *BLANKS       LST03             3
     C                   MOVE      *BLANKS       LST04            15
     C                   MOVE      *BLANKS       LST05             2
     C                   MOVE      *BLANKS       LST06             3
     C                   MOVE      *BLANKS       LST07             6
     C                   MOVE      *BLANKS       LST08             3
     C                   MOVE      *BLANKS       LST09            10
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *ZEROS        PRM002            5 0
     C                   MOVE      *ZEROS        PRSEQ            15 5
     C                   MOVE      *ZEROS        PS0102            5 0
     C                   MOVE      *BLANKS       SVKBRN            3
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *ZEROS        SVK002            5 0
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004            3
     C                   MOVE      *BLANKS       SVK005            3
     C                   MOVE      *BLANKS       SVK006           15
     C                   MOVE      *BLANKS       SVK007            3
     C                   MOVE      *BLANKS       SVK008            2
     C                   MOVE      *BLANKS       SVK009            3
     C                   MOVE      *BLANKS       SVK010            3
     C                   MOVE      *BLANKS       SVK011            3
     C                   MOVE      *BLANKS       SVK012            6
     C                   MOVE      *BLANKS       SVK013            3
     C                   MOVE      *BLANKS       SVK014            3
     C                   MOVE      *BLANKS       SVK015            3
     C                   MOVE      *BLANKS       SVK016            3
     C                   MOVE      *BLANKS       SVK017            3
     C                   MOVE      *BLANKS       SVK018           10
     C                   MOVE      *BLANKS       SVK03             3
     C                   MOVE      *BLANKS       SVK04            15
     C                   MOVE      *BLANKS       SVK05             2
     C                   MOVE      *BLANKS       SVK06             3
     C                   MOVE      *BLANKS       SVK07             6
     C                   MOVE      *BLANKS       SVK08             3
     C                   MOVE      *BLANKS       SVK09            10
     C                   MOVE      *ZEROS        S03CNT            3 0
     C                   MOVE      *ZEROS        S04CNT            3 0
     C                   MOVE      *ZEROS        S05CNT            3 0
     C                   MOVE      *ZEROS        S06CNT            3 0
     C                   MOVE      *ZEROS        S07CNT            3 0
     C                   MOVE      *ZEROS        S08CNT            3 0
     C                   MOVE      *ZEROS        S09CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD02            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          003
     C                   MOVE      *BLANKS       KRCO01            3            SRCOYNO
     C                   MOVE      *ZEROS        KRSE02            5 0          SRSEQ
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       KCCO01            3            ICCOYNO
     C                   MOVE      *BLANKS       KCCL02            3            ICCLAS
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       KICO01            3            SICOYNO
     C                   MOVE      *BLANKS       KIST02            2            SISTIG
     C                   MOVE      *BLANKS       KGCO01            3            SGCOYNO
     C                   MOVE      *BLANKS       KGSG02            3            SGSGRP
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KLCO01            3            WLCOYNO
     C                   MOVE      *BLANKS       KLWH02            3            WLWHSE
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
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
     C                   MOVE      *ZEROS        T07001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T07002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T07003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T07004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T07005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T10001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T10002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T10003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T10004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T10005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T13001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T13002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T13003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T13004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T13005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T17001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T17002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T17003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T17004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T17005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T20001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T20002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T20003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T20004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T20005                         Init DS/*DTA flds
     C                   MOVEL     'LANDIMS'     APPSET
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
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS m file IMS St
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        RN0044           30 9
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS07             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS08             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS09             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS10             5 0          SV STS
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
     C     *DTAARA       DEFINE    KDPKEY3       @DS001
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
     C     SCRNID        CASEQ     'SC0009'      S009
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
     C* S001 - List Screen for STOKREQ
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C* WK0601 = *ymd
     C                   Z-ADD     XYMD          WK0601
     C* PGO = ' '
     C                   MOVEL     *BLANKS       PGO
     C* GETDTAA KDPKEY3
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
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
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S010
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* SRSEQ = 0
     C                   Z-ADD     *ZERO         XRSEQ
     C* SRFWHSE = ' '
     C                   MOVEL     *BLANKS       WK0016
     C* SRFSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0015
     C* SRFCLAS = ' '
     C                   MOVEL     *BLANKS       WK0009
     C* SRFSGRP = ' '
     C                   MOVEL     *BLANKS       WK0013
     C* SRFLOCN = ' '
     C                   MOVEL     *BLANKS       WK0011
     C* SRFITEM = ' '
     C                   MOVEL     *BLANKS       WK0010
     C* SRTWHSE = ' '
     C                   MOVEL     *BLANKS       WK0024
     C* SRTSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* SRTCLAS = ' '
     C                   MOVEL     *BLANKS       WK0017
     C* SRTSGRP = ' '
     C                   MOVEL     *BLANKS       WK0021
     C* SRTLOCN = ' '
     C                   MOVEL     *BLANKS       WK0019
     C* SRTITEM = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* Set Key values to parms passed
     C* SVK001 = prcoyno
     C                   MOVE      PRM003        SVK001
     C* SVK002 = 0
     C                   Z-ADD     *ZERO         SVK002
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     C*
     C                   EXSR      S011
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
     C* SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
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
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C* EXSUBR S01EDT
     C                   EXSR      S01EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C* *** Check for reposition
     C* IF (PS0102<>0)
     C     PS0102        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK002 = PS0102
     C                   Z-ADD     PS0102        SVK002
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
     C* SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
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
     C* S002 - Detail Screen for STOKREQ
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '000'         *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=4 | MODE=5
     C     MODE          IFEQ      4
     C     MODE          OREQ      5
     C*                                                               *
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK001 = SRCOYNO
     C                   MOVE      WK0008        SVK001
     C* SVK002 = SRSEQ
     C                   Z-ADD     XRSEQ         SVK002
     C* SRFWHSE = ' '
     C                   MOVEL     *BLANKS       WK0016
     C* SRFSTIG = ' '
     C                   MOVEL     *BLANKS       WK0014
     C* SRFSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0015
     C* SRFSBRN = ' '
     C                   MOVEL     *BLANKS       WK0012
     C* SRFCLAS = ' '
     C                   MOVEL     *BLANKS       WK0009
     C* SRFSGRP = ' '
     C                   MOVEL     *BLANKS       WK0013
     C* SRFLOCN = ' '
     C                   MOVEL     *BLANKS       WK0011
     C* SRFITEM = ' '
     C                   MOVEL     *BLANKS       WK0010
     C* SRTWHSE = ' '
     C                   MOVEL     *BLANKS       WK0024
     C* SRTSTIG = ' '
     C                   MOVEL     *BLANKS       WK0022
     C* SRTSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* SRTSBRN = ' '
     C                   MOVEL     *BLANKS       WK0020
     C* SRTCLAS = ' '
     C                   MOVEL     *BLANKS       WK0017
     C* SRTSGRP = ' '
     C                   MOVEL     *BLANKS       WK0021
     C* SRTLOCN = ' '
     C                   MOVEL     *BLANKS       WK0019
     C* SRTITEM = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* SRCOYNO = SVK001
     C                   MOVE      SVK001        WK0008
     C* SRSEQ = SVK002
     C                   Z-ADD     SVK002        XRSEQ
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
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
     C* GETREC D.STOKREQ,F.STOKREQ,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S012
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.STOKREQ,F.STOKREQ)=*yes
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
     C* IF %sts(D.STOKREQ,F.STOKREQ)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
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
     C* If record being used in batch cannot delet
     C* and return.
     C* IF srbflag = 'Y'
     C     WK0007        IFEQ      'Y'
     C* DSPERR *NONE,'USR0003','ERRORS',*LIBL
     C                   MOVEL     'USR0003'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* RLSREC d.stokreq,f.stokreq
     C*
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   UNLOCK    STOKREQX                             91      RLS LCK STOKREQX
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.STOKREQ,F.STOKREQ,*eq,SVK001,SVK002
     C*
     C                   EXSR      S013
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.STOKREQ,F.STOKREQ)=*no
     C*  Status of last file I/O
     C     STS01         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
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
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'INPUT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* SRCOYNO = prcoyno
     C                   MOVE      PRM003        WK0008
     C* SRFWHSE = ' '
     C                   MOVEL     *BLANKS       WK0016
     C* SRFSTIG = ' '
     C                   MOVEL     *BLANKS       WK0014
     C* SRFSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0015
     C* SRFSBRN = ' '
     C                   MOVEL     *BLANKS       WK0012
     C* SRFCLAS = ' '
     C                   MOVEL     *BLANKS       WK0009
     C* SRFSGRP = ' '
     C                   MOVEL     *BLANKS       WK0013
     C* SRFLOCN = ' '
     C                   MOVEL     *BLANKS       WK0011
     C* SRFITEM = ' '
     C                   MOVEL     *BLANKS       WK0010
     C* SRTWHSE = ' '
     C                   MOVEL     *BLANKS       WK0024
     C* SRTSTIG = ' '
     C                   MOVEL     *BLANKS       WK0022
     C* SRTSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* SRTSBRN = ' '
     C                   MOVEL     *BLANKS       WK0020
     C* SRTCLAS = ' '
     C                   MOVEL     *BLANKS       WK0017
     C* SRTSGRP = ' '
     C                   MOVEL     *BLANKS       WK0021
     C* SRTLOCN = ' '
     C                   MOVEL     *BLANKS       WK0019
     C* SRTITEM = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
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
     C* ** Store cursor position.
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
     C* IF %clf(STOKREQ.STOKREQ.SRFCLAS)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0009  '    FLDNAM
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
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* SRFCLAS = F02001
     C                   MOVE      F02001        WK0009
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtCLAS)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0017  '    FLDNAM
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
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* SRTCLAS = F02001
     C                   MOVE      F02001        WK0017
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFITEM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0010  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02002 = ' '
     C                   MOVEL     *BLANKS       F02002
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02002<>' '
     C     F02002        IFNE      *BLANKS
     C* SRFITEM = F02002
     C                   MOVE      *BLANKS       WK0010
     C                   MOVEL     F02002        WK0010
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtITEM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0018  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02002 = ' '
     C                   MOVEL     *BLANKS       F02002
     C* EXSCR SC0004
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02002<>' '
     C     F02002        IFNE      *BLANKS
     C* SRTITEM = F02002
     C                   MOVE      *BLANKS       WK0018
     C                   MOVEL     F02002        WK0018
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFSTIG)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0014  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02003 = ' '
     C                   MOVEL     *BLANKS       F02003
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S005
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
     C* IF F02003<>' '
     C     F02003        IFNE      *BLANKS
     C* SRFSTIG = F02003
     C                   MOVE      F02003        WK0014
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtSTIG)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0022  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02003 = ' '
     C                   MOVEL     *BLANKS       F02003
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S005
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
     C* IF F02003<>' '
     C     F02003        IFNE      *BLANKS
     C* SRTSTIG = F02003
     C                   MOVE      F02003        WK0022
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFSGRP)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0013  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02004 = ' '
     C                   MOVEL     *BLANKS       F02004
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02004<>' '
     C     F02004        IFNE      *BLANKS
     C* SRFSGRP = F02004
     C                   MOVE      F02004        WK0013
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtSGRP)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0021  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02004 = ' '
     C                   MOVEL     *BLANKS       F02004
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F02004<>' '
     C     F02004        IFNE      *BLANKS
     C* SRTSGRP = F02004
     C                   MOVE      F02004        WK0021
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFSUPPN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0015  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02005 = ' '
     C                   MOVEL     *BLANKS       F02005
     C* EXSCR SC0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S007
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
     C* IF F02005<>' '
     C     F02005        IFNE      *BLANKS
     C* SRFSUPPN = F02005
     C                   MOVE      F02005        WK0015
     C* SRFSBRN = F02brn
     C                   MOVE      F02BRN        WK0012
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtSUPPN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0023  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02005 = ' '
     C                   MOVEL     *BLANKS       F02005
     C* EXSCR SC0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S007
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
     C* IF F02005<>' '
     C     F02005        IFNE      *BLANKS
     C* SRTSUPPN = F02005
     C                   MOVE      F02005        WK0023
     C* SRTSBRN = F02brn
     C                   MOVE      F02BRN        WK0020
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0016  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02006 = ' '
     C                   MOVEL     *BLANKS       F02006
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
     C* IF F02006<>' '
     C     F02006        IFNE      *BLANKS
     C* SRFWHSE = F02006
     C                   MOVE      F02006        WK0016
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0024  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02006 = ' '
     C                   MOVEL     *BLANKS       F02006
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
     C* IF F02006<>' '
     C     F02006        IFNE      *BLANKS
     C* SRTWHSE = F02006
     C                   MOVE      F02006        WK0024
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKREQ.STOKREQ.SRFLOCN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0011  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02007 = ' '
     C                   MOVEL     *BLANKS       F02007
     C* DTWHSE = srfwhse
     C                   MOVE      WK0016        DTWHSE
     C* EXSCR SC0009
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S009
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
     C* IF F02007<>' '
     C     F02007        IFNE      *BLANKS
     C* SRFLOCN = F02007
     C                   MOVE      F02007        WK0011
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %clf(STOKREQ.STOKREQ.SRtLOCN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0019  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02007 = ' '
     C                   MOVEL     *BLANKS       F02007
     C* DTWHSE = srtwhse
     C                   MOVE      WK0024        DTWHSE
     C* EXSCR SC0009
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S009
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
     C* IF F02007<>' '
     C     F02007        IFNE      *BLANKS
     C* SRTLOCN = F02007
     C                   MOVE      F02007        WK0019
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Place cursor on stored position.
     C* POSCUR WKROW,WKCOL
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
     C*                                                               *
     C* ** If no fields processed for prompt
     C* ** (UPDFLG=0), display error.
     C* IF UPDFLG=0
     C     UPDFLG        IFEQ      *ZERO
     C* DSPERR *none,'Invalid cursor loc for prompt'
     C                   MOVEL     C0003         MSGDTA
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
     C* RLSREC D.STOKREQ,F.STOKREQ
     C*
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   UNLOCK    STOKREQX                             91      RLS LCK STOKREQX
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.STOKREQ,F.STOKREQ,f.stoksel
     C*
     C                   EXSR      S014
     C* IF %STS(D.STOKREQ,F.STOKREQ)=*YES
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* IF srfclas <> ' ' & srtclas = ' '
     C     WK0009        IFNE      *BLANKS
     C     WK0017        ANDEQ     *BLANKS
     C* SRTCLAS = srfclas
     C                   MOVE      WK0009        WK0017
     C* END                                                           *
     C                   END
     C* IF srfitem <> ' ' & srtitem = ' '
     C     WK0010        IFNE      *BLANKS
     C     WK0018        ANDEQ     *BLANKS
     C* SRTITEM = srfitem
     C                   MOVE      WK0010        WK0018
     C* END                                                           *
     C                   END
     C* IF srflocn <> ' ' & srtlocn = ' '
     C     WK0011        IFNE      *BLANKS
     C     WK0019        ANDEQ     *BLANKS
     C* SRTLOCN = srflocn
     C                   MOVE      WK0011        WK0019
     C* END                                                           *
     C                   END
     C* IF srfsgrp <> ' ' & srtsgrp = ' '
     C     WK0013        IFNE      *BLANKS
     C     WK0021        ANDEQ     *BLANKS
     C* SRTSGRP = srfsgrp
     C                   MOVE      WK0013        WK0021
     C* END                                                           *
     C                   END
     C* IF srfstig <> ' ' & srtstig = ' '
     C     WK0014        IFNE      *BLANKS
     C     WK0022        ANDEQ     *BLANKS
     C* SRTSTIG = srfstig
     C                   MOVE      WK0014        WK0022
     C* END                                                           *
     C                   END
     C* IF srfsuppn <> ' ' & srtsuppn = ' '
     C     WK0015        IFNE      *BLANKS
     C     WK0023        ANDEQ     *BLANKS
     C* SRTSUPPN = srfsuppn
     C                   MOVE      WK0015        WK0023
     C* END                                                           *
     C                   END
     C* IF srfwhse <> ' ' & srtwhse = ' '
     C     WK0016        IFNE      *BLANKS
     C     WK0024        ANDEQ     *BLANKS
     C* SRTWHSE = srfwhse
     C                   MOVE      WK0016        WK0024
     C* END                                                           *
     C                   END
     C* SRBFLAG = 'Y'
     C                   MOVE      'Y'           WK0007
     C* WRITE D.STOKREQ,F.STOKREQ
     C*
     C                   EXSR      S015
     C* BAT = 'B'
     C                   MOVE      'B'           BAT
     C* PRSEQ = srseq
     C                   Z-ADD     XRSEQ         PRSEQ
     C* CALL 'BSTOKREQC',bat,prcoyno,prseq
     C                   Z-ADD     1             CALLST
     C                   CALL      C0004         P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* ** Set keys for first record to display.
     C* SVK001 = SRCOYNO
     C                   MOVE      WK0008        SVK001
     C* SVK002 = SRSEQ
     C                   Z-ADD     XRSEQ         SVK002
     C* END                                                           *
     C                   END
     C* IF %STS(D.STOKREQ,F.STOKREQ)=*YES
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
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 -      List of Item Classes
     C*****************************************************************
     C     S003          BEGSR
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
     C* SVK003 = SRCOYNO
     C                   MOVE      WK0008        SVK003
     C* S03CNT = 005
     C                   Z-ADD     005           S03CNT
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
     C* SVK03 = FST03
     C                   MOVE      FST03         SVK03
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
     C* SVK03 = LST03
     C                   MOVE      LST03         SVK03
     C* ** Array Forward Read.
     C* EXSUBR S03AFR
     C                   EXSR      S03AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I03 = 1
     C                   Z-ADD     1             Y1
     C* DOW (I03<=C03)&(T01(I03)<>1)
     C     Y1            DOWLE     Z2
     C     T01(Y1)       ANDNE     1
     C* I03 = I03+1
     C     Y1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I03<=C03)&(T01(I03)=1)
     C     Y1            IFLE      Z2
     C     T01(Y1)       ANDEQ     1
     C* F02001 = B01(I03)
     C                   MOVE      B01(Y1)       F02001
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
     C* S004 -         List of Items
     C*****************************************************************
     C     S004          BEGSR
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
     C* SVK005 = SRCOYNO
     C                   MOVE      WK0008        SVK005
     C* S04CNT = 005
     C                   Z-ADD     005           S04CNT
     C* ** Array forward read.
     C* EXSUBR S04AFR
     C                   EXSR      S04AFR
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
     C* SVK04 = FST04
     C                   MOVE      FST04         SVK04
     C* ** Array Backwards read.
     C* EXSUBR S04ABR
     C                   EXSR      S04ABR
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
     C* SVK04 = LST04
     C                   MOVE      LST04         SVK04
     C* ** Array Forward Read.
     C* EXSUBR S04AFR
     C                   EXSR      S04AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I04 = 1
     C                   Z-ADD     1             Y2
     C* DOW (I04<=C04)&(T04(I04)<>1)
     C     Y2            DOWLE     Z3
     C     T04(Y2)       ANDNE     1
     C* I04 = I04+1
     C     Y2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I04<=C04)&(T04(I04)=1)
     C     Y2            IFLE      Z3
     C     T04(Y2)       ANDEQ     1
     C* F02002 = B02(I04)
     C                   MOVE      B02(Y2)       F02002
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
     C* S005 -    List of Inventory Groups
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
     C* SVK007 = SRCOYNO
     C                   MOVE      WK0008        SVK007
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
     C                   Z-ADD     1             Y3
     C* DOW (I05<=C05)&(T07(I05)<>1)
     C     Y3            DOWLE     Z4
     C     T07(Y3)       ANDNE     1
     C* I05 = I05+1
     C     Y3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y3
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I05<=C05)&(T07(I05)=1)
     C     Y3            IFLE      Z4
     C     T07(Y3)       ANDEQ     1
     C* F02003 = B03(I05)
     C                   MOVE      B03(Y3)       F02003
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
     C* S006 -      List of Stock Groups
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
     C* SVK009 = SRCOYNO
     C                   MOVE      WK0008        SVK009
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
     C                   Z-ADD     1             Y4
     C* DOW (I06<=C06)&(T10(I06)<>1)
     C     Y4            DOWLE     Z5
     C     T10(Y4)       ANDNE     1
     C* I06 = I06+1
     C     Y4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I06<=C06)&(T10(I06)=1)
     C     Y4            IFLE      Z5
     C     T10(Y4)       ANDEQ     1
     C* F02004 = B04(I06)
     C                   MOVE      B04(Y4)       F02004
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
     C* S007 -       List of Suppliers
     C*****************************************************************
     C     S007          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST07 = ' '
     C                   MOVEL     *BLANKS       FST07
     C* LST07 = ' '
     C                   MOVEL     *BLANKS       LST07
     C* SVK07 = ' '
     C                   MOVEL     *BLANKS       SVK07
     C* FSTBRN = ' '
     C                   MOVEL     *BLANKS       FSTBRN
     C* LSTBRN = ' '
     C                   MOVEL     *BLANKS       LSTBRN
     C* SVKBRN = ' '
     C                   MOVEL     *BLANKS       SVKBRN
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK011 = SRCOYNO
     C                   MOVE      WK0008        SVK011
     C* S07CNT = 005
     C                   Z-ADD     005           S07CNT
     C* ** Array forward read.
     C* EXSUBR S07AFR
     C                   EXSR      S07AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
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
     C                   EXFMT     SCR007
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
     C                   GOTO      $00799
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK07 = FST07
     C                   MOVE      FST07         SVK07
     C* SVKBRN = FSTbrn
     C                   MOVE      FSTBRN        SVKBRN
     C* ** Array Backwards read.
     C* EXSUBR S07ABR
     C                   EXSR      S07ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK07 = LST07
     C                   MOVE      LST07         SVK07
     C* SVKBRN = LSTbrn
     C                   MOVE      LSTBRN        SVKBRN
     C* ** Array Forward Read.
     C* EXSUBR S07AFR
     C                   EXSR      S07AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I07 = 1
     C                   Z-ADD     1             Y5
     C* DOW (I07<=C07)&(T13(I07)<>1)
     C     Y5            DOWLE     Z6
     C     T13(Y5)       ANDNE     1
     C* I07 = I07+1
     C     Y5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y5
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I07<=C07)&(T13(I07)=1)
     C     Y5            IFLE      Z6
     C     T13(Y5)       ANDEQ     1
     C* F02005 = B05(I07)
     C                   MOVE      B05(Y5)       F02005
     C* F02BRN = t15(I07)
     C                   MOVE      T15(Y5)       F02BRN
     C* EXTSCR                                                        *
     C                   GOTO      $00799
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00799        ENDSR
     C/EJECT
     C*****************************************************************
     C* S008 -       List of Warehouses
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
     C* SVK014 = SRCOYNO
     C                   MOVE      WK0008        SVK014
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
     C* EXTSCR                                                        *
     C                   GOTO      $00899
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
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
     C                   Z-ADD     1             Y6
     C* DOW (I08<=C08)&(T17(I08)<>1)
     C     Y6            DOWLE     Z7
     C     T17(Y6)       ANDNE     1
     C* I08 = I08+1
     C     Y6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y6
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I08<=C08)&(T17(I08)=1)
     C     Y6            IFLE      Z7
     C     T17(Y6)       ANDEQ     1
     C* F02006 = B06(I08)
     C                   MOVE      B06(Y6)       F02006
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
     C* S009 - List of Locations in Warehouse
     C*****************************************************************
     C     S009          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST09 = ' '
     C                   MOVEL     *BLANKS       FST09
     C* LST09 = ' '
     C                   MOVEL     *BLANKS       LST09
     C* SVK09 = ' '
     C                   MOVEL     *BLANKS       SVK09
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK016 = SRCOYNO
     C                   MOVE      WK0008        SVK016
     C* SVK017 = dtWHSE
     C                   MOVE      DTWHSE        SVK017
     C* S09CNT = 005
     C                   Z-ADD     005           S09CNT
     C* ** Array forward read.
     C* EXSUBR S09AFR
     C                   EXSR      S09AFR
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
     C* EXTSCR                                                        *
     C                   GOTO      $00999
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK09 = FST09
     C                   MOVE      FST09         SVK09
     C* ** Array Backwards read.
     C* EXSUBR S09ABR
     C                   EXSR      S09ABR
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
     C* SVK09 = LST09
     C                   MOVE      LST09         SVK09
     C* ** Array Forward Read.
     C* EXSUBR S09AFR
     C                   EXSR      S09AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I09 = 1
     C                   Z-ADD     1             Y7
     C* DOW (I09<=C09)&(T20(I09)<>1)
     C     Y7            DOWLE     Z8
     C     T20(Y7)       ANDNE     1
     C* I09 = I09+1
     C     Y7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I09<=C09)&(T20(I09)=1)
     C     Y7            IFLE      Z8
     C     T20(Y7)       ANDEQ     1
     C* F02007 = B07(I09)
     C                   MOVE      B07(Y7)       F02007
     C* EXTSCR                                                        *
     C                   GOTO      $00999
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00999        ENDSR
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
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR003
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
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0007'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR007
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0008'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR008
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0009'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR009
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
     C* GETBLK D.STOKREQ,F.STOKREQ,*PV,PRCOYNO
     C*
     C                   EXSR      S016
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       WK0007
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0022
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0020
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0021
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEL     *BLANKS       WK0018
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE     STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0006                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
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
     C* A001(C01) = SRCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0008        A01(Z1)
     C* A002(C01) = SRSEQ
     C                   Z-ADD     XRSEQ         A02(Z1)
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
     C                   MOVEL     *BLANKS       WK0007
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0022
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0020
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0021
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEL     *BLANKS       WK0018
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
     C                   EXSR      S018                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Z9
     C* DOBLK D.STOKREQ
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
     C     Z9            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z9
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* SRCOYNO = A001(I01)
     C                   MOVE      A01(Z9)       WK0008
     C* SRSEQ = A002(I01)
     C                   Z-ADD     A02(Z9)       XRSEQ
     C* ** Get record and any secondary records.
     C* GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     C*
     C                   EXSR      S019
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
     C* GETBLK D.STOKREQ,F.STOKREQ,*NE,PRCOYNO
     C*
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       WK0007
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0022
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0020
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0021
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEL     *BLANKS       WK0018
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READE     STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0006                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
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
     C* A001(C01) = SRCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0008        A01(Z1)
     C* A002(C01) = SRSEQ
     C                   Z-ADD     XRSEQ         A02(Z1)
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
     C                   MOVEL     *BLANKS       WK0007
     C                   Z-ADD     *ZEROS        FL0001
     C                   Z-ADD     *ZEROS        XRSEQ
     C                   MOVEL     *BLANKS       WK0016
     C                   MOVEL     *BLANKS       WK0014
     C                   MOVEL     *BLANKS       WK0015
     C                   MOVEL     *BLANKS       WK0012
     C                   MOVEL     *BLANKS       WK0009
     C                   MOVEL     *BLANKS       WK0013
     C                   MOVEL     *BLANKS       WK0011
     C                   MOVEL     *BLANKS       WK0010
     C                   MOVEL     *BLANKS       WK0024
     C                   MOVEL     *BLANKS       WK0022
     C                   MOVEL     *BLANKS       WK0023
     C                   MOVEL     *BLANKS       WK0020
     C                   MOVEL     *BLANKS       WK0017
     C                   MOVEL     *BLANKS       WK0021
     C                   MOVEL     *BLANKS       WK0019
     C                   MOVEL     *BLANKS       WK0018
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
     C* SETLL D.STOKREQ,F.ITMCLAS,SVK003,SVK03
     C*
     C                   EXSR      S020
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.ITMCLAS,*PV,SVK003
     C*
     C                   EXSR      S021
     C* DOW (C03<S03CNT)&%STS(D.STOKREQ,F.ITMCLAS)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z2
     C* GETREC D.STOKREQ,F.ITMCLAS,*PV,SVK003
     C*
     C                   EXSR      S021
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* SETLL D.STOKREQ,F.ITMCLAS,SVK003,SVK03
     C*
     C                   EXSR      S020
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
     C* GETREC D.STOKREQ,F.ITMCLAS,*NE,SVK003
     C*
     C                   EXSR      S023
     C* DOW (C03<S03CNT)&%STS(D.STOKREQ,F.ITMCLAS)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z2
     C* ** Unprotect select field.
     C* FLDATR T01(C03),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C03) = STOKREQ.ITMCLAS.ICCLAS
     C                   MOVE      *BLANKS       B01(Z2)
     C                   MOVE      WCCLAS        B01(Z2)
     C* ** load screen array.
     C* T02(C03) = STOKREQ.ITMCLAS.ICCLAS
     C                   MOVE      *BLANKS       T02(Z2)
     C                   MOVE      WCCLAS        T02(Z2)
     C* T03(C03) = STOKREQ.ITMCLAS.ICDESC
     C                   MOVE      *BLANKS       T03(Z2)
     C                   MOVE      WCDESC        T03(Z2)
     C* ** Save first record on screen.
     C* IF C03=1
     C     Z2            IFEQ      1
     C* FST03 = B01(C03)
     C                   MOVE      B01(Z2)       FST03
     C* END                                                           *
     C                   END
     C* IF C03<S03CNT
     C     Z2            IFLT      S03CNT
     C* GETREC D.STOKREQ,F.ITMCLAS,*NE,SVK003
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* S04ABR - SCRN SUB
     C*****************************************************************
     C     S04ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.ITMMAST,SVK005,SVK04
     C*
     C                   EXSR      S025
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.ITMMAST,*PV,SVK005
     C*
     C                   EXSR      S026
     C* DOW (C04<S04CNT)&%STS(D.STOKREQ,F.ITMMAST)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z3
     C* GETREC D.STOKREQ,F.ITMMAST,*PV,SVK005
     C*
     C                   EXSR      S026
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* SETLL D.STOKREQ,F.ITMMAST,SVK005,SVK04
     C*
     C                   EXSR      S025
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
     C                   Z-ADD     *ZERO         Z3
     C* ** protect select field
     C* DOW C04<S04CNT
     C     Z3            DOWLT     S04CNT
     C* C04 = C04+1
     C     Z3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z3
     C* FLDATR T04(C04),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* GETREC D.STOKREQ,F.ITMMAST,*NE,SVK005
     C*
     C                   EXSR      S028
     C* DOW (C04<S04CNT)&%STS(D.STOKREQ,F.ITMMAST)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z3
     C* ** Unprotect select field.
     C* FLDATR T04(C04),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C04) = STOKREQ.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       B02(Z3)
     C                   MOVEL     WTITEM        B02(Z3)
     C* ** load screen array.
     C* T05(C04) = STOKREQ.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       T05(Z3)
     C                   MOVE      WTITEM        T05(Z3)
     C* T06(C04) = STOKREQ.ITMMAST.ITIDESC
     C                   MOVE      *BLANKS       T06(Z3)
     C                   MOVE      WK0003        T06(Z3)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z3            IFEQ      1
     C* FST04 = B02(C04)
     C                   MOVE      B02(Z3)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z3            IFLT      S04CNT
     C* GETREC D.STOKREQ,F.ITMMAST,*NE,SVK005
     C*
     C                   EXSR      S028
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C04>0
     C     Z3            IFGT      *ZERO
     C* LST04 = B02(C04)
     C                   MOVE      B02(Z3)       LST04
     C* END                                                           *
     C                   END
     C*
     C     $S04AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S05ABR - SCRN SUB
     C*****************************************************************
     C     S05ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.STIGRP,SVK007,SVK05
     C*
     C                   EXSR      S030
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.STIGRP,*PV,SVK007
     C*
     C                   EXSR      S031
     C* DOW (C05<S05CNT)&%STS(D.STOKREQ,F.STIGRP)=*YES
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z4            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z4
     C* GETREC D.STOKREQ,F.STIGRP,*PV,SVK007
     C*
     C                   EXSR      S031
     C* END                                                           *
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* SETLL D.STOKREQ,F.STIGRP,SVK007,SVK05
     C*
     C                   EXSR      S030
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
     C* T07 = 0
     C                   Z-ADD     *ZERO         T07
     C* B03 = ' '
     C                   MOVEA     *BLANKS       B03
     C* T08 = ' '
     C                   MOVEA     *BLANKS       T08
     C* T09 = ' '
     C                   MOVEA     *BLANKS       T09
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z4
     C* ** protect select field
     C* DOW C05<S05CNT
     C     Z4            DOWLT     S05CNT
     C* C05 = C05+1
     C     Z4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z4
     C* FLDATR T07(C05),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C05 = 0
     C                   Z-ADD     *ZERO         Z4
     C* GETREC D.STOKREQ,F.STIGRP,*NE,SVK007
     C*
     C                   EXSR      S033
     C* DOW (C05<S05CNT)&%STS(D.STOKREQ,F.STIGRP)=*YES
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z4            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z4
     C* ** Unprotect select field.
     C* FLDATR T07(C05),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B03(C05) = STOKREQ.STIGRP.SISTIG
     C                   MOVE      *BLANKS       B03(Z4)
     C                   MOVE      WISTIG        B03(Z4)
     C* ** load screen array.
     C* T08(C05) = STOKREQ.STIGRP.SISTIG
     C                   MOVE      *BLANKS       T08(Z4)
     C                   MOVE      WISTIG        T08(Z4)
     C* T09(C05) = STOKREQ.STIGRP.SIDESC
     C                   MOVE      *BLANKS       T09(Z4)
     C                   MOVE      WIDESC        T09(Z4)
     C* ** Save first record on screen.
     C* IF C05=1
     C     Z4            IFEQ      1
     C* FST05 = B03(C05)
     C                   MOVE      B03(Z4)       FST05
     C* END                                                           *
     C                   END
     C* IF C05<S05CNT
     C     Z4            IFLT      S05CNT
     C* GETREC D.STOKREQ,F.STIGRP,*NE,SVK007
     C*
     C                   EXSR      S033
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
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
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C05>0
     C     Z4            IFGT      *ZERO
     C* LST05 = B03(C05)
     C                   MOVE      B03(Z4)       LST05
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
     C                   Z-ADD     *ZERO         Z5
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.STOKGRP,SVK009,SVK06
     C*
     C                   EXSR      S035
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.STOKGRP,*PV,SVK009
     C*
     C                   EXSR      S036
     C* DOW (C06<S06CNT)&%STS(D.STOKREQ,F.STOKGRP)=*YES
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z5            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z5
     C* GETREC D.STOKREQ,F.STOKGRP,*PV,SVK009
     C*
     C                   EXSR      S036
     C* END                                                           *
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* SETLL D.STOKREQ,F.STOKGRP,SVK009,SVK06
     C*
     C                   EXSR      S035
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
     C* T10 = 0
     C                   Z-ADD     *ZERO         T10
     C* B04 = ' '
     C                   MOVEA     *BLANKS       B04
     C* T11 = ' '
     C                   MOVEA     *BLANKS       T11
     C* T12 = ' '
     C                   MOVEA     *BLANKS       T12
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z5
     C* ** protect select field
     C* DOW C06<S06CNT
     C     Z5            DOWLT     S06CNT
     C* C06 = C06+1
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C* FLDATR T10(C06),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T10     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z5
     C* GETREC D.STOKREQ,F.STOKGRP,*NE,SVK009
     C*
     C                   EXSR      S038
     C* DOW (C06<S06CNT)&%STS(D.STOKREQ,F.STOKGRP)=*YES
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z5            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z5
     C* ** Unprotect select field.
     C* FLDATR T10(C06),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T10     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B04(C06) = STOKREQ.STOKGRP.SGSGRP
     C                   MOVE      *BLANKS       B04(Z5)
     C                   MOVE      WGSGRP        B04(Z5)
     C* ** load screen array.
     C* T11(C06) = STOKREQ.STOKGRP.SGSGRP
     C                   MOVE      *BLANKS       T11(Z5)
     C                   MOVE      WGSGRP        T11(Z5)
     C* T12(C06) = STOKREQ.STOKGRP.SGSDESC
     C                   MOVE      *BLANKS       T12(Z5)
     C                   MOVE      WK0006        T12(Z5)
     C* ** Save first record on screen.
     C* IF C06=1
     C     Z5            IFEQ      1
     C* FST06 = B04(C06)
     C                   MOVE      B04(Z5)       FST06
     C* END                                                           *
     C                   END
     C* IF C06<S06CNT
     C     Z5            IFLT      S06CNT
     C* GETREC D.STOKREQ,F.STOKGRP,*NE,SVK009
     C*
     C                   EXSR      S038
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C06>0
     C     Z5            IFGT      *ZERO
     C* LST06 = B04(C06)
     C                   MOVE      B04(Z5)       LST06
     C* END                                                           *
     C                   END
     C*
     C     $S06AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07ABR - SCRN SUB
     C*****************************************************************
     C     S07ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.SUPLIER,SVK011,SVK07,svkbrn
     C*
     C                   EXSR      S040
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.SUPLIER,*PV,SVK011
     C*
     C                   EXSR      S041
     C* DOW (C07<S07CNT)&%STS(D.STOKREQ,F.SUPLIER)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z6
     C* GETREC D.STOKREQ,F.SUPLIER,*PV,SVK011
     C*
     C                   EXSR      S041
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S07ALD
     C                   EXSR      S07ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S07AB
     C                   END
     C*
     C     $S07AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07AFR - SCRN SUB
     C*****************************************************************
     C     S07AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKREQ,F.SUPLIER,SVK011,SVK07,svkbrn
     C*
     C                   EXSR      S040
     C* ** Load arrays from this point.
     C* EXSUBR S07ALD
     C                   EXSR      S07ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S07AF
     C                   END
     C*
     C     $S07AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07ALD - SCRN SUB
     C*****************************************************************
     C     S07ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T13 = 0
     C                   Z-ADD     *ZERO         T13
     C* B05 = ' '
     C                   MOVEA     *BLANKS       B05
     C* T14 = ' '
     C                   MOVEA     *BLANKS       T14
     C* T15 = ' '
     C                   MOVEA     *BLANKS       T15
     C* T16 = ' '
     C                   MOVEA     *BLANKS       T16
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C07<S07CNT
     C     Z6            DOWLT     S07CNT
     C* C07 = C07+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* FLDATR T13(C07),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T13     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.STOKREQ,F.SUPLIER,*NE,SVK011
     C*
     C                   EXSR      S043
     C* DOW (C07<S07CNT)&%STS(D.STOKREQ,F.SUPLIER)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z6
     C* ** Unprotect select field.
     C* FLDATR T13(C07),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T13     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B05(C07) = STOKREQ.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       B05(Z6)
     C                   MOVE      WK0027        B05(Z6)
     C* ** load screen array.
     C* T14(C07) = STOKREQ.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       T14(Z6)
     C                   MOVE      WK0027        T14(Z6)
     C* T15(C07) = STOKREQ.SUPLIER.SUBRNBR
     C                   MOVE      *BLANKS       T15(Z6)
     C                   MOVE      WK0025        T15(Z6)
     C* T16(C07) = STOKREQ.SUPLIER.SUNAME
     C                   MOVE      *BLANKS       T16(Z6)
     C                   MOVE      WUNAME        T16(Z6)
     C* ** Save first record on screen.
     C* IF C07=1
     C     Z6            IFEQ      1
     C* FST07 = B05(C07)
     C                   MOVE      B05(Z6)       FST07
     C* FSTBRN = t15(C07)
     C                   MOVE      T15(Z6)       FSTBRN
     C* END                                                           *
     C                   END
     C* IF C07<S07CNT
     C     Z6            IFLT      S07CNT
     C* GETREC D.STOKREQ,F.SUPLIER,*NE,SVK011
     C*
     C                   EXSR      S043
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C07>0
     C     Z6            IFGT      *ZERO
     C* LST07 = B05(C07)
     C                   MOVE      B05(Z6)       LST07
     C* LSTBRN = t15(C07)
     C                   MOVE      T15(Z6)       LSTBRN
     C* END                                                           *
     C                   END
     C*
     C     $S07AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S08ABR - SCRN SUB
     C*****************************************************************
     C     S08ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.WAREHED,SVK014,SVK08
     C*
     C                   EXSR      S045
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.WAREHED,*PV,SVK014
     C*
     C                   EXSR      S046
     C* DOW (C08<S08CNT)&%STS(D.STOKREQ,F.WAREHED)=*YES
     C     Z7            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z7            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z7
     C* GETREC D.STOKREQ,F.WAREHED,*PV,SVK014
     C*
     C                   EXSR      S046
     C* END                                                           *
     C     Z7            IFLT      S08CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
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
     C* SETLL D.STOKREQ,F.WAREHED,SVK014,SVK08
     C*
     C                   EXSR      S045
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
     C* T17 = 0
     C                   Z-ADD     *ZERO         T17
     C* B06 = ' '
     C                   MOVEA     *BLANKS       B06
     C* T18 = ' '
     C                   MOVEA     *BLANKS       T18
     C* T19 = ' '
     C                   MOVEA     *BLANKS       T19
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** protect select field
     C* DOW C08<S08CNT
     C     Z7            DOWLT     S08CNT
     C* C08 = C08+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* FLDATR T17(C08),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T17     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z7
     C* GETREC D.STOKREQ,F.WAREHED,*NE,SVK014
     C*
     C                   EXSR      S048
     C* DOW (C08<S08CNT)&%STS(D.STOKREQ,F.WAREHED)=*YES
     C     Z7            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z7            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z7
     C* ** Unprotect select field.
     C* FLDATR T17(C08),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T17     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B06(C08) = STOKREQ.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       B06(Z7)
     C                   MOVE      WK0030        B06(Z7)
     C* ** load screen array.
     C* T18(C08) = STOKREQ.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       T18(Z7)
     C                   MOVE      WK0030        T18(Z7)
     C* T19(C08) = STOKREQ.WAREHED.WHWDESC
     C                   MOVE      *BLANKS       T19(Z7)
     C                   MOVE      WK0029        T19(Z7)
     C* ** Save first record on screen.
     C* IF C08=1
     C     Z7            IFEQ      1
     C* FST08 = B06(C08)
     C                   MOVE      B06(Z7)       FST08
     C* END                                                           *
     C                   END
     C* IF C08<S08CNT
     C     Z7            IFLT      S08CNT
     C* GETREC D.STOKREQ,F.WAREHED,*NE,SVK014
     C*
     C                   EXSR      S048
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z7            IFLT      S08CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C08>0
     C     Z7            IFGT      *ZERO
     C* LST08 = B06(C08)
     C                   MOVE      B06(Z7)       LST08
     C* END                                                           *
     C                   END
     C*
     C     $S08AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S09ABR - SCRN SUB
     C*****************************************************************
     C     S09ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKREQ,F.WARELOC,SVK016,SVK017,SVK09
     C*
     C                   EXSR      S050
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKREQ,F.WARELOC,*PV,SVK016,SVK017
     C*
     C                   EXSR      S051
     C* DOW (C09<S09CNT)&%STS(D.STOKREQ,F.WARELOC)=*YES
     C     Z8            IFLT      S09CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C09 = C09+1
     C     Z8            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z8
     C* GETREC D.STOKREQ,F.WARELOC,*PV,SVK016,SVK017
     C*
     C                   EXSR      S051
     C* END                                                           *
     C     Z8            IFLT      S09CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S09ALD
     C                   EXSR      S09ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S09AB
     C                   END
     C*
     C     $S09AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S09AFR - SCRN SUB
     C*****************************************************************
     C     S09AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKREQ,F.WARELOC,SVK016,SVK017,SVK09
     C*
     C                   EXSR      S050
     C* ** Load arrays from this point.
     C* EXSUBR S09ALD
     C                   EXSR      S09ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S09AF
     C                   END
     C*
     C     $S09AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S09ALD - SCRN SUB
     C*****************************************************************
     C     S09ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T20 = 0
     C                   Z-ADD     *ZERO         T20
     C* B07 = ' '
     C                   MOVEA     *BLANKS       B07
     C* T21 = ' '
     C                   MOVEA     *BLANKS       T21
     C* T22 = ' '
     C                   MOVEA     *BLANKS       T22
     C* T23 = ' '
     C                   MOVEA     *BLANKS       T23
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** protect select field
     C* DOW C09<S09CNT
     C     Z8            DOWLT     S09CNT
     C* C09 = C09+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* FLDATR T20(C09),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T20     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z8
     C* GETREC D.STOKREQ,F.WARELOC,*NE,SVK016,SVK017
     C*
     C                   EXSR      S053
     C* DOW (C09<S09CNT)&%STS(D.STOKREQ,F.WARELOC)=*YES
     C     Z8            IFLT      S09CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     RN0044        IFEQ      XYES
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0044        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* C09 = C09+1
     C     Z8            ADD       1             RN0044
     C                   Z-ADD     RN0044        Z8
     C* ** Unprotect select field.
     C* FLDATR T20(C09),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T20     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B07(C09) = STOKREQ.WARELOC.WLLOCN
     C                   MOVE      *BLANKS       B07(Z8)
     C                   MOVE      WK0033        B07(Z8)
     C* ** load screen array.
     C* T21(C09) = STOKREQ.WARELOC.WLWHSE
     C                   MOVE      *BLANKS       T21(Z8)
     C                   MOVE      WK0034        T21(Z8)
     C* T22(C09) = STOKREQ.WARELOC.WLLOCN
     C                   MOVE      *BLANKS       T22(Z8)
     C                   MOVE      WK0033        T22(Z8)
     C* T23(C09) = STOKREQ.WARELOC.WLDESC
     C                   MOVE      *BLANKS       T23(Z8)
     C                   MOVE      WK0032        T23(Z8)
     C* ** Save first record on screen.
     C* IF C09=1
     C     Z8            IFEQ      1
     C* FST09 = B07(C09)
     C                   MOVE      B07(Z8)       FST09
     C* END                                                           *
     C                   END
     C* IF C09<S09CNT
     C     Z8            IFLT      S09CNT
     C* GETREC D.STOKREQ,F.WARELOC,*NE,SVK016,SVK017
     C*
     C                   EXSR      S053
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z8            IFLT      S09CNT
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0044        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0044
     C                   ELSE
     C                   Z-ADD     0             RN0044
     C                   END
     C                   Z-ADD     RN0044        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C09>0
     C     Z8            IFGT      *ZERO
     C* LST09 = B07(C09)
     C                   MOVE      B07(Z8)       LST09
     C* END                                                           *
     C                   END
     C*
     C     $S09AL        ENDSR
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
     C* S010   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S010          BEGSR
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
     C* S011   - SETLL D.STOKREQ,F.STOKREQ,SVK001,SVK002
     C**************************************************************************
     C     S011          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HD0006                         Company number
     C                   Z-ADD     *LOVAL        HRSEQ                          Sequence
     C*
     C                   MOVEL     SVK001        KRCO01
     C                   MOVEL     SVK001        HD0006                         Company number
     C                   MOVEL     SVK001        RN0015                         Company number
     C                   Z-ADD     SVK002        KRSE02
     C                   Z-ADD     SVK002        HRSEQ                          Sequence
     C                   Z-ADD     SVK002        SRSEQ                          Sequence
     C*
     C     K0002         SETLL     STOKREQ                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S012   - GETREC D.STOKREQ,F.STOKREQ,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S012          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     SVK001        KRCO01
     C                   Z-ADD     SVK002        KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   Z-ADD     REC01         HRC01
     C     HRC01         CHAIN     STOKREQX                           9091      STOKREQ
     C                   Z-ADD     STS11         STS01                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   ELSE
     C                   Z-ADD     *HIVAL        STS11                          REC LOCKED
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
     C* S013   - GETREC D.STOKREQ,F.STOKREQ,*eq,SVK001,SVK002
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     SVK001        KRCO01
     C                   Z-ADD     SVK002        KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - DELETE D.STOKREQ,F.STOKREQ,f.stoksel
     C**************************************************************************
     C     S014          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS01
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     WK0008        KRCO01
     C                   Z-ADD     XRSEQ         KRSE02
     C     K0002         SETLL     STOKREQ                                      SETLL  STOKREQ
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - STOKREQ
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0002         READE     STOKREQ                              9190    READE  STOKREQ
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C     REC01         CHAIN     STOKREQX                           9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   MOVE      *HIVAL        SVS03
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0015        KRCO01
     C                   Z-ADD     SRSEQ         KRSE02
     C     K0002         SETLL     STOKSEL                                      SETLL  STOKSEL
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - STOKSEL
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0002         READE     STOKSEL                              9190    READE  STOKSEL
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    STOKSEL                              91      DELETE STOKSEL
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
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
     C     REC01         DELETE    STOKREQX                           9191      DELETE STOKREQ
     C                   Z-ADD     STS11         SVS01                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(3)         MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(4)         MSGDTA                         No record found to d
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
     C     K0002         SETLL     STOKREQ                                      RESUME FILE POINTER
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C     K0002         SETLL     STOKSEL                                      RESUME FILE POINTER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - WRITE D.STOKREQ,F.STOKREQ
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0008        KRCO01                         INITIALIZE KRCO01
     C                   Z-ADD     *HIVAL        KRSE02                         INITIALIZE KRSE02
     C     K0002         SETGT     STOKREQ
     C                   READP     STOKREQ                              9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0015        ANDEQ     KRCO01                                       Company number
     C     SRSEQ         ADD       1             XRSEQ                          Sequence
     C                   ELSE
     C                   Z-ADD     1             XRSEQ
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   WRITE     FMT002                               90      ADD REC TO STOKREQ
     C                   Z-ADD     STS11         STS01                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC11         REC01
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(5)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(6)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETBLK D.STOKREQ,F.STOKREQ,*PV,PRCOYNO
     C**************************************************************************
     C     S016          BEGSR
     C*
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     PRM003        KRCO01
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
     C     SWRD01        DOUNE     'Y'                                          RD.SW.STOKREQ   ITMC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C     K0003         READPE    STOKREQ                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0006                         Company number
     C                   Z-ADD     *ZERO         HRSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   END
     C*
     C     SWRD01        IFEQ      'Y'                                          RD.SW.STOKREQ   ITMC
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
     C* S017   - Process To Reset File Pointer(BOF) - STOKREQ
     C**************************************************************************
     C     S017          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKREQ   ITMC
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0015        KRCO01
     C     K0003         SETLL     STOKREQ
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - Process To Reset File Pointer(EOF) - STOKREQ
     C**************************************************************************
     C     S018          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.STOKREQ   ITMC
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KRCO01                         Company number
     C                   MOVEL     RN0015        KRCO01
     C     K0003         SETGT     STOKREQ
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       6             WADJ01
     C                   END
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.STOKREQ,F.STOKREQ,*EQ,SRCOYNO,SRSEQ
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KRCO01
     C                   MOVEL     WK0008        KRCO01
     C                   Z-ADD     XRSEQ         KRSE02
     C     K0002         CHAIN     STOKREQ                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.STOKREQ   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - SETLL D.STOKREQ,F.ITMCLAS,SVK003,SVK03
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK003        KCCO01
     C                   MOVEL     SVK003        HD0002                         Company number
     C                   MOVEL     SVK003        RN0007                         Company number
     C                   MOVEL     SVK03         KCCL02
     C                   MOVEL     SVK03         HCCLAS                         Item Class
     C                   MOVEL     SVK03         ICCLAS                         Item Class
     C*
     C     K0004         SETLL     ITMCLAS                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.STOKREQ,F.ITMCLAS,*PV,SVK003
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCCO01
     C                   MOVEL     SVK003        KCCO01
     C     K0005         READPE    ITMCLAS                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S022                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - Process To Reset File Pointer(BOF) - ITMCLAS
     C**************************************************************************
     C     S022          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.ITMCLAS   ITMM
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCCO01                         Company number
     C                   MOVEL     RN0007        KCCO01
     C     K0005         SETLL     ITMCLAS
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.STOKREQ,F.ITMCLAS,*NE,SVK003
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KCCO01
     C                   MOVEL     SVK003        KCCO01
     C     K0005         READE     ITMCLAS                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S024                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - Process To Reset File Pointer(EOF) - ITMCLAS
     C**************************************************************************
     C     S024          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.ITMCLAS   ITMM
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.ITMCLAS   ITMM
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KCCO01                         Company number
     C                   MOVEL     RN0007        KCCO01
     C     K0005         SETGT     ITMCLAS
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - SETLL D.STOKREQ,F.ITMMAST,SVK005,SVK04
     C**************************************************************************
     C     S025          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK005        KTCO01
     C                   MOVEL     SVK005        HD0003                         Company number
     C                   MOVEL     SVK005        RN0009                         Company number
     C                   MOVEL     SVK04         KTIT02
     C                   MOVEL     SVK04         HTITEM                         Item Number
     C                   MOVEL     SVK04         ITITEM                         Item Number
     C*
     C     K0006         SETLL     ITMMAST                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - GETREC D.STOKREQ,F.ITMMAST,*PV,SVK005
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK005        KTCO01
     C     K0007         READPE    ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S027                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - Process To Reset File Pointer(BOF) - ITMMAST
     C**************************************************************************
     C     S027          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.ITMMAST   STIG
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0009        KTCO01
     C     K0007         SETLL     ITMMAST
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - GETREC D.STOKREQ,F.ITMMAST,*NE,SVK005
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK005        KTCO01
     C     K0007         READE     ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S029                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - Process To Reset File Pointer(EOF) - ITMMAST
     C**************************************************************************
     C     S029          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.ITMMAST   STIG
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.ITMMAST   STIG
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0009        KTCO01
     C     K0007         SETGT     ITMMAST
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - SETLL D.STOKREQ,F.STIGRP,SVK007,SVK05
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK007        KICO01
     C                   MOVEL     SVK007        HD0004                         Company number
     C                   MOVEL     SVK007        RN0011                         Company number
     C                   MOVEL     SVK05         KIST02
     C                   MOVEL     SVK05         HISTIG                         Stock Inventory Grou
     C                   MOVEL     SVK05         SISTIG                         Stock Inventory Grou
     C*
     C     K0008         SETLL     STIGRP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - GETREC D.STOKREQ,F.STIGRP,*PV,SVK007
     C**************************************************************************
     C     S031          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK007        KICO01
     C     K0009         READPE    STIGRP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S032                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - Process To Reset File Pointer(BOF) - STIGRP
     C**************************************************************************
     C     S032          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.STIGRP    STOK
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0011        KICO01
     C     K0009         SETLL     STIGRP
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - GETREC D.STOKREQ,F.STIGRP,*NE,SVK007
     C**************************************************************************
     C     S033          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK007        KICO01
     C     K0009         READE     STIGRP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.STIGRP    STOK
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S034                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - Process To Reset File Pointer(EOF) - STIGRP
     C**************************************************************************
     C     S034          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.STIGRP    STOK
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.STIGRP    STOK
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0011        KICO01
     C     K0009         SETGT     STIGRP
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - SETLL D.STOKREQ,F.STOKGRP,SVK009,SVK06
     C**************************************************************************
     C     S035          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK009        KGCO01
     C                   MOVEL     SVK009        HD0005                         Company number
     C                   MOVEL     SVK009        RN0012                         Company number
     C                   MOVEL     SVK06         KGSG02
     C                   MOVEL     SVK06         HGSGRP                         Stock Group
     C                   MOVEL     SVK06         SGSGRP                         Stock Group
     C*
     C     K0010         SETLL     STOKGRP                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS07                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - GETREC D.STOKREQ,F.STOKGRP,*PV,SVK009
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KGCO01
     C                   MOVEL     SVK009        KGCO01
     C     K0011         READPE    STOKGRP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S037                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - Process To Reset File Pointer(BOF) - STOKGRP
     C**************************************************************************
     C     S037          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.STOKGRP   SUPL
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KGCO01                         Company number
     C                   MOVEL     RN0012        KGCO01
     C     K0011         SETLL     STOKGRP
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S038   - GETREC D.STOKREQ,F.STOKGRP,*NE,SVK009
     C**************************************************************************
     C     S038          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KGCO01
     C                   MOVEL     SVK009        KGCO01
     C     K0011         READE     STOKGRP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S039                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - Process To Reset File Pointer(EOF) - STOKGRP
     C**************************************************************************
     C     S039          BEGSR
     C*
     C     SWRD07        IFNE      'Y'                                          RD.SW.STOKGRP   SUPL
     C     STS07         ANDNE     1122                                         RCD LOCK
     C     STS07         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD07                         RD.SW.STOKGRP   SUPL
     C                   Z-ADD     STS07         SVS07                          SAVE FILE STS
     C                   MOVEL     *BLANK        KGCO01                         Company number
     C                   MOVEL     RN0012        KGCO01
     C     K0011         SETGT     STOKGRP
     C                   Z-ADD     SVS07         STS07                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - SETLL D.STOKREQ,F.SUPLIER,SVK011,SVK07,svkbrn
     C**************************************************************************
     C     S040          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C                   MOVEL     *LOVAL        HD0008                         Branch Number
     C*
     C                   MOVEL     SVK011        KUCO01
     C                   MOVEL     SVK011        HD0009                         Company number
     C                   MOVEL     SVK011        RN0037                         Company number
     C                   MOVEL     SVK07         KUSU02
     C                   MOVEL     SVK07         HD0010                         Supplier Number
     C                   MOVEL     SVK07         RN0039                         Supplier Number
     C                   MOVEL     SVKBRN        KUBR03
     C                   MOVEL     SVKBRN        HD0008                         Branch Number
     C                   MOVEL     SVKBRN        RN0035                         Branch Number
     C*
     C     K0012         SETLL     SUPLIER                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS08                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - GETREC D.STOKREQ,F.SUPLIER,*PV,SVK011
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK011        KUCO01
     C     K0013         READPE    SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S042                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S042   - Process To Reset File Pointer(BOF) - SUPLIER
     C**************************************************************************
     C     S042          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.SUPLIER   WARE
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0037        KUCO01
     C     K0013         SETLL     SUPLIER
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S043   - GETREC D.STOKREQ,F.SUPLIER,*NE,SVK011
     C**************************************************************************
     C     S043          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK011        KUCO01
     C     K0013         READE     SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S044                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - Process To Reset File Pointer(EOF) - SUPLIER
     C**************************************************************************
     C     S044          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.SUPLIER   WARE
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.SUPLIER   WARE
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0037        KUCO01
     C     K0013         SETGT     SUPLIER
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S045   - SETLL D.STOKREQ,F.WAREHED,SVK014,SVK08
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD09                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK014        KHCO01
     C                   MOVEL     SVK014        HD0011                         Company number
     C                   MOVEL     SVK014        RN0041                         Company number
     C                   MOVEL     SVK08         KHWH02
     C                   MOVEL     SVK08         HHWHSE                         Warehouse Number
     C                   MOVEL     SVK08         WHWHSE                         Warehouse Number
     C*
     C     K0014         SETLL     WAREHED                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS09                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S046   - GETREC D.STOKREQ,F.WAREHED,*PV,SVK014
     C**************************************************************************
     C     S046          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK014        KHCO01
     C     K0015         READPE    WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S047                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S047   - Process To Reset File Pointer(BOF) - WAREHED
     C**************************************************************************
     C     S047          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0041        KHCO01
     C     K0015         SETLL     WAREHED
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - GETREC D.STOKREQ,F.WAREHED,*NE,SVK014
     C**************************************************************************
     C     S048          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK014        KHCO01
     C     K0015         READE     WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S049                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S049   - Process To Reset File Pointer(EOF) - WAREHED
     C**************************************************************************
     C     S049          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0041        KHCO01
     C     K0015         SETGT     WAREHED
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - SETLL D.STOKREQ,F.WARELOC,SVK016,SVK017,SVK09
     C**************************************************************************
     C     S050          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD10                         RD.SW.WARELOC   STOK
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKSEL
     C*
     C                   MOVEL     SVK016        KLCO01
     C                   MOVEL     SVK016        HD0012                         Company number
     C                   MOVEL     SVK016        RN0043                         Company number
     C                   MOVEL     SVK017        KLWH02
     C                   MOVEL     SVK017        HLWHSE                         Warehouse Number
     C                   MOVEL     SVK017        WLWHSE                         Warehouse Number
     C                   MOVEL     SVK09         KLLO03
     C                   MOVEL     SVK09         HLLOCN                         Location
     C                   MOVEL     SVK09         WLLOCN                         Location
     C*
     C     K0016         SETLL     WARELOC                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS10                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - GETREC D.STOKREQ,F.WARELOC,*PV,SVK016,SVK017
     C**************************************************************************
     C     S051          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK016        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK017        KLWH02
     C     K0017         READPE    WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WARELOC   STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S052                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S052   - Process To Reset File Pointer(BOF) - WARELOC
     C**************************************************************************
     C     S052          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WARELOC   STOK
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WARELOC   STOK
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0043        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0017         SETLL     WARELOC
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - GETREC D.STOKREQ,F.WARELOC,*NE,SVK016,SVK017
     C**************************************************************************
     C     S053          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK016        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK017        KLWH02
     C     K0017         READE     WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WARELOC   STOK
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WARELOC   STOK
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S054                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S054   - Process To Reset File Pointer(EOF) - WARELOC
     C**************************************************************************
     C     S054          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WARELOC   STOK
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WARELOC   STOK
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0043        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0017         SETGT     WARELOC
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(8)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
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
     C* SLOCK - Update Lock Flag
     C*****************************************************************
     C     SLOCK         BEGSR
     C     STS01         IFEQ      1218                                         LOCK(SYS)-STOKREQ
     C     STS01         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK01                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK01                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    STOKREQX                             91      STOKREQX  MSTOKREQD
     C                   READ      STOKREQX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            STOKREQ
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
     C     WFILE#        IFEQ      3                                            STOKSEL
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
     C     WFILE#        IFEQ      4                                            ITMCLAS
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
     C     WFILE#        IFEQ      5                                            ITMMAST
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
     C     WFILE#        IFEQ      6                                            STIGRP
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
     C     WFILE#        IFEQ      7                                            STOKGRP
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
     C     WFILE#        IFEQ      8                                            SUPLIER
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
     C     WFILE#        IFEQ      9                                            WAREHED
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
     C     WFILE#        IFEQ      10                                           WARELOC
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
     C     WFILE#        IFEQ      11                                           STOKREQX
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
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOF - Move Fields From Work Area To File(s)
     C*****************************************************************
     C     SMVTOF        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     WK0007        RN0014                         Batch Update flag
     C                   MOVEL     WK0008        RN0015                         Company number
     C                   MOVEL     WK0009        RN0016                         From Item Class
     C                   MOVEL     WK0010        RN0017                         From Item Number
     C                   MOVEL     WK0011        RN0018                         From Location
     C                   MOVEL     WK0012        RN0019                         From Branch Number
     C                   MOVEL     WK0013        RN0020                         FromStock Group
     C                   MOVEL     WK0014        RN0021                         From Stock Inventory
     C                   MOVEL     WK0015        RN0022                         From Supplier Number
     C                   MOVEL     WK0016        RN0023                         From Warehouse Numbe
     C                   Z-ADD     XRSEQ         SRSEQ                          Sequence
     C                   MOVEL     WK0017        RN0024                         To Item Class
     C                   MOVEL     WK0018        RN0025                         To Item Number
     C                   MOVEL     WK0019        RN0026                         To Location
     C                   MOVEL     WK0020        RN0027                         To Branch Number
     C                   MOVEL     WK0021        RN0028                         To Stock Group
     C                   MOVEL     WK0022        RN0029                         To Stock Inventory G
     C                   MOVEL     WK0023        RN0030                         To Supplier Number
     C                   MOVEL     WK0024        RN0031                         To Warehouse Number
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKREQ
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0014        WK0007                         Batch Update flag
     C                   MOVEL     RN0015        WK0008                         Company number
     C                   MOVEL     RN0016        WK0009                         From Item Class
     C                   MOVEL     RN0017        WK0010                         From Item Number
     C                   MOVEL     RN0018        WK0011                         From Location
     C                   MOVEL     RN0019        WK0012                         From Branch Number
     C                   MOVEL     RN0020        WK0013                         FromStock Group
     C                   MOVEL     RN0021        WK0014                         From Stock Inventory
     C                   MOVEL     RN0022        WK0015                         From Supplier Number
     C                   MOVEL     RN0023        WK0016                         From Warehouse Numbe
     C                   Z-ADD     SRSEQ         XRSEQ                          Sequence
     C                   MOVEL     RN0024        WK0017                         To Item Class
     C                   MOVEL     RN0025        WK0018                         To Item Number
     C                   MOVEL     RN0026        WK0019                         To Location
     C                   MOVEL     RN0027        WK0020                         To Branch Number
     C                   MOVEL     RN0028        WK0021                         To Stock Group
     C                   MOVEL     RN0029        WK0022                         To Stock Inventory G
     C                   MOVEL     RN0030        WK0023                         To Supplier Number
     C                   MOVEL     RN0031        WK0024                         To Warehouse Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0015        HD0006                         Company number
     C                   Z-ADD     SRSEQ         HRSEQ                          Sequence
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
     C*          | Move Fields From File To Work Area - STOKSEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0032        HD0007                         Company number
     C                   Z-ADD     SSSEQ         HSSEQ                          Sequence
     C                   MOVEL     SSWHSE        HSWHSE                         Warehouse Number
     C                   MOVEL     SSPCKR        HSPCKR                         Picking Route
     C                   MOVEL     SSLOCN        HSLOCN                         Location
     C                   MOVEL     SSITEM        HSITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMCLAS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     ICCLAS        WCCLAS                         Item Class
     C                   MOVEL     RN0007        WK0001                         Company number
     C                   MOVEL     ICDESC        WCDESC                         Item Class Descripti
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0007        HD0002                         Company number
     C                   MOVEL     ICCLAS        HCCLAS                         Item Class
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0009        WK0002                         Company number
     C                   MOVEL     RN0010        WK0003                         Item Description
     C                   MOVEL     ITITEM        WTITEM                         Item Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0009        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STIGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0011        WK0004                         Company number
     C                   MOVEL     SIDESC        WIDESC                         S.I.G. Description
     C                   MOVEL     SISTIG        WISTIG                         Stock Inventory Grou
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0011        HD0004                         Company number
     C                   MOVEL     SISTIG        HISTIG                         Stock Inventory Grou
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKGRP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     RN0012        WK0005                         Company number
     C                   MOVEL     RN0013        WK0006                         Stock Group Descript
     C                   MOVEL     SGSGRP        WGSGRP                         Stock Group
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0012        HD0005                         Company number
     C                   MOVEL     SGSGRP        HGSGRP                         Stock Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     RN0035        WK0025                         Branch Number
     C                   MOVEL     RN0037        WK0026                         Company number
     C                   MOVEL     SUNAME        WUNAME                         Customer name
     C                   MOVEL     RN0039        WK0027                         Supplier Number
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0037        HD0009                         Company number
     C                   MOVEL     RN0039        HD0010                         Supplier Number
     C                   MOVEL     RN0035        HD0008                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     RN0041        WK0028                         Company number
     C                   MOVEL     RN0042        WK0029                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        WK0030                         Warehouse Number
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0041        HD0011                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     RN0043        WK0031                         Company number
     C                   MOVEL     WLDESC        WK0032                         Location Description
     C                   MOVEL     WLLOCN        WK0033                         Location
     C                   MOVEL     WLWHSE        WK0034                         Warehouse Number
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0043        HD0012                         Company number
     C                   MOVEL     WLWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
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
Record deleted from file IMS Stocktake items rqustd  SS
No record found to delete from file IMS Stocktake items rqustd  SS
Record deleted from file IMS Stock take request      SR
No record found to delete from file IMS Stock take request      SR
Record added to file IMS Stock take request      SR
Unable to add record to file IMS Stock take request      SR
The beginning of the file was reached
The end of the file was reached
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    WK0009    000008360838
SC0002    WK0017    000008580860
SC0002    WK0010    000010761095
SC0002    WK0018    000010981117
SC0002    WK0014    000006760677
SC0002    WK0022    000006980699
SC0002    WK0013    000009160918
SC0002    WK0021    000009380940
SC0002    WK0015    000007560761
SC0002    WK0023    000007780783
SC0002    WK0016    000005960598
SC0002    WK0024    000006180620
SC0002    WK0011    000009961005
SC0002    WK0019    000010181027
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  03      03
SC0001    FL0001    0000  0103    010402               Y
SC0002    INPUT     0000    02        01
SC0003    T01       0001            0201
SC0003    T01       0002            0403
SC0003    T01       0003            0605
SC0003    T01       0004            0807
SC0003    T01       0005            1009
SC0004    T04       0001            0201
SC0004    T04       0002            0403
SC0004    T04       0003            0605
SC0004    T04       0004            0807
SC0004    T04       0005            1009
SC0005    T07       0001            0201
SC0005    T07       0002            0403
SC0005    T07       0003            0605
SC0005    T07       0004            0807
SC0005    T07       0005            1009
SC0006    T10       0001            0201
SC0006    T10       0002            0403
SC0006    T10       0003            0605
SC0006    T10       0004            0807
SC0006    T10       0005            1009
SC0007    T13       0001            0201
SC0007    T13       0002            0403
SC0007    T13       0003            0605
SC0007    T13       0004            0807
SC0007    T13       0005            1009
SC0008    T17       0001            0201
SC0008    T17       0002            0403
SC0008    T17       0003            0605
SC0008    T17       0004            0807
SC0008    T17       0005            1009
SC0009    T20       0001            0201
SC0009    T20       0002            0403
SC0009    T20       0003            0605
SC0009    T20       0004            0807
SC0009    T20       0005            1009
