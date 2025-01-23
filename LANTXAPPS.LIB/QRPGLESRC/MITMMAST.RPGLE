     H dftactgrp(*no) actgrp(*caller) expropts(*resdecpos)
     H datfmt(*iso) timfmt(*iso) option(*nodebugio)
     F/TITLE MITMMAST     Work with Item Master
      ********************************************************************
      * Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
      ********************************************************************
      *
      *  Program ID          -    MITMMAST
      *  Application ID      -    MITMMAST
      *  Application Name    -        Work with Item Master
      *  Date Generated      -    Jan 11, 2012
      *
      ********************************************************************
      *  Files Usage
      *
      *  ITMMAST1    - (I/DISK   ) IMS Alpha seq
      *  COMPANY     - (I/DISK   ) Company screen headings     CY
      *  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
      *  ITMMAST     - (U/DISK   ) IMS Item master             IT
      *  ITMCLAS     - (I/DISK   ) IMS Item class parameters   IC
      *  STOKGRP     - (I/DISK   ) IMS Stock group codes       SG
      *  VATCOD      - (I/DISK   ) IMS VAT code
      *  ITMTYP      - (I/DISK   ) IMS Item Type               TP
      *  STANYS      - (I/DISK   ) IMS Stock analysis codes    SA
      *  STIGRP      - (I/DISK   ) IMS Stock Inventory group   SI
      *  STVGRP      - (I/DISK   ) IMS Stock value group       VG
      *  UOM         - (I/DISK   ) IMS Unit of measure         UM
      *  ORDDET5     - (I/DISK   ) SOP Order Details           OD
      *  WAREDETR1   - (I/DISK   ) IMS Warehouse Item Details  WD
      *  MITMMASTD   - (C/WORKSTN) Generated display file
      *
      ********************************************************************
      *  Function Of Indicators
      *
      *  SCALPH     - Alpha List Screen for ITMMAST
      *
      *  01     - SCR001S1 / FL0002 : DSPATR(PC)
      *  01     - SCR001S1 / FL0002 : DSPATR(RI)
      *  02     - SCR001S1 / FL0002 : DSPATR(PR)
      *  03     - SCR001S1 / FL0002 : DSPATR(UL)
      *  04     - SCR001S1 / FL0002 : DSPATR(ND)
      *  05     - SCR001S1 / RN0025 : DSPATR(PC)
      *  05     - SCR001S1 / RN0025 : DSPATR(RI)
      *  06     - SCR001S1 / ITITEM : DSPATR(PC)
      *  06     - SCR001S1 / ITITEM : DSPATR(RI)
      *  07     - SCR001 / CYDESC : DSPATR(PC)
      *  07     - SCR001 / CYDESC : DSPATR(RI)
      *  63     - SCR001C1 SFLDSPCTL
      *  64     - SCR001C1 SFLDSP
      *  65     - SCR001S1 SFLNXTCHG
      *  66     - SCR001C1 SFLINZ
      *  99     - SCR001 OVERLAY
      * N63     - SCR001C1 SFLCLR
      * N64     - SCR001C1 ERASE(SCR001S1)
      * N67     - SCR001C1 SFLEND
      * N79     - SCR001 PUTOVR
      * N79     - SCR001C1 PUTOVR
      *
      *  SC0001     - List Screen for ITMMAST
      *
      *  01     - SCR002S1 / FL0001 : DSPATR(RI)
      *  02     - SCR002S1 / FL0001 : DSPATR(PR)
      *  03     - SCR002S1 / FL0001 : DSPATR(UL)
      *  04     - SCR002S1 / FL0001 : DSPATR(ND)
      *  05     - SCR002S1 / ITITEM : DSPATR(PC)
      *  05     - SCR002S1 / ITITEM : DSPATR(RI)
      *  06     - SCR002 / CYDESC : DSPATR(PC)
      *  06     - SCR002 / CYDESC : DSPATR(RI)
      *  63     - SCR002C1 SFLDSPCTL
      *  64     - SCR002C1 SFLDSP
      *  65     - SCR002S1 SFLNXTCHG
      *  66     - SCR002C1 SFLINZ
      *  80     - SCR002S1 / FL0001 : DSPATR(PC)
      *  99     - SCR002 OVERLAY
      * N63     - SCR002C1 SFLCLR
      * N64     - SCR002C1 ERASE(SCR002S1)
      * N67     - SCR002C1 SFLEND
      * N79     - SCR002 PUTOVR
      * N79     - SCR002C1 PUTOVR
      *
      *  SC0002     - Detail Screen for ITMMAST
      *
      *  01     - SCR003 / RN0020 : DSPATR(PR)
      *  01     - SCR003 / ITCLAS : DSPATR(PR)
      *  01     - SCR003 / RN0022 : DSPATR(PR)
      *  01     - SCR003 / ITIGRP : DSPATR(PR)
      *  01     - SCR003 / ITMANF : DSPATR(PR)
      *  01     - SCR003 / ITPACK : DSPATR(PR)
      *  01     - SCR003 / ITPALL : DSPATR(PR)
      *  01     - SCR003 / ITQTYO : DSPATR(PR)
      *  01     - SCR003 / ITSUBS : DSPATR(PR)
      *  01     - SCR003 / ITSUPD : DSPATR(PR)
      *  01     - SCR003 / ITSUPG : DSPATR(PR)
      *  01     - SCR003 / ITUOM : DSPATR(PR)
      *  01     - SCR003 / ITUOMO : DSPATR(PR)
      *  01     - SCR003 / ITVATC : DSPATR(PR)
      *  01     - SCR003 / ITWEIG : DSPATR(PR)
      *  02     - SCR003 / RN0020 : DSPATR(UL)
      *  02     - SCR003 / ITCLAS : DSPATR(UL)
      *  02     - SCR003 / RN0022 : DSPATR(UL)
      *  02     - SCR003 / ITIGRP : DSPATR(UL)
      *  02     - SCR003 / ITMANF : DSPATR(UL)
      *  02     - SCR003 / ITPACK : DSPATR(UL)
      *  02     - SCR003 / ITPALL : DSPATR(UL)
      *  02     - SCR003 / ITQTYO : DSPATR(UL)
      *  02     - SCR003 / ITSUBS : DSPATR(UL)
      *  02     - SCR003 / ITSUPD : DSPATR(UL)
      *  02     - SCR003 / ITSUPG : DSPATR(UL)
      *  02     - SCR003 / ITUOM : DSPATR(UL)
      *  02     - SCR003 / ITUOMO : DSPATR(UL)
      *  02     - SCR003 / ITVATC : DSPATR(UL)
      *  02     - SCR003 / ITWEIG : DSPATR(UL)
      *  03     - SCR003 / RN0022 : DSPATR(PC)
      *  03     - SCR003 / RN0022 : DSPATR(RI)
      *  04     - SCR003 / VCDESC : DSPATR(PC)
      *  04     - SCR003 / VCDESC : DSPATR(RI)
      *  05     - SCR003 / ITCLAS : DSPATR(PC)
      *  05     - SCR003 / ITCLAS : DSPATR(RI)
      *  06     - SCR003 / ITIGRP : DSPATR(PC)
      *  06     - SCR003 / ITIGRP : DSPATR(RI)
      *  07     - SCR003 / ITITEM : DSPATR(PC)
      *  07     - SCR003 / ITITEM : DSPATR(RI)
      *  08     - SCR003 / ITITEM : DSPATR(PR)
      *  09     - SCR003 / ITITEM : DSPATR(UL)
      *  10     - SCR003 / ITPACK : DSPATR(PC)
      *  10     - SCR003 / ITPACK : DSPATR(RI)
      *  11     - SCR003 / ITPALL : DSPATR(PC)
      *  11     - SCR003 / ITPALL : DSPATR(RI)
      *  12     - SCR003 / ITQTYO : DSPATR(PC)
      *  12     - SCR003 / ITQTYO : DSPATR(RI)
      *  13     - SCR003 / ITSUBS : DSPATR(PC)
      *  13     - SCR003 / ITSUBS : DSPATR(RI)
      *  14     - SCR003 / ITSUPD : DSPATR(PC)
      *  14     - SCR003 / ITSUPD : DSPATR(RI)
      *  15     - SCR003 / ITSUPG : DSPATR(PC)
      *  15     - SCR003 / ITSUPG : DSPATR(RI)
      *  16     - SCR003 / ITUOM : DSPATR(PC)
      *  16     - SCR003 / ITUOM : DSPATR(RI)
      *  17     - SCR003 / ITUOMO : DSPATR(PC)
      *  17     - SCR003 / ITUOMO : DSPATR(RI)
      *  18     - SCR003 / ITVATC : DSPATR(PC)
      *  18     - SCR003 / ITVATC : DSPATR(RI)
      *  19     - SCR003 / ITWEIG : DSPATR(PC)
      *  19     - SCR003 / ITWEIG : DSPATR(RI)
      *  20     - SCR003 / CYDESC : DSPATR(PC)
      *  20     - SCR003 / CYDESC : DSPATR(RI)
      *  99     - SCR003 OVERLAY
      * N79     - SCR003 PUTOVR
      *
      *  SC0003     -      List of Item Classes
      *
      *  01     - SCR005 / T01 : DSPATR(PR)
      *  02     - SCR005 / T01 : DSPATR(ND)
      *  03     - SCR005 / T01 : DSPATR(PR)
      *  04     - SCR005 / T01 : DSPATR(ND)
      *  05     - SCR005 / T01 : DSPATR(PR)
      *  06     - SCR005 / T01 : DSPATR(ND)
      *  07     - SCR005 / T01 : DSPATR(PR)
      *  08     - SCR005 / T01 : DSPATR(ND)
      *  09     - SCR005 / T01 : DSPATR(PR)
      *  10     - SCR005 / T01 : DSPATR(ND)
      *  80     - SCR005 / T01 : DSPATR(PC)
      *  80     - SCR005 / T01 : DSPATR(PC)
      *  80     - SCR005 / T01 : DSPATR(PC)
      *  80     - SCR005 / T01 : DSPATR(PC)
      *  80     - SCR005 / T01 : DSPATR(PC)
      * N79     - SCR005 PUTOVR
      *
      *  SC0004     -       List of item types
      *
      *  01     - SCR006 / T04 : DSPATR(PR)
      *  02     - SCR006 / T04 : DSPATR(ND)
      *  03     - SCR006 / T04 : DSPATR(PR)
      *  04     - SCR006 / T04 : DSPATR(ND)
      *  05     - SCR006 / T04 : DSPATR(PR)
      *  06     - SCR006 / T04 : DSPATR(ND)
      *  07     - SCR006 / T04 : DSPATR(PR)
      *  08     - SCR006 / T04 : DSPATR(ND)
      *  09     - SCR006 / T04 : DSPATR(PR)
      *  10     - SCR006 / T04 : DSPATR(ND)
      *  80     - SCR006 / T04 : DSPATR(PC)
      *  80     - SCR006 / T04 : DSPATR(PC)
      *  80     - SCR006 / T04 : DSPATR(PC)
      *  80     - SCR006 / T04 : DSPATR(PC)
      *  80     - SCR006 / T04 : DSPATR(PC)
      * N79     - SCR006 PUTOVR
      *
      *  SC0007     -  List of stock analysis codes
      *
      *  01     - SCR007 / T14 : DSPATR(PR)
      *  02     - SCR007 / T14 : DSPATR(ND)
      *  03     - SCR007 / T14 : DSPATR(PR)
      *  04     - SCR007 / T14 : DSPATR(ND)
      *  05     - SCR007 / T14 : DSPATR(PR)
      *  06     - SCR007 / T14 : DSPATR(ND)
      *  07     - SCR007 / T14 : DSPATR(PR)
      *  08     - SCR007 / T14 : DSPATR(ND)
      *  09     - SCR007 / T14 : DSPATR(PR)
      *  10     - SCR007 / T14 : DSPATR(ND)
      *  80     - SCR007 / T14 : DSPATR(PC)
      *  80     - SCR007 / T14 : DSPATR(PC)
      *  80     - SCR007 / T14 : DSPATR(PC)
      *  80     - SCR007 / T14 : DSPATR(PC)
      *  80     - SCR007 / T14 : DSPATR(PC)
      * N79     - SCR007 PUTOVR
      *
      *  SC0008     - List of Stock inventory groups
      *
      *  01     - SCR008 / T17 : DSPATR(PR)
      *  02     - SCR008 / T17 : DSPATR(ND)
      *  03     - SCR008 / T17 : DSPATR(PR)
      *  04     - SCR008 / T17 : DSPATR(ND)
      *  05     - SCR008 / T17 : DSPATR(PR)
      *  06     - SCR008 / T17 : DSPATR(ND)
      *  07     - SCR008 / T17 : DSPATR(PR)
      *  08     - SCR008 / T17 : DSPATR(ND)
      *  09     - SCR008 / T17 : DSPATR(PR)
      *  10     - SCR008 / T17 : DSPATR(ND)
      *  80     - SCR008 / T17 : DSPATR(PC)
      *  80     - SCR008 / T17 : DSPATR(PC)
      *  80     - SCR008 / T17 : DSPATR(PC)
      *  80     - SCR008 / T17 : DSPATR(PC)
      *  80     - SCR008 / T17 : DSPATR(PC)
      * N79     - SCR008 PUTOVR
      *
      *  SC0009     -      List of stock groups
      *
      *  01     - SCR009 / T20 : DSPATR(PR)
      *  02     - SCR009 / T20 : DSPATR(ND)
      *  03     - SCR009 / T20 : DSPATR(PR)
      *  04     - SCR009 / T20 : DSPATR(ND)
      *  05     - SCR009 / T20 : DSPATR(PR)
      *  06     - SCR009 / T20 : DSPATR(ND)
      *  07     - SCR009 / T20 : DSPATR(PR)
      *  08     - SCR009 / T20 : DSPATR(ND)
      *  09     - SCR009 / T20 : DSPATR(PR)
      *  10     - SCR009 / T20 : DSPATR(ND)
      *  80     - SCR009 / T20 : DSPATR(PC)
      *  80     - SCR009 / T20 : DSPATR(PC)
      *  80     - SCR009 / T20 : DSPATR(PC)
      *  80     - SCR009 / T20 : DSPATR(PC)
      *  80     - SCR009 / T20 : DSPATR(PC)
      * N79     - SCR009 PUTOVR
      *
      *  SC0010     -   List of stock value groups
      *
      *  01     - SCR010 / T23 : DSPATR(PR)
      *  02     - SCR010 / T23 : DSPATR(ND)
      *  03     - SCR010 / T23 : DSPATR(PR)
      *  04     - SCR010 / T23 : DSPATR(ND)
      *  05     - SCR010 / T23 : DSPATR(PR)
      *  06     - SCR010 / T23 : DSPATR(ND)
      *  07     - SCR010 / T23 : DSPATR(PR)
      *  08     - SCR010 / T23 : DSPATR(ND)
      *  09     - SCR010 / T23 : DSPATR(PR)
      *  10     - SCR010 / T23 : DSPATR(ND)
      *  80     - SCR010 / T23 : DSPATR(PC)
      *  80     - SCR010 / T23 : DSPATR(PC)
      *  80     - SCR010 / T23 : DSPATR(PC)
      *  80     - SCR010 / T23 : DSPATR(PC)
      *  80     - SCR010 / T23 : DSPATR(PC)
      * N79     - SCR010 PUTOVR
      *
      *  SC0011     -    List of Units of Measure
      *
      *  01     - SCR011 / T26 : DSPATR(PR)
      *  02     - SCR011 / T26 : DSPATR(ND)
      *  03     - SCR011 / T26 : DSPATR(PR)
      *  04     - SCR011 / T26 : DSPATR(ND)
      *  05     - SCR011 / T26 : DSPATR(PR)
      *  06     - SCR011 / T26 : DSPATR(ND)
      *  07     - SCR011 / T26 : DSPATR(PR)
      *  08     - SCR011 / T26 : DSPATR(ND)
      *  09     - SCR011 / T26 : DSPATR(PR)
      *  10     - SCR011 / T26 : DSPATR(ND)
      *  80     - SCR011 / T26 : DSPATR(PC)
      *  80     - SCR011 / T26 : DSPATR(PC)
      *  80     - SCR011 / T26 : DSPATR(PC)
      *  80     - SCR011 / T26 : DSPATR(PC)
      *  80     - SCR011 / T26 : DSPATR(PC)
      * N79     - SCR011 PUTOVR
      *
      *  SC0012     -        List of Tax codes
      *
      *  01     - SCR012 / T29 : DSPATR(PR)
      *  02     - SCR012 / T29 : DSPATR(ND)
      *  03     - SCR012 / T29 : DSPATR(PR)
      *  04     - SCR012 / T29 : DSPATR(ND)
      *  05     - SCR012 / T29 : DSPATR(PR)
      *  06     - SCR012 / T29 : DSPATR(ND)
      *  07     - SCR012 / T29 : DSPATR(PR)
      *  08     - SCR012 / T29 : DSPATR(ND)
      *  09     - SCR012 / T29 : DSPATR(PR)
      *  10     - SCR012 / T29 : DSPATR(ND)
      *  80     - SCR012 / T29 : DSPATR(PC)
      *  80     - SCR012 / T29 : DSPATR(PC)
      *  80     - SCR012 / T29 : DSPATR(PC)
      *  80     - SCR012 / T29 : DSPATR(PC)
      *  80     - SCR012 / T29 : DSPATR(PC)
      * N79     - SCR012 PUTOVR
      *
      *  SUP014     - Detail Screen for ITMMAST
      *
      *  01     - SCR004 / ITITYP : DSPATR(PR)
      *  01     - SCR004 / ITLPRC : DSPATR(PR)
      *  01     - SCR004 / ITNLAC : DSPATR(PR)
      *  01     - SCR004 / ITNLAS : DSPATR(PR)
      *  01     - SCR004 / ITNLST : DSPATR(PR)
      *  01     - SCR004 / ITSANL : DSPATR(PR)
      *  01     - SCR004 / ITSIG : DSPATR(PR)
      *  01     - SCR004 / ITSTUC : DSPATR(PR)
      *  01     - SCR004 / ITSVG : DSPATR(PR)
      *  01     - SCR004 / ITUDF1 : DSPATR(PR)
      *  01     - SCR004 / ITUDF2 : DSPATR(PR)
      *  01     - SCR004 / ITUDF3 : DSPATR(PR)
      *  02     - SCR004 / ITITYP : DSPATR(UL)
      *  02     - SCR004 / ITLPRC : DSPATR(UL)
      *  02     - SCR004 / ITNLAC : DSPATR(UL)
      *  02     - SCR004 / ITNLAS : DSPATR(UL)
      *  02     - SCR004 / ITNLST : DSPATR(UL)
      *  02     - SCR004 / ITSANL : DSPATR(UL)
      *  02     - SCR004 / ITSIG : DSPATR(UL)
      *  02     - SCR004 / ITSTUC : DSPATR(UL)
      *  02     - SCR004 / ITSVG : DSPATR(UL)
      *  02     - SCR004 / ITUDF1 : DSPATR(UL)
      *  02     - SCR004 / ITUDF2 : DSPATR(UL)
      *  02     - SCR004 / ITUDF3 : DSPATR(UL)
      *  03     - SCR004 / RN0022 : DSPATR(PC)
      *  03     - SCR004 / RN0022 : DSPATR(RI)
      *  04     - SCR004 / SADESC : DSPATR(PC)
      *  04     - SCR004 / SADESC : DSPATR(RI)
      *  05     - SCR004 / BADESC : DSPATR(PC)
      *  05     - SCR004 / BADESC : DSPATR(RI)
      *  06     - SCR004 / ITITEM : DSPATR(PC)
      *  06     - SCR004 / ITITEM : DSPATR(RI)
      *  07     - SCR004 / ITITYP : DSPATR(PC)
      *  07     - SCR004 / ITITYP : DSPATR(RI)
      *  08     - SCR004 / ITLPRC : DSPATR(PC)
      *  08     - SCR004 / ITLPRC : DSPATR(RI)
      *  09     - SCR004 / ITSANL : DSPATR(PC)
      *  09     - SCR004 / ITSANL : DSPATR(RI)
      *  10     - SCR004 / ITSIG : DSPATR(PC)
      *  10     - SCR004 / ITSIG : DSPATR(RI)
      *  11     - SCR004 / ITSTUC : DSPATR(PC)
      *  11     - SCR004 / ITSTUC : DSPATR(RI)
      *  12     - SCR004 / ITSVG : DSPATR(PC)
      *  12     - SCR004 / ITSVG : DSPATR(RI)
      *  13     - SCR004 / CYDESC : DSPATR(PC)
      *  13     - SCR004 / CYDESC : DSPATR(RI)
      *  99     - SCR004 OVERLAY
      * N79     - SCR004 PUTOVR
      *
      ********************************************************************
      *  Function Of Subroutines
      *
      * SMAIN - Main flow of the program.
      * SEND - END of program.
      * S001 - Alpha List Screen for ITMMAST
      * S002 - List Screen for ITMMAST
      * S003 - Detail Screen for ITMMAST
      * S004 - Detail Screen for ITMMAST
      * S005 -      List of Item Classes
      * S006 -       List of item types
      * S007 -  List of stock analysis codes
      * S008 - List of Stock inventory groups
      * S009 -      List of stock groups
      * S010 -   List of stock value groups
      * S011 -    List of Units of Measure
      * S012 -        List of Tax codes
      * SREDSP -  Redisplay Windows within stack.
      * SYSDAT - System Date
      * S01BKW - SCRN SUB
      * S500 - SCRN SUB
      * S01EDT - SCRN SUB
      * S501 - SCRN SUB
      * S01FWD - SCRN SUB
      * S502 - SCRN SUB
      * S03ABR - SCRN SUB
      * S03AFR - SCRN SUB
      * S03ALD - SCRN SUB
      * S04ABR - SCRN SUB
      * S04AFR - SCRN SUB
      * S04ALD - SCRN SUB
      * S07ABR - SCRN SUB
      * S07AFR - SCRN SUB
      * S07ALD - SCRN SUB
      * S08ABR - SCRN SUB
      * S08AFR - SCRN SUB
      * S08ALD - SCRN SUB
      * S09ABR - SCRN SUB
      * S09AFR - SCRN SUB
      * S09ALD - SCRN SUB
      * S10ABR - SCRN SUB
      * S10AFR - SCRN SUB
      * S10ALD - SCRN SUB
      * S11ABR - SCRN SUB
      * S11AFR - SCRN SUB
      * S11ALD - SCRN SUB
      * S12ABR - SCRN SUB
      * S12AFR - SCRN SUB
      * S12ALD - SCRN SUB
      * SY0010 - Format Date
      * SMSG - calls message handling program to either clear, add, or
      * S013   - GETREC d.company,f.company,*eq,prcoyno
      * S014   - GETREC d.company,f.imscpyd,*eq,prcoyno
      * S015   - SETLL D.ITMMAST1,F.ITMMAST1,SVK001,SVK002
      * S016   - SETLL D.ITMMAST1,F.ITMMAST1,SVK001,svkalp,SVK002
      * S017   - SETLL D.ITMMAST,F.ITMMAST,SVK001,SVK002
      * S018   - GETREC D.ITMMAST,F.ITMMAST,*lock,*eq,SVK001,SVK002
      * S019   - GETREC D.ITMMAST,F.ITMMAST,*eq,SVK001,SVK002
      * S020   - GETREC D.ITMMAST,F.ITMCLAS,*eq,ITCOYNO,ITCLAS
      * S021   - GETREC D.ITMMAST,F.ITMTYP,*eq,ITCOYNO,ITITYP
      * S022   - GETREC D.ITMMAST,F.STANYS,*eq,ITCOYNO,ITSANL
      * S023   - GETREC D.ITMMAST,F.STIGRP,*eq,ITCOYNO,ITSIG
      * S024   - GETREC D.ITMMAST,F.STOKGRP,*eq,ITCOYNO,ITIGRP
      * S025   - GETREC D.ITMMAST,F.STVGRP,*eq,ITCOYNO,ITSVG
      * S026   - GETREC D.ITMMAST,F.VATCOD,*eq,ITCOYNO,ITVATC
      * S027   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupg
      * S028   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupd
      * S029   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksubs
      * S030   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wkitem
      * S031   - DELETE D.ITMMAST,F.ITMMAST
      * S032   - Referential Integrity Check (Delete) For File ITMMAST
      * S033   - UPDATE D.ITMMAST,F.ITMMAST
      * S034   - Referential Integrity Check (Update) For File ITMMAST
      * S035   - WRITE D.ITMMAST,F.ITMMAST
      * S036   - GETBLK D.ITMMAST,F.ITMMAST,*pv,prcoyno
      * S037   - Process To Reset File Pointer(BOF) - ITMMAST
      * S038   - Process To Reset File Pointer(EOF) - ITMMAST
      * S039   - GETBLK D.ITMMAST1,F.ITMMAST1,*pv,prcoyno
      * S040   - Process To Reset File Pointer(BOF) - ITMMAST1
      * S041   - Process To Reset File Pointer(EOF) - ITMMAST1
      * S042   - GETREC D.ITMMAST,F.ITMMAST,*eq,itcoyno,ititem
      * S043   - GETREC D.ITMMAST,F.ITMMAST,*eq,PRCOYNO,ititem
      * S044   - SETLL D.ITMMAST,F.ITMCLAS,SVK003,SVK03
      * S045   - GETREC D.ITMMAST,F.ITMCLAS,*PV,SVK003
      * S046   - Process To Reset File Pointer(BOF) - ITMCLAS
      * S047   - GETREC D.ITMMAST,F.ITMCLAS,*NE,SVK003
      * S048   - Process To Reset File Pointer(EOF) - ITMCLAS
      * S049   - SETLL D.ITMMAST,F.ITMTYP,SVK005,SVK04
      * S050   - GETREC D.ITMMAST,F.ITMTYP,*PV,SVK005
      * S051   - Process To Reset File Pointer(BOF) - ITMTYP
      * S052   - GETREC D.ITMMAST,F.ITMTYP,*NE,SVK005
      * S053   - Process To Reset File Pointer(EOF) - ITMTYP
      * S054   - SETLL D.ITMMAST,F.STANYS,SVK011,SVK07
      * S055   - GETREC D.ITMMAST,F.STANYS,*PV,SVK011
      * S056   - Process To Reset File Pointer(BOF) - STANYS
      * S057   - GETREC D.ITMMAST,F.STANYS,*NE,SVK011
      * S058   - Process To Reset File Pointer(EOF) - STANYS
      * S059   - SETLL D.ITMMAST,F.STIGRP,SVK013,SVK08
      * S060   - GETREC D.ITMMAST,F.STIGRP,*PV,SVK013
      * S061   - Process To Reset File Pointer(BOF) - STIGRP
      * S062   - GETREC D.ITMMAST,F.STIGRP,*NE,SVK013
      * S063   - Process To Reset File Pointer(EOF) - STIGRP
      * S064   - SETLL D.ITMMAST,F.STOKGRP,SVK015,SVK09
      * S065   - GETREC D.ITMMAST,F.STOKGRP,*PV,SVK015
      * S066   - Process To Reset File Pointer(BOF) - STOKGRP
      * S067   - GETREC D.ITMMAST,F.STOKGRP,*NE,SVK015
      * S068   - Process To Reset File Pointer(EOF) - STOKGRP
      * S069   - SETLL D.ITMMAST,F.STVGRP,SVK017,SVK10
      * S070   - GETREC D.ITMMAST,F.STVGRP,*PV,SVK017
      * S071   - Process To Reset File Pointer(BOF) - STVGRP
      * S072   - GETREC D.ITMMAST,F.STVGRP,*NE,SVK017
      * S073   - Process To Reset File Pointer(EOF) - STVGRP
      * S074   - SETLL D.ITMMAST,F.UOM,SVK019,SVK11
      * S075   - GETREC D.ITMMAST,F.UOM,*PV,SVK019
      * S076   - Process To Reset File Pointer(BOF) - UOM
      * S077   - GETREC D.ITMMAST,F.UOM,*NE,SVK019
      * S078   - Process To Reset File Pointer(EOF) - UOM
      * S079   - SETLL D.ITMMAST,F.VATCOD,SVK021,SVK12
      * S080   - GETREC D.ITMMAST,F.VATCOD,*PV,SVK021
      * S081   - Process To Reset File Pointer(BOF) - VATCOD
      * S082   - GETREC D.ITMMAST,F.VATCOD,*NE,SVK021
      * S083   - Process To Reset File Pointer(EOF) - VATCOD
      * S003V - Detail Screen for ITMMAST
      * *PSSR - Program Execution Errors Handler
      * SCLF   - CLF : Cursor Location On Field Handler
      * SATRIB - Display Attribute Handler
      * SLOCK - Update Lock Flag
      * SEXCP - Dummy EXCPT(s) and Read(s)
      * SFERR - File Exception Handler
      * SMVTOF - Move Fields From Work Area To File(s)
      * SMVTOW - Move Fields From File(s) To Work Area
      *
      ********************************************************************
      *            F i l e     S p e c i f i c a t i o n
      ********************************************************************
     Ffile0002  cf   e             workstn
     F                                     extdesc('MITMMASTD')
     F                                     sfile(scr001s1:rrn01)
     F                                     sfile(scr002s1:rrn02)
     F                                     infds(dspfds)
     Fitmmast1  if   e           k disk
     F                                     rename(itmstrf:fmt001)
     F                                     infds(fids01)
     F                                     infsr(sferr)
     Fcompany   if   e           k disk
     F                                     infds(fids02)
     F                                     infsr(sferr)
     Fimscpyd   if   e           k disk
     F                                     infds(fids03)
     F                                     infsr(sferr)
     Fitmclas   if   e           k disk
     F                                     infds(fids05)
     F                                     infsr(sferr)
     Fstokgrp   if   e           k disk
     F                                     infds(fids06)
     F                                     infsr(sferr)
     Fvatcod    if   e           k disk
     F                                     infds(fids07)
     F                                     infsr(sferr)
     Fitmtyp    if   e           k disk
     F                                     infds(fids08)
     F                                     infsr(sferr)
     Fstanys    if   e           k disk
     F                                     infds(fids09)
     F                                     infsr(sferr)
     Fstigrp    if   e           k disk
     F                                     rename(stigrp:fmt002)
     F                                     infds(fids10)
     F                                     infsr(sferr)
     Fstvgrp    if   e           k disk
     F                                     infds(fids11)
     F                                     infsr(sferr)
     Fuom       if   e           k disk
     F                                     infds(fids12)
     F                                     infsr(sferr)
     Forddet5   if   e           k disk
     F                                     infds(fids13)
     F                                     infsr(sferr)
     Ffile0001  if   e           k disk
     F                                     extdesc('WAREDET1')
     F                                     infds(fids14)
     F                                     infsr(sferr)
     Fitmmast   uf a e           k disk
     F                                     infds(fids04)
     F                                     infsr(sferr)
      *

      //--*STAND ALONE-------------------------------------------
      /COPY QRPGLESRC,SATRIBDEF
     D ##date          s              8p 0
     D ##year          s              2p 0
     D aarg1           s            256a                                        Alpha argument1
     D aarg2           s            256a                                        Alpha argument2
     D appcol          s              3p 0
     D apppgm          s             10a
     D approw          s              3p 0
     D appscr          s             10a
     D appset          s             10a
     D apptyp          s              1a
     D arslt           s            256a                                        Alpha result
     D arslt0          s            256a
     D bat             s              1a
     D callst          s              1p 0                                      CALL STSword
     D chkvar          s              1p 0                                      Perform Valid.
     D cmdkey          s              1a                                         Cmd key pressed fla
     D col1            s              3p 0
     D ct              s              3p 0                                      Counter
     D ctoff           s              1p 0                                      Compare to field fla
     D c1              s              3p 0                                      Numeric wrk fld
     D datfmt          s              3a                                        Date format
     D drn01           s              4p 0                                      Dspl.Rrn
     D drn02           s              4p 0                                      Dspl.Rrn
     D dspws           s              1a                                        -dsply- replaced
     D dtcrdt          s             10a
     D dtdtcr          s             10a
     D dtdtlm          s             10a
     D ern01           s              4p 0                                      SFLEND +
     D ern02           s              4p 0                                      SFLEND +
     D error           s              1a
     D existf          s              1p 0                                      Existence chk flg
     D extscr          s              1p 0
     D feb             s              2p 0                                      NOD in feb/Leap
     D fl0001          s              1p 0
     D fl0002          s              1p 0
     D fst03           s              3a
     D fst04           s              1a
     D fst07           s              1a
     D fst08           s              2a
     D fst09           s              3a
     D fst10           s              1a
     D fst11           s              5a
     D fst12           s              2a
     D f02001          s              3a
     D f02002          s              3a
     D f02003          s              5a
     D f02004          s              2a
     D f12flg          s              1p 0
     D f14001          s              1a
     D f14002          s              1a
     D f14003          s              2a
     D f14004          s              1a
     D haityp          s                   like(baityp)
     D hasanl          s                   like(sasanl)
     D hcclas          s                   like(icclas)
     D hcvatc          s                   like(vcvatc)
     D hditem          s                   like(oditem)
     D hdwhse          s                   like(wdwhse)
     D hd0001          s                   like(rn0009)
     D hd0002          s                   like(rn0015)
     D hd0003          s                   like(rn0019)
     D hd0008          s                   like(rn0026)
     D hd0009          s                   like(rn0027)
     D hd0010          s                   like(rn0030)
     D hd0011          s                   like(rn0031)
     D hd0012          s                   like(rn0032)
     D hd0013          s                   like(rn0034)
     D hd0014          s                   like(rn0035)
     D hd0015          s                   like(rn0036)
     D hd0016          s                   like(rn0037)
     D hd0017          s                   like(rn0038)
     D hd0018          s                   like(wditem)
     D hgsgrp          s                   like(sgsgrp)
     D histig          s                   like(sistig)
     D hmuom           s                   like(umuom)
     D hrc02           s                   like(rec02)
     D hrc03           s                   like(rec03)
     D hrc05           s                   like(rec05)
     D hrc06           s                   like(rec06)
     D hrc07           s                   like(rec07)
     D hrc08           s                   like(rec08)
     D hrc09           s                   like(rec09)
     D hrc10           s                   like(rec10)
     D hrc11           s                   like(rec11)
     D hrc12           s                   like(rec12)
     D hrc13           s                   like(rec13)
     D hrc14           s                   like(rec14)
     D ins01           s             99a                                        Savd.Ind
     D ins02           s             99a                                        Savd.Ind
     D in01            s             99a                                        Save Ind
     D in02            s             99a                                        Save Ind
     D in03            s             99a                                        Save Ind
     D in04            s             99a                                        Save Ind
     D ioflag          s              1a
     D kaco01          s              3a                                        BACOYNO
     D kaco02          s              3a                                        SACOYNO
     D kait02          s              1a                                        BAITYP
     D kasa03          s              1a                                        SASANL
     D kccl02          s              3a                                        ICCLAS
     D kcco01          s              3a                                        ICCOYNO
     D kcco02          s              3a                                        VCCOYNO
     D kcva03          s              2a                                        VCVATC
     D kgco01          s              3a                                        SGCOYNO
     D kgco02          s              3a                                        VGCOYNO
     D kgsg02          s              3a                                        SGSGRP
     D kgsv03          s              1a                                        VGSVALG
     D kico01          s              3a                                        SICOYNO
     D kist02          s              2a                                        SISTIG
     D kmco01          s              3a                                        UMCOYNO
     D kmuo02          s              5a                                        UMUOM
     D ktal02          s             10a                                        ITALPHA
     D ktcl02          s              3a                                        ITCLAS
     D ktco01          s              3a                                        ITCOYNO
     D ktig02          s              3a                                        ITIGRP
     D ktit02          s             20a                                        ITITEM
     D ktit03          s             20a                                        ITITEM
     D ktit04          s              1a                                        ITITYP
     D ktsa02          s              1a                                        ITSANL
     D ktsi02          s              2a                                        ITSIG
     D ktsv02          s              1a                                        ITSVG
     D ktva02          s              2a                                        ITVATC
     D kyco01          s              3a                                        CYCOYNO
     D lck01           s              1p 0                                      File lock flag
     D lck02           s              1p 0                                      File lock flag
     D lck03           s              1p 0                                      File lock flag
     D lck04           s              1p 0                                      File lock flag
     D lck05           s              1p 0                                      File lock flag
     D lck06           s              1p 0                                      File lock flag
     D lck07           s              1p 0                                      File lock flag
     D lck08           s              1p 0                                      File lock flag
     D lck09           s              1p 0                                      File lock flag
     D lck10           s              1p 0                                      File lock flag
     D lck11           s              1p 0                                      File lock flag
     D lck12           s              1p 0                                      File lock flag
     D lck13           s              1p 0                                      File lock flag
     D lck14           s              1p 0                                      File lock flag
     D listf           s              1p 0                                      List of value flag
     D lit#la          s              1a
     D lit#li          s              1a
     D lit#lj          s              1a
     D lit#lr          s              1a
     D lit#ls          s              1a
     D lit#lz          s              1a
     D loopct          s              3p 0
     D lrflag          s              1a
     D lst03           s              3a
     D lst04           s              1a
     D lst07           s              1a
     D lst08           s              2a
     D lst09           s              3a
     D lst10           s              1a
     D lst11           s              5a
     D lst12           s              2a
     D mntflg          s              1p 0
     D moddsc          s              8a
     D mode            s              1p 0
     D msgact          s              1a
     D msgf            s             10a
     D msgfl           s             10a
     D msgflg          s              1a                                        Display Msg Flg
     D narg1           s             30p 9                                      Numer argument1
     D narg3           s             30p 9                                      Numeric argumnt
     D nrslt           s             30p 9                                      Numeric result
     D nrslt0          s             30p 9
     D nxtrrn          s              4p 0                                      NXT RRNC        0030
     D offset          s              4p 0                                      OFFSET
     D posflg          s              1p 0
     D pract           s              1a
     D pralwd          s              1a
     D prm001          s              3a
     D prm002          s             15a
     D*prm003          s              3a
     D psalph          s             10a
     D ps0102          s             20a
     D rangef          s              1p 0                                      Range chk flag
     D rierr           s              1a                                        RI FLAG
     D rn0001          s              4a                                        SYCCYYA
     D rn0002          s              8p 0                                      SYDATI
     D rn0003          s             10a                                        SYDATO
     D rn0004          s              1a                                        SYDFMT
     D rn0005          s              1a                                        SYDSEP
     D rn0006          s              4a                                        SYMMDDA
     D rn0007          s             20a                                        WKALPHA
     D rn0008          s             20a                                        WKIDESC
     D rn0009          s              3a
     D rn0015          s              3a
     D rn0016          s             15a
     D rn0017          s             15a
     D rn0018          s             15a
     D rn0019          s              3a
     D rn0020          s             10a
     D rn0021          s              3a
     D rn0022          s             40a
     D rn0023          s             10a
     D rn0024          s              3a
     D rn0025          s             40a
     D rn0026          s              3a
     D rn0027          s              3a
     D rn0030          s              3a
     D rn0031          s              3a
     D rn0032          s              3a
     D rn0033          s             40a
     D rn0034          s              3a
     D rn0035          s              1a
     D rn0036          s              3a
     D rn0037          s              3a
     D rn0038          s              3a
     D rn0040          s             99a
     D rn0041          s             30p 9
     D rn0042          s             99a
     D row1            s              3p 0
     D rslt01          s              1p 0
     D scrnid          s              8a                                        Scrn ID
     D sp              s              3p 0                                      Stk ptr
     D srn01           s              4p 0                                      Savd.Rrn
     D srn02           s              4p 0                                      Savd.Rrn
     D svcc            s              2p 0                                      Save century
     D svcy            s              4p 0                                      Save days
     D svdat           s              6p 0                                      Save date
     D svdays          s              3p 0                                      Save days
     D svdd            s              2p 0                                      Save days
     D svkalp          s             10a
     D svk001          s              3a
     D svk002          s             15a
     D svk003          s              3a
     D svk004          s              3a
     D svk005          s              3a
     D svk006          s              1a
     D svk007          s              4p 0
     D svk009          s              6a
     D svk010          s              3a
     D svk011          s              3a
     D svk012          s              1a
     D svk013          s              3a
     D svk014          s              2a
     D svk015          s              3a
     D svk016          s              3a
     D svk017          s              3a
     D svk018          s              1a
     D svk019          s              3a
     D svk020          s              5a
     D svk021          s              3a
     D svk022          s              2a
     D svk03           s              3a
     D svk04           s              1a
     D svk07           s              1a
     D svk08           s              2a
     D svk09           s              3a
     D svk10           s              1a
     D svk11           s              5a
     D svk12           s              2a
     D svleap          s              1p 0                                      If leap year
     D svmm            s              2p 0                                      Save month
     D svs01           s              5p 0                                      SV STS
     D svs04           s              5p 0                                      SV STS          0030
     D svs05           s              5p 0                                      SV STS
     D svs06           s              5p 0                                      SV STS
     D svs07           s              5p 0                                      SV STS
     D svs08           s              5p 0                                      SV STS
     D svs09           s              5p 0                                      SV STS
     D svs10           s              5p 0                                      SV STS
     D svs11           s              5p 0                                      SV STS
     D svs12           s              5p 0                                      SV STS
     D svyy            s              2p 0                                      Save year
     D swexbl          s              1p 0                                      @EXITBLK        0030
     D swrd01          s              1a                                        RD STS          003
     D swrd02          s              1a                                        RD STS
     D swrd03          s              1a                                        RD STS
     D swrd04          s              1a                                        RD STS          0030
     D swrd05          s              1a                                        RD STS          0030
     D swrd06          s              1a                                        RD STS          0030
     D swrd07          s              1a                                        RD STS          0030
     D swrd08          s              1a                                        RD STS          0030
     D swrd09          s              1a                                        RD STS          0030
     D swrd10          s              1a                                        RD STS          0030
     D swrd11          s              1a                                        RD STS          0030
     D swrd12          s              1a                                        RD STS          0030
     D swskpr          s              1p 0                                      @SKIPREC        0030
     D syccyy          s              4p 0
     D sydati          s             15p 6
     D sydato          s             10a
     D sydat0          s             20a
     D sydd            s              2p 0
     D sydda           s              2a
     D sydfmt          s              1a
     D sydsep          s              1a
     D symm            s              2p 0
     D symma           s              2a
     D symmdd          s              4p 0
     D s03cnt          s              3p 0
     D s04cnt          s              3p 0
     D s07cnt          s              3p 0
     D s08cnt          s              3p 0
     D s09cnt          s              3p 0
     D s10cnt          s              3p 0
     D s11cnt          s              3p 0
     D s12cnt          s              3p 0
     D uercnt          s              1p 0
     D updflg          s              1p 0
     D ursume          s              6a
     D validf          s              1p 0                                      Flag for validation
     D wadj01          s              3p 0                                      WRK ADJ
     D wadj02          s              3p 0                                      WRK ADJ
     D waityp          s                   like(baityp)                         Item Type - business
     D wasanl          s                   like(sasanl)                         Stock Analysis Code
     D wcclas          s                   like(icclas)                         Item Class
     D wcntr           s              3p 0                                      COUNTER
     D wcvatc          s                   like(vcvatc)                         VAT Code
     D wfile#          s              2p 0                                      FILE#
     D wgetr           s              3p 0                                      COUNTER
     D wgsgrp          s                   like(sgsgrp)                         Stock Group
     D wistig          s                   like(sistig)                         Stock Inventory Grou
     D wkclas          s             20a
     D wkcol           s              3p 0
     D wkcrtu          s             10a
     D wkigrp          s             20a
     D wkitem          s             20a
     D wkityp          s              1a
     D wklmby          s             10a
     D wklprc          s             11p 4
     D wkmanf          s             20a
     D wknlac          s             20a
     D wknlas          s             20a
     D wknlst          s             20a
     D wkpack          s             15p 6
     D wkpall          s             20a
     D wkqtyo          s             15p 6
     D wkrow           s              3p 0
     D wksanl          s              1a
     D wksig           s              2a
     D wkstuc          s             11p 4
     D wksubs          s             20a
     D wksupd          s             20a
     D wksupg          s             20a
     D wksvg           s              1a
     D wkudf1          s             20a
     D wkudf2          s              5a
     D wkudf3          s              5a
     D wkuom           s             20a
     D wkuomo          s             20a
     D wkuser          s             10a
     D wkvatc          s             20a
     D wkweig          s             15p 6
     D wk0004          s                   like(rn0019)                         Company number
     D wk0006          s                   like(rn0021)                         Company number
     D wk0009          s                   like(rn0024)                         Company number
     D wk0012          s                   like(rn0026)                         Company number
     D wk0013          s                   like(rn0030)                         Company number
     D wk0015          s                   like(rn0031)                         Company number
     D wk0016          s                   like(rn0032)                         Company number
     D wk0018          s                   like(rn0034)                         Company number
     D wk0019          s                   like(rn0035)                         Stock Value Group
     D wk0020          s                   like(rn0036)                         Company number
     D wk0021          s                   like(rn0037)                         Company number
     D wlcntr          s              5p 0                                      LOOP CT         0030
     D wlgetr          s              5p 0                                      LOOP CT         0030
     D wmqtyo          s                   like(umqtyo)                         Quantity per unit
     D wmuom           s                   like(umuom)                          Unit of Measure
     D wrrn01          s              3p 0                                      WRK RRN
     D wrrn02          s              3p 0                                      WRK RRN
     D wtdtcr          s                   like(itdtcr)                         Created date
     D wtdtlm          s                   like(itdtlm)                         Amended date
     D wydfmt          s                   like(cydfmt)                         Date Format 1=dmy 2=
     D wydsep          s                   like(cydsep)                         Date Seperator
     D xno             s              1p 0                                      *NO keyword
     D xyes            s              1p 0                                      *YES keyword
     D*xymd            s              6p 0
     D x0              s              4p 0                                      INDEX 0
     D x1              s              3p 0                                      INDEX 1
     D y1              s              3p 0                                      Loop Counter . . . .
     D y2              s              3p 0                                      Loop Counter . . . .
     D y3              s              3p 0                                      Loop Counter . . . .
     D y4              s              3p 0                                      Loop Counter . . . .
     D y5              s              3p 0                                      Loop Counter . . . .
     D y6              s              3p 0                                      Loop Counter . . . .
     D y7              s              3p 0                                      Loop Counter . . . .
     D y8              s              3p 0                                      Loop Counter . . . .
     D y9              s              3p 0                                      Loop Counter . . . .
     D z1              s              3p 0                                      Loop Counter . . . .
     D z2              s              3p 0                                      Loop Counter . . . .
     D z3              s              3p 0                                      Loop Counter . . . .
     D z4              s              3p 0                                      Loop Counter . . . .
     D z5              s              3p 0                                      Loop Counter . . . .
     D z6              s              3p 0                                      Loop Counter . . . .
     D z7              s              3p 0                                      Loop Counter . . . .
     D z8              s              3p 0                                      Loop Counter . . . .
     D z9              s              3p 0                                      Loop Counter . . . .

      ********************************************************************
      *   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
      ********************************************************************
     D wka             s              1    dim(256)                             Alpha wrk array
     D a01             s              3    dim(12)
     D a02             s             15    dim(12)
     D b01             s              3    dim(5)
     D b02             s              1    dim(5)
     D b05             s              1    dim(5)
     D b06             s              2    dim(5)
     D b07             s              3    dim(5)
     D b08             s              1    dim(5)
     D b09             s              5    dim(5)
     D b10             s              2    dim(5)
     D sid             s              8    dim(99)                              Scrn stk
     D sty             s              1    dim(99)                              Scr type
     D a1              s             80    dim(13) ctdata perrcd(1)             Alpha constants i
     D n1              s             30  9 dim(5) ctdata perrcd(1)              Numeric constants
     D da4             s             24    dim(12) ctdata perrcd(1)             CLF : Cursor Loca
     D da5             s              8    dim(12) alt(da4)
     D da3             s              2    dim(17)                              Fld Attr. Wrk Ary
     D da1             s             24    dim(79) ctdata perrcd(1)             Fld Attr. Indic t
     D da2             s             34    dim(79) alt(da1)
     D fids02          ds
     D  sts02            *status
     D  rec02                397    400b 0
     D fids03          ds
     D  sts03            *status
     D  rec03                397    400b 0
     D fids05          ds
     D  sts05            *status
     D  rec05                397    400b 0
     D fids04          ds
     D  sts04            *status
     D  rec04                397    400b 0
     D fids01          ds
     D  sts01            *status
     D  rec01                397    400b 0
     D fids08          ds
     D  sts08            *status
     D  rec08                397    400b 0
     D fids13          ds
     D  sts13            *status
     D  rec13                397    400b 0
     D fids09          ds
     D  sts09            *status
     D  rec09                397    400b 0
     D fids10          ds
     D  sts10            *status
     D  rec10                397    400b 0
     D fids06          ds
     D  sts06            *status
     D  rec06                397    400b 0
     D fids11          ds
     D  sts11            *status
     D  rec11                397    400b 0
     D fids12          ds
     D  sts12            *status
     D  rec12                397    400b 0
     D fids07          ds
     D  sts07            *status
     D  rec07                397    400b 0
     D fids14          ds
     D  sts14            *status
     D  rec14                397    400b 0
      *
      * INFDS for cursor location
      *
     D dspfds          ds
     D  row                  370    370
     D  col                  371    371
     D  sflrrn               378    379b 0
      *
      * Work Data Structure for cursor
      *
     D @ds001          ds
     D  halfwd                 1      2b 0
     D  byte2                  2      2
      *
      * Display Attribute Structure
      *
     D @ds002          ds
     D  fldscr                 1     10
     D  fldnam                11     20
     D  fldinx                21     24  0
     D  dsperr                25     25
     D  #ds                   26     26
     D  #hi                   27     27
     D  #ri                   28     28
     D  #ul                   29     29
     D  #bl                   30     30
     D  #cs                   31     31
     D  #pc                   32     32
     D  #nd                   33     33
     D  #pr                   34     34
     D  #gn                   35     35
     D  #rd                   36     36
     D  #pk                   37     37
     D  #wt                   38     38
     D  #tq                   39     39
     D  #yw                   40     40
     D  #bu                   41     41
     D  da6                   27     41    dim(15)                              Fld Attr. Wrk Ary
     D  #atrib                11     41
     D  #from                 25     28  0
     D  #to                   29     32  0
     D  #clf                  25     32  0
     D  #map                   1     24
      *
      * Named constants
      *
     D c0001           c                   const('Record not found for-
     D                                      Edit')
      *
      * Named constants
      *
     D c0002           c                   const('Record not found for-
     D                                      de1ete')                            -delete - replaced
      *
      * Named constants
      *
     D c0003           c                   const('Record not found for-
     D                                      Display')
      *
      * Named constants
      *
     D c0004           c                   const('Invalid cursor loc f-
     D                                     or prompt')
      *
      * Named constants
      *
     D c0005           c                   const('Invalid action choic-
     D                                     e')
      *
      * Date Manipulation Data Struct.
      *
     D                 ds
     D  x1cdat                 1      8  0
     D  x1date                 3      8  0
     D  x14                    1      4  0
     D  x12                    1      2  0
     D  x34                    3      4  0
     D  x56                    5      6  0
     D  x58                    5      8  0
     D  x78                    7      8  0
      *
      * Message data structure
      *
     D @ds003          ds
     D  msgdta                 1    132
     D  umesg1                 1     51
     D  umesg2                52    102
     D  umesg3               103    132
      *
      * Program status data structure
      *
     D sds            sds
     D  wsid                 244    253
     D  user                 254    263
     D  pgm              *proc
     D  ustat                 11     15  0
     D  usrcln                21     28
     D  uroutn                29     36
     D  msgid                 40     46
     D  ulib                  81     90
     D  umsgtx                91    170
     D  ufile                201    208
     D  ufstat               209    213
     D  ufsrcl               228    235
     D  ujobn                264    269  0
     D  ucdat                288    293  0
     D  uctim                294    299  0
     D @ds004          ds
     D  t01                    1      5p 0 dim(5)
     D  t01001                 1      1p 0
     D  t01002                 2      2p 0
     D  t01003                 3      3p 0
     D  t01004                 4      4p 0
     D  t01005                 5      5p 0
     D @ds005          ds
     D  t02                    1     15    dim(5)
     D  t02001                 1      3
     D  t02002                 4      6
     D  t02003                 7      9
     D  t02004                10     12
     D  t02005                13     15
     D @ds006          ds
     D  t03                    1    200    dim(5)
     D  t03001                 1     40
     D  t03002                41     80
     D  t03003                81    120
     D  t03004               121    160
     D  t03005               161    200
     D @ds007          ds
     D  t04                    1      5p 0 dim(5)
     D  t04001                 1      1p 0
     D  t04002                 2      2p 0
     D  t04003                 3      3p 0
     D  t04004                 4      4p 0
     D  t04005                 5      5p 0
     D @ds008          ds
     D  t05                    1      5    dim(5)
     D  t05001                 1      1
     D  t05002                 2      2
     D  t05003                 3      3
     D  t05004                 4      4
     D  t05005                 5      5
     D @ds009          ds
     D  t06                    1    200    dim(5)
     D  t06001                 1     40
     D  t06002                41     80
     D  t06003                81    120
     D  t06004               121    160
     D  t06005               161    200
     D @ds010          ds
     D  t14                    1      5p 0 dim(5)
     D  t14001                 1      1p 0
     D  t14002                 2      2p 0
     D  t14003                 3      3p 0
     D  t14004                 4      4p 0
     D  t14005                 5      5p 0
     D @ds011          ds
     D  t15                    1      5    dim(5)
     D  t15001                 1      1
     D  t15002                 2      2
     D  t15003                 3      3
     D  t15004                 4      4
     D  t15005                 5      5
     D @ds012          ds
     D  t16                    1    200    dim(5)
     D  t16001                 1     40
     D  t16002                41     80
     D  t16003                81    120
     D  t16004               121    160
     D  t16005               161    200
     D @ds013          ds
     D  t17                    1      5p 0 dim(5)
     D  t17001                 1      1p 0
     D  t17002                 2      2p 0
     D  t17003                 3      3p 0
     D  t17004                 4      4p 0
     D  t17005                 5      5p 0
     D @ds014          ds
     D  t18                    1     10    dim(5)
     D  t18001                 1      2
     D  t18002                 3      4
     D  t18003                 5      6
     D  t18004                 7      8
     D  t18005                 9     10
     D @ds015          ds
     D  t19                    1    200    dim(5)
     D  t19001                 1     40
     D  t19002                41     80
     D  t19003                81    120
     D  t19004               121    160
     D  t19005               161    200
     D @ds016          ds
     D  t20                    1      5p 0 dim(5)
     D  t20001                 1      1p 0
     D  t20002                 2      2p 0
     D  t20003                 3      3p 0
     D  t20004                 4      4p 0
     D  t20005                 5      5p 0
     D @ds017          ds
     D  t21                    1     15    dim(5)
     D  t21001                 1      3
     D  t21002                 4      6
     D  t21003                 7      9
     D  t21004                10     12
     D  t21005                13     15
     D @ds018          ds
     D  t22                    1    200    dim(5)
     D  t22001                 1     40
     D  t22002                41     80
     D  t22003                81    120
     D  t22004               121    160
     D  t22005               161    200
     D @ds019          ds
     D  t23                    1      5p 0 dim(5)
     D  t23001                 1      1p 0
     D  t23002                 2      2p 0
     D  t23003                 3      3p 0
     D  t23004                 4      4p 0
     D  t23005                 5      5p 0
     D @ds020          ds
     D  t24                    1      5    dim(5)
     D  t24001                 1      1
     D  t24002                 2      2
     D  t24003                 3      3
     D  t24004                 4      4
     D  t24005                 5      5
     D @ds021          ds
     D  t25                    1    200    dim(5)
     D  t25001                 1     40
     D  t25002                41     80
     D  t25003                81    120
     D  t25004               121    160
     D  t25005               161    200
     D @ds022          ds
     D  t26                    1      5p 0 dim(5)
     D  t26001                 1      1p 0
     D  t26002                 2      2p 0
     D  t26003                 3      3p 0
     D  t26004                 4      4p 0
     D  t26005                 5      5p 0
     D @ds023          ds
     D  t27                    1     25    dim(5)
     D  t27001                 1      5
     D  t27002                 6     10
     D  t27003                11     15
     D  t27004                16     20
     D  t27005                21     25
     D @ds024          ds
     D  t28                    1     25p 0 dim(5)
     D  t28001                 1      5p 0
     D  t28002                 6     10p 0
     D  t28003                11     15p 0
     D  t28004                16     20p 0
     D  t28005                21     25p 0
     D @ds025          ds
     D  t29                    1      5p 0 dim(5)
     D  t29001                 1      1p 0
     D  t29002                 2      2p 0
     D  t29003                 3      3p 0
     D  t29004                 4      4p 0
     D  t29005                 5      5p 0
     D @ds026          ds
     D  t30                    1     10    dim(5)
     D  t30001                 1      2
     D  t30002                 3      4
     D  t30003                 5      6
     D  t30004                 7      8
     D  t30005                 9     10
     D @ds027          ds
     D  t31                    1    200    dim(5)
     D  t31001                 1     40
     D  t31002                41     80
     D  t31003                81    120
     D  t31004               121    160
     D  t31005               161    200
     D pindicators     s               *   inz(%addr(*in))
     D indicators      ds            99    based(pindicators)
      //-*ENTRY-----------------------------
     D p_mitmmast      PR                  extpgm('MITMMAST')
     D                                3a                                        prm003
     D                                6p 0                                      xymd
      // -----------------------------------
     D p_mitmmast      PI
     D prm003                         3a
     D xymd                           6p 0
      // -----------------------------------
      //------------------------------------------------------
     D p_bsecimsc      PR                  extpgm('BSECIMSC')
     D                                1a                                        bat
     D                                3a                                        prm003
     D                               10a                                        wkuser
     D                                1a                                        pract
     D                                1a                                        pralwd
      //---ASSET GENERATED CLP TO HANDLE MSG - CLMSG----------
     D p_clmsg         PR                  extpgm('CLMSG')
     D                                1a                                        msgact
     D                                7a                                        msgid
     D                               10a                                        msgf
     D                               10a                                        msgfl
     D                              132a                                        msgdta
      *
     C     k0001         klist
     C                   kfld                    kyco01
      *
     C     k0002         klist
     C                   kfld                    ktco01
     C                   kfld                    ktal02
      *
     C     k0003         klist
     C                   kfld                    ktco01
     C                   kfld                    ktal02
     C                   kfld                    ktit03
      *
     C     k0004         klist
     C                   kfld                    ktco01
     C                   kfld                    ktit02
      *
     C     k0005         klist
     C                   kfld                    wk0006
     C                   kfld                    xtclas
      *
     C     k0006         klist
     C                   kfld                    wk0006
     C                   kfld                    xtigrp
      *
     C     k0007         klist
     C                   kfld                    wk0006
     C                   kfld                    xtuom
      *
     C     k0008         klist
     C                   kfld                    wk0006
     C                   kfld                    xtuomo
      *
     C     k0009         klist
     C                   kfld                    wk0006
     C                   kfld                    xtvatc
      *
     C     k0010         klist
     C                   kfld                    ktco01
     C                   kfld                    ktcl02
      *
     C     k0011         klist
     C                   kfld                    ktco01
     C                   kfld                    ktit04
      *
     C     k0012         klist
     C                   kfld                    ktco01
     C                   kfld                    ktsa02
      *
     C     k0013         klist
     C                   kfld                    ktco01
     C                   kfld                    ktsi02
      *
     C     k0014         klist
     C                   kfld                    ktco01
     C                   kfld                    ktig02
      *
     C     k0015         klist
     C                   kfld                    ktco01
     C                   kfld                    ktsv02
      *
     C     k0016         klist
     C                   kfld                    ktco01
     C                   kfld                    ktva02
      *
     C     k0017         klist
     C                   kfld                    wk0006
     C                   kfld                    xtityp
      *
     C     k0018         klist
     C                   kfld                    wk0006
     C                   kfld                    xtsanl
      *
     C     k0019         klist
     C                   kfld                    wk0006
     C                   kfld                    xtsvg
      *
     C     k0020         klist
     C                   kfld                    wk0006
     C                   kfld                    xtsig
      *
     C     k0021         klist
     C                   kfld                    ktco01
      *
     C     k0022         klist
     C                   kfld                    kcco01
     C                   kfld                    kccl02
      *
     C     k0023         klist
     C                   kfld                    kcco01
      *
     C     k0024         klist
     C                   kfld                    kaco01
     C                   kfld                    kait02
      *
     C     k0025         klist
     C                   kfld                    kaco01
      *
     C     k0026         klist
     C                   kfld                    kaco02
     C                   kfld                    kasa03
      *
     C     k0027         klist
     C                   kfld                    kaco02
      *
     C     k0028         klist
     C                   kfld                    kico01
     C                   kfld                    kist02
      *
     C     k0029         klist
     C                   kfld                    kico01
      *
     C     k0030         klist
     C                   kfld                    kgco01
     C                   kfld                    kgsg02
      *
     C     k0031         klist
     C                   kfld                    kgco01
      *
     C     k0032         klist
     C                   kfld                    kgco02
     C                   kfld                    kgsv03
      *
     C     k0033         klist
     C                   kfld                    kgco02
      *
     C     k0034         klist
     C                   kfld                    kmco01
     C                   kfld                    kmuo02
      *
     C     k0035         klist
     C                   kfld                    kmco01
      *
     C     k0036         klist
     C                   kfld                    kcco02
     C                   kfld                    kcva03
      *
     C     k0037         klist
     C                   kfld                    kcco02
      *
      ********************************************************************
      *        V a r i a b l e s     D e c l a r a t i o n
      ********************************************************************
 1b  C                   if        lrflag <> 'N'
     C                   eval      aarg1 = *blanks
     C                   eval      c1 = *zeros
     C                   eval      arslt = *blanks
     C                   eval      row1 = *zeros
     C                   eval      col1 = *zeros
     C                   eval      narg3 = *zeros
     C                   eval      aarg2 = *blanks
     C                   eval      narg1 = *zeros
     C                   eval      nrslt = *zeros
     C                   eval      datfmt = *blanks
     C                   eval      svdat = *zeros
     C                   eval      svyy = *zeros
     C                   eval      svmm = *zeros
     C                   eval      svdd = *zeros
     C                   eval      svdays = *zeros
     C                   eval      svleap = *zeros
     C                   eval      feb = *zeros
     C                   eval      svcy = *zeros
     C                   eval      svcc = *zeros
     C                   eval      chkvar = 1
     C                   eval      ##date = *zeros
     C                   eval      ##year = *zeros
     C                   eval      bat = *blanks
     C                   eval      z1 = *zeros
     C                   eval      z2 = *zeros
     C                   eval      z3 = *zeros
     C                   eval      z4 = *zeros
     C                   eval      z5 = *zeros
     C                   eval      z6 = *zeros
     C                   eval      z7 = *zeros
     C                   eval      z8 = *zeros
     C                   eval      z9 = *zeros
     C                   eval      dtcrdt = *blanks
     C                   eval      dtdtcr = *blanks
     C                   eval      dtdtlm = *blanks
     C                   eval      error = *blanks
     C                   eval      extscr = *zeros
     C                   eval      fl0001 = *zeros
     C                   eval      fl0002 = *zeros
     C                   eval      fst03 = *blanks
     C                   eval      fst04 = *blanks
     C                   eval      fst07 = *blanks
     C                   eval      fst08 = *blanks
     C                   eval      fst09 = *blanks
     C                   eval      fst10 = *blanks
     C                   eval      fst11 = *blanks
     C                   eval      fst12 = *blanks
     C                   eval      f02001 = *blanks
     C                   eval      f02002 = *blanks
     C                   eval      f02003 = *blanks
     C                   eval      f02004 = *blanks
     C                   eval      f12flg = *zeros
     C                   eval      f14001 = *blanks
     C                   eval      f14002 = *blanks
     C                   eval      f14003 = *blanks
     C                   eval      f14004 = *blanks
     C                   eval      y1 = *zeros
     C                   eval      y2 = *zeros
     C                   eval      y3 = *zeros
     C                   eval      y4 = *zeros
     C                   eval      y5 = *zeros
     C                   eval      y6 = *zeros
     C                   eval      y7 = *zeros
     C                   eval      y8 = *zeros
     C                   eval      y9 = *zeros
     C                   eval      loopct = *zeros
     C                   eval      lst03 = *blanks
     C                   eval      lst04 = *blanks
     C                   eval      lst07 = *blanks
     C                   eval      lst08 = *blanks
     C                   eval      lst09 = *blanks
     C                   eval      lst10 = *blanks
     C                   eval      lst11 = *blanks
     C                   eval      lst12 = *blanks
     C                   eval      mntflg = *zeros
     C                   eval      moddsc = *blanks
     C                   eval      mode = *zeros
     C                   eval      posflg = *zeros
     C                   eval      pract = *blanks
     C                   eval      pralwd = *blanks
     C                   eval      prm001 = *blanks
     C                   eval      prm002 = *blanks
     C                   eval      psalph = *blanks
     C                   eval      ps0102 = *blanks
     C                   eval      svkalp = *blanks
     C                   eval      svk001 = *blanks
     C                   eval      svk002 = *blanks
     C                   eval      svk003 = *blanks
     C                   eval      svk004 = *blanks
     C                   eval      svk005 = *blanks
     C                   eval      svk006 = *blanks
     C                   eval      svk007 = *zeros
     C                   eval      svk009 = *blanks
     C                   eval      svk010 = *blanks
     C                   eval      svk011 = *blanks
     C                   eval      svk012 = *blanks
     C                   eval      svk013 = *blanks
     C                   eval      svk014 = *blanks
     C                   eval      svk015 = *blanks
     C                   eval      svk016 = *blanks
     C                   eval      svk017 = *blanks
     C                   eval      svk018 = *blanks
     C                   eval      svk019 = *blanks
     C                   eval      svk020 = *blanks
     C                   eval      svk021 = *blanks
     C                   eval      svk022 = *blanks
     C                   eval      svk03 = *blanks
     C                   eval      svk04 = *blanks
     C                   eval      svk07 = *blanks
     C                   eval      svk08 = *blanks
     C                   eval      svk09 = *blanks
     C                   eval      svk10 = *blanks
     C                   eval      svk11 = *blanks
     C                   eval      svk12 = *blanks
     C                   eval      syccyy = *zeros
     C                   eval      rn0001 = *blanks
     C                   eval      sydati = *zeros
     C                   eval      rn0002 = *zeros
     C                   eval      sydato = *blanks
     C                   eval      rn0003 = *blanks
     C                   eval      sydat0 = *blanks
     C                   eval      sydd = *zeros
     C                   eval      sydda = *blanks
     C                   eval      sydfmt = *blanks
     C                   eval      rn0004 = *blanks
     C                   eval      sydsep = *blanks
     C                   eval      rn0005 = *blanks
     C                   eval      symm = *zeros
     C                   eval      symma = *blanks
     C                   eval      symmdd = *zeros
     C                   eval      rn0006 = *blanks
     C                   eval      s03cnt = *zeros
     C                   eval      s04cnt = *zeros
     C                   eval      s07cnt = *zeros
     C                   eval      s08cnt = *zeros
     C                   eval      s09cnt = *zeros
     C                   eval      s10cnt = *zeros
     C                   eval      s11cnt = *zeros
     C                   eval      s12cnt = *zeros
     C                   eval      updflg = *zeros
     C                   eval      rn0007 = *blanks
     C                   eval      wkclas = *blanks
     C                   eval      wkcol = *zeros
     C                   eval      wkcrtu = *blanks
     C                   eval      rn0008 = *blanks
     C                   eval      wkigrp = *blanks
     C                   eval      wkitem = *blanks
     C                   eval      wkityp = *blanks
     C                   eval      wklmby = *blanks
     C                   eval      wklprc = *zeros
     C                   eval      wkmanf = *blanks
     C                   eval      wknlac = *blanks
     C                   eval      wknlas = *blanks
     C                   eval      wknlst = *blanks
     C                   eval      wkpack = *zeros
     C                   eval      wkpall = *blanks
     C                   eval      wkqtyo = *zeros
     C                   eval      wkrow = *zeros
     C                   eval      wksanl = *blanks
     C                   eval      wksig = *blanks
     C                   eval      wkstuc = *zeros
     C                   eval      wksubs = *blanks
     C                   eval      wksupd = *blanks
     C                   eval      wksupg = *blanks
     C                   eval      wksvg = *blanks
     C                   eval      wkudf1 = *blanks
     C                   eval      wkudf2 = *blanks
     C                   eval      wkudf3 = *blanks
     C                   eval      wkuom = *blanks
     C                   eval      wkuomo = *blanks
     C                   eval      wkuser = *blanks
     C                   eval      wkvatc = *blanks
     C                   eval      wkweig = *zeros
     C                   eval      lck02 = *zeros
     C                   eval      lck03 = *zeros
     C                   eval      lck05 = *zeros
     C                   eval      lck04 = *zeros
     C                   eval      lck01 = *zeros
     C                   eval      lck08 = *zeros
     C                   eval      lck13 = *zeros
     C                   eval      lck09 = *zeros
     C                   eval      lck10 = *zeros
     C                   eval      lck06 = *zeros
     C                   eval      lck11 = *zeros
     C                   eval      lck12 = *zeros
     C                   eval      lck07 = *zeros
     C                   eval      lck14 = *zeros
     C                   eval      ioflag = 'N'
     C                   eval      scrnid = *blanks
     C                   eval      in01 = *blanks
     C                   eval      in02 = *blanks
     C                   eval      in03 = *blanks
     C                   eval      in04 = *blanks
     C                   eval      dspws = *blanks                              -dsply- replaced
     C                   eval      ins01 = *blanks
     C                   eval      swrd02 = *blanks
     C                   eval      swrd03 = *blanks
     C                   eval      kyco01 = *blanks
     C                   eval      swrd01 = *blanks
     C                   eval      ktco01 = *blanks
     C                   eval      ktal02 = *blanks
     C                   eval      ktit03 = *blanks
     C                   eval      ins02 = *blanks
     C                   eval      swrd04 = *blanks
     C                   eval      swrd05 = *blanks
     C                   eval      swrd08 = *blanks
     C                   eval      swrd09 = *blanks
     C                   eval      swrd10 = *blanks
     C                   eval      swrd06 = *blanks
     C                   eval      swrd11 = *blanks
     C                   eval      swrd12 = *blanks
     C                   eval      swrd07 = *blanks
     C                   eval      ktit02 = *blanks
     C                   eval      ktcl02 = *blanks
     C                   eval      ktit04 = *blanks
     C                   eval      ktsa02 = *blanks
     C                   eval      ktsi02 = *blanks
     C                   eval      ktig02 = *blanks
     C                   eval      ktsv02 = *blanks
     C                   eval      ktva02 = *blanks
     C                   eval      arslt0 = *blanks
     C                   eval      rierr = *blanks
     C                   eval      cmdkey = 'N'
     C                   eval      rn0040 = *blanks
     C                   eval      kcco01 = *blanks
     C                   eval      kccl02 = *blanks
     C                   eval      kaco01 = *blanks
     C                   eval      kait02 = *blanks
     C                   eval      kaco02 = *blanks
     C                   eval      kasa03 = *blanks
     C                   eval      kico01 = *blanks
     C                   eval      kist02 = *blanks
     C                   eval      kgco01 = *blanks
     C                   eval      kgsg02 = *blanks
     C                   eval      kgco02 = *blanks
     C                   eval      kgsv03 = *blanks
     C                   eval      kmco01 = *blanks
     C                   eval      kmuo02 = *blanks
     C                   eval      kcco02 = *blanks
     C                   eval      kcva03 = *blanks
     C                   eval      validf = *zeros
     C                   eval      listf = *zeros
     C                   eval      existf = *zeros
     C                   eval      ctoff = *zeros
     C                   eval      rangef = *zeros
     C                   eval      rn0042 = *blanks
     C                   eval      rslt01 = *zeros
     C                   eval      x1cdat = *zeros
     C                   eval      msgflg = 'N'
     C                   eval      appset = *blanks
     C                   eval      apptyp = 'D'
     C                   eval      appscr = *blanks
     C                   eval      approw = *zeros
     C                   eval      appcol = *zeros
     C                   eval      uercnt = *zeros
     C                   eval      ursume = *blanks
     C                   eval      t01001 = *zeros
     C                   eval      t01002 = *zeros
     C                   eval      t01003 = *zeros
     C                   eval      t01004 = *zeros
     C                   eval      t01005 = *zeros
     C                   eval      t04001 = *zeros
     C                   eval      t04002 = *zeros
     C                   eval      t04003 = *zeros
     C                   eval      t04004 = *zeros
     C                   eval      t04005 = *zeros
     C                   eval      t14001 = *zeros
     C                   eval      t14002 = *zeros
     C                   eval      t14003 = *zeros
     C                   eval      t14004 = *zeros
     C                   eval      t14005 = *zeros
     C                   eval      t17001 = *zeros
     C                   eval      t17002 = *zeros
     C                   eval      t17003 = *zeros
     C                   eval      t17004 = *zeros
     C                   eval      t17005 = *zeros
     C                   eval      t20001 = *zeros
     C                   eval      t20002 = *zeros
     C                   eval      t20003 = *zeros
     C                   eval      t20004 = *zeros
     C                   eval      t20005 = *zeros
     C                   eval      t23001 = *zeros
     C                   eval      t23002 = *zeros
     C                   eval      t23003 = *zeros
     C                   eval      t23004 = *zeros
     C                   eval      t23005 = *zeros
     C                   eval      t26001 = *zeros
     C                   eval      t26002 = *zeros
     C                   eval      t26003 = *zeros
     C                   eval      t26004 = *zeros
     C                   eval      t26005 = *zeros
     C                   eval      t28001 = *zeros
     C                   eval      t28002 = *zeros
     C                   eval      t28003 = *zeros
     C                   eval      t28004 = *zeros
     C                   eval      t28005 = *zeros
     C                   eval      t29001 = *zeros
     C                   eval      t29002 = *zeros
     C                   eval      t29003 = *zeros
     C                   eval      t29004 = *zeros
     C                   eval      t29005 = *zeros
     C                   eval      appset = 'LANDXAPP'
     C                   eval      apppgm = pgm
     C                   eval      xrn01 = 1
     C                   eval      xrn02 = 1
     C                   eval      x0 = *zeros
     C                   eval      x1 = *zeros
     C                   eval      offset = *zeros
     C                   eval      nrslt = *zeros
     C                   eval      x0 = *zeros
     C                   eval      sp = *zeros
     C                   eval      ct = *zeros
     C                   eval      srn01 = *zeros
     C                   eval      drn01 = *zeros
     C                   eval      ern01 = *zeros
     C                   eval      wcntr = *zeros
     C                   eval      wgetr = *zeros
     C                   eval      srn02 = *zeros
     C                   eval      drn02 = *zeros
     C                   eval      ern02 = *zeros
     C                   eval      nrslt0 = *zeros
     C                   eval      svs04 = *zeros
     C                   eval      wrrn01 = *zeros
     C                   eval      wadj01 = *zeros
     C                   eval      wlcntr = *zeros
     C                   eval      wlgetr = *zeros
     C                   eval      swexbl = *zeros
     C                   eval      swskpr = *zeros
     C                   eval      nxtrrn = *zeros
     C                   eval      wrrn02 = *zeros
     C                   eval      wadj02 = *zeros
     C                   eval      svs01 = *zeros
     C                   eval      svs05 = *zeros
     C                   eval      rn0041 = *zeros
     C                   eval      svs08 = *zeros
     C                   eval      svs09 = *zeros
     C                   eval      svs10 = *zeros
     C                   eval      svs06 = *zeros
     C                   eval      svs11 = *zeros
     C                   eval      svs12 = *zeros
     C                   eval      svs07 = *zeros
     C                   eval      xyes = 1
     C                   eval      callst = 1
     C                   eval      xno = *zeros
     C                   eval      wfile# = *zeros
 1e  C                   endif
     C                   eval      lrflag = *blanks
     C                   eval      *in60 = *off
      *
     C/EJECT
      ********************************************************************
      *        M a i n l i n e      R o u t i n e
      ********************************************************************
     C                   exsr      smain
      *
     C/EJECT
      *****************************************************************
      * SMAIN - Main flow of the program.
      *****************************************************************
     C     smain         begsr
      *
      *
      * Clear Message Subfile.
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
      *      *------------------------------------------*
      *      *  Process all screens.                    *
      *      *------------------------------------------*
     C                   eval      scrnid = 'SCALPH'
 1b  C                   dow       not *inlr
 2b  C                   select
 2x  C                   when      scrnid = 'SCALPH'
     C                   exsr      s001
 2x  C                   when      scrnid = 'SC0001'
     C                   exsr      s002
 2x  C                   when      scrnid = 'SC0002'
     C                   exsr      s003
 2x  C                   when      scrnid = 'SUP014'
     C                   exsr      s004
 2x  C                   when      scrnid = 'SC0003'
     C                   exsr      s005
 2x  C                   when      scrnid = 'SC0004'
     C                   exsr      s006
 2x  C                   when      scrnid = 'SC0007'
     C                   exsr      s007
 2x  C                   when      scrnid = 'SC0008'
     C                   exsr      s008
 2x  C                   when      scrnid = 'SC0009'
     C                   exsr      s009
 2x  C                   when      scrnid = 'SC0010'
     C                   exsr      s010
 2x  C                   when      scrnid = 'SC0011'
     C                   exsr      s011
 2x  C                   when      scrnid = 'SC0012'
     C                   exsr      s012
 2x  C                   when      scrnid = 'SEND'
     C                   exsr      send
 2e  C                   endsl
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SEND - END of program.
      *****************************************************************
     C     send          begsr
      *
 1b  C                   if        lrflag = 'Y'  or
     C                             lrflag = *blank
     C                   eval      *inlr = *on
 1e  C                   endif                                                  LRFLAG EQ 'Y'
     C                   eval      scrnid = *blanks
     C                   return
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S001 - Alpha List Screen for ITMMAST
      *****************************************************************
     C     s001          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *on
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in64 = *off
     C                   eval      *in80 = *on
      * ***  Clear list panel and start display on
      * ***  first record in file. Performed only once
      * ***  at start of program.
      * GETREC d.company,f.company,*eq,prcoyno
      *
     C                   exsr      s013
      * GETREC d.company,f.imscpyd,*eq,prcoyno
      *
     C                   exsr      s014
      *                                                               *
      * F12FLG = 0
     C                   eval      f12flg = *zeros
      * :0238 = ' '
     C                   eval      wk0011 = *blanks
      * :0239 = ' '
     C                   eval      wk0010 = *blanks
      * :0237 = ' '
     C                   eval      wk0009 = *blanks
      * Set Key values to parms passed
      * SVK001 = prcoyno
     C                   eval      svk001 = prm003
      * SVK002 = ' '
     C                   eval      svk002 = *blanks
      *                                                               *
      * Set file for list to first record in file
      * SETLL D.ITMMAST1,F.ITMMAST1,SVK001,SVK002
      *
     C                   exsr      s015
      *                                                               *
      * Fill list Panel
      * EXSUBR S01FWD
     C                   exsr      s502
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in63 = *on
     C                   eval      *in65 = *on
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   write     scr001
      * Turn off SFLDSP in case of empty subfile
 2b  C                   if        rrn01 < 1
     C                   eval      *in64 = *off
 2x  C                   else
     C                   eval      *in64 = *on
 2e  C                   endif
 2b  C                   if        ern01 = 1
     C                   eval      *in67 = *on
 2x  C                   else
     C                   eval      *in67 = *off
 2e  C                   endif
     C                   eval      drn01 = rrn01
     C                   exfmt     scr001c1
 2b  C                   if        sflrrn > 0  and
     C                             drn01 <> 0
     C                   eval      rrn01 = sflrrn
     C                   eval      drn01 = sflrrn
 2e  C                   endif
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Exit
      *
 2b  C                   if        *inkc  and
     C                             cmdkey = 'N'
      * *** Exit program on function key 3
      *                                                               *
      * EXTPGM                                                        *
     C                   eval      lrflag = 'Y'
     C                   eval      scrnid = *blanks
     C                   eval      scrnid = 'SEND'
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * *** Exit program on function key 12
      *                                                               *
      * EXTPGM                                                        *
     C                   eval      lrflag = 'Y'
     C                   eval      scrnid = *blanks
     C                   eval      scrnid = 'SEND'
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Number Seq
      *
 2b  C                   if        *inks  and
     C                             cmdkey = 'N'
      * GOTOSCR sc0001
     C                   eval      scrnid = 'SC0001  '
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Create
      *
 3b  C                   if        *inkf  and
     C                             cmdkey = 'N'
      * *** Process ADD Request on function key 6
      *                                                               *
      * MODE = 6
     C                   eval      mode = 6
      * EXSCR SC0002
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SCALPH  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in01 = indicators
     C                   exsr      s003
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in01
     C                   eval      *in79 = *on
      * SETLL D.ITMMAST1,F.ITMMAST1,SVK001,svkalp,SVK002
      *
     C                   exsr      s016
      * EXSUBR S01FWD
     C                   exsr      s502
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * *** Scroll information backwards
      *     1. Check for any selected records.
      * EXSUBR S01EDT
     C                   exsr      s501
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      *     2. Fill panel.
      * EXSUBR S01BKW
     C                   exsr      s500
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * *** Scroll information forwards
      *     1. Check for selected records.
      * EXSUBR S01EDT
     C                   exsr      s501
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      *     2. Fill Panel.
      * EXSUBR S01FWD
     C                   exsr      s502
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * *** Check for any selected records on post-enter.
      *                                                               *
      * Reset reposition flag and check for any
      * selected records.
      * POSFLG = 0
     C                   eval      posflg = *zeros
      * EXSUBR S01EDT
     C                   exsr      s501
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      * *** Check for reposition
      * *** Check field only if not passed as parm.
      *                                                               *
      * IF PSalph<>' '
 4b  C                   if        psalph <> *blanks
      * POSFLG = 1
     C                   eval      posflg = 1
      * SVKALP = psalph
     C                   eval      svkalp = psalph
      * Reset/clear reposition values to parms passed
      * PSALPH = ' '
     C                   eval      psalph = *blanks
      * END                                                           *
 4e  C                   endif
      *                                                               *
      * Refresh screen if record selected or
      * if reposition was selected.
      * IF POSFLG=1 | updflg=1
 4b  C                   if        posflg = 1  or
     C                             updflg = 1
      *                                                               *
      * Set pointer to file.
      * SETLL D.ITMMAST1,F.ITMMAST1,SVK001,svkalp,SVK002
      *
     C                   exsr      s016
      *                                                               *
      * Fill Panel.
      * EXSUBR S01FWD
     C                   exsr      s502
 5b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 5e  C                   endif
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S002 - List Screen for ITMMAST
      *****************************************************************
     C     s002          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *on
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in64 = *off
     C                   eval      *in80 = *on
      * ***  Clear list panel and start display on
      * ***  first record in file. Performed only once
      * ***  at start of program.
      * GETREC d.company,f.company,*eq,prcoyno
      *
     C                   exsr      s013
      *                                                               *
      * F12FLG = 0
     C                   eval      f12flg = *zeros
      * ITITEM = ' '
     C                   eval      xtitem = *blanks
      * ITIDESC = ' '
     C                   eval      wk0007 = *blanks
      * ITALPHA = ' '
     C                   eval      wk0005 = *blanks
      * Set Key values to parms passed
      * SVK001 = prcoyno
     C                   eval      svk001 = prm003
      * SVK002 = ' '
     C                   eval      svk002 = *blanks
      *                                                               *
      * Set file for list to first record in file
      * SETLL D.ITMMAST,F.ITMMAST,SVK001,SVK002
      *
     C                   exsr      s017
      *                                                               *
      * Fill list Panel
      * EXSUBR S01FWD
     C                   exsr      s01fwd
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in63 = *on
     C                   eval      *in65 = *on
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   write     scr002
      * Turn off SFLDSP in case of empty subfile
 2b  C                   if        rrn02 < 1
     C                   eval      *in64 = *off
 2x  C                   else
     C                   eval      *in64 = *on
 2e  C                   endif
 2b  C                   if        ern02 = 1
     C                   eval      *in67 = *on
 2x  C                   else
     C                   eval      *in67 = *off
 2e  C                   endif
     C                   eval      drn02 = rrn02
     C                   exfmt     scr002c1
 2b  C                   if        sflrrn > 0  and
     C                             drn02 <> 0
     C                   eval      rrn02 = sflrrn
     C                   eval      drn02 = sflrrn
 2e  C                   endif
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Exit
      *
 2b  C                   if        *inkc  and
     C                             cmdkey = 'N'
      * *** Exit program on function key 3
      *                                                               *
      * EXTPGM                                                        *
     C                   eval      lrflag = 'Y'
     C                   eval      scrnid = *blanks
     C                   eval      scrnid = 'SEND'
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * *** Exit program on function key 12
      *                                                               *
      * EXTPGM                                                        *
     C                   eval      lrflag = 'Y'
     C                   eval      scrnid = *blanks
     C                   eval      scrnid = 'SEND'
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Alpha Seq
      *
 2b  C                   if        *inks  and
     C                             cmdkey = 'N'
      * GOTOSCR scalph
     C                   eval      scrnid = 'SCALPH  '
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Create
      *
 3b  C                   if        *inkf  and
     C                             cmdkey = 'N'
      * *** Process ADD Request on function key 6
      *                                                               *
      * MODE = 6
     C                   eval      mode = 6
      * EXSCR SC0002
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0001  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in02 = indicators
     C                   exsr      s003
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in02
     C                   eval      *in79 = *on
      * SETLL D.ITMMAST,F.ITMMAST,SVK001,SVK002
      *
     C                   exsr      s017
      * EXSUBR S01FWD
     C                   exsr      s01fwd
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * *** Scroll information backwards
      *     1. Check for any selected records.
      * EXSUBR S01EDT
     C                   exsr      s01edt
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      *     2. Fill panel.
      * EXSUBR S01BKW
     C                   exsr      s01bkw
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * *** Scroll information forwards
      *     1. Check for selected records.
      * EXSUBR S01EDT
     C                   exsr      s01edt
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      *     2. Fill Panel.
      * EXSUBR S01FWD
     C                   exsr      s01fwd
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * *** Check for any selected records on post-enter.
      *                                                               *
      * Reset reposition flag and check for any
      * selected records.
      * POSFLG = 0
     C                   eval      posflg = *zeros
      * EXSUBR S01EDT
     C                   exsr      s01edt
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
      * *** Check for reposition
      * *** Check field only if not passed as parm.
      *                                                               *
      * IF PS0102<>' '
 4b  C                   if        ps0102 <> *blanks
      * POSFLG = 1
     C                   eval      posflg = 1
      * SVK002 = PS0102
     C                   eval      svk002 = *blanks
     C                   eval      svk002 = ps0102
      * Reset/clear reposition values to parms passed
      * PS0102 = ' '
     C                   eval      ps0102 = *blanks
      * END                                                           *
 4e  C                   endif
      *                                                               *
      * Refresh screen if record selected or
      * if reposition was selected.
      * IF POSFLG=1 | updflg=1
 4b  C                   if        posflg = 1  or
     C                             updflg = 1
      *                                                               *
      * Set pointer to file.
      * SETLL D.ITMMAST,F.ITMMAST,SVK001,SVK002
      *
     C                   exsr      s017
      *                                                               *
      * Fill Panel.
      * EXSUBR S01FWD
     C                   exsr      s01fwd
 5b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 5e  C                   endif
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S003 - Detail Screen for ITMMAST
      *****************************************************************
     C     s003          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in11 = *off
     C                   eval      *in12 = *off
     C                   eval      *in13 = *off
     C                   eval      *in14 = *off
     C                   eval      *in15 = *off
     C                   eval      *in16 = *off
     C                   eval      *in17 = *off
     C                   eval      *in18 = *off
     C                   eval      *in19 = *off
     C                   eval      *in20 = *off
     C                   eval      *in80 = *on
      * Check user is allowed action
      * POSCUR 0,0
     C                   eval      lin = *zeros
     C                   eval      pos = *zeros
     C                   eval      *in79 = *on
      * BAT = 'I'
     C                   eval      bat = 'I'
      * WKUSER = *userid
     C                   eval      wkuser = *blanks
     C                   eval      wkuser = user
      * PRACT = %ctc(mode)
      *  Convert To Character
     C                   eval      pract = *blanks
     C                   eval      pract = %char(mode)                          Check %char conv
      * PRALWD = ' '
     C                   eval      pralwd = *blanks
      * CALL 'BSECIMSC',BAT,PRCOYNO,WKUSER,PRACT,PRALWD
     C                   eval      callst = 1
      *
     C                   callp(e)  p_BSECIMSC(
     C                             bat:
     C                             prm003:
     C                             wkuser:
     C                             pract:
     C                             pralwd)
      *
     C                   if        %error
     C                   eval      *in93 = *on
     C                   endif
      *
      *                  call      'BSECIMSC'    p0001                  93
     C                   eval      *in79 = *on
 1b  C                   if        *in93
     C                   eval      msgflg = 'Y'
     C                   eval      callst = *zeros
 1e  C                   endif
      * IF pralwd = 'N'
 1b  C                   if        pralwd = 'N'
      * DSPERR *none,'usr0001','errors'
     C                   eval      msgid = 'USR0001'
     C                   eval      msgf = 'ERRORS'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 1e  C                   endif
      *                                                               *
      * *** Clear detail screens, setup field attributes,
      * *** and retrieve field values from files.
      * SVKALP = ITalpha
     C                   eval      svkalp = wk0005
      * ITIDESC = ' '
     C                   eval      wk0007 = *blanks
      * ITALPHA = ' '
     C                   eval      wk0005 = *blanks
      * ITSUPG = ' '
     C                   eval      xtsupg = *blanks
      * ITSUPD = ' '
     C                   eval      xtsupd = *blanks
      * ITSUBS = ' '
     C                   eval      xtsubs = *blanks
      * ITMANF = ' '
     C                   eval      xtmanf = *blanks
      * ITWEIG = 0
     C                   eval      xtweig = *zeros
      * ITCLAS = ' '
     C                   eval      xtclas = *blanks
      * ITIGRP = ' '
     C                   eval      xtigrp = *blanks
      * ITUOM = ' '
     C                   eval      xtuom = *blanks
      * ITPACK = 0
     C                   eval      xtpack = *zeros
      * ITUOMO = ' '
     C                   eval      xtuomo = *blanks
      * ITQTYO = 0
     C                   eval      xtqtyo = *zeros
      * ITPALL = ' '
     C                   eval      xtpall = *blanks
      * ITVATC = ' '
     C                   eval      xtvatc = *blanks
      * ITNLAC = ' '
     C                   eval      xtnlac = *blanks
      * ITNLAS = ' '
     C                   eval      xtnlas = *blanks
      * ITNLST = ' '
     C                   eval      xtnlst = *blanks
      * ITUDF1 = ' '
     C                   eval      xtudf1 = *blanks
      * ITUDF2 = ' '
     C                   eval      xtudf2 = *blanks
      * ITUDF3 = ' '
     C                   eval      xtudf3 = *blanks
      * ITITYP = ' '
     C                   eval      xtityp = *blanks
      * ITSANL = ' '
     C                   eval      xtsanl = *blanks
      * ITSVG = ' '
     C                   eval      xtsvg = *blanks
      * ITSIG = ' '
     C                   eval      xtsig = *blanks
      * ITLPRC = 0
     C                   eval      xtlprc = *zeros
      * ITSTUC = 0
     C                   eval      xtstuc = *zeros
      * ITDTCR = 0
     C                   eval      wtdtcr = *zeros
      * ITCRTU = ' '
     C                   eval      xtcrtu = *blanks
      * ITDTLM = 0
     C                   eval      wtdtlm = *zeros
      * ITLMBY = ' '
     C                   eval      xtlmby = *blanks
      * ICDESC = ' '
     C                   eval      xcdesc = *blanks
      * BADESC = ' '
     C                   eval      xadesc = *blanks
      * SADESC = ' '
     C                   eval      wk0014 = *blanks
      * SIDESC = ' '
     C                   eval      xidesc = *blanks
      * SGSDESC = ' '
     C                   eval      wk0017 = *blanks
      * VGDESC = ' '
     C                   eval      xgdesc = *blanks
      * UMQTYO = 0
     C                   eval      wmqtyo = *zeros
      * VCDESC = ' '
     C                   eval      wk0022 = *blanks
      *                                                               *
      * Refresh exit flag at start of detail
      * EXTSCR = 0
     C                   eval      extscr = *zeros
      *                                                               *
      * Process Edit, Delete, and Display action choices
      * IF MODE=2 | MODE=4 | MODE=5
 1b  C                   if        mode = 2  or
     C                             mode = 4  or
     C                             mode = 5
      *                                                               *
      * Save Key values prior to clearing screens,
      * otherwise, keys will be lost when screen is
      * cleared.
      * SVK001 = ITCOYNO
     C                   eval      svk001 = wk0006
      * SVK002 = ITITEM
     C                   eval      svk002 = *blanks
     C                   eval      svk002 = xtitem
      * ITITEM = ' '
     C                   eval      xtitem = *blanks
      * ITCOYNO = SVK001
     C                   eval      wk0006 = svk001
      * ITITEM = SVK002
     C                   eval      xtitem = *blanks
     C                   eval      xtitem = svk002
      *                                                               *
      * Revise, Delete, and Display, protect
      * key fields from being changed.
      * FLDATR ITITEM,*PR
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'XTITEM  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * Get selected record for edit function.
      * IF MODE=2
 2b  C                   if        mode = 2
      * GRPATR input,*ul
     C                   eval      #ul = 'X'
     C                   eval      fldnam = 'INPUT   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * GETREC D.ITMMAST,F.ITMMAST,*lock,*eq,SVK001,SVK002
      *
     C                   exsr      s018
      * If record locked, return to previous
      * screen and display lock message from OS/400.
      * IF %lock(D.ITMMAST,F.ITMMAST)=*yes
      *  Lock status on file
     C                   exsr      slock
 3b  C                   if        lck04 = *zero
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 3e  C                   endif
      * If record not found, Display message
      * and return.
      * IF %sts(D.ITMMAST,F.ITMMAST)=*no
      *  Status of last file I/O
 3b  C                   if        sts04 <> *zero
      * DSPERR *none,'Record not found for Edit'
     C                   eval      msgdta = c0001
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 3e  C                   endif
      * MODDSC = 'CHANGE'
     C                   eval      moddsc = *blanks
     C                   eval      moddsc = 'CHANGE'
      * ELSE                                                          *
 2x  C                   else
      * Protect Data fields from being changed for
      * delete and display action choices.
      * GRPATR input,*pr
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'INPUT   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      *                                                               *
      * Get selected record for delete function.
      * IF MODE=4
 3b  C                   if        mode = 4
      * GETREC D.ITMMAST,F.ITMMAST,*lock,*eq,SVK001,SVK002
      *
     C                   exsr      s018
      * If record locked, return to previous
      * screen and display lock message from OS/400.
      * IF %lock(D.ITMMAST,F.ITMMAST)=*yes
      *  Lock status on file
     C                   exsr      slock
 4b  C                   if        lck04 = *zero
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
      * If record not found, Display message
      * and return.
      * IF %sts(D.ITMMAST,F.ITMMAST)=*no
      *  Status of last file I/O
 4b  C                   if        sts04 <> *zero
      * DSPERR *none,'Record not found for Delete'
     C                   eval      msgdta = c0002
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
      * MODDSC = 'DELETE'
     C                   eval      moddsc = *blanks
     C                   eval      moddsc = 'de1ete'                            -delete - replaced
      * ELSE                                                          *
 3x  C                   else
      * Get selected record for display function.
      * GETREC D.ITMMAST,F.ITMMAST,*eq,SVK001,SVK002
      *
     C                   exsr      s019
      * If record not found, Display message
      * and return.
      * IF %sts(D.ITMMAST,F.ITMMAST)=*no
      *  Status of last file I/O
 4b  C                   if        sts04 <> *zero
      * DSPERR *none,'Record not found for Display'
     C                   eval      msgdta = c0003
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
      * MODDSC = 'DISPLAY'
     C                   eval      moddsc = *blanks
     C                   eval      moddsc = 'DISPLAY'
      * END                                                           *
 3e  C                   endif
      * END                                                           *
 2e  C                   endif
      * Get secondary records if any were selected.
      * GETREC D.ITMMAST,F.ITMCLAS,*eq,ITCOYNO,ITCLAS
      *
     C                   exsr      s020
      * GETREC D.ITMMAST,F.ITMTYP,*eq,ITCOYNO,ITITYP
      *
     C                   exsr      s021
      * GETREC D.ITMMAST,F.STANYS,*eq,ITCOYNO,ITSANL
      *
     C                   exsr      s022
      * GETREC D.ITMMAST,F.STIGRP,*eq,ITCOYNO,ITSIG
      *
     C                   exsr      s023
      * GETREC D.ITMMAST,F.STOKGRP,*eq,ITCOYNO,ITIGRP
      *
     C                   exsr      s024
      * GETREC D.ITMMAST,F.STVGRP,*eq,ITCOYNO,ITSVG
      *
     C                   exsr      s025
      * GETREC D.ITMMAST,F.VATCOD,*eq,ITCOYNO,ITVATC
      *
     C                   exsr      s026
      * ELSE                                                          *
 1x  C                   else
      *                                                               *
      * Clear screens for Add function.
      * FLDATR ITitem,*ul
     C                   eval      #ul = 'X'
     C                   eval      fldnam = 'XTITEM  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * GRPATR input,*ul
     C                   eval      #ul = 'X'
     C                   eval      fldnam = 'INPUT   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * ITCOYNO = prcoyno
     C                   eval      wk0006 = prm003
      * ITITEM = ' '
     C                   eval      xtitem = *blanks
      * EXSUBR SYSDAT
     C                   exsr      sysdat
 2b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 2e  C                   endif
      * ITDTCR = ##DATE
     C                   eval      wtdtcr = ##date
      * ITCRTU = *userid
     C                   eval      xtcrtu = *blanks
     C                   eval      xtcrtu = user
      * MODDSC = 'ADD'
     C                   eval      moddsc = *blanks
     C                   eval      moddsc = 'ADD'
      * END                                                           *
 1e  C                   endif
      * F12FLG = 0
     C                   eval      f12flg = *zeros
      *                                                               *
      * SYDATO = *blanks
     C                   eval      rn0003 = *blanks
      * SYDSEP = cydsep
     C                   eval      rn0005 = wydsep
      * SYDFMT = cydfmt
     C                   eval      rn0004 = wydfmt
      * SYDATI = ITDTLM  ; date maintained
     C                   eval      rn0002 = wtdtlm
      * EXSUBR SY0010
     C                   exsr      sy0010
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      * DTDTLM = SYDATO
     C                   eval      dtdtlm = rn0003
      * SYDATO = *blanks
     C                   eval      rn0003 = *blanks
      * SYDATI = ITDTCR  ; date created
     C                   eval      rn0002 = wtdtcr
      * EXSUBR SY0010
     C                   exsr      sy0010
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      * DTDTCR = SYDATO
     C                   eval      dtdtcr = rn0003
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr003
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in10 = *off
     C                   eval      *in11 = *off
     C                   eval      *in12 = *off
     C                   eval      *in13 = *off
     C                   eval      *in14 = *off
     C                   eval      *in15 = *off
     C                   eval      *in16 = *off
     C                   eval      *in17 = *off
     C                   eval      *in18 = *off
     C                   eval      *in19 = *off
     C                   eval      *in20 = *off
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Prompt
      *
 2b  C                   if        *inkd  and
     C                             cmdkey = 'N'
      * ** Check for cursor position
      * WKROW = *row
     C                   eval      halfwd = 0
     C                   eval      byte2 = row
     C                   eval      row1 = halfwd                                << Conv Numbers
     C                   eval      wkrow = row1
      * WKCOL = *col
     C                   eval      halfwd = 0
     C                   eval      byte2 = col
     C                   eval      col1 = halfwd                                << Conv Numbers
     C                   eval      wkcol = col1
      *                                                               *
      * ** Check for any prompt fields.
      * UPDFLG = 0
     C                   eval      updflg = *zeros
      * IF %clf(ITMMAST.ITMMAST.ITCLAS)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTCLAS  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F02001 = ' '
     C                   eval      f02001 = *blanks
      * EXSCR SC0003
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s005
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F02001<>' '
 4b  C                   if        f02001 <> *blanks
      * ITCLAS = F02001
     C                   eval      xtclas = f02001
      * END                                                           *
 4e  C                   endif
      * ICDESC = ' '
     C                   eval      xcdesc = *blanks
      * GETREC D.ITMMAST,F.ITMCLAS,*eq,ITCOYNO,ITCLAS
      *
     C                   exsr      s020
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITIGRP)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTIGRP  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F02002 = ' '
     C                   eval      f02002 = *blanks
      * EXSCR SC0009
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s009
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F02002<>' '
 4b  C                   if        f02002 <> *blanks
      * ITIGRP = F02002
     C                   eval      xtigrp = f02002
      * END                                                           *
 4e  C                   endif
      * SGSDESC = ' '
     C                   eval      wk0017 = *blanks
      * GETREC D.ITMMAST,F.STOKGRP,*eq,ITCOYNO,ITIGRP
      *
     C                   exsr      s024
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITUOM)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTUOM   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F02003 = ' '
     C                   eval      f02003 = *blanks
      * EXSCR SC0011
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s011
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F02003<>' '
 4b  C                   if        f02003 <> *blanks
      * ITUOM = F02003
     C                   eval      xtuom = f02003
      * END                                                           *
 4e  C                   endif
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITUOMo)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTUOMO  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F02003 = ' '
     C                   eval      f02003 = *blanks
      * EXSCR SC0011
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s011
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F02003<>' '
 4b  C                   if        f02003 <> *blanks
      * ITUOMO = F02003
     C                   eval      xtuomo = f02003
      * END                                                           *
 4e  C                   endif
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITVATC)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTVATC  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F02004 = ' '
     C                   eval      f02004 = *blanks
      * EXSCR SC0012
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s012
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F02004<>' '
 4b  C                   if        f02004 <> *blanks
      * ITVATC = F02004
     C                   eval      xtvatc = f02004
      * END                                                           *
 4e  C                   endif
      * VCDESC = ' '
     C                   eval      wk0022 = *blanks
      * GETREC D.ITMMAST,F.VATCOD,*eq,ITCOYNO,ITVATC
      *
     C                   exsr      s026
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * ** Restore cursor position
      * POSCUR wkrow,wkcol
     C                   eval      lin = wkrow
     C                   eval      pos = wkcol
      *                                                               *
      * ** If no fields processed for prompt
      * ** (UPDFLG=0), display error.
      * IF UPDFLG=0
 3b  C                   if        updflg = *zero
      * DSPERR *none,'Invalid cursor loc for prompt'
     C                   eval      msgdta = c0004
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * END                                                           *
 3e  C                   endif
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * *** Return to list panel on function key 12
      * Set exit flag to signal previous screen
      * EXTSCR = 1
     C                   eval      extscr = 1
      *                                                               *
      * Release record if edit or delete functions
      * IF mode=2 | mode=4
 3b  C                   if        mode = 2  or
     C                             mode = 4
      * RLSREC D.ITMMAST,F.ITMMAST
      *
     C                   eval      wfile# = 4
     C                   unlock    itmmast                                      Lo91 Repl 4 bif
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Delete
      *
 2b  C                   if        *inkn  and
     C                             cmdkey = 'N'
      * *** Display next detail panel on post-enter
      *                                                               *
      * EXSCR SUP014
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s004
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 3b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 3e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      *                                                               *
      * If Exit selected return to previous screen.
      * IF extscr=1
 3b  C                   if        extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 3e  C                   endif
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      * Process Screen Validation.
 3b  C                   if        chkvar = 1
     C                   exsr      s003v
 3e  C                   endif
 3b  C                   if        validf = 1  or
     C                             chkvar = 0
      * *** Display next detail panel on post-enter
      * ERROR = 'N'
     C                   eval      error = 'N'
      * IF mode = 2 | mode = 6
 4b  C                   if        mode = 2  or
     C                             mode = 6
      * If another item type entered check it
      * IF itsupg<>' ' | itsupd<>' ' | itsubs<>' '
 5b  C                   if        xtsupg <> *blanks  or
     C                             xtsupd <> *blanks  or
     C                             xtsubs <> *blanks
      * WKITEM = ititem
     C                   eval      wkitem = xtitem
      * WKIDESC = itidesc
     C                   eval      rn0008 = *blanks
     C                   eval      rn0008 = wk0007
      * WKALPHA = italpha
     C                   eval      rn0007 = *blanks
     C                   eval      rn0007 = wk0005
      * WKSUPG = itsupg
     C                   eval      wksupg = xtsupg
      * WKSUPD = itsupd
     C                   eval      wksupd = xtsupd
      * WKSUBS = itsubs
     C                   eval      wksubs = xtsubs
      * WKMANF = itmanf
     C                   eval      wkmanf = *blanks
     C                   eval      wkmanf = xtmanf
      * WKWEIG = itweig
     C                   eval      wkweig=xtweig                                Check fld overflow 2
      * WKCLAS = itclas
     C                   eval      wkclas = *blanks
     C                   eval      wkclas = xtclas
      * WKIGRP = itigrp
     C                   eval      wkigrp = *blanks
     C                   eval      wkigrp = xtigrp
      * WKUOM = ituom
     C                   eval      wkuom = *blanks
     C                   eval      wkuom = xtuom
      * WKPACK = itpack
     C                   eval      wkpack = xtpack
      * WKUOMO = ituomo
     C                   eval      wkuomo = *blanks
     C                   eval      wkuomo = xtuomo
      * WKQTYO = itqtyo
     C                   eval      wkqtyo = xtqtyo
      * WKPALL = itpall
     C                   eval      wkpall = *blanks
     C                   eval      wkpall = xtpall
      * WKVATC = itvatc
     C                   eval      wkvatc = *blanks
     C                   eval      wkvatc = xtvatc
      * WKNLAC = itnlac
     C                   eval      wknlac = *blanks
     C                   eval      wknlac = xtnlac
      * WKNLAS = itnlas
     C                   eval      wknlas = *blanks
     C                   eval      wknlas = xtnlas
      * WKNLST = itnlst
     C                   eval      wknlst = *blanks
     C                   eval      wknlst = xtnlst
      * WKUDF1 = itudf1
     C                   eval      wkudf1 = *blanks
     C                   eval      wkudf1 = xtudf1
      * WKUDF2 = itudf2
     C                   eval      wkudf2 = xtudf2
      * WKUDF3 = itudf3
     C                   eval      wkudf3 = xtudf3
      * WKITYP = itityp
     C                   eval      wkityp = xtityp
      * WKSANL = itsanl
     C                   eval      wksanl = xtsanl
      * WKSVG = itsvg
     C                   eval      wksvg = xtsvg
      * WKSIG = itsig
     C                   eval      wksig = xtsig
      * WKLPRC = itlprc
     C                   eval      wklprc = xtlprc
      * WKSTUC = itstuc
     C                   eval      wkstuc = xtstuc
      * WKCRTU = itcrtu
     C                   eval      wkcrtu = xtcrtu
      * WKLMBY = itlmby
     C                   eval      wklmby = xtlmby
      * Check superceding to
      * IF wksupg <> ' '
 6b  C                   if        wksupg <> *blanks
      * GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupg
      *
     C                   exsr      s027
      * IF %sts(d.itmmast,f.itmmast)=*no
      *  Status of last file I/O
 7b  C                   if        sts04 <> *zero
      * DSPERR itsupg,'fil0055','errors'
     C                   eval      msgid = 'FIL0055'
     C                   eval      msgf = 'ERRORS'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
     C                   eval      dsperr = 'X'
     C                   eval      fldnam = 'XTSUPG  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * ERROR = 'Y'
     C                   eval      error = 'Y'
      * END                                                           *
 7e  C                   endif
      * END                                                           *
 6e  C                   endif
      * Check superceding from
      * IF wksupd <> ' '
 6b  C                   if        wksupd <> *blanks
      * GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupd
      *
     C                   exsr      s028
      * IF %sts(d.itmmast,f.itmmast)=*no
      *  Status of last file I/O
 7b  C                   if        sts04 <> *zero
      * DSPERR itsupd,'fil0054','errors'
     C                   eval      msgid = 'FIL0054'
     C                   eval      msgf = 'ERRORS'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
     C                   eval      dsperr = 'X'
     C                   eval      fldnam = 'XTSUPD  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * ERROR = 'Y'
     C                   eval      error = 'Y'
      * END                                                           *
 7e  C                   endif
      * END                                                           *
 6e  C                   endif
      * Check substitute item
      * IF wksubs <> ' '
 6b  C                   if        wksubs <> *blanks
      * GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksubs
      *
     C                   exsr      s029
      * IF %sts(d.itmmast,f.itmmast)=*no
      *  Status of last file I/O
 7b  C                   if        sts04 <> *zero
      * DSPERR itsubs,'fil0053','errors'
     C                   eval      msgid = 'FIL0053'
     C                   eval      msgf = 'ERRORS'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
     C                   eval      dsperr = 'X'
     C                   eval      fldnam = 'XTSUBS  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0002  '
     C                   exsr      satrib
      * ERROR = 'Y'
     C                   eval      error = 'Y'
      * END                                                           *
 7e  C                   endif
      * END                                                           *
 6e  C                   endif
      * IF mode = 2
 6b  C                   if        mode = 2
      * GETREC d.itmmast,f.itmmast,*eq,prcoyno,wkitem
      *
     C                   exsr      s030
      * END                                                           *
 6e  C                   endif
      * ITITEM = wkitem
     C                   eval      xtitem = wkitem
      * ITIDESC = wkidesc
     C                   eval      wk0007 = *blanks
     C                   eval      wk0007 = rn0008
      * ITALPHA = wkalpha
     C                   eval      wk0005 = *blanks
     C                   eval      wk0005 = rn0007
      * ITSUPG = wksupg
     C                   eval      xtsupg = wksupg
      * ITSUPD = wksupd
     C                   eval      xtsupd = wksupd
      * ITSUBS = wksubs
     C                   eval      xtsubs = wksubs
      * ITMANF = wkmanf
     C                   eval      xtmanf = *blanks
     C                   eval      xtmanf = wkmanf
      * ITWEIG = wkweig
     C                   eval      xtweig = wkweig
      * ITCLAS = wkclas
     C                   eval      xtclas = *blanks
     C                   eval      xtclas = wkclas
      * ITIGRP = wkigrp
     C                   eval      xtigrp = *blanks
     C                   eval      xtigrp = wkigrp
      * ITUOM = wkuom
     C                   eval      xtuom = *blanks
     C                   eval      xtuom = wkuom
      * ITPACK = wkpack
     C                   eval      xtpack=%int(wkpack)                          Check fld overflow 1
      * ITUOMO = wkuomo
     C                   eval      xtuomo = *blanks
     C                   eval      xtuomo = wkuomo
      * ITQTYO = wkqtyo
     C                   eval      xtqtyo = wkqtyo
      * ITPALL = wkpall
     C                   eval      xtpall = *blanks
     C                   eval      xtpall = wkpall
      * ITVATC = wkvatc
     C                   eval      xtvatc = *blanks
     C                   eval      xtvatc = wkvatc
      * ITNLAC = wknlac
     C                   eval      xtnlac = *blanks
     C                   eval      xtnlac = wknlac
      * ITNLAS = wknlas
     C                   eval      xtnlas = *blanks
     C                   eval      xtnlas = wknlas
      * ITNLST = wknlst
     C                   eval      xtnlst = *blanks
     C                   eval      xtnlst = wknlst
      * ITUDF1 = wkudf1
     C                   eval      xtudf1 = *blanks
     C                   eval      xtudf1 = wkudf1
      * ITUDF2 = wkudf2
     C                   eval      xtudf2 = wkudf2
      * ITUDF3 = wkudf3
     C                   eval      xtudf3 = wkudf3
      * ITITYP = wkityp
     C                   eval      xtityp = wkityp
      * ITSANL = wksanl
     C                   eval      xtsanl = wksanl
      * ITSVG = wksvg
     C                   eval      xtsvg = wksvg
      * ITSIG = wksig
     C                   eval      xtsig = wksig
      * ITLPRC = wklprc
     C                   eval      xtlprc = wklprc
      * ITSTUC = wkstuc
     C                   eval      xtstuc = wkstuc
      * ITCRTU = wkcrtu
     C                   eval      xtcrtu = wkcrtu
      * ITLMBY = wklmby
     C                   eval      xtlmby = wklmby
      *                                                               *
      * END                                                           *
 5e  C                   endif
      *                                                               *
      * END                                                           *
 4e  C                   endif
      *                                                               *
      * IF error = 'N'
 4b  C                   if        error = 'N'
      * Move alpha detail if not entered
      * IF italpha = ' '
 5b  C                   if        wk0005 = *blanks
      * ITALPHA = %ljf(itidesc)
      *  Left Justify field into result field
     C                   eval      wk0005 = wk0007
      * ITALPHA = %UPC(ITALPHA)
      *  Convert to Upper Case
     C                   eval      aarg1 = *blanks
     C                   eval      aarg1 = wk0005
     C                   eval      arslt0 = %upper(aarg1)
     C                   eval      wk0005 = *blanks
     C                   eval      wk0005 = arslt0
      * END                                                           *
 5e  C                   endif
      * EXSCR SUP014
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0002  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in03 = indicators
     C                   exsr      s004
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 5b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 5e  C                   endif
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
      *                                                               *
      * If Exit selected return to previous screen.
      * IF extscr=1
 5b  C                   if        extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 5e  C                   endif
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S004 - Detail Screen for ITMMAST
      *****************************************************************
     C     s004          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in11 = *off
     C                   eval      *in12 = *off
     C                   eval      *in13 = *off
     C                   eval      *in80 = *on
      * *** Set display attributes for this panel
      * POSCUR 0,0
     C                   eval      lin = *zeros
     C                   eval      pos = *zeros
     C                   eval      *in79 = *on
      *                                                               *
      * If Edit, Delete, or Display function,
      * protect key fields.
      * IF MODE=4 | MODE=5
 1b  C                   if        mode = 4  or
     C                             mode = 5
      * GRPATR input2,*pr
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'INPUT2  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      satrib
      * ELSE                                                          *
 1x  C                   else
      * GRPATR input2,*ul
     C                   eval      #ul = 'X'
     C                   eval      fldnam = 'INPUT2  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr004
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in11 = *off
     C                   eval      *in12 = *off
     C                   eval      *in13 = *off
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkc  and
     C                             cmdkey = 'N'
      * *** return to first panel on function key 3
      *                                                               *
      * Set exit flag to signal previous panel
      * EXTSCR = 1
     C                   eval      extscr = 1
      *                                                               *
      * If Edit or delete function, release
      * record.
      * IF mode=2 | mode=4
 3b  C                   if        mode = 2  or
     C                             mode = 4
      * RLSREC D.ITMMAST,F.ITMMAST
      *
     C                   eval      wfile# = 4
     C                   unlock    itmmast                                      Lo91 Repl 4 bif
      * END                                                           *
 3e  C                   endif
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Prompt
      *
 2b  C                   if        *inkd  and
     C                             cmdkey = 'N'
      * ** store cursop position
      * WKROW = *row
     C                   eval      halfwd = 0
     C                   eval      byte2 = row
     C                   eval      row1 = halfwd                                << Conv Numbers
     C                   eval      wkrow = row1
      * WKCOL = *col
     C                   eval      halfwd = 0
     C                   eval      byte2 = col
     C                   eval      col1 = halfwd                                << Conv Numbers
     C                   eval      wkcol = col1
      *                                                               *
      * ** Check for any prompt fields
      * UPDFLG = 0
     C                   eval      updflg = *zeros
      * IF %clf(ITMMAST.ITMMAST.ITITYP)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTITYP  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F14001 = ' '
     C                   eval      f14001 = *blanks
      * EXSCR SC0004
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SUP014  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in04 = indicators
     C                   exsr      s006
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in04
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F14001<>' '
 4b  C                   if        f14001 <> *blanks
      * ITITYP = F14001
     C                   eval      xtityp = f14001
      * END                                                           *
 4e  C                   endif
      * BADESC = ' '
     C                   eval      xadesc = *blanks
      * GETREC D.ITMMAST,F.ITMTYP,*eq,ITCOYNO,ITITYP
      *
     C                   exsr      s021
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITSANL)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTSANL  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F14002 = ' '
     C                   eval      f14002 = *blanks
      * EXSCR SC0007
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SUP014  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in04 = indicators
     C                   exsr      s007
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in04
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F14002<>' '
 4b  C                   if        f14002 <> *blanks
      * ITSANL = F14002
     C                   eval      xtsanl = f14002
      * END                                                           *
 4e  C                   endif
      * SADESC = ' '
     C                   eval      wk0014 = *blanks
      * GETREC D.ITMMAST,F.STANYS,*eq,ITCOYNO,ITSANL
      *
     C                   exsr      s022
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITSIG)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTSIG   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F14003 = ' '
     C                   eval      f14003 = *blanks
      * EXSCR SC0008
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SUP014  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in04 = indicators
     C                   exsr      s008
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in04
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F14003<>' '
 4b  C                   if        f14003 <> *blanks
      * ITSIG = F14003
     C                   eval      xtsig = f14003
      * END                                                           *
 4e  C                   endif
      * SIDESC = ' '
     C                   eval      xidesc = *blanks
      * GETREC D.ITMMAST,F.STIGRP,*eq,ITCOYNO,ITSIG
      *
     C                   exsr      s023
      * END                                                           *
 3e  C                   endif
      *                                                               *
      * IF %clf(ITMMAST.ITMMAST.ITSVG)
      *  Cursor location on fields/Keywords.
     C                   eval      fldnam = 'XTSVG   '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SUP014  '
     C                   exsr      sclf
     C                   eval      nrslt0 = nrslt
 3b  C                   if        nrslt0 = 1
      * F14004 = ' '
     C                   eval      f14004 = *blanks
      * EXSCR SC0010
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SUP014  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in04 = indicators
     C                   exsr      s010
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      indicators = in04
     C                   eval      *in79 = *on
      * UPDFLG = 1
     C                   eval      updflg = 1
      * IF F14004<>' '
 4b  C                   if        f14004 <> *blanks
      * ITSVG = F14004
     C                   eval      xtsvg = f14004
      * END                                                           *
 4e  C                   endif
      * VGDESC = ' '
     C                   eval      xgdesc = *blanks
      * GETREC D.ITMMAST,F.STVGRP,*eq,ITCOYNO,ITSVG
      *
     C                   exsr      s025
      * END                                                           *
 3e  C                   endif
      * ** restore cursor position
      * POSCUR wkrow,wkcol
     C                   eval      lin = wkrow
     C                   eval      pos = wkcol
      *                                                               *
      * ** If no field selected for prompt
      * ** (UPDFLG=0), display error.
      * IF UPDFLG=0
 3b  C                   if        updflg = *zero
      * DSPERR *none,'Invalid cursor loc for prompt'
     C                   eval      msgdta = c0004
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
      * END                                                           *
 3e  C                   endif
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Return
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * *** Process previous screen request on function key 12
      *                                                               *
      * F12FLG = 1
     C                   eval      f12flg = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
      *
      * Delete
      *
 2b  C                   if        *inkn  and
     C                             cmdkey = 'N'
      * *** Process update to file on function key 14
      * ** Delete
      * IF MODE=4
 3b  C                   if        mode = 4
      * DELETE D.ITMMAST,F.ITMMAST
      *
     C                   exsr      s031
      * Set exit flag to signal previous screen.
      * IF %STS(D.ITMMAST,F.ITMMAST)=*YES
      *  Status of last file I/O
 4b  C                   if        sts04 = *zero
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
      * END                                                           *
 3e  C                   endif
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      * Process Screen Validation.
 3b  C                   if        chkvar = 1
     C                   exsr      s004v
 3e  C                   endif
 3b  C                   if        validf = 1  or
     C                             chkvar = 0
      * *** Process update to file on function key 14
      *                                                               *
      * IF mode <> 4
 4b  C                   if        mode <> 4
      * ** Revise
      * IF MODE=2
 5b  C                   if        mode = 2
      * EXSUBR SYSDAT
     C                   exsr      sysdat
 6b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 6e  C                   endif
      * ITDTLM = ##DATE
     C                   eval      wtdtlm = ##date
      * ITLMBY = *userid
     C                   eval      xtlmby = *blanks
     C                   eval      xtlmby = user
      * UPDATE D.ITMMAST,F.ITMMAST
      *
     C                   exsr      s033
      * SVKALP = ITalpha
     C                   eval      svkalp = wk0005
      * ELSE                                                          *
 5x  C                   else
      * ** Create, Set key values to reposition
      * ** record at top of screen.
      * IF MODE=6
 6b  C                   if        mode = 6
      * EXSUBR SYSDAT
     C                   exsr      sysdat
 7b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 7e  C                   endif
      * ITDTCR = ##DATE
     C                   eval      wtdtcr = ##date
      * WRITE D.ITMMAST,F.ITMMAST
      *
     C                   exsr      s035
      * SVK001 = ITCOYNO
     C                   eval      svk001 = wk0006
      * SVK002 = ITITEM
     C                   eval      svk002 = *blanks
     C                   eval      svk002 = xtitem
      * SVKALP = ITalpha
     C                   eval      svkalp = wk0005
      * END                                                           *
 6e  C                   endif
      * END                                                           *
 5e  C                   endif
      * Set exit flag to signal previous screen.
      * IF %STS(D.ITMMAST,F.ITMMAST)=*YES
      *  Status of last file I/O
 5b  C                   if        sts04 = *zero
      * EXTSCR = 1
     C                   eval      extscr = 1
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 5e  C                   endif
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S005 -      List of Item Classes
      *****************************************************************
     C     s005          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST03 = ' '
     C                   eval      fst03 = *blanks
      * LST03 = ' '
     C                   eval      lst03 = *blanks
      * SVK03 = ' '
     C                   eval      svk03 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK003 = ITCOYNO
     C                   eval      svk003 = wk0006
      * S03CNT = 005
     C                   eval      s03cnt = 005
      * ** Array forward read.
      * EXSUBR S03AFR
     C                   exsr      s03afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr005
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK03 = FST03
     C                   eval      svk03 = fst03
      * ** Array Backwards read.
      * EXSUBR S03ABR
     C                   exsr      s03abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK03 = LST03
     C                   eval      svk03 = lst03
      * ** Array Forward Read.
      * EXSUBR S03AFR
     C                   exsr      s03afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I03 = 1
     C                   eval      y2 = 1
      * DOW (I03<=C03)&(T01(I03)<>1)
 4b  C                   dow       y2 <= z2  and
     C                             t01(y2) <> 1
      * I03 = I03+1
     C                   eval      nrslt0 = y2 + 1
     C                   eval      y2=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I03<=C03)&(T01(I03)=1)
 4b  C                   if        y2 <= z2  and
     C                             t01(y2) = 1
      * F02001 = B01(I03)
     C                   eval      f02001 = b01(y2)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S006 -       List of item types
      *****************************************************************
     C     s006          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST04 = ' '
     C                   eval      fst04 = *blanks
      * LST04 = ' '
     C                   eval      lst04 = *blanks
      * SVK04 = ' '
     C                   eval      svk04 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK005 = ITCOYNO
     C                   eval      svk005 = wk0006
      * S04CNT = 005
     C                   eval      s04cnt = 005
      * ** Array forward read.
      * EXSUBR S04AFR
     C                   exsr      s04afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr006
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK04 = FST04
     C                   eval      svk04 = fst04
      * ** Array Backwards read.
      * EXSUBR S04ABR
     C                   exsr      s04abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK04 = LST04
     C                   eval      svk04 = lst04
      * ** Array Forward Read.
      * EXSUBR S04AFR
     C                   exsr      s04afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I04 = 1
     C                   eval      y3 = 1
      * DOW (I04<=C04)&(T04(I04)<>1)
 4b  C                   dow       y3 <= z3  and
     C                             t04(y3) <> 1
      * I04 = I04+1
     C                   eval      nrslt0 = y3 + 1
     C                   eval      y3=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I04<=C04)&(T04(I04)=1)
 4b  C                   if        y3 <= z3  and
     C                             t04(y3) = 1
      * F14001 = B02(I04)
     C                   eval      f14001 = b02(y3)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S007 -  List of stock analysis codes
      *****************************************************************
     C     s007          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST07 = ' '
     C                   eval      fst07 = *blanks
      * LST07 = ' '
     C                   eval      lst07 = *blanks
      * SVK07 = ' '
     C                   eval      svk07 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK011 = ITCOYNO
     C                   eval      svk011 = wk0006
      * S07CNT = 005
     C                   eval      s07cnt = 005
      * ** Array forward read.
      * EXSUBR S07AFR
     C                   exsr      s07afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr007
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK07 = FST07
     C                   eval      svk07 = fst07
      * ** Array Backwards read.
      * EXSUBR S07ABR
     C                   exsr      s07abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK07 = LST07
     C                   eval      svk07 = lst07
      * ** Array Forward Read.
      * EXSUBR S07AFR
     C                   exsr      s07afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I07 = 1
     C                   eval      y4 = 1
      * DOW (I07<=C07)&(T14(I07)<>1)
 4b  C                   dow       y4 <= z4  and
     C                             t14(y4) <> 1
      * I07 = I07+1
     C                   eval      nrslt0 = y4 + 1
     C                   eval      y4=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I07<=C07)&(T14(I07)=1)
 4b  C                   if        y4 <= z4  and
     C                             t14(y4) = 1
      * F14002 = B05(I07)
     C                   eval      f14002 = b05(y4)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S008 - List of Stock inventory groups
      *****************************************************************
     C     s008          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST08 = ' '
     C                   eval      fst08 = *blanks
      * LST08 = ' '
     C                   eval      lst08 = *blanks
      * SVK08 = ' '
     C                   eval      svk08 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK013 = ITCOYNO
     C                   eval      svk013 = wk0006
      * S08CNT = 005
     C                   eval      s08cnt = 005
      * ** Array forward read.
      * EXSUBR S08AFR
     C                   exsr      s08afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr008
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK08 = FST08
     C                   eval      svk08 = fst08
      * ** Array Backwards read.
      * EXSUBR S08ABR
     C                   exsr      s08abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK08 = LST08
     C                   eval      svk08 = lst08
      * ** Array Forward Read.
      * EXSUBR S08AFR
     C                   exsr      s08afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I08 = 1
     C                   eval      y5 = 1
      * DOW (I08<=C08)&(T17(I08)<>1)
 4b  C                   dow       y5 <= z5  and
     C                             t17(y5) <> 1
      * I08 = I08+1
     C                   eval      nrslt0 = y5 + 1
     C                   eval      y5=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I08<=C08)&(T17(I08)=1)
 4b  C                   if        y5 <= z5  and
     C                             t17(y5) = 1
      * F14003 = B06(I08)
     C                   eval      f14003 = b06(y5)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S009 -      List of stock groups
      *****************************************************************
     C     s009          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST09 = ' '
     C                   eval      fst09 = *blanks
      * LST09 = ' '
     C                   eval      lst09 = *blanks
      * SVK09 = ' '
     C                   eval      svk09 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK015 = ITCOYNO
     C                   eval      svk015 = wk0006
      * S09CNT = 005
     C                   eval      s09cnt = 005
      * ** Array forward read.
      * EXSUBR S09AFR
     C                   exsr      s09afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr009
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK09 = FST09
     C                   eval      svk09 = fst09
      * ** Array Backwards read.
      * EXSUBR S09ABR
     C                   exsr      s09abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK09 = LST09
     C                   eval      svk09 = lst09
      * ** Array Forward Read.
      * EXSUBR S09AFR
     C                   exsr      s09afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I09 = 1
     C                   eval      y6 = 1
      * DOW (I09<=C09)&(T20(I09)<>1)
 4b  C                   dow       y6 <= z6  and
     C                             t20(y6) <> 1
      * I09 = I09+1
     C                   eval      nrslt0 = y6 + 1
     C                   eval      y6=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I09<=C09)&(T20(I09)=1)
 4b  C                   if        y6 <= z6  and
     C                             t20(y6) = 1
      * F02002 = B07(I09)
     C                   eval      f02002 = b07(y6)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S010 -   List of stock value groups
      *****************************************************************
     C     s010          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST10 = ' '
     C                   eval      fst10 = *blanks
      * LST10 = ' '
     C                   eval      lst10 = *blanks
      * SVK10 = ' '
     C                   eval      svk10 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK017 = ITCOYNO
     C                   eval      svk017 = wk0006
      * S10CNT = 005
     C                   eval      s10cnt = 005
      * ** Array forward read.
      * EXSUBR S10AFR
     C                   exsr      s10afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr010
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK10 = FST10
     C                   eval      svk10 = fst10
      * ** Array Backwards read.
      * EXSUBR S10ABR
     C                   exsr      s10abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK10 = LST10
     C                   eval      svk10 = lst10
      * ** Array Forward Read.
      * EXSUBR S10AFR
     C                   exsr      s10afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I10 = 1
     C                   eval      y7 = 1
      * DOW (I10<=C10)&(T23(I10)<>1)
 4b  C                   dow       y7 <= z7  and
     C                             t23(y7) <> 1
      * I10 = I10+1
     C                   eval      nrslt0 = y7 + 1
     C                   eval      y7=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I10<=C10)&(T23(I10)=1)
 4b  C                   if        y7 <= z7  and
     C                             t23(y7) = 1
      * F14004 = B08(I10)
     C                   eval      f14004 = b08(y7)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S011 -    List of Units of Measure
      *****************************************************************
     C     s011          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST11 = ' '
     C                   eval      fst11 = *blanks
      * LST11 = ' '
     C                   eval      lst11 = *blanks
      * SVK11 = ' '
     C                   eval      svk11 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK019 = ITCOYNO
     C                   eval      svk019 = wk0006
      * S11CNT = 005
     C                   eval      s11cnt = 005
      * ** Array forward read.
      * EXSUBR S11AFR
     C                   exsr      s11afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr011
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK11 = FST11
     C                   eval      svk11 = fst11
      * ** Array Backwards read.
      * EXSUBR S11ABR
     C                   exsr      s11abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK11 = LST11
     C                   eval      svk11 = lst11
      * ** Array Forward Read.
      * EXSUBR S11AFR
     C                   exsr      s11afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I11 = 1
     C                   eval      y8 = 1
      * DOW (I11<=C11)&(T26(I11)<>1)
 4b  C                   dow       y8 <= z8  and
     C                             t26(y8) <> 1
      * I11 = I11+1
     C                   eval      nrslt0 = y8 + 1
     C                   eval      y8=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I11<=C11)&(T26(I11)=1)
 4b  C                   if        y8 <= z8  and
     C                             t26(y8) = 1
      * F02003 = B09(I11)
     C                   eval      f02003 = b09(y8)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S012 -        List of Tax codes
      *****************************************************************
     C     s012          begsr
      *
     C                   eval      dspws = 'Y'                                  -dsply- replaced
     C                   eval      *in01 = *off
     C                   eval      *in02 = *off
     C                   eval      *in03 = *off
     C                   eval      *in04 = *off
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
     C                   eval      *in08 = *off
     C                   eval      *in09 = *off
     C                   eval      *in10 = *off
     C                   eval      *in80 = *on
      * FST12 = ' '
     C                   eval      fst12 = *blanks
      * LST12 = ' '
     C                   eval      lst12 = *blanks
      * SVK12 = ' '
     C                   eval      svk12 = *blanks
      * ** set prompt file keys to values
      * ** from header file.
      * SVK021 = ITCOYNO
     C                   eval      svk021 = wk0006
      * S12CNT = 005
     C                   eval      s12cnt = 005
      * ** Array forward read.
      * EXSUBR S12AFR
     C                   exsr      s12afr
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
 1b  C                   dow       dspws = 'Y'                                  -dsply- replaced
      *
     C                   eval      *in79 = *on
     C                   eval      *in99 = *off
      * Write sub-file messages
 2b  C                   if        msgflg = 'Y'
     C                   eval      *in99 = *on
     C                   write     msgctl
 2e  C                   endif
     C                   exfmt     scr012
     C                   eval      *in80 = *on
     C                   eval      cmdkey = 'N'
      *
      * Clear Message Subfile.
 2b  C                   if        msgflg = 'Y'
     C                   eval      msgact = 'C'
     C                   exsr      smsg
     C                   write     msgctl
 2e  C                   endif
      *
      * Cancel
      *
 2b  C                   if        *inkl  and
     C                             cmdkey = 'N'
      * EXTSCR                                                        *
 LV  C                   leavesr
     C                   eval      cmdkey = 'Y'
 2e  C                   endif
 2b  C                   if        cmdkey = 'N'
      *
      * Bkwd
      *
 3b  C                   if        *in62  and
     C                             cmdkey = 'N'
      * SVK12 = FST12
     C                   eval      svk12 = fst12
      * ** Array Backwards read.
      * EXSUBR S12ABR
     C                   exsr      s12abr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
      *
      * Fwd
      *
 3b  C                   if        *in61  and
     C                             cmdkey = 'N'
      * SVK12 = LST12
     C                   eval      svk12 = lst12
      * ** Array Forward Read.
      * EXSUBR S12AFR
     C                   exsr      s12afr
 4b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 4e  C                   endif
     C                   eval      cmdkey = 'Y'
 3e  C                   endif
 3b  C                   if        cmdkey = 'N'
      * ** Check for any selected records.
      *    1. Check each array element that
      *       was loaded in load routine.
      * I12 = 1
     C                   eval      y9 = 1
      * DOW (I12<=C12)&(T29(I12)<>1)
 4b  C                   dow       y9 <= z9  and
     C                             t29(y9) <> 1
      * I12 = I12+1
     C                   eval      nrslt0 = y9 + 1
     C                   eval      y9=%int(nrslt0)                              Check fld overflow 1
      * END                                                           *
 4e  C                   enddo
      *                                                               *
      * ** If value was found, fill prompt work
      * ** field, get screen values, and return.
      * IF (I12<=C12)&(T29(I12)=1)
 4b  C                   if        y9 <= z9  and
     C                             t29(y9) = 1
      * F02004 = B10(I12)
     C                   eval      f02004 = b10(y9)
      * EXTSCR                                                        *
 LV  C                   leavesr
      * END                                                           *
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SREDSP -  Redisplay Windows within stack.
      *****************************************************************
     C     sredsp        begsr
      *
     C                   eval      ct = sp
 1b  C                   dow       ct > 1  and
     C                             sty(ct) <> 'F'
     C                   eval      ct = ct - 1
 1e  C                   enddo
      *
      *  Redisplay Windows within stack.
      *
 1b  C                   dow       ct <= sp  and
     C                             ct > 0
      *
 2b  C                   if        sid(ct) = 'SCALPH'
     C                   eval      indicators = in01
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr001
     C                   write     scr001c1
 2x  C                   else
 3b  C                   if        sid(ct) = 'SC0001'
     C                   eval      indicators = in02
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr002
     C                   write     scr002c1
 3x  C                   else
 4b  C                   if        sid(ct) = 'SC0002'
     C                   eval      indicators = in03
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr003
 4x  C                   else
 5b  C                   if        sid(ct) = 'SUP014'
     C                   eval      indicators = in04
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr004
 5x  C                   else
 6b  C                   if        sid(ct) = 'SC0003'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr005
 6x  C                   else
 7b  C                   if        sid(ct) = 'SC0004'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr006
 7x  C                   else
 8b  C                   if        sid(ct) = 'SC0007'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr007
 8x  C                   else
 9b  C                   if        sid(ct) = 'SC0008'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr008
 9x  C                   else
 10b C                   if        sid(ct) = 'SC0009'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr009
 10x C                   else
 11b C                   if        sid(ct) = 'SC0010'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr010
 11x C                   else
 12b C                   if        sid(ct) = 'SC0011'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr011
 12x C                   else
 13b C                   if        sid(ct) = 'SC0012'
     C                   eval      *in79 = *on
     C                   eval      *in99 = *on
     C                   write     scr012
 13e C                   endif
 12e C                   endif
 11e C                   endif
 10e C                   endif
 9e  C                   endif
 8e  C                   endif
 7e  C                   endif
 6e  C                   endif
 5e  C                   endif
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
      *
     C                   eval      ct = ct + 1
 1e  C                   enddo
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SYSDAT - System Date
      *****************************************************************
     C     sysdat        begsr
      *
      * ##YEAR = %LJF(*YMD)
      *  Left Justify field into result field
     C                   eval      x1date = xymd
     C                   eval      ##year = x34
      * IF ##YEAR > 39
 1b  C                   if        ##year > 39
      * ##DATE = 19000000 + *YMD
     C                   eval      nrslt0 = 19000000 + xymd
     C                   eval      ##date=%int(nrslt0)                          Check fld overflow 1
      * ELSE                                                          *
 1x  C                   else
      * ##DATE = 20000000 + *YMD
     C                   eval      nrslt0 = 20000000 + xymd
     C                   eval      ##date=%int(nrslt0)                          Check fld overflow 1
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S01BKW - SCRN SUB
      *****************************************************************
     C     s01bkw        begsr
      *
      * ***  Scroll information backward
      *                                                               *
      * C01 = 0
     C                   eval      z1 = *zeros
      * ** Clear hidden key arrays used for record
      * ** retrieval.
      * A001 = ' '
     C                   clear                   a01
     C                   clear                   a02
     C                   eval      #pr = 'X'
     C                   eval      #nd = 'X'
     C                   eval      fldnam = 'FL0001  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0001  '
     C                   exsr      satrib
      * GETBLK D.ITMMAST,F.ITMMAST,*pv,prcoyno
      *
     C                   exsr      s036
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = 12
      *          ---------------------------------------------------------------
      *          | Initialize subfile    SCR002S1
      *          ---------------------------------------------------------------
     C                   eval      *in63 = *off
     C                   eval      *in64 = *off
     C                   eval      *in65 = *off
     C                   eval      *in66 = *off
     C                   write     scr002c1                                     CLEAR SUBFILE
     C                   eval      rrn02 = 0
      *
     C                   eval      xrn02 = 1
     C                   eval      srn02 = xrn02
     C                   eval      *in63 = *on
     C                   eval      *in64 = *on
     C                   eval      *in65 = *on
     C                   eval      *in66 = *off
     C                   eval      ins02 = indicators
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd04 <> 'Y'  or                            RD.SW.ITMMAST   ITMC
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      fl0001 = *zeros
     C                   eval      xtitem = *blanks
     C                   eval      wk0007 = *blanks
     C                   eval      wk0005 = *blanks
     C                   eval      wfile# = 4
     C     k0021         reade(en) itmmast                                      Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
     C                   eval      hd0004 = *blanks
     C                   eval      htitem = *blanks
 2x  C                   else
     C                   eval      swrd04 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd04 = 'Y'                                 RD.SW.ITMMAST   ITMC
     C                   exsr      smvtow                                       MOVE FLD TO WORK
      *
      * FLDATR fl0001,*ds
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'FL0001  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0001  '
     C                   exsr      satrib
      * C01 = C01+1
     C                   eval      nrslt0 = z1 + 1
     C                   eval      z1=%int(nrslt0)                              Check fld overflow 1
      * ** Save key values in key arrays.
      * A001(C01) = ITCOYNO
     C                   eval      a01(z1) = *blanks
     C                   eval      a01(z1) = wk0006
      * A002(C01) = ITITEM
     C                   eval      a02(z1) = *blanks
     C                   eval      a02(z1) = xtitem
      * ENDBLK                                                        *
 3b  C                   if        swexbl = *zero  and
     C                             swskpr = *zero
     C                   eval      wcntr = wcntr + 1
     C                   eval      wrrn01 = wcntr
     C                   eval      insav1 = indicators
     C                   eval      rrn02 = rrn02 + 1
     C                   write     scr002s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn02 = xrn02 + 1
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   eval      nxtrrn = rrn02
     C                   eval      fl0001 = *zeros
     C                   eval      xtitem = *blanks
     C                   eval      wk0007 = *blanks
     C                   eval      wk0005 = *blanks
     C                   eval      indicators = ins02
     C                   eval      *in65 = *off
     C                   eval      insav1 = indicators
     C                   eval      wgetr = wcntr
 1b  C                   dow       wgetr < wlcntr
     C                   eval      rrn02 = rrn02 + 1
     C                   write     scr002s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn02 = xrn02 + 1
     C                   eval      wgetr = wgetr + 1
 1e  C                   enddo
 1b  C                   if        nxtrrn > 0
     C     nxtrrn        chain(e)  scr002s1                                     Hi90Lo   Repl 4 bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   update    scr002s1                                     Lo90 Repl 4 bif
     C                   eval      indicators = ins02
 1e  C                   endif
 1b  C                   if        rrn02 > srn02
     C                   eval      rrn02 = srn02
 1e  C                   endif
     C                   exsr      s038                                         CHK EOF
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S500 - SCRN SUB
      *****************************************************************
     C     s500          begsr
      *
      * ***  Scroll information backward
      *                                                               *
      * C01 = 0
     C                   eval      z1 = *zeros
      * ** Clear hidden key arrays used for record
      * ** retrieval.
      * A001 = ' '
     C                   clear                   a01
     C                   clear                   a02
     C                   eval      #pr = 'X'
     C                   eval      #nd = 'X'
     C                   eval      fldnam = 'FL0002  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SCALPH  '
     C                   exsr      satrib
      * GETBLK D.ITMMAST1,F.ITMMAST1,*pv,prcoyno
      *
     C                   exsr      s039
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = 12
      *          ---------------------------------------------------------------
      *          | Initialize subfile    SCR001S1
      *          ---------------------------------------------------------------
     C                   eval      *in63 = *off
     C                   eval      *in64 = *off
     C                   eval      *in65 = *off
     C                   eval      *in66 = *off
     C                   write     scr001c1                                     CLEAR SUBFILE
     C                   eval      rrn01 = 0
      *
     C                   eval      xrn01 = 1
     C                   eval      srn01 = xrn01
     C                   eval      *in63 = *on
     C                   eval      *in64 = *on
     C                   eval      *in65 = *on
     C                   eval      *in66 = *off
     C                   eval      ins01 = indicators
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd01 <> 'Y'  or                            RD.SW.ITMMAST1
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      fl0002 = *zeros
     C                   eval      wk0008 = *blanks
     C                   eval      wk0010 = *blanks
     C                   eval      wk0011 = *blanks
     C                   eval      wfile# = 1
     C     k0021         reade(e)  itmmast1                                     Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
 2b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd01 = 'N'
     C                   eval      hrc01 = *zeros
     C                   eval      hd0006 = *blanks
     C                   eval      hd0005 = *blanks
     C                   eval      hd0007 = *blanks
 2x  C                   else
     C                   eval      swrd01 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd01 = 'Y'                                 RD.SW.ITMMAST1
     C                   exsr      smvtow                                       MOVE FLD TO WORK
      *
      * FLDATR fl0002,*ds
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'FL0002  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SCALPH  '
     C                   exsr      satrib
      * C01 = C01+1
     C                   eval      nrslt0 = z1 + 1
     C                   eval      z1=%int(nrslt0)                              Check fld overflow 1
      * ** Save key values in key arrays.
      * A001(C01) = :237
     C                   eval      a01(z1) = *blanks
     C                   eval      a01(z1) = wk0009
      * A002(C01) = :238
     C                   eval      a02(z1) = *blanks
     C                   eval      a02(z1) = wk0011
      * ENDBLK                                                        *
 3b  C                   if        swexbl = *zero  and
     C                             swskpr = *zero
     C                   eval      wcntr = wcntr + 1
     C                   eval      wrrn02 = wcntr
     C                   eval      insav1 = indicators
     C                   eval      rrn01 = rrn01 + 1
     C                   write     scr001s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn01 = xrn01 + 1
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   eval      nxtrrn = rrn01
     C                   eval      fl0002 = *zeros
     C                   eval      wk0008 = *blanks
     C                   eval      wk0010 = *blanks
     C                   eval      wk0011 = *blanks
     C                   eval      indicators = ins01
     C                   eval      *in65 = *off
     C                   eval      insav1 = indicators
     C                   eval      wgetr = wcntr
 1b  C                   dow       wgetr < wlcntr
     C                   eval      rrn01 = rrn01 + 1
     C                   write     scr001s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn01 = xrn01 + 1
     C                   eval      wgetr = wgetr + 1
 1e  C                   enddo
 1b  C                   if        nxtrrn > 0
     C     nxtrrn        chain(e)  scr001s1                                     Hi90Lo   Repl 4 bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   update    scr001s1                                     Lo90 Repl 4 bif
     C                   eval      indicators = ins01
 1e  C                   endif
 1b  C                   if        rrn01 > srn01
     C                   eval      rrn01 = srn01
 1e  C                   endif
     C                   exsr      s041                                         CHK EOF
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S01EDT - SCRN SUB
      *****************************************************************
     C     s01edt        begsr
      *
      * ** Process Maintenance on Detail Panel (MB)
      * **   1. Check for any selected records, If record
      * **      selected, display detail panel.
      * UPDFLG = 0
     C                   eval      updflg = *zeros
      * I01 = 0
     C                   eval      y1 = *zeros
      * DOBLK D.ITMMAST
      *
     C                   eval      srn02 = rrn02
     C                   eval      rrn02 = 1
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
     C                   eval      ins02 = indicators
 1b  C                   if        srn02 >= 1
 2b  C                   dou       *in90  or
     C                             *in91  or
     C                             swexbl <> *zero
     C                   readc(e)  scr002s1                                     Lo91Eq90 Repl 4 bif
 3b  C                   if        %eof
     C                   eval      *in90 = *on
 3e  C                   endif
 3b  C                   if        %error
     C                   eval      *in91 = *on
 3e  C                   endif
 3b  C                   if        not %eof and                                 Chg Ind 90 to bif
     C                             not %error                                   Chg Ind 91 to bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
      * I01 = I01+1
     C                   eval      nrslt0 = y1 + 1
     C                   eval      y1=%int(nrslt0)                              Check fld overflow 1
      *                                                               *
      * ** display detail screen
      * IF (FL0001=2)|(FL0001=4)|(FL0001=5)
 4b  C                   if        fl0001 = 2  or
     C                             fl0001 = 4  or
     C                             fl0001 = 5
      * MODE = FL0001
     C                   eval      mode = fl0001
      * ** set keys from hidden key arrays.
      * ITCOYNO = A001(I01)
     C                   eval      wk0006 = a01(y1)
      * ITITEM = A002(I01)
     C                   eval      xtitem = *blanks
     C                   eval      xtitem = a02(y1)
      * ** Get record and any secondary records.
      * GETREC D.ITMMAST,F.ITMMAST,*eq,itcoyno,ititem
      *
     C                   exsr      s042
      * ** Display Screen.
      * EXSCR SC0002
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SC0001  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in02 = indicators
     C                   update    scr002s1                                     Lo90 Repl 4 bif
     C                   exsr      s003
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 5b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 5e  C                   endif
     C     rrn02         chain(e)  scr002s1                                     Hi90Lo91 Repl 4 bif
     C                   eval      indicators = in02
     C                   eval      *in79 = *on
      * FL0001 = 0
     C                   eval      fl0001 = *zeros
      * UPDFLG = 1
     C                   eval      updflg = 1
      * END                                                           *
 4e  C                   endif
      *                                                               *
      * ** If the action choice is not
      * ** one of the allowed values,
      * ** display error message.
      * IF (FL0001<>0)&(UPDFLG=0)
 4b  C                   if        fl0001 <> *zero  and
     C                             updflg = *zero
      * DSPERR FL0001,'Invalid action choice'
     C                   eval      msgdta = c0005
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
     C                   eval      dsperr = 'X'
     C                   eval      fldnam = 'FL0001  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0001  '
     C                   exsr      satrib
      * END                                                           *
 4e  C                   endif
      * END                                                           *
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
     C                   eval      insav1 = indicators
     C                   update    scr002s1                                     Lo90 Repl 4 bif
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
 3e  C                   endif
 2e  C                   enddo
     C                   eval      swexbl = *zeros
 1e  C                   endif
      *
     C                   eval      rrn02 = srn02
     C                   eval      indicators = ins02
      *
      *
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S501 - SCRN SUB
      *****************************************************************
     C     s501          begsr
      *
      * ** Process Maintenance on Detail Panel (MB)
      * **   1. Check for any selected records, If record
      * **      selected, display detail panel.
      * UPDFLG = 0
     C                   eval      updflg = *zeros
      * I01 = 0
     C                   eval      y1 = *zeros
      * DOBLK D.ITMMAST1
      *
     C                   eval      srn01 = rrn01
     C                   eval      rrn01 = 1
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
     C                   eval      ins01 = indicators
 1b  C                   if        srn01 >= 1
 2b  C                   dou       *in90  or
     C                             *in91  or
     C                             swexbl <> *zero
     C                   readc(e)  scr001s1                                     Lo91Eq90 Repl 4 bif
 3b  C                   if        %eof
     C                   eval      *in90 = *on
 3e  C                   endif
 3b  C                   if        %error
     C                   eval      *in91 = *on
 3e  C                   endif
 3b  C                   if        not %eof and                                 Chg Ind 90 to bif
     C                             not %error                                   Chg Ind 91 to bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
      * I01 = I01+1
     C                   eval      nrslt0 = y1 + 1
     C                   eval      y1=%int(nrslt0)                              Check fld overflow 1
      *                                                               *
      * ** display detail screen
      * IF (FL0002=2)|(FL0002=4)|(FL0002=5)
 4b  C                   if        fl0002 = 2  or
     C                             fl0002 = 4  or
     C                             fl0002 = 5
      * MODE = FL0002
     C                   eval      mode = fl0002
      * ** set keys from hidden key arrays.
      * ITCOYNO = A001(I01)
     C                   eval      wk0006 = a01(y1)
      * ITITEM = A002(I01)
     C                   eval      xtitem = *blanks
     C                   eval      xtitem = a02(y1)
      * ** Get record and any secondary records.
      * GETREC D.ITMMAST,F.ITMMAST,*eq,PRCOYNO,ititem
      *
     C                   exsr      s043
      * ** Display Screen.
      * EXSCR SC0002
     C                   eval      sp = sp + 1
     C                   eval      sid(sp) = 'SCALPH  '
     C                   eval      sty(sp) = 'F'
     C                   eval      in01 = indicators
     C                   update    scr001s1                                     Lo90 Repl 4 bif
     C                   exsr      s003
     C                   eval      sid(sp) = *blanks
     C                   eval      sty(sp) = *blanks
     C                   eval      sp = sp - 1
 5b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 5e  C                   endif
     C     rrn01         chain(e)  scr001s1                                     Hi90Lo91 Repl 4 bif
     C                   eval      indicators = in01
     C                   eval      *in79 = *on
      * FL0002 = 0
     C                   eval      fl0002 = *zeros
      * UPDFLG = 1
     C                   eval      updflg = 1
      * END                                                           *
 4e  C                   endif
      *                                                               *
      * ** If the action choice is not
      * ** one of the allowed values,
      * ** display error message.
      * IF (FL0002<>0)&(UPDFLG=0)
 4b  C                   if        fl0002 <> *zero  and
     C                             updflg = *zero
      * DSPERR FL0002,'Invalid action choice'
     C                   eval      msgdta = c0005
     C                   eval      msgid = 'CPF9898'
     C                   eval      msgact = 'A'
     C                   exsr      smsg
     C                   eval      dsperr = 'X'
     C                   eval      fldnam = 'FL0002  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SCALPH  '
     C                   exsr      satrib
      * END                                                           *
 4e  C                   endif
      * END                                                           *
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
     C                   eval      insav1 = indicators
     C                   update    scr001s1                                     Lo90 Repl 4 bif
     C                   eval      *in01 = *off
     C                   eval      *in03 = *on
     C                   eval      *in05 = *off
     C                   eval      *in06 = *off
     C                   eval      *in07 = *off
 3e  C                   endif
 2e  C                   enddo
     C                   eval      swexbl = *zeros
 1e  C                   endif
      *
     C                   eval      rrn01 = srn01
     C                   eval      indicators = ins01
      *
      *
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S01FWD - SCRN SUB
      *****************************************************************
     C     s01fwd        begsr
      *
      * *** Scroll information forward
      *                                                               *
      * C01 = 0
     C                   eval      z1 = *zeros
      * ** Clear Hidden key arrays used for later
      * ** record retrieval.
      * A001 = ' '
     C                   clear                   a01
     C                   clear                   a02
     C                   eval      #pr = 'X'
     C                   eval      #nd = 'X'
     C                   eval      fldnam = 'FL0001  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0001  '
     C                   exsr      satrib
      * GETBLK D.ITMMAST,F.ITMMAST,*ne,prcoyno
      *
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = 12
      *          ---------------------------------------------------------------
      *          | Initialize subfile    SCR002S1
      *          ---------------------------------------------------------------
     C                   eval      *in63 = *off
     C                   eval      *in64 = *off
     C                   eval      *in65 = *off
     C                   eval      *in66 = *off
     C                   write     scr002c1                                     CLEAR SUBFILE
     C                   eval      rrn02 = 0
      *
     C                   eval      xrn02 = 1
     C                   eval      srn02 = xrn02
     C                   eval      *in63 = *on
     C                   eval      *in64 = *on
     C                   eval      *in65 = *on
     C                   eval      *in66 = *off
     C                   eval      ins02 = indicators
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd04 <> 'Y'  or                            RD.SW.ITMMAST   ITMC
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      fl0001 = *zeros
     C                   eval      xtitem = *blanks
     C                   eval      wk0007 = *blanks
     C                   eval      wk0005 = *blanks
     C                   eval      wfile# = 4
     C     k0021         reade(en) itmmast                                      Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
     C                   eval      hd0004 = *blanks
     C                   eval      htitem = *blanks
 2x  C                   else
     C                   eval      swrd04 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd04 = 'Y'                                 RD.SW.ITMMAST   ITMC
     C                   exsr      smvtow                                       MOVE FLD TO WORK
      * FLDATR FL0001,*ds
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'FL0001  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0001  '
     C                   exsr      satrib
      * C01 = C01+1
     C                   eval      nrslt0 = z1 + 1
     C                   eval      z1=%int(nrslt0)                              Check fld overflow 1
      * ** Save key information in key arrays.
      * A001(C01) = ITCOYNO
     C                   eval      a01(z1) = *blanks
     C                   eval      a01(z1) = wk0006
      * A002(C01) = ITITEM
     C                   eval      a02(z1) = *blanks
     C                   eval      a02(z1) = xtitem
      * ENDBLK                                                        *
 3b  C                   if        swexbl = *zero  and
     C                             swskpr = *zero
     C                   eval      wcntr = wcntr + 1
     C                   eval      wrrn01 = wcntr
     C                   eval      insav1 = indicators
     C                   eval      rrn02 = rrn02 + 1
     C                   write     scr002s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn02 = xrn02 + 1
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   eval      nxtrrn = rrn02
     C                   eval      fl0001 = *zeros
     C                   eval      xtitem = *blanks
     C                   eval      wk0007 = *blanks
     C                   eval      wk0005 = *blanks
     C                   eval      indicators = ins02
     C                   eval      *in65 = *off
     C                   eval      insav1 = indicators
     C                   eval      wgetr = wcntr
 1b  C                   dow       wgetr < wlcntr
     C                   eval      rrn02 = rrn02 + 1
     C                   write     scr002s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn02 = xrn02 + 1
     C                   eval      wgetr = wgetr + 1
 1e  C                   enddo
 1b  C                   if        nxtrrn > 0
     C     nxtrrn        chain(e)  scr002s1                                     Hi90Lo   Repl 4 bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   update    scr002s1                                     Lo90 Repl 4 bif
     C                   eval      indicators = ins02
 1e  C                   endif
 1b  C                   if        rrn02 > srn02
     C                   eval      rrn02 = srn02
 1e  C                   endif
     C                   exsr      s038                                         RESET FP
      * IF c01 = 0
 1b  C                   if        z1 = *zero
      * EXSUBR s01bkw
     C                   exsr      s01bkw
 2b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 2e  C                   endif
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S502 - SCRN SUB
      *****************************************************************
     C     s502          begsr
      *
      * *** Scroll information forward
      *                                                               *
      * C01 = 0
     C                   eval      z1 = *zeros
      * ** Clear Hidden key arrays used for later
      * ** record retrieval.
      * A001 = ' '
     C                   clear                   a01
     C                   clear                   a02
     C                   eval      #pr = 'X'
     C                   eval      #nd = 'X'
     C                   eval      fldnam = 'FL0002  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SCALPH  '
     C                   exsr      satrib
      * GETBLK D.ITMMAST1,F.ITMMAST1,*ne,prcoyno
      *
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = 12
      *          ---------------------------------------------------------------
      *          | Initialize subfile    SCR001S1
      *          ---------------------------------------------------------------
     C                   eval      *in63 = *off
     C                   eval      *in64 = *off
     C                   eval      *in65 = *off
     C                   eval      *in66 = *off
     C                   write     scr001c1                                     CLEAR SUBFILE
     C                   eval      rrn01 = 0
      *
     C                   eval      xrn01 = 1
     C                   eval      srn01 = xrn01
     C                   eval      *in63 = *on
     C                   eval      *in64 = *on
     C                   eval      *in65 = *on
     C                   eval      *in66 = *off
     C                   eval      ins01 = indicators
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd01 <> 'Y'  or                            RD.SW.ITMMAST1
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      fl0002 = *zeros
     C                   eval      wk0008 = *blanks
     C                   eval      wk0010 = *blanks
     C                   eval      wk0011 = *blanks
     C                   eval      wfile# = 1
     C     k0021         reade(e)  itmmast1                                     Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
 2b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd01 = 'N'
     C                   eval      hrc01 = *zeros
     C                   eval      hd0006 = *blanks
     C                   eval      hd0005 = *blanks
     C                   eval      hd0007 = *blanks
 2x  C                   else
     C                   eval      swrd01 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd01 = 'Y'                                 RD.SW.ITMMAST1
     C                   exsr      smvtow                                       MOVE FLD TO WORK
      * FLDATR FL0002,*ds
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'FL0002  '
     C                   eval      fldinx = *zeros
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SCALPH  '
     C                   exsr      satrib
      * C01 = C01+1
     C                   eval      nrslt0 = z1 + 1
     C                   eval      z1=%int(nrslt0)                              Check fld overflow 1
      * ** Save key information in key arrays.
      * A001(C01) = :237
     C                   eval      a01(z1) = *blanks
     C                   eval      a01(z1) = wk0009
      * A002(C01) = :238
     C                   eval      a02(z1) = *blanks
     C                   eval      a02(z1) = wk0011
      * ENDBLK                                                        *
 3b  C                   if        swexbl = *zero  and
     C                             swskpr = *zero
     C                   eval      wcntr = wcntr + 1
     C                   eval      wrrn02 = wcntr
     C                   eval      insav1 = indicators
     C                   eval      rrn01 = rrn01 + 1
     C                   write     scr001s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn01 = xrn01 + 1
 3e  C                   endif
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   eval      nxtrrn = rrn01
     C                   eval      fl0002 = *zeros
     C                   eval      wk0008 = *blanks
     C                   eval      wk0010 = *blanks
     C                   eval      wk0011 = *blanks
     C                   eval      indicators = ins01
     C                   eval      *in65 = *off
     C                   eval      insav1 = indicators
     C                   eval      wgetr = wcntr
 1b  C                   dow       wgetr < wlcntr
     C                   eval      rrn01 = rrn01 + 1
     C                   write     scr001s1                                     Lo90Eq   Repl 4 bif
     C                   eval      xrn01 = xrn01 + 1
     C                   eval      wgetr = wgetr + 1
 1e  C                   enddo
 1b  C                   if        nxtrrn > 0
     C     nxtrrn        chain(e)  scr001s1                                     Hi90Lo   Repl 4 bif
     C                   eval      indicators = insav1
     C                   eval      *in65 = *on
     C                   update    scr001s1                                     Lo90 Repl 4 bif
     C                   eval      indicators = ins01
 1e  C                   endif
 1b  C                   if        rrn01 > srn01
     C                   eval      rrn01 = srn01
 1e  C                   endif
     C                   exsr      s041                                         RESET FP
      * IF c01 = 0
 1b  C                   if        z1 = *zero
      * EXSUBR s01bkw
     C                   exsr      s500
 2b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 2e  C                   endif
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S03ABR - SCRN SUB
      *****************************************************************
     C     s03abr        begsr
      *
      * ** Array backwards read.
      * C03 = 0
     C                   eval      z2 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.ITMCLAS,SVK003,SVK03
      *
     C                   exsr      s044
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.ITMCLAS,*PV,SVK003
      *
     C                   exsr      s045
      * DOW (C03<S03CNT)&%STS(D.ITMMAST,F.ITMCLAS)=*YES
 1b  C                   if        z2 < s03cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts05 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C03 = C03+1
     C                   eval      rn0041 = z2 + 1
     C                   eval      z2=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.ITMCLAS,*PV,SVK003
      *
     C                   exsr      s045
      * END                                                           *
 2b  C                   if        z2 < s03cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts05 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S03ALD
     C                   exsr      s03ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S03AFR - SCRN SUB
      *****************************************************************
     C     s03afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.ITMCLAS,SVK003,SVK03
      *
     C                   exsr      s044
      * ** Load arrays from this point.
      * EXSUBR S03ALD
     C                   exsr      s03ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S03ALD - SCRN SUB
      *****************************************************************
     C     s03ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T01 = 0
     C                   eval      t01 = *zeros
      * B01 = ' '
     C                   clear                   b01
     C                   clear                   t02
     C                   clear                   t03
     C                   eval      z2 = *zeros
      * ** protect select field
      * DOW C03<S03CNT
 1b  C                   dow       z2 < s03cnt
      * C03 = C03+1
     C                   eval      nrslt0 = z2 + 1
     C                   eval      z2=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T01(C03),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T01     '
     C                   eval      fldinx = z2
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0003  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C03 = 0
     C                   eval      z2 = *zeros
      * GETREC D.ITMMAST,F.ITMCLAS,*NE,SVK003
      *
     C                   exsr      s047
      * DOW (C03<S03CNT)&%STS(D.ITMMAST,F.ITMCLAS)=*YES
 1b  C                   if        z2 < s03cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts05 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C03 = C03+1
     C                   eval      rn0041 = z2 + 1
     C                   eval      z2=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T01(C03),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T01     '
     C                   eval      fldinx = z2
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0003  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B01(C03) = ITMMAST.ITMCLAS.ICCLAS
     C                   eval      b01(z2) = *blanks
     C                   eval      b01(z2) = wcclas
      * ** load screen array.
      * T02(C03) = ITMMAST.ITMCLAS.ICCLAS
     C                   eval      t02(z2) = *blanks
     C                   eval      t02(z2) = wcclas
      * T03(C03) = ITMMAST.ITMCLAS.ICDESC
     C                   eval      t03(z2) = *blanks
     C                   eval      t03(z2) = xcdesc
      * ** Save first record on screen.
      * IF C03=1
 2b  C                   if        z2 = 1
      * FST03 = B01(C03)
     C                   eval      fst03 = b01(z2)
      * END                                                           *
 2e  C                   endif
      * IF C03<S03CNT
 2b  C                   if        z2 < s03cnt
      * GETREC D.ITMMAST,F.ITMCLAS,*NE,SVK003
      *
     C                   exsr      s047
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z2 < s03cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts05 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C03>0
 1b  C                   if        z2 > *zero
      * LST03 = B01(C03)
     C                   eval      lst03 = b01(z2)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S04ABR - SCRN SUB
      *****************************************************************
     C     s04abr        begsr
      *
      * ** Array backwards read.
      * C04 = 0
     C                   eval      z3 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.ITMTYP,SVK005,SVK04
      *
     C                   exsr      s049
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.ITMTYP,*PV,SVK005
      *
     C                   exsr      s050
      * DOW (C04<S04CNT)&%STS(D.ITMMAST,F.ITMTYP)=*YES
 1b  C                   if        z3 < s04cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts08 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C04 = C04+1
     C                   eval      rn0041 = z3 + 1
     C                   eval      z3=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.ITMTYP,*PV,SVK005
      *
     C                   exsr      s050
      * END                                                           *
 2b  C                   if        z3 < s04cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts08 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S04ALD
     C                   exsr      s04ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S04AFR - SCRN SUB
      *****************************************************************
     C     s04afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.ITMTYP,SVK005,SVK04
      *
     C                   exsr      s049
      * ** Load arrays from this point.
      * EXSUBR S04ALD
     C                   exsr      s04ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S04ALD - SCRN SUB
      *****************************************************************
     C     s04ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T04 = 0
     C                   eval      t04 = *zeros
      * B02 = ' '
     C                   clear                   b02
     C                   clear                   t05
     C                   clear                   t06
     C                   eval      z3 = *zeros
      * ** protect select field
      * DOW C04<S04CNT
 1b  C                   dow       z3 < s04cnt
      * C04 = C04+1
     C                   eval      nrslt0 = z3 + 1
     C                   eval      z3=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T04(C04),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T04     '
     C                   eval      fldinx = z3
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0004  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C04 = 0
     C                   eval      z3 = *zeros
      * GETREC D.ITMMAST,F.ITMTYP,*NE,SVK005
      *
     C                   exsr      s052
      * DOW (C04<S04CNT)&%STS(D.ITMMAST,F.ITMTYP)=*YES
 1b  C                   if        z3 < s04cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts08 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C04 = C04+1
     C                   eval      rn0041 = z3 + 1
     C                   eval      z3=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T04(C04),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T04     '
     C                   eval      fldinx = z3
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0004  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B02(C04) = ITMMAST.ITMTYP.BAITYP
     C                   eval      b02(z3) = *blanks
     C                   eval      b02(z3) = waityp
      * ** load screen array.
      * T05(C04) = ITMMAST.ITMTYP.BAITYP
     C                   eval      t05(z3) = *blanks
     C                   eval      t05(z3) = waityp
      * T06(C04) = ITMMAST.ITMTYP.BADESC
     C                   eval      t06(z3) = *blanks
     C                   eval      t06(z3) = xadesc
      * ** Save first record on screen.
      * IF C04=1
 2b  C                   if        z3 = 1
      * FST04 = B02(C04)
     C                   eval      fst04 = b02(z3)
      * END                                                           *
 2e  C                   endif
      * IF C04<S04CNT
 2b  C                   if        z3 < s04cnt
      * GETREC D.ITMMAST,F.ITMTYP,*NE,SVK005
      *
     C                   exsr      s052
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z3 < s04cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts08 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C04>0
 1b  C                   if        z3 > *zero
      * LST04 = B02(C04)
     C                   eval      lst04 = b02(z3)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S07ABR - SCRN SUB
      *****************************************************************
     C     s07abr        begsr
      *
      * ** Array backwards read.
      * C07 = 0
     C                   eval      z4 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.STANYS,SVK011,SVK07
      *
     C                   exsr      s054
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.STANYS,*PV,SVK011
      *
     C                   exsr      s055
      * DOW (C07<S07CNT)&%STS(D.ITMMAST,F.STANYS)=*YES
 1b  C                   if        z4 < s07cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts09 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C07 = C07+1
     C                   eval      rn0041 = z4 + 1
     C                   eval      z4=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.STANYS,*PV,SVK011
      *
     C                   exsr      s055
      * END                                                           *
 2b  C                   if        z4 < s07cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts09 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S07ALD
     C                   exsr      s07ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S07AFR - SCRN SUB
      *****************************************************************
     C     s07afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.STANYS,SVK011,SVK07
      *
     C                   exsr      s054
      * ** Load arrays from this point.
      * EXSUBR S07ALD
     C                   exsr      s07ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S07ALD - SCRN SUB
      *****************************************************************
     C     s07ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T14 = 0
     C                   eval      t14 = *zeros
      * B05 = ' '
     C                   clear                   b05
     C                   clear                   t15
     C                   clear                   t16
     C                   eval      z4 = *zeros
      * ** protect select field
      * DOW C07<S07CNT
 1b  C                   dow       z4 < s07cnt
      * C07 = C07+1
     C                   eval      nrslt0 = z4 + 1
     C                   eval      z4=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T14(C07),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T14     '
     C                   eval      fldinx = z4
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0007  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C07 = 0
     C                   eval      z4 = *zeros
      * GETREC D.ITMMAST,F.STANYS,*NE,SVK011
      *
     C                   exsr      s057
      * DOW (C07<S07CNT)&%STS(D.ITMMAST,F.STANYS)=*YES
 1b  C                   if        z4 < s07cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts09 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C07 = C07+1
     C                   eval      rn0041 = z4 + 1
     C                   eval      z4=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T14(C07),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T14     '
     C                   eval      fldinx = z4
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0007  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B05(C07) = ITMMAST.STANYS.SASANL
     C                   eval      b05(z4) = *blanks
     C                   eval      b05(z4) = wasanl
      * ** load screen array.
      * T15(C07) = ITMMAST.STANYS.SASANL
     C                   eval      t15(z4) = *blanks
     C                   eval      t15(z4) = wasanl
      * T16(C07) = ITMMAST.STANYS.SADESC
     C                   eval      t16(z4) = *blanks
     C                   eval      t16(z4) = wk0014
      * ** Save first record on screen.
      * IF C07=1
 2b  C                   if        z4 = 1
      * FST07 = B05(C07)
     C                   eval      fst07 = b05(z4)
      * END                                                           *
 2e  C                   endif
      * IF C07<S07CNT
 2b  C                   if        z4 < s07cnt
      * GETREC D.ITMMAST,F.STANYS,*NE,SVK011
      *
     C                   exsr      s057
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z4 < s07cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts09 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C07>0
 1b  C                   if        z4 > *zero
      * LST07 = B05(C07)
     C                   eval      lst07 = b05(z4)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S08ABR - SCRN SUB
      *****************************************************************
     C     s08abr        begsr
      *
      * ** Array backwards read.
      * C08 = 0
     C                   eval      z5 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.STIGRP,SVK013,SVK08
      *
     C                   exsr      s059
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.STIGRP,*PV,SVK013
      *
     C                   exsr      s060
      * DOW (C08<S08CNT)&%STS(D.ITMMAST,F.STIGRP)=*YES
 1b  C                   if        z5 < s08cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts10 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C08 = C08+1
     C                   eval      rn0041 = z5 + 1
     C                   eval      z5=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.STIGRP,*PV,SVK013
      *
     C                   exsr      s060
      * END                                                           *
 2b  C                   if        z5 < s08cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts10 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S08ALD
     C                   exsr      s08ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S08AFR - SCRN SUB
      *****************************************************************
     C     s08afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.STIGRP,SVK013,SVK08
      *
     C                   exsr      s059
      * ** Load arrays from this point.
      * EXSUBR S08ALD
     C                   exsr      s08ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S08ALD - SCRN SUB
      *****************************************************************
     C     s08ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T17 = 0
     C                   eval      t17 = *zeros
      * B06 = ' '
     C                   clear                   b06
     C                   clear                   t18
     C                   clear                   t19
     C                   eval      z5 = *zeros
      * ** protect select field
      * DOW C08<S08CNT
 1b  C                   dow       z5 < s08cnt
      * C08 = C08+1
     C                   eval      nrslt0 = z5 + 1
     C                   eval      z5=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T17(C08),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T17     '
     C                   eval      fldinx = z5
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0008  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C08 = 0
     C                   eval      z5 = *zeros
      * GETREC D.ITMMAST,F.STIGRP,*NE,SVK013
      *
     C                   exsr      s062
      * DOW (C08<S08CNT)&%STS(D.ITMMAST,F.STIGRP)=*YES
 1b  C                   if        z5 < s08cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts10 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C08 = C08+1
     C                   eval      rn0041 = z5 + 1
     C                   eval      z5=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T17(C08),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T17     '
     C                   eval      fldinx = z5
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0008  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B06(C08) = ITMMAST.STIGRP.SISTIG
     C                   eval      b06(z5) = *blanks
     C                   eval      b06(z5) = wistig
      * ** load screen array.
      * T18(C08) = ITMMAST.STIGRP.SISTIG
     C                   eval      t18(z5) = *blanks
     C                   eval      t18(z5) = wistig
      * T19(C08) = ITMMAST.STIGRP.SIDESC
     C                   eval      t19(z5) = *blanks
     C                   eval      t19(z5) = xidesc
      * ** Save first record on screen.
      * IF C08=1
 2b  C                   if        z5 = 1
      * FST08 = B06(C08)
     C                   eval      fst08 = b06(z5)
      * END                                                           *
 2e  C                   endif
      * IF C08<S08CNT
 2b  C                   if        z5 < s08cnt
      * GETREC D.ITMMAST,F.STIGRP,*NE,SVK013
      *
     C                   exsr      s062
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z5 < s08cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts10 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C08>0
 1b  C                   if        z5 > *zero
      * LST08 = B06(C08)
     C                   eval      lst08 = b06(z5)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S09ABR - SCRN SUB
      *****************************************************************
     C     s09abr        begsr
      *
      * ** Array backwards read.
      * C09 = 0
     C                   eval      z6 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.STOKGRP,SVK015,SVK09
      *
     C                   exsr      s064
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.STOKGRP,*PV,SVK015
      *
     C                   exsr      s065
      * DOW (C09<S09CNT)&%STS(D.ITMMAST,F.STOKGRP)=*YES
 1b  C                   if        z6 < s09cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts06 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C09 = C09+1
     C                   eval      rn0041 = z6 + 1
     C                   eval      z6=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.STOKGRP,*PV,SVK015
      *
     C                   exsr      s065
      * END                                                           *
 2b  C                   if        z6 < s09cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts06 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S09ALD
     C                   exsr      s09ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S09AFR - SCRN SUB
      *****************************************************************
     C     s09afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.STOKGRP,SVK015,SVK09
      *
     C                   exsr      s064
      * ** Load arrays from this point.
      * EXSUBR S09ALD
     C                   exsr      s09ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S09ALD - SCRN SUB
      *****************************************************************
     C     s09ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T20 = 0
     C                   eval      t20 = *zeros
      * B07 = ' '
     C                   clear                   b07
     C                   clear                   t21
     C                   clear                   t22
     C                   eval      z6 = *zeros
      * ** protect select field
      * DOW C09<S09CNT
 1b  C                   dow       z6 < s09cnt
      * C09 = C09+1
     C                   eval      nrslt0 = z6 + 1
     C                   eval      z6=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T20(C09),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T20     '
     C                   eval      fldinx = z6
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0009  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C09 = 0
     C                   eval      z6 = *zeros
      * GETREC D.ITMMAST,F.STOKGRP,*NE,SVK015
      *
     C                   exsr      s067
      * DOW (C09<S09CNT)&%STS(D.ITMMAST,F.STOKGRP)=*YES
 1b  C                   if        z6 < s09cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts06 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C09 = C09+1
     C                   eval      rn0041 = z6 + 1
     C                   eval      z6=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T20(C09),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T20     '
     C                   eval      fldinx = z6
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0009  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B07(C09) = ITMMAST.STOKGRP.SGSGRP
     C                   eval      b07(z6) = *blanks
     C                   eval      b07(z6) = wgsgrp
      * ** load screen array.
      * T21(C09) = ITMMAST.STOKGRP.SGSGRP
     C                   eval      t21(z6) = *blanks
     C                   eval      t21(z6) = wgsgrp
      * T22(C09) = ITMMAST.STOKGRP.SGSDESC
     C                   eval      t22(z6) = *blanks
     C                   eval      t22(z6) = wk0017
      * ** Save first record on screen.
      * IF C09=1
 2b  C                   if        z6 = 1
      * FST09 = B07(C09)
     C                   eval      fst09 = b07(z6)
      * END                                                           *
 2e  C                   endif
      * IF C09<S09CNT
 2b  C                   if        z6 < s09cnt
      * GETREC D.ITMMAST,F.STOKGRP,*NE,SVK015
      *
     C                   exsr      s067
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z6 < s09cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts06 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C09>0
 1b  C                   if        z6 > *zero
      * LST09 = B07(C09)
     C                   eval      lst09 = b07(z6)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S10ABR - SCRN SUB
      *****************************************************************
     C     s10abr        begsr
      *
      * ** Array backwards read.
      * C10 = 0
     C                   eval      z7 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.STVGRP,SVK017,SVK10
      *
     C                   exsr      s069
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.STVGRP,*PV,SVK017
      *
     C                   exsr      s070
      * DOW (C10<S10CNT)&%STS(D.ITMMAST,F.STVGRP)=*YES
 1b  C                   if        z7 < s10cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts11 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C10 = C10+1
     C                   eval      rn0041 = z7 + 1
     C                   eval      z7=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.STVGRP,*PV,SVK017
      *
     C                   exsr      s070
      * END                                                           *
 2b  C                   if        z7 < s10cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts11 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S10ALD
     C                   exsr      s10ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S10AFR - SCRN SUB
      *****************************************************************
     C     s10afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.STVGRP,SVK017,SVK10
      *
     C                   exsr      s069
      * ** Load arrays from this point.
      * EXSUBR S10ALD
     C                   exsr      s10ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S10ALD - SCRN SUB
      *****************************************************************
     C     s10ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T23 = 0
     C                   eval      t23 = *zeros
      * B08 = ' '
     C                   clear                   b08
     C                   clear                   t24
     C                   clear                   t25
     C                   eval      z7 = *zeros
      * ** protect select field
      * DOW C10<S10CNT
 1b  C                   dow       z7 < s10cnt
      * C10 = C10+1
     C                   eval      nrslt0 = z7 + 1
     C                   eval      z7=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T23(C10),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T23     '
     C                   eval      fldinx = z7
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0010  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C10 = 0
     C                   eval      z7 = *zeros
      * GETREC D.ITMMAST,F.STVGRP,*NE,SVK017
      *
     C                   exsr      s072
      * DOW (C10<S10CNT)&%STS(D.ITMMAST,F.STVGRP)=*YES
 1b  C                   if        z7 < s10cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts11 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C10 = C10+1
     C                   eval      rn0041 = z7 + 1
     C                   eval      z7=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T23(C10),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T23     '
     C                   eval      fldinx = z7
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0010  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B08(C10) = ITMMAST.STVGRP.VGSVALG
     C                   eval      b08(z7) = *blanks
     C                   eval      b08(z7) = wk0019
      * ** load screen array.
      * T24(C10) = ITMMAST.STVGRP.VGSVALG
     C                   eval      t24(z7) = *blanks
     C                   eval      t24(z7) = wk0019
      * T25(C10) = ITMMAST.STVGRP.VGDESC
     C                   eval      t25(z7) = *blanks
     C                   eval      t25(z7) = xgdesc
      * ** Save first record on screen.
      * IF C10=1
 2b  C                   if        z7 = 1
      * FST10 = B08(C10)
     C                   eval      fst10 = b08(z7)
      * END                                                           *
 2e  C                   endif
      * IF C10<S10CNT
 2b  C                   if        z7 < s10cnt
      * GETREC D.ITMMAST,F.STVGRP,*NE,SVK017
      *
     C                   exsr      s072
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z7 < s10cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts11 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C10>0
 1b  C                   if        z7 > *zero
      * LST10 = B08(C10)
     C                   eval      lst10 = b08(z7)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S11ABR - SCRN SUB
      *****************************************************************
     C     s11abr        begsr
      *
      * ** Array backwards read.
      * C11 = 0
     C                   eval      z8 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.UOM,SVK019,SVK11
      *
     C                   exsr      s074
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.UOM,*PV,SVK019
      *
     C                   exsr      s075
      * DOW (C11<S11CNT)&%STS(D.ITMMAST,F.UOM)=*YES
 1b  C                   if        z8 < s11cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts12 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C11 = C11+1
     C                   eval      rn0041 = z8 + 1
     C                   eval      z8=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.UOM,*PV,SVK019
      *
     C                   exsr      s075
      * END                                                           *
 2b  C                   if        z8 < s11cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts12 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S11ALD
     C                   exsr      s11ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S11AFR - SCRN SUB
      *****************************************************************
     C     s11afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.UOM,SVK019,SVK11
      *
     C                   exsr      s074
      * ** Load arrays from this point.
      * EXSUBR S11ALD
     C                   exsr      s11ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S11ALD - SCRN SUB
      *****************************************************************
     C     s11ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T26 = 0
     C                   eval      t26 = *zeros
      * B09 = ' '
     C                   clear                   b09
     C                   clear                   t27
     C                   eval      t28 = *zeros
      * C11 = 0
     C                   eval      z8 = *zeros
      * ** protect select field
      * DOW C11<S11CNT
 1b  C                   dow       z8 < s11cnt
      * C11 = C11+1
     C                   eval      nrslt0 = z8 + 1
     C                   eval      z8=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T26(C11),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T26     '
     C                   eval      fldinx = z8
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0011  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C11 = 0
     C                   eval      z8 = *zeros
      * GETREC D.ITMMAST,F.UOM,*NE,SVK019
      *
     C                   exsr      s077
      * DOW (C11<S11CNT)&%STS(D.ITMMAST,F.UOM)=*YES
 1b  C                   if        z8 < s11cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts12 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C11 = C11+1
     C                   eval      rn0041 = z8 + 1
     C                   eval      z8=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T26(C11),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T26     '
     C                   eval      fldinx = z8
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0011  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B09(C11) = ITMMAST.UOM.UMUOM
     C                   eval      b09(z8) = *blanks
     C                   eval      b09(z8) = wmuom
      * ** load screen array.
      * T27(C11) = ITMMAST.UOM.UMUOM
     C                   eval      t27(z8) = *blanks
     C                   eval      t27(z8) = wmuom
      * T28(C11) = ITMMAST.UOM.UMQTYO
     C                   eval      t28(z8) = wmqtyo
      * ** Save first record on screen.
      * IF C11=1
 2b  C                   if        z8 = 1
      * FST11 = B09(C11)
     C                   eval      fst11 = b09(z8)
      * END                                                           *
 2e  C                   endif
      * IF C11<S11CNT
 2b  C                   if        z8 < s11cnt
      * GETREC D.ITMMAST,F.UOM,*NE,SVK019
      *
     C                   exsr      s077
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z8 < s11cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts12 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C11>0
 1b  C                   if        z8 > *zero
      * LST11 = B09(C11)
     C                   eval      lst11 = b09(z8)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S12ABR - SCRN SUB
      *****************************************************************
     C     s12abr        begsr
      *
      * ** Array backwards read.
      * C12 = 0
     C                   eval      z9 = *zeros
      * ** Set pointer to first record on screen.
      * SETLL D.ITMMAST,F.VATCOD,SVK021,SVK12
      *
     C                   exsr      s079
      * ** Read backwards until number
      * ** elements reached, or beginning
      * ** of file.
      * GETREC D.ITMMAST,F.VATCOD,*PV,SVK021
      *
     C                   exsr      s080
      * DOW (C12<S12CNT)&%STS(D.ITMMAST,F.VATCOD)=*YES
 1b  C                   if        z9 < s12cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts07 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C12 = C12+1
     C                   eval      rn0041 = z9 + 1
     C                   eval      z9=%int(rn0041)                              Check fld overflow 1
      * GETREC D.ITMMAST,F.VATCOD,*PV,SVK021
      *
     C                   exsr      s080
      * END                                                           *
 2b  C                   if        z9 < s12cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts07 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Load arrays from this point.
      * EXSUBR S12ALD
     C                   exsr      s12ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S12AFR - SCRN SUB
      *****************************************************************
     C     s12afr        begsr
      *
      * ** Set pointer to last record on screen.
      * SETLL D.ITMMAST,F.VATCOD,SVK021,SVK12
      *
     C                   exsr      s079
      * ** Load arrays from this point.
      * EXSUBR S12ALD
     C                   exsr      s12ald
 1b  C                   if        lrflag <> *blank
 LV  C                   leavesr
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * S12ALD - SCRN SUB
      *****************************************************************
     C     s12ald        begsr
      *
      * ** load arrays from file
      * ** clear arrays
      * T29 = 0
     C                   eval      t29 = *zeros
      * B10 = ' '
     C                   clear                   b10
     C                   clear                   t30
     C                   clear                   t31
     C                   eval      z9 = *zeros
      * ** protect select field
      * DOW C12<S12CNT
 1b  C                   dow       z9 < s12cnt
      * C12 = C12+1
     C                   eval      nrslt0 = z9 + 1
     C                   eval      z9=%int(nrslt0)                              Check fld overflow 1
      * FLDATR T29(C12),*ND,*PR
     C                   eval      #nd = 'X'
     C                   eval      #pr = 'X'
     C                   eval      fldnam = 'T29     '
     C                   eval      fldinx = z9
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0012  '
     C                   exsr      satrib
      * END                                                           *
 1e  C                   enddo
      * ** Read file and load to arrays.
      * C12 = 0
     C                   eval      z9 = *zeros
      * GETREC D.ITMMAST,F.VATCOD,*NE,SVK021
      *
     C                   exsr      s082
      * DOW (C12<S12CNT)&%STS(D.ITMMAST,F.VATCOD)=*YES
 1b  C                   if        z9 < s12cnt
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
      *  Status of last file I/O
 1b  C                   if        sts07 = *zero
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        rn0041 = xyes
     C                   eval      rn0041 = 1
 1x  C                   else
     C                   eval      rn0041 = 0
 1e  C                   endif
 1b  C                   if        nrslt0 = 1  and
     C                             rn0041 = 1
     C                   eval      nrslt0 = 1
 1x  C                   else
     C                   eval      nrslt0 = 0
 1e  C                   endif
     C                   eval      rslt01=%int(nrslt0)                          Check fld overflow 1
 1b  C                   dow       rslt01 = 1
      * C12 = C12+1
     C                   eval      rn0041 = z9 + 1
     C                   eval      z9=%int(rn0041)                              Check fld overflow 1
      * ** Unprotect select field.
      * FLDATR T29(C12),*DS
     C                   eval      #ds = 'X'
     C                   eval      fldnam = 'T29     '
     C                   eval      fldinx = z9
     C                   eval      fldscr = *blanks
     C                   eval      fldscr = 'SC0012  '
     C                   exsr      satrib
      * ** Save field being prompted for.
      * B10(C12) = ITMMAST.VATCOD.VCVATC
     C                   eval      b10(z9) = *blanks
     C                   eval      b10(z9) = wcvatc
      * ** load screen array.
      * T30(C12) = ITMMAST.VATCOD.VCVATC
     C                   eval      t30(z9) = *blanks
     C                   eval      t30(z9) = wcvatc
      * T31(C12) = ITMMAST.VATCOD.VCDESC
     C                   eval      t31(z9) = *blanks
     C                   eval      t31(z9) = wk0022
      * ** Save first record on screen.
      * IF C12=1
 2b  C                   if        z9 = 1
      * FST12 = B10(C12)
     C                   eval      fst12 = b10(z9)
      * END                                                           *
 2e  C                   endif
      * IF C12<S12CNT
 2b  C                   if        z9 < s12cnt
      * GETREC D.ITMMAST,F.VATCOD,*NE,SVK021
      *
     C                   exsr      s082
      * END                                                           *
 2e  C                   endif
      * END                                                           *
 2b  C                   if        z9 < s12cnt
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
      *  Status of last file I/O
 2b  C                   if        sts07 = *zero
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        nrslt0 = xyes
     C                   eval      nrslt0 = 1
 2x  C                   else
     C                   eval      nrslt0 = 0
 2e  C                   endif
 2b  C                   if        rn0041 = 1  and
     C                             nrslt0 = 1
     C                   eval      rn0041 = 1
 2x  C                   else
     C                   eval      rn0041 = 0
 2e  C                   endif
     C                   eval      rslt01=%int(rn0041)                          Check fld overflow 1
 1e  C                   enddo
      * ** Save last record on screen.
      * IF C12>0
 1b  C                   if        z9 > *zero
      * LST12 = B10(C12)
     C                   eval      lst12 = b10(z9)
      * END                                                           *
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SY0010 - Format Date
      *****************************************************************
     C     sy0010        begsr
      *
      * *** INPUT PARAMETER = SYDATI - CYMD field 8N CMD
      * ***                 = SYDSEP - date seperator
      * ***                 = SYDFMT - date format
      * ***                                                           *
      * *** OUTPUT PARAMETER = SYDATO - Char date field 10A
      * *** Split date components
      *                                                               *
      * SYDATO = *blanks
     C                   eval      rn0003 = *blanks
      * ***                                                           *
      * IF sydsep = ' '
 1b  C                   if        rn0005 = *blanks
      * SYDSEP = '/'
     C                   eval      rn0005 = '/'
      * END                                                           *
 1e  C                   endif
      *                                                               *
      * SYCCYY = %ljf(SYDATI) ; YEAR  4
      *  Left Justify field into result field
     C                   eval      x1cdat = rn0002
     C                   eval      syccyy = x14
      * SYMMDD = %RJF(SYDATI) ; MMDD  4
      *  Right Justify field into result field
     C                   eval      symmdd = x58
      * SYMM = %ljf(SYMMDD) ; Month 2
      *  Left Justify field into result field
     C                   eval      symm = x56
      * SYDD = %rjf(SYMMDD) ; Days  2
      *  Right Justify field into result field
     C                   eval      sydd = x78
      *                                                               *
      * *** Convert elements to Char
      *                                                               *
      * SYCCYYA = %CTC(SYCCYY)
      *  Convert To Character
     C                   eval      rn0001 = *blanks
     C                   eval      rn0001 = %char(syccyy)                       Check %char conv
      * SYMMDDA = %CTC(SYMMDD)
      *  Convert To Character
     C                   eval      rn0006 = *blanks
     C                   eval      rn0006 = %char(symmdd)                       Check %char conv
      * SYMMA = %CTC(SYMM)
      *  Convert To Character
     C                   eval      symma = *blanks
     C                   eval      symma = %char(symm)                          Check %char conv
      * SYDDA = %CTC(SYDD)
      *  Convert To Character
     C                   eval      sydda = *blanks
     C                   eval      sydda = %char(sydd)                          Check %char conv
      *                                                               *
      * IF SYDFMT = '1'
 1b  C                   if        rn0004 = '1'
      * SYDATO = %CON(SYDATO,SYDDA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + sydda
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,sydsep)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0005
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,SYMMA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + symma
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,sydsep)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0005
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,SYCCYYA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0001
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * END                                                           *
 1e  C                   endif
      * IF SYDFMT = '2'
 1b  C                   if        rn0004 = '2'
      * SYDATO = %CON(SYDATO,SYMMA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + symma
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,sydsep)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0005
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,SYDDA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + sydda
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,sydsep)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0005
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * SYDATO = %CON(SYDATO,SYCCYYA)
      *  Concatenate
     C                   eval      arslt0 = %trimr(rn0003) + rn0001
     C                   eval      rn0003 = *blanks
     C                   eval      rn0003 = arslt0
      * END                                                           *
 1e  C                   endif
      *                                                               *
      * *** If the input date is Blank - Blank the output date
      * IF SYDATI = 0
 1b  C                   if        rn0002 = *zero
      * SYDATO = *BLANKS
     C                   eval      rn0003 = *blanks
      * END                                                           *
 1e  C                   endif
      * *** Initialise the input fields
      * SYDATI = SYDATI  ; Input date
     C                   eval      rn0002 = rn0002
      * SYDSEP = SYDSEP  ; date seperator
     C                   eval      rn0005 = rn0005
      * SYDFMT = SYDFMT  ; date format
     C                   eval      rn0004 = rn0004
      *
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SMSG - calls message handling program to either clear, add, or
      *        remove messages from message subfile or extracts
      *        messages from message files.
      *****************************************************************
     C     smsg          begsr
      *
      * Add message to message subfile
      *
 1b  C                   if        msgact = 'A'  or
     C                             msgact = 'R'
     C                   eval      msgflg = 'Y'
 1x  C                   else
      * Clear message subfile or extract message from message file.
      *
 2b  C                   if        msgact = 'C'
     C                   eval      msgflg = 'N'
 2e  C                   endif
 1e  C                   endif
      *
 1b  C                   if        msgact = 'C'  or
     C                             msgact = 'A'  or
     C                             msgact = 'E'
      *
     C                   callp     p_CLMSG(
     C                             msgact:
     C                             msgid:
     C                             msgf:
     C                             msgfl:
     C                             msgdta)
      *
      *                  call      'CLMSG'       pmsgcl
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
      * Do not clear the message data field if message is extracted
      * from message file
 2b  C                   if        msgact <> 'E'
     C                   eval      msgdta = *blanks
 2e  C                   endif
 1e  C                   endif
      *
     C                   ENDSR
     C/EJECT
      **************************************************************************
      * S013   - GETREC d.company,f.company,*eq,prcoyno
      **************************************************************************
     C     s013          begsr
     C                   eval      wfile# = 2
     C                   eval      kyco01 = *blanks
     C                   eval      kyco01 = prm003
     C     k0001         chain(e)  company                                      Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd02 = 'N'
     C                   eval      hrc02 = *zeros
 1x  C                   else
     C                   eval      swrd02 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S014   - GETREC d.company,f.imscpyd,*eq,prcoyno
      **************************************************************************
     C     s014          begsr
     C                   eval      wfile# = 3
     C                   eval      kyco01 = *blanks
     C                   eval      kyco01 = prm003
     C     k0001         chain(e)  imscpyd                                      Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd03 = 'N'
     C                   eval      hrc03 = *zeros
 1x  C                   else
     C                   eval      swrd03 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S015   - SETLL D.ITMMAST1,F.ITMMAST1,SVK001,SVK002
      **************************************************************************
     C     s015          begsr
     C                   eval      wfile# = 1
     C                   eval      swrd01 = 'Y'
     C                   eval      hd0006 = *loval
     C                   eval      hd0005 = *loval
     C                   eval      hd0007 = *loval
      *
     C                   eval      ktco01 = svk001
     C                   eval      hd0006 = svk001
     C                   eval      rn0024 = svk001
     C                   eval      ktal02 = svk002
     C                   eval      hd0005 = svk002
     C                   eval      rn0023 = svk002
      *
     C     k0002         setll(e)  itmmast1                                     Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts01 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S016   - SETLL D.ITMMAST1,F.ITMMAST1,SVK001,svkalp,SVK002
      **************************************************************************
     C     s016          begsr
     C                   eval      wfile# = 1
     C                   eval      swrd01 = 'Y'
     C                   eval      hd0006 = *loval
     C                   eval      hd0005 = *loval
     C                   eval      hd0007 = *loval
      *
     C                   eval      ktco01 = svk001
     C                   eval      hd0006 = svk001
     C                   eval      rn0024 = svk001
     C                   eval      ktal02 = svkalp
     C                   eval      hd0005 = svkalp
     C                   eval      rn0023 = svkalp
     C                   eval      ktit03 = svk002
     C                   eval      hd0007 = svk002
     C                   eval      ititem = svk002
      *
     C     k0003         setll(e)  itmmast1                                     Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts01 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S017   - SETLL D.ITMMAST,F.ITMMAST,SVK001,SVK002
      **************************************************************************
     C     s017          begsr
     C                   eval      wfile# = 1
     C                   eval      swrd04 = 'Y'
     C                   eval      swrd05 = 'N'
     C                   eval      swrd08 = 'N'
     C                   eval      swrd09 = 'N'
     C                   eval      swrd10 = 'N'
     C                   eval      swrd06 = 'N'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
     C                   eval      hd0004 = *loval
     C                   eval      htitem = *loval
      *
     C                   eval      ktco01 = svk001
     C                   eval      hd0004 = svk001
     C                   eval      rn0021 = svk001
     C                   eval      ktit02 = svk002
     C                   eval      htitem = svk002
     C                   eval      ititem = svk002
      *
     C     k0004         setll(e)  itmmast                                      Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts04 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S018   - GETREC D.ITMMAST,F.ITMMAST,*lock,*eq,SVK001,SVK002
      **************************************************************************
     C     s018          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = svk001
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = svk002
     C     k0004         chain(e)  itmmast                                      Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
      *
 2b  C                   if        %error                                       Chg Ind 91 to bif
     C                   eval      msgflg = 'Y'
 2e  C                   endif
      *
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S019   - GETREC D.ITMMAST,F.ITMMAST,*eq,SVK001,SVK002
      **************************************************************************
     C     s019          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = svk001
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = svk002
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S020   - GETREC D.ITMMAST,F.ITMCLAS,*eq,ITCOYNO,ITCLAS
      **************************************************************************
     C     s020          begsr
     C                   eval      wfile# = 5
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktcl02 = *blanks
     C                   eval      ktcl02 = xtclas
     C     k0010         chain(e)  itmclas                                      Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd05 = 'N'
     C                   eval      hrc05 = *zeros
 1x  C                   else
     C                   eval      swrd05 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S021   - GETREC D.ITMMAST,F.ITMTYP,*eq,ITCOYNO,ITITYP
      **************************************************************************
     C     s021          begsr
     C                   eval      wfile# = 8
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktit04 = *blanks
     C                   eval      ktit04 = xtityp
     C     k0011         chain(e)  itmtyp                                       Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd08 = 'N'
     C                   eval      hrc08 = *zeros
 1x  C                   else
     C                   eval      swrd08 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S022   - GETREC D.ITMMAST,F.STANYS,*eq,ITCOYNO,ITSANL
      **************************************************************************
     C     s022          begsr
     C                   eval      wfile# = 9
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktsa02 = *blanks
     C                   eval      ktsa02 = xtsanl
     C     k0012         chain(e)  stanys                                       Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd09 = 'N'
     C                   eval      hrc09 = *zeros
 1x  C                   else
     C                   eval      swrd09 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S023   - GETREC D.ITMMAST,F.STIGRP,*eq,ITCOYNO,ITSIG
      **************************************************************************
     C     s023          begsr
     C                   eval      wfile# = 10
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktsi02 = *blanks
     C                   eval      ktsi02 = xtsig
     C     k0013         chain(e)  stigrp                                       Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd10 = 'N'
     C                   eval      hrc10 = *zeros
 1x  C                   else
     C                   eval      swrd10 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S024   - GETREC D.ITMMAST,F.STOKGRP,*eq,ITCOYNO,ITIGRP
      **************************************************************************
     C     s024          begsr
     C                   eval      wfile# = 6
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktig02 = *blanks
     C                   eval      ktig02 = xtigrp
     C     k0014         chain(e)  stokgrp                                      Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd06 = 'N'
     C                   eval      hrc06 = *zeros
 1x  C                   else
     C                   eval      swrd06 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S025   - GETREC D.ITMMAST,F.STVGRP,*eq,ITCOYNO,ITSVG
      **************************************************************************
     C     s025          begsr
     C                   eval      wfile# = 11
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktsv02 = *blanks
     C                   eval      ktsv02 = xtsvg
     C     k0015         chain(e)  stvgrp                                       Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd11 = 'N'
     C                   eval      hrc11 = *zeros
 1x  C                   else
     C                   eval      swrd11 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S026   - GETREC D.ITMMAST,F.VATCOD,*eq,ITCOYNO,ITVATC
      **************************************************************************
     C     s026          begsr
     C                   eval      wfile# = 7
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktva02 = *blanks
     C                   eval      ktva02 = xtvatc
     C     k0016         chain(e)  vatcod                                       Hi90Lo91 Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd07 = 'N'
     C                   eval      hrc07 = *zeros
 1x  C                   else
     C                   eval      swrd07 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S027   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupg
      **************************************************************************
     C     s027          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = wksupg
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S028   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksupd
      **************************************************************************
     C     s028          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = wksupd
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S029   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wksubs
      **************************************************************************
     C     s029          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = wksubs
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S030   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wkitem
      **************************************************************************
     C     s030          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = wkitem
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S031   - DELETE D.ITMMAST,F.ITMMAST
      **************************************************************************
     C     s031          begsr
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
     C                   eval      svs04 = *hival
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = xtitem
     C     k0004         setll     itmmast                                      SETLL  ITMMAST
      *          ---------------------------------------------------------------
      *          | Setup Loop To Delete Record - ITMMAST
      *          ---------------------------------------------------------------
 1b  C                   dou       *in90  or
     C                             *in91
      *
     C                   eval      wfile# = 4
     C     k0004         reade(e)  itmmast                                      Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
 2b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 2e  C                   endif                                                  Set Ind for dou loop
      *
 2b  C                   if        not %eof and                                 Chg Ind 90 to bif
     C                             not %error                                   Chg Ind 91 to bif
      *
      *
     C                   exsr      s032                                         Refer.Integrity chk.
 3b  C                   if        rierr = 'N'
     C                   delete    itmmast                                      Lo91 Repl 4 bif
     C                   eval      svs04 = sts04
 3x  C                   else
     C                   unlock    itmmast                                      Lo91 Repl 4 bif
     C                   eval      *in91 = *on
     C                   eval      svs04 = *hival
 3e  C                   endif
      *          ---------------------------------------------------------------
      *          | Send Message To Indicate Delete Status
      *          ---------------------------------------------------------------
 3b  C                   if        not %error                                   Chg Ind 91 to bif
     C                   eval      msgdta = a1(6)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 3e  C                   endif                                                  END-DEL STATUS
      *
 2x  C                   else                                                   ELSE-READ-FILE
 3b  C                   if        *in90                                        NO RCD FOUND
     C                   eval      msgdta = a1(7)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 3x  C                   else
     C                   eval      msgflg = 'Y'
 3e  C                   endif                                                  READ KEY FILE FAIL
      *
 2e  C                   endif                                                  END-READ KEY FILE
 1e  C                   enddo                                                  EMD-DOUNE LOOP
     C                   eval      *in90 = *off
     C                   eval      *in91 = *off
      *
     C     k0004         setll     itmmast                                      RESUME FILE POINTER
     C                   eval      sts04 = svs04
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S032   - Referential Integrity Check (Delete) For File ITMMAST
      **************************************************************************
     C     s032          begsr
     C                   eval      rierr = 'N'
      *
     C                   eval      ktco01 = rn0021
     C                   eval      ktit02 = ititem
     C     k0004         setll(e)  orddet5                                      Hi  Lo  Eq90 Repl bi
 1b  C                   if        %equal                                       Chg Ind 90 to bif
     C                   eval      rierr = 'Y'
     C                   eval      msgdta = a1(4)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 LV  C                   leavesr
 1e  C                   endif                                                  END-*IN90
     C                   eval      ktco01 = rn0021
     C                   eval      ktit02 = ititem
     C     k0004         setll(e)  file0001                                     Hi  Lo  Eq90 Repl bi
 1b  C                   if        %equal                                       Chg Ind 90 to bif
     C                   eval      rierr = 'Y'
     C                   eval      msgdta = a1(5)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 LV  C                   leavesr
 1e  C                   endif                                                  END-*IN90
     C                   ENDSR
     C/EJECT
      **************************************************************************
      * S033   - UPDATE D.ITMMAST,F.ITMMAST
      **************************************************************************
     C     s033          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = hd0004
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = htitem
     C     k0004         chain(e)  itmmast                                      Hi90Lo91 Repl 4 bif
      *
 1b  C                   if        %error                                       Chg Ind 91 to bif
     C                   eval      msgflg = 'Y'
 1e  C                   endif
      *
 1b  C                   if        %found and                                   Chg Ind 90 to bif
     C                             not %error                                   Chg Ind 91 to bif
      *
 2b  C                   if        rn0020 = wk0005  and
     C                             itclas = xtclas  and
     C                             rn0021 = wk0006  and
     C                             itcrtu = xtcrtu  and
     C                             itdtcr = wtdtcr  and
     C                             itdtlm = wtdtlm  and
     C                             rn0022 = wk0007  and
     C                             itigrp = xtigrp  and
     C                             ititem = xtitem  and
     C                             itityp = xtityp  and
     C                             itlmby = xtlmby  and
     C                             itlprc = xtlprc  and
     C                             itmanf = xtmanf  and
     C                             itnlac = xtnlac  and
     C                             itnlas = xtnlas  and
     C                             itnlst = xtnlst  and
     C                             itpack = xtpack  and
     C                             itpall = xtpall  and
     C                             itqtyo = xtqtyo  and
     C                             itsanl = xtsanl  and
     C                             itsig = xtsig  and
     C                             itstuc = xtstuc  and
     C                             itsubs = xtsubs  and
     C                             itsupd = xtsupd  and
     C                             itsupg = xtsupg  and
     C                             itsvg = xtsvg  and
     C                             itudf1 = xtudf1  and
     C                             itudf2 = xtudf2  and
     C                             itudf3 = xtudf3  and
     C                             ituom = xtuom  and
     C                             ituomo = xtuomo  and
     C                             itvatc = xtvatc  and
     C                             itweig = xtweig
     C                   unlock    itmmast                                      Lo91 Repl 4 bif
 2x  C                   else
      *
     C                   exsr      s034                                         Refer.Integrity chk.
 3b  C                   if        rierr = 'N'
     C                   exsr      smvtof                                       MOVE FLD TO FILE
     C                   update    itmstrf                                      Lo90 Repl 4 bif
 3x  C                   else
     C                   unlock    itmmast                                      Lo91 Repl 4 bif
     C                   eval      *in90 = *on
     C                   eval      sts04 = *hival
 3e  C                   endif
 3b  C                   if        not *in90                                    REC UPDATED
     C                   exsr      smvtow                                       MOVE FLD TO WORK
     C                   eval      msgdta = a1(8)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 3e  C                   endif                                                  END-UPDATE STATUS
 2e  C                   endif                                                  END-FLD COMPARE
      *
      *
 1x  C                   else
     C                   eval      msgdta = a1(9)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif                                                  END-STATUS
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S034   - Referential Integrity Check (Update) For File ITMMAST
      **************************************************************************
     C     s034          begsr
     C                   eval      rierr = 'N'
      *
 1b  C                   if        rn0021 <> wk0006  or
     C                             ititem <> xtitem
     C                   eval      ktco01 = rn0021
     C                   eval      ktit02 = ititem
     C     k0004         setll(e)  orddet5                                      Hi  Lo  Eq90 Repl bi
 2b  C                   if        %equal                                       Chg Ind 90 to bif
     C                   eval      rierr = 'Y'
     C                   eval      msgdta = a1(4)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 LV  C                   leavesr
 2e  C                   endif                                                  END-*IN90
      *
 1e  C                   endif                                                  END-Compare fld.
 1b  C                   if        rn0021 <> wk0006  or
     C                             ititem <> xtitem
     C                   eval      ktco01 = rn0021
     C                   eval      ktit02 = ititem
     C     k0004         setll(e)  file0001                                     Hi  Lo  Eq90 Repl bi
 2b  C                   if        %equal                                       Chg Ind 90 to bif
     C                   eval      rierr = 'Y'
     C                   eval      msgdta = a1(5)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 LV  C                   leavesr
 2e  C                   endif                                                  END-*IN90
      *
 1e  C                   endif                                                  END-Compare fld.
     C                   ENDSR
     C/EJECT
      **************************************************************************
      * S035   - WRITE D.ITMMAST,F.ITMMAST
      **************************************************************************
     C     s035          begsr
     C                   eval      wfile# = 4
     C                   exsr      smvtof                                       MOVE FLD TO FILE
     C                   write     itmstrf                                      Lo90Eq   Repl 4 bif
      *
 1b  C                   if        not %error                                   Chg Ind 90 to bif
     C                   exsr      smvtow                                       MOVE FLD TO WORK
     C                   eval      msgdta = a1(10)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1x  C                   else
     C                   eval      msgdta = a1(11)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif                                                  END-STATUS
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S036   - GETBLK D.ITMMAST,F.ITMMAST,*pv,prcoyno
      **************************************************************************
     C     s036          begsr
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = wrrn01
     C                   eval      wlcntr = wlcntr + wadj01
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd04 <> 'Y'  or                            RD.SW.ITMMAST   ITMC
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      wfile# = 4
     C     k0021         readpe(en)itmmast                                      Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
     C                   eval      hd0004 = *blanks
     C                   eval      htitem = *blanks
 2x  C                   else
     C                   eval      swrd04 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd04 = 'Y'                                 RD.SW.ITMMAST   ITMC
     C                   exsr      smvtow                                       MOVE FLD TO WORK
     C                   eval      wcntr = wcntr + 1
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   exsr      s037                                         CHK BOF
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S037   - Process To Reset File Pointer(BOF) - ITMMAST
      **************************************************************************
     C     s037          begsr
      *
 1b  C                   if        swrd04 <> 'Y'  and                           RD.SW.ITMMAST   ITMC
     C                             sts04 <> 1122  and                           RCD LOCK
     C                             sts04 <> 1218                                RCD LOCK
      *
     C                   eval      swrd04 = 'Y'
     C                   eval      svs04 = sts04
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = rn0021
     C     k0021         setll     itmmast
     C                   eval      sts04 = svs04
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S038   - Process To Reset File Pointer(EOF) - ITMMAST
      **************************************************************************
     C     s038          begsr
      *
 1b  C                   if        swrd04 <> 'Y'  and                           RD.SW.ITMMAST   ITMC
     C                             sts04 <> 1122  and                           RCD LOCK
     C                             sts04 <> 1218                                RCD LOCK
      *
     C                   eval      swrd04 = 'Y'
     C                   eval      svs04 = sts04
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = rn0021
     C     k0021         setgt     itmmast
     C                   eval      sts04 = svs04
      *
     C                   eval      wadj01 = 1
 2b  C                   if        wcntr <> *zero
     C                   eval      wadj01 = wadj01 + 12
 2e  C                   endif
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1x  C                   else
     C                   eval      wadj01 = wrrn01
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S039   - GETBLK D.ITMMAST1,F.ITMMAST1,*pv,prcoyno
      **************************************************************************
     C     s039          begsr
      *
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
      *
      *          ---------------------------------------------------------------
      *          | Initialize Loop
      *          ---------------------------------------------------------------
     C                   eval      wcntr = *zeros
     C                   eval      wlcntr = wrrn02
     C                   eval      wlcntr = wlcntr + wadj02
      *          ---------------------------------------------------------------
      *          | Setup Loop To Retrieve Record
      *          ---------------------------------------------------------------
 1b  C                   dou       swrd01 <> 'Y'  or                            RD.SW.ITMMAST1
     C                             wcntr >= wlcntr  or
     C                             swexbl <> *zero
     C                   eval      swskpr = *zeros
     C                   eval      wfile# = 1
     C     k0021         readpe(e) itmmast1                                     Lo91Eq90 Repl 4 bif
 2b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd01 = 'N'
     C                   eval      hrc01 = *zeros
     C                   eval      hd0006 = *blanks
     C                   eval      hd0005 = *blanks
     C                   eval      hd0007 = *blanks
 2x  C                   else
     C                   eval      swrd01 = 'Y'
 2e  C                   endif
      *
 2b  C                   if        swrd01 = 'Y'                                 RD.SW.ITMMAST1
     C                   exsr      smvtow                                       MOVE FLD TO WORK
     C                   eval      wcntr = wcntr + 1
 2e  C                   endif
 1e  C                   enddo
     C                   eval      swexbl = *zeros
     C                   exsr      s040                                         CHK BOF
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S040   - Process To Reset File Pointer(BOF) - ITMMAST1
      **************************************************************************
     C     s040          begsr
      *
 1b  C                   if        swrd01 <> 'Y'  and                           RD.SW.ITMMAST1
     C                             sts01 <> 1122  and                           RCD LOCK
     C                             sts01 <> 1218                                RCD LOCK
      *
     C                   eval      swrd01 = 'Y'
     C                   eval      svs01 = sts01
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = rn0024
     C     k0021         setll     itmmast1
     C                   eval      sts01 = svs01
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S041   - Process To Reset File Pointer(EOF) - ITMMAST1
      **************************************************************************
     C     s041          begsr
      *
 1b  C                   if        swrd01 <> 'Y'  and                           RD.SW.ITMMAST1
     C                             sts01 <> 1122  and                           RCD LOCK
     C                             sts01 <> 1218                                RCD LOCK
      *
     C                   eval      swrd01 = 'Y'
     C                   eval      svs01 = sts01
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = rn0024
     C     k0021         setgt     itmmast1
     C                   eval      sts01 = svs01
      *
     C                   eval      wadj02 = 1
 2b  C                   if        wcntr <> *zero
     C                   eval      wadj02 = wadj02 + 12
 2e  C                   endif
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1x  C                   else
     C                   eval      wadj02 = wrrn02
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S042   - GETREC D.ITMMAST,F.ITMMAST,*eq,itcoyno,ititem
      **************************************************************************
     C     s042          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = wk0006
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = xtitem
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S043   - GETREC D.ITMMAST,F.ITMMAST,*eq,PRCOYNO,ititem
      **************************************************************************
     C     s043          begsr
     C                   eval      wfile# = 4
     C                   eval      ktco01 = *blanks
     C                   eval      ktco01 = prm003
     C                   eval      ktit02 = *blanks
     C                   eval      ktit02 = xtitem
     C     k0004         chain(en) itmmast                                      Lo91Eq   Repl 4 bif
 1b  C                   if        not %found or                                Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd04 = 'N'
     C                   eval      hrc04 = *zeros
 1x  C                   else
     C                   eval      swrd04 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S044   - SETLL D.ITMMAST,F.ITMCLAS,SVK003,SVK03
      **************************************************************************
     C     s044          begsr
     C                   eval      wfile# = 2
     C                   eval      swrd05 = 'Y'
     C                   eval      swrd08 = 'N'
     C                   eval      swrd09 = 'N'
     C                   eval      swrd10 = 'N'
     C                   eval      swrd06 = 'N'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kcco01 = svk003
     C                   eval      hd0003 = svk003
     C                   eval      rn0019 = svk003
     C                   eval      kccl02 = svk03
     C                   eval      hcclas = svk03
     C                   eval      icclas = svk03
      *
     C     k0022         setll(e)  itmclas                                      Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts05 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S045   - GETREC D.ITMMAST,F.ITMCLAS,*PV,SVK003
      **************************************************************************
     C     s045          begsr
     C                   eval      wfile# = 5
     C                   eval      kcco01 = *blanks
     C                   eval      kcco01 = svk003
     C     k0023         readpe(e) itmclas                                      Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd05 = 'N'
     C                   eval      hrc05 = *zeros
 1x  C                   else
     C                   eval      swrd05 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s046                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S046   - Process To Reset File Pointer(BOF) - ITMCLAS
      **************************************************************************
     C     s046          begsr
      *
 1b  C                   if        swrd05 <> 'Y'  and                           RD.SW.ITMCLAS   ITMT
     C                             sts05 <> 1122  and                           RCD LOCK
     C                             sts05 <> 1218                                RCD LOCK
      *
     C                   eval      swrd05 = 'Y'
     C                   eval      svs05 = sts05
     C                   eval      kcco01 = *blanks
     C                   eval      kcco01 = rn0019
     C     k0023         setll     itmclas
     C                   eval      sts05 = svs05
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S047   - GETREC D.ITMMAST,F.ITMCLAS,*NE,SVK003
      **************************************************************************
     C     s047          begsr
     C                   eval      wfile# = 5
     C                   eval      kcco01 = *blanks
     C                   eval      kcco01 = svk003
     C     k0023         reade(e)  itmclas                                      Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd05 = 'N'
     C                   eval      hrc05 = *zeros
 1x  C                   else
     C                   eval      swrd05 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s048                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S048   - Process To Reset File Pointer(EOF) - ITMCLAS
      **************************************************************************
     C     s048          begsr
      *
 1b  C                   if        swrd05 <> 'Y'  and                           RD.SW.ITMCLAS   ITMT
     C                             sts05 <> 1122  and                           RCD LOCK
     C                             sts05 <> 1218                                RCD LOCK
      *
     C                   eval      swrd05 = 'Y'
     C                   eval      svs05 = sts05
     C                   eval      kcco01 = *blanks
     C                   eval      kcco01 = rn0019
     C     k0023         setgt     itmclas
     C                   eval      sts05 = svs05
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S049   - SETLL D.ITMMAST,F.ITMTYP,SVK005,SVK04
      **************************************************************************
     C     s049          begsr
     C                   eval      wfile# = 3
     C                   eval      swrd08 = 'Y'
     C                   eval      swrd09 = 'N'
     C                   eval      swrd10 = 'N'
     C                   eval      swrd06 = 'N'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kaco01 = svk005
     C                   eval      hd0008 = svk005
     C                   eval      rn0026 = svk005
     C                   eval      kait02 = svk04
     C                   eval      haityp = svk04
     C                   eval      baityp = svk04
      *
     C     k0024         setll(e)  itmtyp                                       Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts08 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S050   - GETREC D.ITMMAST,F.ITMTYP,*PV,SVK005
      **************************************************************************
     C     s050          begsr
     C                   eval      wfile# = 8
     C                   eval      kaco01 = *blanks
     C                   eval      kaco01 = svk005
     C     k0025         readpe(e) itmtyp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd08 = 'N'
     C                   eval      hrc08 = *zeros
 1x  C                   else
     C                   eval      swrd08 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s051                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S051   - Process To Reset File Pointer(BOF) - ITMTYP
      **************************************************************************
     C     s051          begsr
      *
 1b  C                   if        swrd08 <> 'Y'  and                           RD.SW.ITMTYP    STAN
     C                             sts08 <> 1122  and                           RCD LOCK
     C                             sts08 <> 1218                                RCD LOCK
      *
     C                   eval      swrd08 = 'Y'
     C                   eval      svs08 = sts08
     C                   eval      kaco01 = *blanks
     C                   eval      kaco01 = rn0026
     C     k0025         setll     itmtyp
     C                   eval      sts08 = svs08
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S052   - GETREC D.ITMMAST,F.ITMTYP,*NE,SVK005
      **************************************************************************
     C     s052          begsr
     C                   eval      wfile# = 8
     C                   eval      kaco01 = *blanks
     C                   eval      kaco01 = svk005
     C     k0025         reade(e)  itmtyp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd08 = 'N'
     C                   eval      hrc08 = *zeros
 1x  C                   else
     C                   eval      swrd08 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s053                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S053   - Process To Reset File Pointer(EOF) - ITMTYP
      **************************************************************************
     C     s053          begsr
      *
 1b  C                   if        swrd08 <> 'Y'  and                           RD.SW.ITMTYP    STAN
     C                             sts08 <> 1122  and                           RCD LOCK
     C                             sts08 <> 1218                                RCD LOCK
      *
     C                   eval      swrd08 = 'Y'
     C                   eval      svs08 = sts08
     C                   eval      kaco01 = *blanks
     C                   eval      kaco01 = rn0026
     C     k0025         setgt     itmtyp
     C                   eval      sts08 = svs08
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S054   - SETLL D.ITMMAST,F.STANYS,SVK011,SVK07
      **************************************************************************
     C     s054          begsr
     C                   eval      wfile# = 4
     C                   eval      swrd09 = 'Y'
     C                   eval      swrd10 = 'N'
     C                   eval      swrd06 = 'N'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kaco02 = svk011
     C                   eval      hd0010 = svk011
     C                   eval      rn0030 = svk011
     C                   eval      kasa03 = svk07
     C                   eval      hasanl = svk07
     C                   eval      sasanl = svk07
      *
     C     k0026         setll(e)  stanys                                       Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts09 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S055   - GETREC D.ITMMAST,F.STANYS,*PV,SVK011
      **************************************************************************
     C     s055          begsr
     C                   eval      wfile# = 9
     C                   eval      kaco02 = *blanks
     C                   eval      kaco02 = svk011
     C     k0027         readpe(e) stanys                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd09 = 'N'
     C                   eval      hrc09 = *zeros
 1x  C                   else
     C                   eval      swrd09 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s056                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S056   - Process To Reset File Pointer(BOF) - STANYS
      **************************************************************************
     C     s056          begsr
      *
 1b  C                   if        swrd09 <> 'Y'  and                           RD.SW.STANYS    STIG
     C                             sts09 <> 1122  and                           RCD LOCK
     C                             sts09 <> 1218                                RCD LOCK
      *
     C                   eval      swrd09 = 'Y'
     C                   eval      svs09 = sts09
     C                   eval      kaco02 = *blanks
     C                   eval      kaco02 = rn0030
     C     k0027         setll     stanys
     C                   eval      sts09 = svs09
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S057   - GETREC D.ITMMAST,F.STANYS,*NE,SVK011
      **************************************************************************
     C     s057          begsr
     C                   eval      wfile# = 9
     C                   eval      kaco02 = *blanks
     C                   eval      kaco02 = svk011
     C     k0027         reade(e)  stanys                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd09 = 'N'
     C                   eval      hrc09 = *zeros
 1x  C                   else
     C                   eval      swrd09 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s058                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S058   - Process To Reset File Pointer(EOF) - STANYS
      **************************************************************************
     C     s058          begsr
      *
 1b  C                   if        swrd09 <> 'Y'  and                           RD.SW.STANYS    STIG
     C                             sts09 <> 1122  and                           RCD LOCK
     C                             sts09 <> 1218                                RCD LOCK
      *
     C                   eval      swrd09 = 'Y'
     C                   eval      svs09 = sts09
     C                   eval      kaco02 = *blanks
     C                   eval      kaco02 = rn0030
     C     k0027         setgt     stanys
     C                   eval      sts09 = svs09
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S059   - SETLL D.ITMMAST,F.STIGRP,SVK013,SVK08
      **************************************************************************
     C     s059          begsr
     C                   eval      wfile# = 5
     C                   eval      swrd10 = 'Y'
     C                   eval      swrd06 = 'N'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kico01 = svk013
     C                   eval      hd0011 = svk013
     C                   eval      rn0031 = svk013
     C                   eval      kist02 = svk08
     C                   eval      histig = svk08
     C                   eval      sistig = svk08
      *
     C     k0028         setll(e)  stigrp                                       Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts10 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S060   - GETREC D.ITMMAST,F.STIGRP,*PV,SVK013
      **************************************************************************
     C     s060          begsr
     C                   eval      wfile# = 10
     C                   eval      kico01 = *blanks
     C                   eval      kico01 = svk013
     C     k0029         readpe(e) stigrp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd10 = 'N'
     C                   eval      hrc10 = *zeros
 1x  C                   else
     C                   eval      swrd10 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s061                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S061   - Process To Reset File Pointer(BOF) - STIGRP
      **************************************************************************
     C     s061          begsr
      *
 1b  C                   if        swrd10 <> 'Y'  and                           RD.SW.STIGRP    STOK
     C                             sts10 <> 1122  and                           RCD LOCK
     C                             sts10 <> 1218                                RCD LOCK
      *
     C                   eval      swrd10 = 'Y'
     C                   eval      svs10 = sts10
     C                   eval      kico01 = *blanks
     C                   eval      kico01 = rn0031
     C     k0029         setll     stigrp
     C                   eval      sts10 = svs10
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S062   - GETREC D.ITMMAST,F.STIGRP,*NE,SVK013
      **************************************************************************
     C     s062          begsr
     C                   eval      wfile# = 10
     C                   eval      kico01 = *blanks
     C                   eval      kico01 = svk013
     C     k0029         reade(e)  stigrp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd10 = 'N'
     C                   eval      hrc10 = *zeros
 1x  C                   else
     C                   eval      swrd10 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s063                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S063   - Process To Reset File Pointer(EOF) - STIGRP
      **************************************************************************
     C     s063          begsr
      *
 1b  C                   if        swrd10 <> 'Y'  and                           RD.SW.STIGRP    STOK
     C                             sts10 <> 1122  and                           RCD LOCK
     C                             sts10 <> 1218                                RCD LOCK
      *
     C                   eval      swrd10 = 'Y'
     C                   eval      svs10 = sts10
     C                   eval      kico01 = *blanks
     C                   eval      kico01 = rn0031
     C     k0029         setgt     stigrp
     C                   eval      sts10 = svs10
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S064   - SETLL D.ITMMAST,F.STOKGRP,SVK015,SVK09
      **************************************************************************
     C     s064          begsr
     C                   eval      wfile# = 6
     C                   eval      swrd06 = 'Y'
     C                   eval      swrd11 = 'N'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kgco01 = svk015
     C                   eval      hd0012 = svk015
     C                   eval      rn0032 = svk015
     C                   eval      kgsg02 = svk09
     C                   eval      hgsgrp = svk09
     C                   eval      sgsgrp = svk09
      *
     C     k0030         setll(e)  stokgrp                                      Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts06 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S065   - GETREC D.ITMMAST,F.STOKGRP,*PV,SVK015
      **************************************************************************
     C     s065          begsr
     C                   eval      wfile# = 6
     C                   eval      kgco01 = *blanks
     C                   eval      kgco01 = svk015
     C     k0031         readpe(e) stokgrp                                      Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd06 = 'N'
     C                   eval      hrc06 = *zeros
 1x  C                   else
     C                   eval      swrd06 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s066                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S066   - Process To Reset File Pointer(BOF) - STOKGRP
      **************************************************************************
     C     s066          begsr
      *
 1b  C                   if        swrd06 <> 'Y'  and                           RD.SW.STOKGRP   STVG
     C                             sts06 <> 1122  and                           RCD LOCK
     C                             sts06 <> 1218                                RCD LOCK
      *
     C                   eval      swrd06 = 'Y'
     C                   eval      svs06 = sts06
     C                   eval      kgco01 = *blanks
     C                   eval      kgco01 = rn0032
     C     k0031         setll     stokgrp
     C                   eval      sts06 = svs06
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S067   - GETREC D.ITMMAST,F.STOKGRP,*NE,SVK015
      **************************************************************************
     C     s067          begsr
     C                   eval      wfile# = 6
     C                   eval      kgco01 = *blanks
     C                   eval      kgco01 = svk015
     C     k0031         reade(e)  stokgrp                                      Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd06 = 'N'
     C                   eval      hrc06 = *zeros
 1x  C                   else
     C                   eval      swrd06 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s068                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S068   - Process To Reset File Pointer(EOF) - STOKGRP
      **************************************************************************
     C     s068          begsr
      *
 1b  C                   if        swrd06 <> 'Y'  and                           RD.SW.STOKGRP   STVG
     C                             sts06 <> 1122  and                           RCD LOCK
     C                             sts06 <> 1218                                RCD LOCK
      *
     C                   eval      swrd06 = 'Y'
     C                   eval      svs06 = sts06
     C                   eval      kgco01 = *blanks
     C                   eval      kgco01 = rn0032
     C     k0031         setgt     stokgrp
     C                   eval      sts06 = svs06
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S069   - SETLL D.ITMMAST,F.STVGRP,SVK017,SVK10
      **************************************************************************
     C     s069          begsr
     C                   eval      wfile# = 7
     C                   eval      swrd11 = 'Y'
     C                   eval      swrd12 = 'N'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kgco02 = svk017
     C                   eval      hd0013 = svk017
     C                   eval      rn0034 = svk017
     C                   eval      kgsv03 = svk10
     C                   eval      hd0014 = svk10
     C                   eval      rn0035 = svk10
      *
     C     k0032         setll(e)  stvgrp                                       Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts11 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S070   - GETREC D.ITMMAST,F.STVGRP,*PV,SVK017
      **************************************************************************
     C     s070          begsr
     C                   eval      wfile# = 11
     C                   eval      kgco02 = *blanks
     C                   eval      kgco02 = svk017
     C     k0033         readpe(e) stvgrp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd11 = 'N'
     C                   eval      hrc11 = *zeros
 1x  C                   else
     C                   eval      swrd11 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s071                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S071   - Process To Reset File Pointer(BOF) - STVGRP
      **************************************************************************
     C     s071          begsr
      *
 1b  C                   if        swrd11 <> 'Y'  and                           RD.SW.STVGRP    UOM
     C                             sts11 <> 1122  and                           RCD LOCK
     C                             sts11 <> 1218                                RCD LOCK
      *
     C                   eval      swrd11 = 'Y'
     C                   eval      svs11 = sts11
     C                   eval      kgco02 = *blanks
     C                   eval      kgco02 = rn0034
     C     k0033         setll     stvgrp
     C                   eval      sts11 = svs11
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S072   - GETREC D.ITMMAST,F.STVGRP,*NE,SVK017
      **************************************************************************
     C     s072          begsr
     C                   eval      wfile# = 11
     C                   eval      kgco02 = *blanks
     C                   eval      kgco02 = svk017
     C     k0033         reade(e)  stvgrp                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd11 = 'N'
     C                   eval      hrc11 = *zeros
 1x  C                   else
     C                   eval      swrd11 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s073                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S073   - Process To Reset File Pointer(EOF) - STVGRP
      **************************************************************************
     C     s073          begsr
      *
 1b  C                   if        swrd11 <> 'Y'  and                           RD.SW.STVGRP    UOM
     C                             sts11 <> 1122  and                           RCD LOCK
     C                             sts11 <> 1218                                RCD LOCK
      *
     C                   eval      swrd11 = 'Y'
     C                   eval      svs11 = sts11
     C                   eval      kgco02 = *blanks
     C                   eval      kgco02 = rn0034
     C     k0033         setgt     stvgrp
     C                   eval      sts11 = svs11
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S074   - SETLL D.ITMMAST,F.UOM,SVK019,SVK11
      **************************************************************************
     C     s074          begsr
     C                   eval      wfile# = 8
     C                   eval      swrd12 = 'Y'
     C                   eval      swrd07 = 'N'
      *
     C                   eval      kmco01 = svk019
     C                   eval      hd0015 = svk019
     C                   eval      rn0036 = svk019
     C                   eval      kmuo02 = svk11
     C                   eval      hmuom = svk11
     C                   eval      umuom = svk11
      *
     C     k0034         setll(e)  uom                                          Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts12 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S075   - GETREC D.ITMMAST,F.UOM,*PV,SVK019
      **************************************************************************
     C     s075          begsr
     C                   eval      wfile# = 12
     C                   eval      kmco01 = *blanks
     C                   eval      kmco01 = svk019
     C     k0035         readpe(e) uom                                          Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd12 = 'N'
     C                   eval      hrc12 = *zeros
 1x  C                   else
     C                   eval      swrd12 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s076                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S076   - Process To Reset File Pointer(BOF) - UOM
      **************************************************************************
     C     s076          begsr
      *
 1b  C                   if        swrd12 <> 'Y'  and                           RD.SW.UOM       VATC
     C                             sts12 <> 1122  and                           RCD LOCK
     C                             sts12 <> 1218                                RCD LOCK
      *
     C                   eval      swrd12 = 'Y'
     C                   eval      svs12 = sts12
     C                   eval      kmco01 = *blanks
     C                   eval      kmco01 = rn0036
     C     k0035         setll     uom
     C                   eval      sts12 = svs12
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S077   - GETREC D.ITMMAST,F.UOM,*NE,SVK019
      **************************************************************************
     C     s077          begsr
     C                   eval      wfile# = 12
     C                   eval      kmco01 = *blanks
     C                   eval      kmco01 = svk019
     C     k0035         reade(e)  uom                                          Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd12 = 'N'
     C                   eval      hrc12 = *zeros
 1x  C                   else
     C                   eval      swrd12 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s078                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S078   - Process To Reset File Pointer(EOF) - UOM
      **************************************************************************
     C     s078          begsr
      *
 1b  C                   if        swrd12 <> 'Y'  and                           RD.SW.UOM       VATC
     C                             sts12 <> 1122  and                           RCD LOCK
     C                             sts12 <> 1218                                RCD LOCK
      *
     C                   eval      swrd12 = 'Y'
     C                   eval      svs12 = sts12
     C                   eval      kmco01 = *blanks
     C                   eval      kmco01 = rn0036
     C     k0035         setgt     uom
     C                   eval      sts12 = svs12
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S079   - SETLL D.ITMMAST,F.VATCOD,SVK021,SVK12
      **************************************************************************
     C     s079          begsr
     C                   eval      wfile# = 9
     C                   eval      swrd07 = 'Y'
      *
     C                   eval      kcco02 = svk021
     C                   eval      hd0016 = svk021
     C                   eval      rn0037 = svk021
     C                   eval      kcva03 = svk12
     C                   eval      hcvatc = svk12
     C                   eval      vcvatc = svk12
      *
     C     k0036         setll(e)  vatcod                                       Hi  Lo  Eq90 Repl bi
 1b  C                   if        not %equal                                   Chg Ind 90 to bif
     C                   eval      sts07 = 12
 1e  C                   endif                                                  *IN90=0
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S080   - GETREC D.ITMMAST,F.VATCOD,*PV,SVK021
      **************************************************************************
     C     s080          begsr
     C                   eval      wfile# = 7
     C                   eval      kcco02 = *blanks
     C                   eval      kcco02 = svk021
     C     k0037         readpe(e) vatcod                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd07 = 'N'
     C                   eval      hrc07 = *zeros
 1x  C                   else
     C                   eval      swrd07 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s081                                         CHK BOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S081   - Process To Reset File Pointer(BOF) - VATCOD
      **************************************************************************
     C     s081          begsr
      *
 1b  C                   if        swrd07 <> 'Y'  and                           RD.SW.VATCOD
     C                             sts07 <> 1122  and                           RCD LOCK
     C                             sts07 <> 1218                                RCD LOCK
      *
     C                   eval      swrd07 = 'Y'
     C                   eval      svs07 = sts07
     C                   eval      kcco02 = *blanks
     C                   eval      kcco02 = rn0037
     C     k0037         setll     vatcod
     C                   eval      sts07 = svs07
      *
     C                   eval      msgdta = a1(12)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S082   - GETREC D.ITMMAST,F.VATCOD,*NE,SVK021
      **************************************************************************
     C     s082          begsr
     C                   eval      wfile# = 7
     C                   eval      kcco02 = *blanks
     C                   eval      kcco02 = svk021
     C     k0037         reade(e)  vatcod                                       Lo91Eq90 Repl 4 bif
 1b  C                   if        %eof                                         Set Ind for dou loop
     C                   eval      *in90 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %error                                       Set Ind for dou loop
     C                   eval      *in91 = *on                                  Set Ind for dou loop
 1e  C                   endif                                                  Set Ind for dou loop
 1b  C                   if        %eof or                                      Chg Ind 90 to bif
     C                             %error                                       Chg Ind 91 to bif
     C                   eval      swrd07 = 'N'
     C                   eval      hrc07 = *zeros
 1x  C                   else
     C                   eval      swrd07 = 'Y'
     C                   exsr      smvtow                                       MOVE FLD TO WORK
 1e  C                   endif
      *
     C                   exsr      s083                                         CHK EOF
      *
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S083   - Process To Reset File Pointer(EOF) - VATCOD
      **************************************************************************
     C     s083          begsr
      *
 1b  C                   if        swrd07 <> 'Y'  and                           RD.SW.VATCOD
     C                             sts07 <> 1122  and                           RCD LOCK
     C                             sts07 <> 1218                                RCD LOCK
      *
     C                   eval      swrd07 = 'Y'
     C                   eval      svs07 = sts07
     C                   eval      kcco02 = *blanks
     C                   eval      kcco02 = rn0037
     C     k0037         setgt     vatcod
     C                   eval      sts07 = svs07
      *
     C                   eval      msgdta = a1(13)
     C                   eval      msgact = 'A'
     C                   exsr      smsg                                         GET THE MESSAGE
 1e  C                   endif
     C                   ENDSR
      *
     C/EJECT
      **************************************************************************
      * S003V - Detail Screen for ITMMAST
      * Validation subroutine for -- SC0002
      **************************************************************************
     C     s003v         begsr
      *
     C                   eval      validf = 1
      *
 1b  C                   if        xtitem = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 0
 1x  C                   else
     C                   eval      listf = 1
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTITEM'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0019'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        wk0007 = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 0
 1x  C                   else
     C                   eval      listf = 1
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'WK0007'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0017'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtsupg <> xtitem                             COMPARE TO FIELD.
     C                   eval      ctoff = 1
 1x  C                   else
     C                   eval      ctoff = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSUPG'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        ctoff = 1                                    COMPARE TO FIELD.
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0055'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtsupd <> xtitem                             COMPARE TO FIELD.
     C                   eval      ctoff = 1
 1x  C                   else
     C                   eval      ctoff = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSUPD'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        ctoff = 1                                    COMPARE TO FIELD.
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0054'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtsubs <> xtitem                             COMPARE TO FIELD.
     C                   eval      ctoff = 1
 1x  C                   else
     C                   eval      ctoff = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSUBS'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        ctoff = 1                                    COMPARE TO FIELD.
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0053'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtweig <= n1(1)  and                         HIGH VALUE
     C                             xtweig >= n1(2)                              LOW VALUE
     C                   eval      rangef = 1
 1x  C                   else
     C                   eval      rangef = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTWEIG'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        rangef = 1                                   RANGE CHECK
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0067'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0005         chain(e)  itmclas                                      Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTCLAS'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        existf = 1                                   FIELD EXISTENCE CHEC
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0005'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0006         chain(e)  stokgrp                                      Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTIGRP'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        existf = 1                                   FIELD EXISTENCE CHEC
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0047'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0007         chain(e)  uom                                          Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtuom = a1(1)                                LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTUOM'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0061'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtpack <= n1(3)  and                         HIGH VALUE
     C                             xtpack >= n1(2)                              LOW VALUE
     C                   eval      rangef = 1
 1x  C                   else
     C                   eval      rangef = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTPACK'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        rangef = 1                                   RANGE CHECK
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0035'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0008         chain(e)  uom                                          Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtuomo = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTUOMO'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0061'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtqtyo <= n1(4)  and                         HIGH VALUE
     C                             xtqtyo >= n1(2)                              LOW VALUE
     C                   eval      rangef = 1
 1x  C                   else
     C                   eval      rangef = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTQTYO'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        rangef = 1                                   RANGE CHECK
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0041'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtpall = a1(2)  or                           LST VALID/INVALID VA
     C                             xtpall = a1(3)  or                           VALID VALUE
     C                             xtpall = a1(1)                               VALID VALUE
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTPALL'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0036'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0009         chain(e)  vatcod                                       Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtvatc = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTVATC'
     C                   eval      fldscr = 'SC0002'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0065'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        validf <> 1
     C                   eval      lin = *zeros
     C                   eval      pos = *zeros
 1e  C                   endif
      *
     C                   ENDSR
      **************************************************************************
     C/EJECT
      **************************************************************************
      * S004V - Detail Screen for ITMMAST
      * Validation subroutine for -- SUP014
      **************************************************************************
     C     s004v         begsr
      *
     C                   eval      validf = 1
      *
     C     k0017         chain(e)  itmtyp                                       Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtityp = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTITYP'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0020'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0018         chain(e)  stanys                                       Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtsanl = a1(1)                               LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSANL'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0046'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0019         chain(e)  stvgrp                                       Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtsvg = a1(1)                                LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSVG'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0057'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
     C     k0020         chain(e)  stigrp                                       Hi90Lo   Repl 4 bif
      *
 1b  C                   if        not %found                                   Chg Ind 90 to bif
     C                   eval      existf = 0
 1x  C                   else                                                   Chain sucessful
     C                   eval      existf = 1
 1e  C                   endif
      *
 1b  C                   if        xtsig = a1(1)                                LST VALID/INVALID VA
     C                   eval      listf = 1
 1x  C                   else
     C                   eval      listf = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSIG'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        existf = 1  or                               FIELD EXISTENCE CHEC
     C                             listf = 1                                    LST VALID/INVALID VA
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FIL0049'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtlprc <= n1(5)  and                         HIGH VALUE
     C                             xtlprc >= n1(2)                              LOW VALUE
     C                   eval      rangef = 1
 1x  C                   else
     C                   eval      rangef = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTLPRC'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        rangef = 1                                   RANGE CHECK
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0023'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        xtstuc <= n1(5)  and                         HIGH VALUE
     C                             xtstuc >= n1(2)                              LOW VALUE
     C                   eval      rangef = 1
 1x  C                   else
     C                   eval      rangef = 0
 1e  C                   endif
      *
     C                   eval      fldinx = 0
     C                   eval      fldnam = 'XTSTUC'
     C                   eval      fldscr = 'SUP014'
 1b  C                   if        rangef = 1                                   RANGE CHECK
     C                   eval      dsperr = 'R'
     C                   exsr      satrib
 1x  C                   else
     C                   eval      validf = 0
     C                   eval      msgid = *blanks
     C                   eval      msgf = *blanks
     C                   eval      msgfl = *blanks
     C                   eval      msgdta = *blanks
     C                   eval      msgact = 'A'
     C                   eval      msgid = 'FLD0052'
     C                   eval      msgf = 'ERRORS'
     C                   exsr      smsg                                         Exsr error handler
     C                   eval      dsperr = 'X'
     C                   exsr      satrib
 1e  C                   endif
      *
 1b  C                   if        validf <> 1
     C                   eval      lin = *zeros
     C                   eval      pos = *zeros
 1e  C                   endif
      *
     C                   ENDSR
      **************************************************************************
     C/EJECT
      *****************************************************************
      * *PSSR - Program Execution Errors Handler
      *****************************************************************
     C     *pssr         begsr
 1b  C                   if        uercnt <> *zero
     C                   eval      ursume = '*CANCL'
 1x  C                   else
     C                   eval      uercnt = 1
     C                   eval      msgact = 'R'
     C                   eval      msgf = *blanks
     C                   eval      msgf = 'QCPFMSG'
     C                   eval      msgfl = *blanks
     C                   eval      msgfl = 'QSYS'
     C                   eval      msgdta = *blanks
 2b  C                   if        umsgtx <> *blanks
     C                   eval      msgdta = umsgtx
 2x  C                   else
     C                   eval      msgdta = uroutn
 2e  C                   endif
      *
 2b  C                   if        ustat = *zeros
     C                   eval      ustat = %dec(ufstat:5:0)                     Check conversion
     C                   eval      usrcln = ufsrcl
 2e  C                   endif
     C                   eval      ustat4 = %char(ustat)                        << Conv to Alpha
      *
 2b  C                   if        msgid = *blanks
     C                   evalr     msgid = ustat4                               Check conversion
     C                   eval      msgid = 'RPG'
     C                   eval      msgf = 'QRPGMSGE'
 2e  C                   endif
      *
      *
     C                   callp     p_CLMSG(
     C                             msgact:
     C                             msgid:
     C                             msgf:
     C                             msgfl:
     C                             msgdta)
      *
      *                  call      'CLMSG'       pmsgcl                   93
      *
     C                   eval      ueropt = '1'
     C                   exfmt     pssr0001
      *
 2b  C                   if        ueropt = '1'
     C                   eval      ursume = '*GETIN  '
 2x  C                   else
 3b  C                   if        ueropt = '2'
     C                   eval      ursume = '*CANCL  '
 3x  C                   else
 4b  C                   if        ueropt = '3'
     C                   evalr     ursume = '        '                          Check conversion
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
      *
     C                   eval      msgid = *blanks
     C                   eval      uercnt = *zeros
      *
     C                   ENDSR
      */EJECT
      *****************************************************************
      * SCLF   - CLF : Cursor Location On Field Handler
      *****************************************************************
      /COPY QRPGLESRC,SCLF
      */EJECT
      *****************************************************************
      * SATRIB - Display Attribute Handler
      *****************************************************************
      /COPY QRPGLESRC,SATRIB
     C/EJECT
      *****************************************************************
      * SLOCK - Update Lock Flag
      *****************************************************************
     C     slock         begsr
 1b  C                   if        sts04 = 1218  or                             LOCK(SYS)-ITMMAST
     C                             sts04 = 1122                                 LOCK(ASSET)
     C                   eval      lck04 = *zeros
 1x  C                   else
     C                   eval      lck04 = 1
 1e  C                   endif
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SEXCP - Dummy EXCPT(s) and Read(s)
      *****************************************************************
     C     sexcp         begsr
     C                   read(e)   orddet5                                      Lo  Eq90 Repl 4 bif
     C                   read(e)   file0001                                     Lo  Eq90 Repl 4 bif
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SFERR - File Exception Handler
      *****************************************************************
     C     sferr         begsr
     C                   eval      msgflg = 'Y'
 1b  C                   if        wfile# = 1                                   ITMMAST1
 2b  C                   if        sts01 = 1218                                 LOCK(SYS)
     C                   eval      sts01 = 1122
 2x  C                   else
 3b  C                   if        sts01 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts01 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 2                                   COMPANY
 2b  C                   if        sts02 = 1218                                 LOCK(SYS)
     C                   eval      sts02 = 1122
 2x  C                   else
 3b  C                   if        sts02 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts02 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 3                                   IMSCPYD
 2b  C                   if        sts03 = 1218                                 LOCK(SYS)
     C                   eval      sts03 = 1122
 2x  C                   else
 3b  C                   if        sts03 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts03 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 4                                   ITMMAST
 2b  C                   if        sts04 = 1218                                 LOCK(SYS)
     C                   eval      sts04 = 1122
 2x  C                   else
 3b  C                   if        sts04 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts04 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 5                                   ITMCLAS
 2b  C                   if        sts05 = 1218                                 LOCK(SYS)
     C                   eval      sts05 = 1122
 2x  C                   else
 3b  C                   if        sts05 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts05 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 6                                   STOKGRP
 2b  C                   if        sts06 = 1218                                 LOCK(SYS)
     C                   eval      sts06 = 1122
 2x  C                   else
 3b  C                   if        sts06 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts06 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 7                                   VATCOD
 2b  C                   if        sts07 = 1218                                 LOCK(SYS)
     C                   eval      sts07 = 1122
 2x  C                   else
 3b  C                   if        sts07 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts07 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 8                                   ITMTYP
 2b  C                   if        sts08 = 1218                                 LOCK(SYS)
     C                   eval      sts08 = 1122
 2x  C                   else
 3b  C                   if        sts08 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts08 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 9                                   STANYS
 2b  C                   if        sts09 = 1218                                 LOCK(SYS)
     C                   eval      sts09 = 1122
 2x  C                   else
 3b  C                   if        sts09 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts09 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 10                                  STIGRP
 2b  C                   if        sts10 = 1218                                 LOCK(SYS)
     C                   eval      sts10 = 1122
 2x  C                   else
 3b  C                   if        sts10 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts10 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 11                                  STVGRP
 2b  C                   if        sts11 = 1218                                 LOCK(SYS)
     C                   eval      sts11 = 1122
 2x  C                   else
 3b  C                   if        sts11 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts11 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 12                                  UOM
 2b  C                   if        sts12 = 1218                                 LOCK(SYS)
     C                   eval      sts12 = 1122
 2x  C                   else
 3b  C                   if        sts12 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts12 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 13                                  ORDDET5
 2b  C                   if        sts13 = 1218                                 LOCK(SYS)
     C                   eval      sts13 = 1122
 2x  C                   else
 3b  C                   if        sts13 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts13 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
 1b  C                   if        wfile# = 14                                  WAREDETR1
 2b  C                   if        sts14 = 1218                                 LOCK(SYS)
     C                   eval      sts14 = 1122
 2x  C                   else
 3b  C                   if        sts14 = 1211                                 CLOSED FILE
     C                   exsr      *pssr
 3x  C                   else
     C                   eval      sts14 = 1121
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SMVTOF - Move Fields From Work Area To File(s)
      *****************************************************************
     C     smvtof        begsr
      *          ------------------------------------------------------
      *          | Move Fields From Work Area To File - ITMMAST
      *          ------------------------------------------------------
 1b  C                   if        wfile# = 04
     C                   eval      rn0020 = wk0005
     C                   eval      italpha = rn0020
     C                   eval      itclas = xtclas
     C                   eval      rn0021 = wk0006
     C                   eval      itcoyno = rn0021
     C                   eval      itcrtu = xtcrtu
     C                   eval      itdtcr = wtdtcr
     C                   eval      itdtlm = wtdtlm
     C                   eval      rn0022 = wk0007
     C                   eval      itidesc = rn0022
     C                   eval      itigrp = xtigrp
     C                   eval      ititem = xtitem
     C                   eval      itityp = xtityp
     C                   eval      itlmby = xtlmby
     C                   eval      itlprc = xtlprc
     C                   eval      itmanf = xtmanf
     C                   eval      itnlac = xtnlac
     C                   eval      itnlas = xtnlas
     C                   eval      itnlst = xtnlst
     C                   eval      itpack = xtpack
     C                   eval      itpall = xtpall
     C                   eval      itqtyo = xtqtyo
     C                   eval      itsanl = xtsanl
     C                   eval      itsig = xtsig
     C                   eval      itstuc = xtstuc
     C                   eval      itsubs = xtsubs
     C                   eval      itsupd = xtsupd
     C                   eval      itsupg = xtsupg
     C                   eval      itsvg = xtsvg
     C                   eval      itudf1 = xtudf1
     C                   eval      itudf2 = xtudf2
     C                   eval      itudf3 = xtudf3
     C                   eval      ituom = xtuom
     C                   eval      ituomo = xtuomo
     C                   eval      itvatc = xtvatc
     C                   eval      itweig = xtweig
 1e  C                   endif
     C                   ENDSR
     C/EJECT
      *****************************************************************
      * SMVTOW - Move Fields From File(s) To Work Area
      *****************************************************************
     C     smvtow        begsr
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - ITMMAST1
      *          ------------------------------------------------------
 1b  C                   if        wfile# = 01
     C                   eval      rn0023 = italpha
     C                   eval      rn0024 = itcoyno
     C                   eval      rn0025 = itidesc
     C                   eval      wk0008 = rn0023
     C                   eval      wk0009 = rn0024
     C                   eval      wk0010 = rn0025
     C                   eval      wk0011 = ititem
     C                   eval      hrc01 = rec01
     C                   eval      hd0006 = rn0024
     C                   eval      hd0005 = rn0023
     C                   eval      hd0007 = ititem
 1x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - COMPANY
      *          ------------------------------------------------------
 2b  C                   if        wfile# = 02
     C                   eval      rn0009 = cycoyno
     C                   eval      xydesc = cydesc
     C                   eval      wydfmt = cydfmt
     C                   eval      wydsep = cydsep
     C                   eval      hrc02 = rec02
     C                   eval      hd0001 = rn0009
 2x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - IMSCPYD
      *          ------------------------------------------------------
 3b  C                   if        wfile# = 03
     C                   eval      rn0015 = cdcoyno
     C                   eval      rn0016 = cdhead1
     C                   eval      rn0017 = cdhead2
     C                   eval      rn0018 = cdhead3
     C                   eval      wk0001 = rn0016
     C                   eval      wk0002 = rn0017
     C                   eval      wk0003 = rn0018
     C                   eval      hrc03 = rec03
     C                   eval      hd0002 = rn0015
 3x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - ITMMAST
      *          ------------------------------------------------------
 4b  C                   if        wfile# = 04
     C                   eval      rn0020 = italpha
     C                   eval      wk0005 = rn0020
     C                   eval      xtclas = itclas
     C                   eval      rn0021 = itcoyno
     C                   eval      wk0006 = rn0021
     C                   eval      xtcrtu = itcrtu
     C                   eval      wtdtcr = itdtcr
     C                   eval      wtdtlm = itdtlm
     C                   eval      rn0022 = itidesc
     C                   eval      wk0007 = rn0022
     C                   eval      xtigrp = itigrp
     C                   eval      xtitem = ititem
     C                   eval      xtityp = itityp
     C                   eval      xtlmby = itlmby
     C                   eval      xtlprc = itlprc
     C                   eval      xtmanf = itmanf
     C                   eval      xtnlac = itnlac
     C                   eval      xtnlas = itnlas
     C                   eval      xtnlst = itnlst
     C                   eval      xtpack = itpack
     C                   eval      xtpall = itpall
     C                   eval      xtqtyo = itqtyo
     C                   eval      xtsanl = itsanl
     C                   eval      xtsig = itsig
     C                   eval      xtstuc = itstuc
     C                   eval      xtsubs = itsubs
     C                   eval      xtsupd = itsupd
     C                   eval      xtsupg = itsupg
     C                   eval      xtsvg = itsvg
     C                   eval      xtudf1 = itudf1
     C                   eval      xtudf2 = itudf2
     C                   eval      xtudf3 = itudf3
     C                   eval      xtuom = ituom
     C                   eval      xtuomo = ituomo
     C                   eval      xtvatc = itvatc
     C                   eval      xtweig = itweig
     C                   eval      hrc04 = rec04
     C                   eval      hd0004 = rn0021
     C                   eval      htitem = ititem
 4x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - ITMCLAS
      *          ------------------------------------------------------
 5b  C                   if        wfile# = 05
     C                   eval      rn0019 = iccoyno
     C                   eval      wcclas = icclas
     C                   eval      wk0004 = rn0019
     C                   eval      xcdesc = icdesc
     C                   eval      hrc05 = rec05
     C                   eval      hd0003 = rn0019
     C                   eval      hcclas = icclas
 5x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - STOKGRP
      *          ------------------------------------------------------
 6b  C                   if        wfile# = 06
     C                   eval      rn0032 = sgcoyno
     C                   eval      rn0033 = sgsdesc
     C                   eval      wk0016 = rn0032
     C                   eval      wk0017 = rn0033
     C                   eval      wgsgrp = sgsgrp
     C                   eval      hrc06 = rec06
     C                   eval      hd0012 = rn0032
     C                   eval      hgsgrp = sgsgrp
 6x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - VATCOD
      *          ------------------------------------------------------
 7b  C                   if        wfile# = 07
     C                   eval      rn0037 = vccoyno
     C                   eval      wk0021 = rn0037
     C                   eval      wk0022 = vcdesc
     C                   eval      wcvatc = vcvatc
     C                   eval      hrc07 = rec07
     C                   eval      hd0016 = rn0037
     C                   eval      hcvatc = vcvatc
 7x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - ITMTYP
      *          ------------------------------------------------------
 8b  C                   if        wfile# = 08
     C                   eval      rn0026 = bacoyno
     C                   eval      wk0012 = rn0026
     C                   eval      xadesc = badesc
     C                   eval      waityp = baityp
     C                   eval      hrc08 = rec08
     C                   eval      hd0008 = rn0026
     C                   eval      haityp = baityp
 8x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - STANYS
      *          ------------------------------------------------------
 9b  C                   if        wfile# = 09
     C                   eval      rn0030 = sacoyno
     C                   eval      wk0013 = rn0030
     C                   eval      wk0014 = sadesc
     C                   eval      wasanl = sasanl
     C                   eval      hrc09 = rec09
     C                   eval      hd0010 = rn0030
     C                   eval      hasanl = sasanl
 9x  C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - STIGRP
      *          ------------------------------------------------------
 10b C                   if        wfile# = 10
     C                   eval      rn0031 = sicoyno
     C                   eval      wk0015 = rn0031
     C                   eval      xidesc = sidesc
     C                   eval      wistig = sistig
     C                   eval      hrc10 = rec10
     C                   eval      hd0011 = rn0031
     C                   eval      histig = sistig
 10x C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - STVGRP
      *          ------------------------------------------------------
 11b C                   if        wfile# = 11
     C                   eval      rn0034 = vgcoyno
     C                   eval      rn0035 = vgsvalg
     C                   eval      wk0018 = rn0034
     C                   eval      xgdesc = vgdesc
     C                   eval      wk0019 = rn0035
     C                   eval      hrc11 = rec11
     C                   eval      hd0013 = rn0034
     C                   eval      hd0014 = rn0035
 11x C                   else
      *          ------------------------------------------------------
      *          | Move Fields From File To Work Area - UOM
      *          ------------------------------------------------------
 12b C                   if        wfile# = 12
     C                   eval      rn0036 = umcoyno
     C                   eval      wk0020 = rn0036
     C                   eval      wmqtyo = umqtyo
     C                   eval      wmuom = umuom
     C                   eval      hrc12 = rec12
     C                   eval      hd0015 = rn0036
     C                   eval      hmuom = umuom
 12e C                   endif
 11e C                   endif
 10e C                   endif
 9e  C                   endif
 8e  C                   endif
 7e  C                   endif
 6e  C                   endif
 5e  C                   endif
 4e  C                   endif
 3e  C                   endif
 2e  C                   endif
 1e  C                   endif
     C                   ENDSR
     C/EJECT
      ********************************************************************
      *            C o m p i l e   T i m e   A r r a y
      *               I n i t i a l i z a t i o n
      ********************************************************************
**   Alpha Constant Array - A1

Y
N
Record cannot be deleted/updated because ITMMAST owns or is referred by ORDDET5.
DEL0001-Cannot delete item used in warehouse
Record deleted from file IMS Item master             IT
NO RECORD FOUND TO de1ete FROM FILE IMS ITEM MASTER             IT              -delete - replaced
Record update for file IMS Item master             IT
Unable to update record for file IMS Item master             IT
Record added to file IMS Item master             IT
Unable to add record to file IMS Item master             IT
The beginning of the file was reached
The end of the file was reached
**   Numeric Constant Array - N1
000000000099999999999990000000
000000000000000000000000000000
000000000000000099999000000000
000000000000999999999000000000
000000000000009999999999900000
**   CURSOR LOCATION ON FIELD MAP ARRAY - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    XTCLAS    000010731075
SC0002    XTIGRP    000011531155
SC0002    XTUOM     000012331237
SC0002    XTUOMO    000013931397
SC0002    XTVATC    000016331634
SUP014    XTITYP    000009890989
SUP014    XTSANL    000010691069
SUP014    XTSIG     000012291230
SUP014    XTSVG     000011491149
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCALPH    XYDESC    0000  07      07
SCALPH    WK0010    0000  05      05
SCALPH    WK0011    0000  06      06
SC0001    XYDESC    0000  06      06
SC0001    XTITEM    0000  05      05
SC0002    XYDESC    0000  20      20
SC0002    XTCLAS    0000  05      05
SC0002    WK0007    0000  03      03
SC0002    XTIGRP    0000  06      06
SC0002    XTITEM    0000  0709    07  08
SC0002    XTPACK    0000  10      10
SC0002    XTPALL    0000  11      11
SC0002    XTQTYO    0000  12      12
SC0002    XTSUBS    0000  13      13
SC0002    XTSUPD    0000  14      14
SC0002    XTSUPG    0000  15      15
SC0002    XTUOM     0000  16      16
SC0002    XTUOMO    0000  17      17
SC0002    XTVATC    0000  18      18
SC0002    XTWEIG    0000  19      19
SC0002    WK0022    0000  04      04
SUP014    XYDESC    0000  13      13
SUP014    WK0007    0000  03      03
SUP014    XTITEM    0000  06      06
SUP014    XTITYP    0000  07      07
SUP014    XTLPRC    0000  08      08
SUP014    XTSANL    0000  09      09
SUP014    XTSIG     0000  10      10
SUP014    XTSTUC    0000  11      11
SUP014    XTSVG     0000  12      12
SUP014    XADESC    0000  05      05
SUP014    WK0014    0000  04      04
SCALPH    FL0002    0000  0103    010402               Y
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
SC0007    T14       0001            0201
SC0007    T14       0002            0403
SC0007    T14       0003            0605
SC0007    T14       0004            0807
SC0007    T14       0005            1009
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
SC0010    T23       0001            0201
SC0010    T23       0002            0403
SC0010    T23       0003            0605
SC0010    T23       0004            0807
SC0010    T23       0005            1009
SC0011    T26       0001            0201
SC0011    T26       0002            0403
SC0011    T26       0003            0605
SC0011    T26       0004            0807
SC0011    T26       0005            1009
SC0012    T29       0001            0201
SC0012    T29       0002            0403
SC0012    T29       0003            0605
SC0012    T29       0004            0807
SC0012    T29       0005            1009
SUP014    INPUT2    0000    02        01
