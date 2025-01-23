     F/TITLE MSTOKMOV     Enter Stock Movements
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MSTOKMOV
     F*  Application ID      -    MSTOKMOV
     F*  Application Name    -        Enter Stock Movements
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  SUPLIER1    - (I/DISK   ) IMS Name seq
     F*  WAREHED     - (I/DISK   ) IMS Warehouse Header        WH
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  WLOCITM     - (U/DISK   ) IMS Warehouse Location Item WI
     F*  EXPDEL      - (I/DISK   ) IMS Expected Deliveries     ED
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  STOKMOV     - (I/DISK   ) IMS Stock movement history  ST
     F*  WARELOC     - (I/DISK   ) IMS Warehouse Locations     WL
     F*  SECITP      - (I/DISK   ) IMS User allowed types      UT
     F*  SECIMS      - (I/DISK   ) IMS User Security           US
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  EXPDELX     - (U/DISK   ) IMS Expected Deliveries     ED
     F*  STOKMOVX    - (U/DISK   ) IMS Stock movement history  ST
     F*  MSTOKMOVD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCALOC     -         Allocate screen
     F*
     F*  01     - SCR010 / ITSUBS : DSPATR(PC)
     F*  01     - SCR010 / ITSUBS : DSPATR(RI)
     F*  02     - SCR010 / ITSUPG : DSPATR(PC)
     F*  02     - SCR010 / ITSUPG : DSPATR(RI)
     F* N79     - SCR010 PUTOVR
     F*
     F*  SCLOCT     -   List of Locations for Item
     F*
     F*  01     - SCR009 / T14 : DSPATR(PR)
     F*  02     - SCR009 / T14 : DSPATR(ND)
     F*  03     - SCR009 / T14 : DSPATR(PR)
     F*  04     - SCR009 / T14 : DSPATR(ND)
     F*  05     - SCR009 / T14 : DSPATR(PR)
     F*  06     - SCR009 / T14 : DSPATR(ND)
     F*  07     - SCR009 / T14 : DSPATR(PR)
     F*  08     - SCR009 / T14 : DSPATR(ND)
     F*  09     - SCR009 / T14 : DSPATR(PR)
     F*  10     - SCR009 / T14 : DSPATR(ND)
     F*  11     - SCR009 / STITEM : DSPATR(PC)
     F*  11     - SCR009 / STITEM : DSPATR(RI)
     F*  12     - SCR009 / STWHSE : DSPATR(PC)
     F*  12     - SCR009 / STWHSE : DSPATR(RI)
     F*  80     - SCR009 / T14 : DSPATR(PC)
     F*  80     - SCR009 / T14 : DSPATR(PC)
     F*  80     - SCR009 / T14 : DSPATR(PC)
     F*  80     - SCR009 / T14 : DSPATR(PC)
     F*  80     - SCR009 / T14 : DSPATR(PC)
     F* N79     - SCR009 PUTOVR
     F*
     F*  SCSALP     -   List Suppliers in Alpha Seq
     F*
     F*  01     - SCR012 / T07 : DSPATR(PR)
     F*  02     - SCR012 / T07 : DSPATR(ND)
     F*  03     - SCR012 / T07 : DSPATR(PR)
     F*  04     - SCR012 / T07 : DSPATR(ND)
     F*  05     - SCR012 / T07 : DSPATR(PR)
     F*  06     - SCR012 / T07 : DSPATR(ND)
     F*  07     - SCR012 / T07 : DSPATR(PR)
     F*  08     - SCR012 / T07 : DSPATR(ND)
     F*  09     - SCR012 / T07 : DSPATR(PR)
     F*  10     - SCR012 / T07 : DSPATR(ND)
     F*  80     - SCR012 / T07 : DSPATR(PC)
     F*  80     - SCR012 / T07 : DSPATR(PC)
     F*  80     - SCR012 / T07 : DSPATR(PC)
     F*  80     - SCR012 / T07 : DSPATR(PC)
     F*  80     - SCR012 / T07 : DSPATR(PC)
     F* N79     - SCR012 PUTOVR
     F*
     F*  SCWHST     -       List of Warehouses
     F*
     F*  01     - SCR008 / T04 : DSPATR(PR)
     F*  02     - SCR008 / T04 : DSPATR(ND)
     F*  03     - SCR008 / T04 : DSPATR(PR)
     F*  04     - SCR008 / T04 : DSPATR(ND)
     F*  05     - SCR008 / T04 : DSPATR(PR)
     F*  06     - SCR008 / T04 : DSPATR(ND)
     F*  07     - SCR008 / T04 : DSPATR(PR)
     F*  08     - SCR008 / T04 : DSPATR(ND)
     F*  09     - SCR008 / T04 : DSPATR(PR)
     F*  10     - SCR008 / T04 : DSPATR(ND)
     F*  80     - SCR008 / T04 : DSPATR(PC)
     F*  80     - SCR008 / T04 : DSPATR(PC)
     F*  80     - SCR008 / T04 : DSPATR(PC)
     F*  80     - SCR008 / T04 : DSPATR(PC)
     F*  80     - SCR008 / T04 : DSPATR(PC)
     F* N79     - SCR008 PUTOVR
     F*
     F*  SC0001     - List Screen for IMSTRN
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
     F*  SC0002     - Detail Screen for STOKMOV
     F*
     F*  01     - SCR002 / FL0023 : DSPATR(PC)
     F*  01     - SCR002 / FL0023 : DSPATR(RI)
     F*  02     - SCR002 / FL0023 : DSPATR(UL)
     F*  03     - SCR002 / STLOCT : DSPATR(PR)
     F*  04     - SCR002 / *CNST* : DSPATR(ND)
     F*  04     - SCR002 / *CNST* : DSPATR(ND)
     F*  04     - SCR002 / STLOCT : DSPATR(ND)
     F*  04     - SCR002 / STWHST : DSPATR(ND)
     F*  05     - SCR002 / EDCARR : DSPATR(PR)
     F*  05     - SCR002 / RN0035 : DSPATR(PR)
     F*  05     - SCR002 / RN0037 : DSPATR(PR)
     F*  05     - SCR002 / STTIME : DSPATR(PR)
     F*  06     - SCR002 / *CNST* : DSPATR(ND)
     F*  06     - SCR002 / *CNST* : DSPATR(ND)
     F*  06     - SCR002 / *CNST* : DSPATR(ND)
     F*  06     - SCR002 / EDCARR : DSPATR(ND)
     F*  06     - SCR002 / RN0035 : DSPATR(ND)
     F*  06     - SCR002 / RN0037 : DSPATR(ND)
     F*  06     - SCR002 / STTIME : DSPATR(ND)
     F*  07     - SCR002 / RN0032 : DSPATR(PC)
     F*  07     - SCR002 / RN0032 : DSPATR(RI)
     F*  08     - SCR002 / RN0037 : DSPATR(PC)
     F*  08     - SCR002 / RN0037 : DSPATR(RI)
     F*  09     - SCR002 / RN0037 : DSPATR(UL)
     F*  10     - SCR002 / TTDESC : DSPATR(PC)
     F*  10     - SCR002 / TTDESC : DSPATR(RI)
     F*  11     - SCR002 / STITEM : DSPATR(PC)
     F*  11     - SCR002 / STITEM : DSPATR(RI)
     F*  12     - SCR002 / STITEM : DSPATR(UL)
     F*  13     - SCR002 / STLOCN : DSPATR(PC)
     F*  13     - SCR002 / STLOCN : DSPATR(RI)
     F*  14     - SCR002 / STLOCN : DSPATR(UL)
     F*  15     - SCR002 / STLOCT : DSPATR(PC)
     F*  15     - SCR002 / STLOCT : DSPATR(RI)
     F*  16     - SCR002 / STLOCT : DSPATR(UL)
     F*  17     - SCR002 / STTIME : DSPATR(PC)
     F*  17     - SCR002 / STTIME : DSPATR(RI)
     F*  18     - SCR002 / STTIME : DSPATR(UL)
     F*  19     - SCR002 / STTQTY : DSPATR(PC)
     F*  19     - SCR002 / STTQTY : DSPATR(RI)
     F*  20     - SCR002 / STTQTY : DSPATR(UL)
     F*  21     - SCR002 / STTREF : DSPATR(PC)
     F*  21     - SCR002 / STTREF : DSPATR(RI)
     F*  22     - SCR002 / STTREF : DSPATR(UL)
     F*  23     - SCR002 / STUCST : DSPATR(PC)
     F*  23     - SCR002 / STUCST : DSPATR(RI)
     F*  24     - SCR002 / STUCST : DSPATR(UL)
     F*  25     - SCR002 / STWEIG : DSPATR(PC)
     F*  25     - SCR002 / STWEIG : DSPATR(RI)
     F*  26     - SCR002 / STWEIG : DSPATR(UL)
     F*  27     - SCR002 / STWHSE : DSPATR(PC)
     F*  27     - SCR002 / STWHSE : DSPATR(RI)
     F*  28     - SCR002 / STWHSE : DSPATR(PR)
     F*  29     - SCR002 / STWHSE : DSPATR(UL)
     F*  30     - SCR002 / STWHST : DSPATR(PC)
     F*  30     - SCR002 / STWHST : DSPATR(RI)
     F*  31     - SCR002 / STWHST : DSPATR(PR)
     F*  32     - SCR002 / STWHST : DSPATR(UL)
     F*  33     - SCR002 / CYDESC : DSPATR(PC)
     F*  33     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     -   List of Items In Warehouse
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
     F*  11     - SCR003 / STWHSE : DSPATR(PC)
     F*  11     - SCR003 / STWHSE : DSPATR(RI)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F*  80     - SCR003 / T01 : DSPATR(PC)
     F* N79     - SCR003 PUTOVR
     F*
     F*  SC0004     -       List of Warehouses
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
     F*  SC0005     - List of Locations in Warehouse
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
     F*  11     - SCR005 / STWHSE : DSPATR(PC)
     F*  11     - SCR005 / STWHSE : DSPATR(RI)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F*  80     - SCR005 / T07 : DSPATR(PC)
     F* N79     - SCR005 PUTOVR
     F*
     F*  SC0006     -   List of Items in Location
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
     F*  11     - SCR006 / STLOCN : DSPATR(PC)
     F*  11     - SCR006 / STLOCN : DSPATR(RI)
     F*  12     - SCR006 / STWHSE : DSPATR(PC)
     F*  12     - SCR006 / STWHSE : DSPATR(RI)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F*  80     - SCR006 / T10 : DSPATR(PC)
     F* N79     - SCR006 PUTOVR
     F*
     F*  SC0007     -   List of Locations for Item
     F*
     F*  01     - SCR007 / T14 : DSPATR(PR)
     F*  02     - SCR007 / T14 : DSPATR(ND)
     F*  03     - SCR007 / T14 : DSPATR(PR)
     F*  04     - SCR007 / T14 : DSPATR(ND)
     F*  05     - SCR007 / T14 : DSPATR(PR)
     F*  06     - SCR007 / T14 : DSPATR(ND)
     F*  07     - SCR007 / T14 : DSPATR(PR)
     F*  08     - SCR007 / T14 : DSPATR(ND)
     F*  09     - SCR007 / T14 : DSPATR(PR)
     F*  10     - SCR007 / T14 : DSPATR(ND)
     F*  11     - SCR007 / STITEM : DSPATR(PC)
     F*  11     - SCR007 / STITEM : DSPATR(RI)
     F*  12     - SCR007 / STWHSE : DSPATR(PC)
     F*  12     - SCR007 / STWHSE : DSPATR(RI)
     F*  80     - SCR007 / T14 : DSPATR(PC)
     F*  80     - SCR007 / T14 : DSPATR(PC)
     F*  80     - SCR007 / T14 : DSPATR(PC)
     F*  80     - SCR007 / T14 : DSPATR(PC)
     F*  80     - SCR007 / T14 : DSPATR(PC)
     F* N79     - SCR007 PUTOVR
     F*
     F*  SC0015     -         List Suppliers
     F*
     F*  01     - SCR011 / T07 : DSPATR(PR)
     F*  02     - SCR011 / T07 : DSPATR(ND)
     F*  03     - SCR011 / T07 : DSPATR(PR)
     F*  04     - SCR011 / T07 : DSPATR(ND)
     F*  05     - SCR011 / T07 : DSPATR(PR)
     F*  06     - SCR011 / T07 : DSPATR(ND)
     F*  07     - SCR011 / T07 : DSPATR(PR)
     F*  08     - SCR011 / T07 : DSPATR(ND)
     F*  09     - SCR011 / T07 : DSPATR(PR)
     F*  10     - SCR011 / T07 : DSPATR(ND)
     F*  80     - SCR011 / T07 : DSPATR(PC)
     F*  80     - SCR011 / T07 : DSPATR(PC)
     F*  80     - SCR011 / T07 : DSPATR(PC)
     F*  80     - SCR011 / T07 : DSPATR(PC)
     F*  80     - SCR011 / T07 : DSPATR(PC)
     F* N79     - SCR011 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for IMSTRN
     F* S002 - Detail Screen for STOKMOV
     F* S003 -   List of Items In Warehouse
     F* S004 -       List of Warehouses
     F* S005 - List of Locations in Warehouse
     F* S006 -   List of Items in Location
     F* S007 -   List of Locations for Item
     F* S008 -       List of Warehouses
     F* S009 -   List of Locations for Item
     F* S010 -         Allocate screen
     F* S011 -         List Suppliers
     F* S012 -   List Suppliers in Alpha Seq
     F* SPBACT - Performs all the program begin actions.
     F* SREDSP -  Redisplay Windows within stack.
     F* SYSDAT - System Date
     F* S01BKW - SCRN SUB
     F* S01EDT - SCRN SUB
     F* S01FWD - SCRN SUB
     F* S03ABR - SCRN SUB
     F* S03AFR - SCRN SUB
     F* S03ALD - SCRN SUB
     F* S04ABR - SCRN SUB
     F* S500 - SCRN SUB
     F* S04AFR - SCRN SUB
     F* S501 - SCRN SUB
     F* S04ALD - SCRN SUB
     F* S502 - SCRN SUB
     F* S05ABR - SCRN SUB
     F* S05AFR - SCRN SUB
     F* S05ALD - SCRN SUB
     F* S06ABR - SCRN SUB
     F* S06AFR - SCRN SUB
     F* S06ALD - SCRN SUB
     F* S07ABR - SCRN SUB
     F* S503 - SCRN SUB
     F* S07AFR - SCRN SUB
     F* S504 - SCRN SUB
     F* S07ALD - SCRN SUB
     F* S505 - SCRN SUB
     F* S15ABR - SCRN SUB
     F* S506 - SCRN SUB
     F* S15AFR - SCRN SUB
     F* S507 - SCRN SUB
     F* S15ALD - SCRN SUB
     F* S508 - SCRN SUB
     F* WDUPD - Update warehouse details
     F* SY0010 - Format Date
     F* SY0020 - Alpha date to numeric
     F* SY0030 - Validate a Date
     F* SREM - Calculates the remainder of a division.
     F* SCMD - Processes OS/400 Commands
     F* SMSG - calls message handling program to either clear, add, or
     F* S013   - SETLL D.IMSTRN,F.IMSTRN,SVK001,SVKtrn
     F* S014   - GETREC D.SECURTY,F.SECITP,*EQ,PRCOYNO,USERID,TTTRNC
     F* S015   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USERID
     F* S016   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     F* S017   - GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSE
     F* S018   - GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     F* S019   - GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     F* S020   - GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSt
     F* S021   - GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHST,STLOCT
     F* S022   - GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhse,stlocn,stitem
     F* S023   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,ttotht
     F* S024   - GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhst,stloct,stitem
     F* S025   - GETREC d.imstrn,f.imstrn,*eq,stttyp
     F* S026   - GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0801,STTIME
     F* S027   - GETREC d.stokmov,f.waredet,*eq,stcoyno,stwhse,stitem
     F* S028   - WRITE D.STOKMOV,F.STOKMOV
     F* S029   - GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0601,STTIME,STTREF
     F* S030   - WRITE d.stokmov,f.expdel
     F* S031   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYNO,STITEM
     F* S032   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     F* S033   - GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     F* S034   - GETBLK D.IMSTRN,F.IMSTRN,*PV,SVK001
     F* S035   - Process To Reset File Pointer(BOF) - IMSTRN
     F* S036   - Process To Reset File Pointer(EOF) - IMSTRN
     F* S037   - GETREC D.IMSTRN,F.IMSTRN,*EQ,TTCOYNO,TTTRNC
     F* S038   - SETLL D.STOKMOV,F.WAREDET,SVK002,SVK003,SVK03
     F* S039   - GETREC D.STOKMOV,F.WAREDET,*PV,SVK002,SVK003
     F* S040   - Process To Reset File Pointer(BOF) - WAREDET
     F* S041   - GETREC D.STOKMOV,F.WAREDET,*NE,SVK002,SVK003
     F* S042   - Process To Reset File Pointer(EOF) - WAREDET
     F* S043   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wditem
     F* S044   - SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     F* S045   - GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     F* S046   - Process To Reset File Pointer(BOF) - WAREHED
     F* S047   - GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     F* S048   - Process To Reset File Pointer(EOF) - WAREHED
     F* S049   - SETLL D.STOKMOV,F.WARELOC,SVK007,SVK008,SVK05
     F* S050   - GETREC D.STOKMOV,F.WARELOC,*PV,SVK007,SVK008
     F* S051   - Process To Reset File Pointer(BOF) - WARELOC
     F* S052   - GETREC D.STOKMOV,F.WARELOC,*NE,SVK007,SVK008
     F* S053   - Process To Reset File Pointer(EOF) - WARELOC
     F* S054   - SETLL D.STOKMOV,F.WLOCITM,SVK010,SVK011,SVK012,SVK06
     F* S055   - GETREC D.STOKMOV,F.WLOCITM,*PV,SVK010,SVK011,SVK012
     F* S056   - Process To Reset File Pointer(BOF) - WLOCITM
     F* S057   - GETREC D.STOKMOV,F.WLOCITM,*NE,SVK010,SVK011,SVK012
     F* S058   - Process To Reset File Pointer(EOF) - WLOCITM
     F* S059   - SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     F* S060   - GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     F* S061   - Process To Reset File Pointer(BOF) - WLOCITM1
     F* S062   - GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     F* S063   - Process To Reset File Pointer(EOF) - WLOCITM1
     F* S064   - SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     F* S065   - GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     F* S066   - Process To Reset File Pointer(BOF) - SUPLIER
     F* S067   - SETLL D.suplier1,F.SUPLIER1,SVK025,svkalp,SVK026,SVK15
     F* S068   - GETREC D.suplier1,F.SUPLIER1,*PV,SVK025
     F* S069   - Process To Reset File Pointer(BOF) - SUPLIER1
     F* S070   - GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     F* S071   - Process To Reset File Pointer(EOF) - SUPLIER
     F* S072   - GETREC D.suplier1,F.SUPLIER1,*NE,SVK025
     F* S073   - Process To Reset File Pointer(EOF) - SUPLIER1
     F* S074   - GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,STCOYNO,STWHSE,STITEM
     F* S075   - UPDATE d.stokmov,f.wlocitm
     F* S076   - Referential Integrity Check (Update) For File WLOCITM
     F* S077   - UPDATE d.stokmov,f.waredet
     F* S078   - Referential Integrity Check (Update) For File WAREDET
     F* S079   - GETREC D.STOKMOV,F.WRITTYP,*EQ,STCOYNO,STWHSE,STITEM,STTTYP
     F* S080   - UPDATE d.stokmov,f.writtyp
     F* S081   - WRITE d.stokmov,f.writtyp
     F* S002V - Detail Screen for STOKMOV
     F* *PSSR - Program Execution Errors Handler
     F* SCLF   - CLF : Cursor Location On Field Handler
     F* SATRIB - Display Attribute Handler
     F* SEXCP - Dummy EXCPT(s) and Read(s)
     F* SFERR - File Exception Handler
     F* SMVTOF - Move Fields From Work Area To File(s)
     F* SMVTOW - Move Fields From File(s) To Work Area
     F*
     F********************************************************************
     F*            F i l e     S p e c i f i c a t i o n
     F********************************************************************
     FFILE0001  CF   E             WORKSTN
     F                                     SFILE(SCR001S1:RRN01)
     F                                     INFDS(DSPFDS)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     RENAME(WLOCITMF:FMT002)
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FSUPLIER1  IF   E           K DISK
     F                                     RENAME(SUPLIERF:FMT001)
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FWAREHED   IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FIMSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FEXPDEL    IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FSTOKMOV   IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FWARELOC   IF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FSECITP    IF   E           K DISK
     F                                     INFDS(FIDS13)
     F                                     INFSR(SFERR)
     FSECIMS    IF   E           K DISK
     F                                     INFDS(FIDS14)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS16)
     F                                     INFSR(SFERR)
     FWLOCITM   UF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FWRITTYP   UF A E           K DISK
     F                                     INFDS(FIDS15)
     F                                     INFSR(SFERR)
     FEXPDELX   UF A E             DISK
     F                                     INFDS(FIDS17)
     F                                     RENAME(EXPDELF:EXPDELFX)
     F                                     INFSR(SFERR)
     FSTOKMOVX  UF A E             DISK
     F                                     INFDS(FIDS18)
     F                                     RENAME(STOKMOVF:FMT003)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D WK2             S              1    DIM(256)                             Alpha wrk array
     D WKA             S              1    DIM(256)                             Alpha wrk array
     D A01             S              3    DIM(12)
     D A02             S              2    DIM(12)
     D BSU             S              6    DIM(5)
     D B01             S             15    DIM(5)
     D B02             S              3    DIM(5)
     D B03             S             10    DIM(5)
     D B04             S             15    DIM(5)
     D B05             S             10    DIM(5)
     D T12             S             10    DIM(5)
     D A03             S              1    DIM(10)
     D A04             S              1    DIM(8)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D CST             S              1    DIM(2560)                            Command string
     D A1              S             80    DIM(19) CTDATA PERRCD(1)             Alpha constants i
     D N1              S             30  9 DIM(4) CTDATA PERRCD(1)              Numeric constants
     D DA4             S             24    DIM(9) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(9) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(77) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(77) ALT(DA1)
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS14          DS
     D  STS14            *STATUS
     D  REC14                397    400B 0
     D FIDS13          DS
     D  STS13            *STATUS
     D  REC13                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS16          DS
     D  STS16            *STATUS
     D  REC16                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS15          DS
     D  STS15            *STATUS
     D  REC15                397    400B 0
     D FIDS17          DS
     D  STS17            *STATUS
     D  REC17                397    400B 0
     D FIDS18          DS
     D  STS18            *STATUS
     D  REC18                397    400B 0
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
     D C0001           C                   CONST('Invalid cursor loc f-
     D                                     or prompt')
     D*
     D* Named constants
     D*
     D C0002           C                   CONST('Invalid action choic-
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
     D* Work data structure for time
     D*
     D @DS005          DS
     D  XTIME                  1      6  0
     D  XDTIME                 1     12  0
     D  XSDATE                 7     12  0
     D  XHR                    1      2  0
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
     D  TAL                    1     50    DIM(5)
     D  TAL001                 1     10
     D  TAL002                11     20
     D  TAL003                21     30
     D  TAL004                31     40
     D  TAL005                41     50
     D @DS007          DS
     D  TBR                    1     15    DIM(5)
     D  TBR001                 1      3
     D  TBR002                 4      6
     D  TBR003                 7      9
     D  TBR004                10     12
     D  TBR005                13     15
     D @DS008          DS
     D  TSN                    1    200    DIM(5)
     D  TSN001                 1     40
     D  TSN002                41     80
     D  TSN003                81    120
     D  TSN004               121    160
     D  TSN005               161    200
     D @DS009          DS
     D  TSU                    1     30    DIM(5)
     D  TSU001                 1      6
     D  TSU002                 7     12
     D  TSU003                13     18
     D  TSU004                19     24
     D  TSU005                25     30
     D @DS010          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS011          DS
     D  T02                    1    100    DIM(5)
     D  T02001                 1     20
     D  T02002                21     40
     D  T02003                41     60
     D  T02004                61     80
     D  T02005                81    100
     D @DS012          DS
     D  T03                    1    200    DIM(5)
     D  T03001                 1     40
     D  T03002                41     80
     D  T03003                81    120
     D  T03004               121    160
     D  T03005               161    200
     D @DS013          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS014          DS
     D  T05                    1     15    DIM(5)
     D  T05001                 1      3
     D  T05002                 4      6
     D  T05003                 7      9
     D  T05004                10     12
     D  T05005                13     15
     D @DS015          DS
     D  T06                    1    200    DIM(5)
     D  T06001                 1     40
     D  T06002                41     80
     D  T06003                81    120
     D  T06004               121    160
     D  T06005               161    200
     D @DS016          DS
     D  T07                    1      5P 0 DIM(5)
     D  T07001                 1      1P 0
     D  T07002                 2      2P 0
     D  T07003                 3      3P 0
     D  T07004                 4      4P 0
     D  T07005                 5      5P 0
     D @DS017          DS
     D  T08                    1     50    DIM(5)
     D  T08001                 1     10
     D  T08002                11     20
     D  T08003                21     30
     D  T08004                31     40
     D  T08005                41     50
     D @DS018          DS
     D  T09                    1    200    DIM(5)
     D  T09001                 1     40
     D  T09002                41     80
     D  T09003                81    120
     D  T09004               121    160
     D  T09005               161    200
     D @DS019          DS
     D  T10                    1      5P 0 DIM(5)
     D  T10001                 1      1P 0
     D  T10002                 2      2P 0
     D  T10003                 3      3P 0
     D  T10004                 4      4P 0
     D  T10005                 5      5P 0
     D @DS020          DS
     D  T11                    1    100    DIM(5)
     D  T11001                 1     20
     D  T11002                21     40
     D  T11003                41     60
     D  T11004                61     80
     D  T11005                81    100
     D @DS021          DS
     D  T13                    1     25P 0 DIM(5)
     D  T13001                 1      5P 0
     D  T13002                 6     10P 0
     D  T13003                11     15P 0
     D  T13004                16     20P 0
     D  T13005                21     25P 0
     D @DS022          DS
     D  T14                    1      5P 0 DIM(5)
     D  T14001                 1      1P 0
     D  T14002                 2      2P 0
     D  T14003                 3      3P 0
     D  T14004                 4      4P 0
     D  T14005                 5      5P 0
     D @DS023          DS
     D  T16                    1     50    DIM(5)
     D  T16001                 1     10
     D  T16002                11     20
     D  T16003                21     30
     D  T16004                31     40
     D  T16005                41     50
     D @DS024          DS
     D  T18                    1     25P 0 DIM(5)
     D  T18001                 1      5P 0
     D  T18002                 6     10P 0
     D  T18003                11     15P 0
     D  T18004                16     20P 0
     D  T18005                21     25P 0
     ICOMPANYF
     I              CYCOYNO                     RN0016
     I              CYEMPCOL                    RN0017
     I              CYEMPHEAD                   RN0018
     I              CYPRDHEAD                   RN0019
     I              CYREFHEAD                   RN0020
     I              CYSDESC                     RN0021
     IEXPDELF
     I              EDBRNBR                     RN0022
     I              EDCOYNO                     RN0023
     I              EDSUPPN                     RN0024
     IIMSCPYDF
     I              CDCOYNO                     RN0025
     I              CDHEAD1                     RN0026
     I              CDHEAD2                     RN0027
     I              CDHEAD3                     RN0028
     IIMSTRMF
     I              TTCOYNO                     RN0029
     IITMSTRF
     I              ITALPHA                     RN0030
     I              ITCOYNO                     RN0031
     I              ITIDESC                     RN0032
     ISECIMSF
     I              USCOYNO                     RN0033
     ISECITPF
     I              UTCOYNO                     RN0034
     ISTOKMOVF
     I              STBRNBR                     RN0035
     I              STCOYNO                     RN0036
     I              STSUPPN                     RN0037
     ISUPLIERF
     I              SUALPHA                     RN0038
     I              SUBRNBR                     RN0039
     I              SUCONNAM                    RN0040
     I              SUCOYNO                     RN0041
     I              SUPSTCD                     RN0042
     I              SUSUPPN                     RN0043
     I              SUTELEPH                    RN0044
     IFMT001
     I              SUALPHA                     RN0045
     I              SUBRNBR                     RN0046
     I              SUCONNAM                    RN0047
     I              SUCOYNO                     RN0048
     I              SUPSTCD                     RN0049
     I              SUSUPPN                     RN0050
     I              SUTELEPH                    RN0051
     IWDETAILF
     I              WDCOYNO                     RN0052
     I              WDSUPPN                     RN0053
     IWAREHEDF
     I              WHCOYNO                     RN0054
     I              WHWDESC                     RN0055
     IWARELOCF
     I              WLCOYNO                     RN0056
     IWLOCITMF
     I              WICOYNO                     RN0057
     IFMT002
     I              WICOYNO                     RN0058
     IWRITTYPF
     I              WTCOYNO                     RN0059
     IEXPDELFX
     I              EDBRNBR                     RN0022
     I              EDCOYNO                     RN0023
     I              EDSUPPN                     RN0024
     IFMT003
     I              STBRNBR                     RN0035
     I              STCOYNO                     RN0036
     I              STSUPPN                     RN0037
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
     C                   PARM                    PRM002            3
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
     C                   KFLD                    KTCO01
     C                   KFLD                    KTTR02
     C*
     C     K0002         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    XTWHSE
     C*
     C     K0003         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    XTWHSE
     C                   KFLD                    XTITEM
     C*
     C     K0004         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    XTWHSE
     C                   KFLD                    XTLOCN
     C                   KFLD                    XTITEM
     C*
     C     K0005         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    WK0012
     C                   KFLD                    WK0009
     C*
     C     K0006         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    XTWHST
     C*
     C     K0007         KLIST
     C                   KFLD                    WK0010
     C                   KFLD                    XTWHST
     C                   KFLD                    XTLOCT
     C                   KFLD                    XTITEM
     C*
     C     K0008         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C                   KFLD                    KTTR03
     C*
     C     K0009         KLIST
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C*
     C     K0010         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTWH03
     C*
     C     K0011         KLIST
     C                   KFLD                    KTCO03
     C                   KFLD                    KTIT04
     C*
     C     K0012         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTWH03
     C                   KFLD                    KTLO04
     C*
     C     K0013         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTWH03
     C                   KFLD                    KTLO04
     C                   KFLD                    KTIT05
     C*
     C     K0014         KLIST
     C                   KFLD                    KTCO01
     C*
     C     K0015         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KDDT03
     C                   KFLD                    KDTI04
     C*
     C     K0016         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTWH03
     C                   KFLD                    KTIT05
     C*
     C     K0017         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KDDT03
     C                   KFLD                    KDTI04
     C                   KFLD                    KDTR05
     C*
     C     K0018         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0019         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C     K0020         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C*
     C     K0021         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0022         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0023         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C                   KFLD                    KLLO03
     C*
     C     K0024         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C*
     C     K0025         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C                   KFLD                    KIIT04
     C*
     C     K0026         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0027         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C                   KFLD                    KILO04
     C*
     C     K0028         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0029         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0030         KLIST
     C                   KFLD                    KUCO01
     C*
     C     K0031         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUAL02
     C                   KFLD                    KUSU03
     C                   KFLD                    KUBR04
     C*
     C     K0032         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDIT02
     C*
     C     K0033         KLIST
     C                   KFLD                    KTCO04
     C                   KFLD                    KTWH05
     C                   KFLD                    KTIT06
     C                   KFLD                    KTTR07
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    RN0022        WK0001                         Branch Number
     C     *LIKE         DEFINE    RN0023        WK0002                         Company number
     C     *LIKE         DEFINE    EDDTTR        WDDTTR                         Transaction Date
     C     *LIKE         DEFINE    RN0024        WK0003                         Supplier Number
     C     *LIKE         DEFINE    EDTIME        WDTIME                         Expected time
     C     *LIKE         DEFINE    EDTREF        WDTREF                         Transaction Referenc
     C     *LIKE         DEFINE    CDTRNP        WDTRNP                         Purchasing Trans
     C     *LIKE         DEFINE    CDTRNR        WDTRNR                         Receiving Trans
     C     *LIKE         DEFINE    RN0029        WK0004                         Company number
     C     *LIKE         DEFINE    TTNEGA        WTNEGA                         Negative allowed
     C     *LIKE         DEFINE    TTONHC        WTONHC                         On Hand Calculation
     C     *LIKE         DEFINE    TTOTHT        WTOTHT                         Other Transaction Co
     C     *LIKE         DEFINE    TTPCKL        WTPCKL                         Picking List Y/N
     C     *LIKE         DEFINE    TTREFE        WTREFE                         Enter Reference
     C     *LIKE         DEFINE    TTUPDC        WTUPDC                         Update Cost
     C     *LIKE         DEFINE    TTUSDC        WTUSDC                         Used Calculation
     C     *LIKE         DEFINE    ITQTYO        WTQTYO                         Outer Quantity
     C     *LIKE         DEFINE    ITSTUC        WTSTUC                         Standard unit cost
     C     *LIKE         DEFINE    ITWEIG        WTWEIG                         Item weight
     C     *LIKE         DEFINE    RN0033        WK0006                         Company number
     C     *LIKE         DEFINE    USUSER        WSUSER                         User
     C     *LIKE         DEFINE    USWHSE        WSWHSE                         Allowed Warehouse
     C     *LIKE         DEFINE    RN0034        WK0007                         Company number
     C     *LIKE         DEFINE    UTTRNC        WK0008                         Transaction Type
     C     *LIKE         DEFINE    UTUSER        WTUSER                         User
     C     *LIKE         DEFINE    RN0036        WK0010                         Company number
     C     *LIKE         DEFINE    STDTAC        WTDTAC                         Actual Date
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STPCKL        WK0011                         Picking List Y/N
     C     *LIKE         DEFINE    STSEQ         WTSEQ                          Picking List No.
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    RN0039        WK0013                         Branch Number
     C     *LIKE         DEFINE    SUNAME        WUNAME                         Customer name
     C     *LIKE         DEFINE    RN0043        WK0014                         Supplier Number
     C     *LIKE         DEFINE    RN0045        WK0015                         Alpha Search
     C     *LIKE         DEFINE    RN0046        WK0016                         Branch Number
     C     *LIKE         DEFINE    SUNAME        WK0017                         Customer name
     C     *LIKE         DEFINE    RN0050        WK0018                         Supplier Number
     C     *LIKE         DEFINE    RN0052        WK0019                         Company number
     C     *LIKE         DEFINE    WDITEM        WK0020                         Item Number
     C     *LIKE         DEFINE    WDLCST        WK0021                         Cost at last receipt
     C     *LIKE         DEFINE    WDQAL         WK0022                         Quantity Allocated
     C     *LIKE         DEFINE    WDQOH         WK0023                         Quantity on hand
     C     *LIKE         DEFINE    WDQOR         WK0024                         Quantity on reserve
     C     *LIKE         DEFINE    WDUCST        WK0025                         Unit Cost
     C     *LIKE         DEFINE    WDUOM         WK0026                         Unit of Measure
     C     *LIKE         DEFINE    WDWHSE        WK0027                         Warehouse Number
     C     *LIKE         DEFINE    RN0054        WK0028                         Company number
     C     *LIKE         DEFINE    WHCTYP        WK0029                         Costing Type
     C     *LIKE         DEFINE    RN0055        WK0030                         Warehouse Descriptio
     C     *LIKE         DEFINE    WHWHSE        WK0031                         Warehouse Number
     C     *LIKE         DEFINE    RN0056        WK0032                         Company number
     C     *LIKE         DEFINE    WLDESC        WK0033                         Location Description
     C     *LIKE         DEFINE    WLLOCN        WK0034                         Location
     C     *LIKE         DEFINE    WLWHSE        WK0035                         Warehouse Number
     C     *LIKE         DEFINE    RN0057        WK0036                         Company number
     C     *LIKE         DEFINE    WIITEM        WK0037                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0038                         Location
     C     *LIKE         DEFINE    WIQAL         WK0039                         Quantity Allocated
     C     *LIKE         DEFINE    WIQOH         WK0040                         Quantity on hand
     C     *LIKE         DEFINE    WIQOR         WK0041                         Quantity on reserve
     C     *LIKE         DEFINE    WIWHSE        WK0042                         Warehouse Number
     C     *LIKE         DEFINE    RN0058        WK0043                         Company number
     C     *LIKE         DEFINE    WIITEM        WK0044                         Item Number
     C     *LIKE         DEFINE    WILOCN        WK0045                         Location
     C     *LIKE         DEFINE    WIQAL         WK0046                         Quantity Allocated
     C     *LIKE         DEFINE    WIQOH         WK0047                         Quantity on hand
     C     *LIKE         DEFINE    WIWHSE        WK0048                         Warehouse Number
     C     *LIKE         DEFINE    RN0059        WK0049                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0050                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0051                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0052                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0053                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0054                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0055                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0056                         Warehouse Number
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0016        HD0001
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0023        HD0002
     C     *LIKE         DEFINE    EDDTTR        HDDTTR
     C     *LIKE         DEFINE    EDTIME        HDTIME
     C     *LIKE         DEFINE    EDTREF        HDTREF
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0025        HD0003
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0031        HD0005
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC14         HRC14
     C     *LIKE         DEFINE    RN0033        HD0006
     C     *LIKE         DEFINE    USUSER        HSUSER
     C     *LIKE         DEFINE    REC13         HRC13
     C     *LIKE         DEFINE    RN0034        HD0007
     C     *LIKE         DEFINE    UTUSER        HTUSER
     C     *LIKE         DEFINE    UTTRNC        HD0008
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0036        HD0009
     C     *LIKE         DEFINE    REC03         HRC03
     C     *LIKE         DEFINE    RN0048        HD0015
     C     *LIKE         DEFINE    RN0045        HD0013
     C     *LIKE         DEFINE    RN0050        HD0016
     C     *LIKE         DEFINE    RN0046        HD0014
     C     *LIKE         DEFINE    REC16         HRC16
     C     *LIKE         DEFINE    RN0041        HD0011
     C     *LIKE         DEFINE    RN0043        HD0012
     C     *LIKE         DEFINE    RN0039        HD0010
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0054        HD0018
     C     *LIKE         DEFINE    WHWHSE        HHWHSE
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    RN0056        HD0019
     C     *LIKE         DEFINE    WLWHSE        HLWHSE
     C     *LIKE         DEFINE    WLLOCN        HLLOCN
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0052        HD0017
     C     *LIKE         DEFINE    WDWHSE        HDWHSE
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC02         HRC02
     C     *LIKE         DEFINE    RN0058        HD0021
     C     *LIKE         DEFINE    WIWHSE        HD0024
     C     *LIKE         DEFINE    WIITEM        HD0022
     C     *LIKE         DEFINE    WILOCN        HD0023
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0057        HD0020
     C     *LIKE         DEFINE    WIWHSE        HIWHSE
     C     *LIKE         DEFINE    WILOCN        HILOCN
     C     *LIKE         DEFINE    WIITEM        HIITEM
     C     *LIKE         DEFINE    REC15         HRC15
     C     *LIKE         DEFINE    RN0059        HD0025
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HD0026
     C     *LIKE         DEFINE    WTTRNC        HD0027
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *ZEROS        ROW1              3 0
     C                   MOVE      *ZEROS        COL1              3 0
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
     C                   MOVE      *ZEROS        ##DATE            8 0
     C                   MOVE      *BLANKS       ##TIM             6
     C                   MOVE      *BLANKS       ##USR            10
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *BLANKS       CHECK             1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *BLANKS       EXIT              1
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *BLANKS       FL0021            6
     C                   MOVE      *BLANKS       FL0022            3
     C                   MOVE      *BLANKS       FL0023           10
     C                   MOVE      *BLANKS       FSTALP           10
     C                   MOVE      *BLANKS       FST026            6
     C                   MOVE      *BLANKS       FST03            15
     C                   MOVE      *BLANKS       FST04             3
     C                   MOVE      *BLANKS       FST05            10
     C                   MOVE      *BLANKS       FST06            15
     C                   MOVE      *BLANKS       FST07            10
     C                   MOVE      *BLANKS       FST15             3
     C                   MOVE      *BLANKS       F02001           15
     C                   MOVE      *BLANKS       F02002            3
     C                   MOVE      *BLANKS       F02003           10
     C                   MOVE      *BLANKS       F04BRN            3
     C                   MOVE      *BLANKS       F04003            6
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        HLDTTR            8 0
     C                   MOVE      *ZEROS        HLTIME            6 0
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LSTALP           10
     C                   MOVE      *BLANKS       LST026            6
     C                   MOVE      *BLANKS       LST03            15
     C                   MOVE      *BLANKS       LST04             3
     C                   MOVE      *BLANKS       LST05            10
     C                   MOVE      *BLANKS       LST06            15
     C                   MOVE      *BLANKS       LST07            10
     C                   MOVE      *BLANKS       LST15             3
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *BLANKS       PSSALP           10
     C                   MOVE      *BLANKS       PS0102            2
     C                   MOVE      *BLANKS       SVKALP           10
     C                   MOVE      *BLANKS       SVKTRN            2
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002            3
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004           15
     C                   MOVE      *BLANKS       SVK005            3
     C                   MOVE      *BLANKS       SVK006            3
     C                   MOVE      *BLANKS       SVK007            3
     C                   MOVE      *BLANKS       SVK008            3
     C                   MOVE      *BLANKS       SVK009           10
     C                   MOVE      *BLANKS       SVK010            3
     C                   MOVE      *BLANKS       SVK011            3
     C                   MOVE      *BLANKS       SVK012           10
     C                   MOVE      *BLANKS       SVK013           15
     C                   MOVE      *BLANKS       SVK014            3
     C                   MOVE      *BLANKS       SVK015            3
     C                   MOVE      *BLANKS       SVK016           15
     C                   MOVE      *BLANKS       SVK017           10
     C                   MOVE      *BLANKS       SVK025            3
     C                   MOVE      *BLANKS       SVK026            6
     C                   MOVE      *BLANKS       SVK03            15
     C                   MOVE      *BLANKS       SVK04             3
     C                   MOVE      *BLANKS       SVK05            10
     C                   MOVE      *BLANKS       SVK06            15
     C                   MOVE      *BLANKS       SVK07            10
     C                   MOVE      *BLANKS       SVK15             3
     C                   MOVE      *BLANKS       SVWHSE            3
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
     C                   MOVE      *ZEROS        RN0006            8 0          SYDATNO = Number out
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0007           10            SYDATO
     C                   MOVE      *ZEROS        SYDATV            8 0
     C                   MOVE      *ZEROS        RN0008            8 0          SYDATV
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *ZEROS        SYDDN             2 0
     C                   MOVE      *BLANKS       SYDERR            1
     C                   MOVE      *BLANKS       RN0009            1            SYDERR
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0010            1            SYDFMT
     C                   MOVE      *BLANKS       RN0011            1            SYDFMT
     C                   MOVE      *ZEROS        SYDMC             8 0
     C                   MOVE      *ZEROS        RN0012            8 0          SYDMC
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
     C                   MOVE      *ZEROS        Y6                2 0          SY1
     C                   MOVE      *ZEROS        Y7                2 0          SY2
     C                   MOVE      *ZEROS        S03CNT            3 0
     C                   MOVE      *ZEROS        S04CNT            3 0
     C                   MOVE      *ZEROS        S05CNT            3 0
     C                   MOVE      *ZEROS        S06CNT            3 0
     C                   MOVE      *ZEROS        S07CNT            3 0
     C                   MOVE      *ZEROS        S15CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       USERID           10
     C                   MOVE      *BLANKS       WKALOC            1
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *BLANKS       WKCYY             4
     C                   MOVE      *BLANKS       WKDA8F            8
     C                   MOVE      *BLANKS       WKDDA             2
     C                   MOVE      *BLANKS       WKDESL           40
     C                   MOVE      *BLANKS       WKDESW           40
     C                   MOVE      *ZEROS        WKEND             2 0
     C                   MOVE      *BLANKS       WKLDES           40
     C                   MOVE      *ZEROS        WKLEAP           15 6
     C                   MOVE      *BLANKS       WKLOCN           10
     C                   MOVE      *BLANKS       WKMMA             2
     C                   MOVE      *BLANKS       WKPCK             1
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *BLANKS       WKWDES           40
     C                   MOVE      *BLANKS       WKWHSE            3
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        WK0801            8 0
     C                   MOVE      *ZEROS        WK1321           13 2
     C                   MOVE      *ZEROS        WK3091           30 9
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK14             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK13             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK16             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK15             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK17             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK18             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       IN04             99            Save Ind
     C                   MOVE      *BLANKS       IN05             99            Save Ind
     C                   MOVE      *BLANKS       IN06             99            Save Ind
     C                   MOVE      *BLANKS       IN07             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD05            1            RD STS
     C                   MOVE      *BLANKS       KTCO01            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR02            2            TTTRNC
     C                   MOVE      *BLANKS       SWRD14            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD13            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          0030
     C                   MOVE      *BLANKS       KSCO01            3            USCOYNO
     C                   MOVE      *BLANKS       KSUS02           10            USUSER
     C                   MOVE      *BLANKS       KTTR03            2            UTTRNC
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD15            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO02            3            STCOYNO
     C                   MOVE      *BLANKS       KTWH03            3            STWHSE
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO03            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT04           20            ITITEM
     C                   MOVE      *BLANKS       KTLO04           10            STLOCN
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       KTIT05           20            STITEM
     C                   MOVE      *ZEROS        KDDT03            8 0          EDDTTR
     C                   MOVE      *ZEROS        KDTI04            6 0          EDTIME
     C                   MOVE      *BLANKS       KDTR05           15            EDTREF
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          0030
     C                   MOVE      *BLANKS       SWRD07            1            RD STS          0030
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       RN0062           99
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KLCO01            3            WLCOYNO
     C                   MOVE      *BLANKS       KLWH02            3            WLWHSE
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       KIIT04           20            WIITEM
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO04           10            WILOCN
     C                   MOVE      *BLANKS       SWRD16            1            RD STS ed
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       SWRD03            1            RD STS  reached
     C                   MOVE      *BLANKS       KUAL02           10            SUALPHA
     C                   MOVE      *BLANKS       KUSU03            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR04            3            SUBRNBR
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       KTCO04            3            WTCOYNO
     C                   MOVE      *BLANKS       KTWH05            3            WTWHSE
     C                   MOVE      *BLANKS       KTIT06           20            WTITEM
     C                   MOVE      *BLANKS       KTTR07            2            WTTRNC
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *ZEROS        EXISTF            1 0          Existence chk flg
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *BLANKS       RN0063           99
     C                   MOVE      *BLANKS       RN0064           99
     C                   MOVE      *BLANKS       RN0065           99
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
     C                   MOVE      *ZEROS        T14001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T14002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T14003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T14004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T14005                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T18001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T18002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T18003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T18004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T18005                         Init DS/*DTA flds
     C                   MOVEL     'LANDIMS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   TIME                    XTIME
     C                   TIME                    XDTIME
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
     C                   Z-ADD     *ZEROS        WCNTR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        WGETR             3 0          COUNTER
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        RN0060           30 9
     C                   Z-ADD     *ZEROS        RN0061           30 9
     C                   Z-ADD     *ZEROS        DAS001            5 0
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS10             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS04             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS12             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS08             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS16             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
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
     C                   EXSR      SPBACT
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0002'      S002
     C     SCRNID        CASEQ     'SC0003'      S003
     C     SCRNID        CASEQ     'SC0004'      S004
     C     SCRNID        CASEQ     'SC0005'      S005
     C     SCRNID        CASEQ     'SC0006'      S006
     C     SCRNID        CASEQ     'SC0007'      S007
     C     SCRNID        CASEQ     'SCWHST'      S008
     C     SCRNID        CASEQ     'SCLOCT'      S009
     C     SCRNID        CASEQ     'SCALOC'      S010
     C     SCRNID        CASEQ     'SC0015'      S011
     C     SCRNID        CASEQ     'SCSALP'      S012
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
     C* S001 - List Screen for IMSTRN
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Get Company Name at beginning
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* TTTRNC = ' '
     C                   MOVEL     *BLANKS       XTTRNC
     C* TTDESC = ' '
     C                   MOVEL     *BLANKS       XTDESC
     C*                                                               *
     C* Set Key values to parms passed
     C* SVK001 = PRcoyno
     C                   MOVE      PRM002        SVK001
     C* SVKTRN = ' '
     C                   MOVEL     *BLANKS       SVKTRN
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.IMSTRN,F.IMSTRN,SVK001,SVKtrn
     C*
     C                   EXSR      S013
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
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information backwards
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
     C* IF PS0102<>' '
     C     PS0102        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVKTRN = PS0102
     C                   MOVE      PS0102        SVKTRN
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
     C* SETLL D.IMSTRN,F.IMSTRN,SVK001,SVKtrn
     C*
     C                   EXSR      S013
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
     C* S002 - Detail Screen for STOKMOV
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01000000'    *IN(1)
     C                   MOVEA     '10010101'    *IN(9)
     C                   MOVEA     '01010101'    *IN(17)
     C                   MOVEA     '01001001'    *IN(25)
     C                   MOVEA     '0'           *IN(33)
     C                   MOVEA     '1'           *IN(80)
     C* *** Set date options from Company file
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0011
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0014
     C* *** Check User is allowed Transaction Type.
     C* USERID = *USERID
     C                   MOVE      *BLANKS       USERID
     C                   MOVEL     USER          USERID
     C* GETREC D.SECURTY,F.SECITP,*EQ,PRCOYNO,USERID,TTTRNC
     C*
     C                   EXSR      S014
     C* IF %STS(D.SECURTY,F.SECITP)=*NO
     C*  Status of last file I/O
     C     STS13         IFNE      *ZERO
     C* DSPERR *NONE,'USR0013','ERRORS',*LIBL
     C                   MOVEL     'USR0013'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Get User's allowed warehouse.
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USERID
     C*
     C                   EXSR      S015
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C* STCOYNO = prcoyno
     C                   MOVE      PRM002        WK0010
     C* STTTYP = tttrnc
     C                   MOVE      XTTRNC        WTTTYP
     C* STWHSE = USWHSE
     C                   MOVE      WSWHSE        XTWHSE
     C* STITEM = ' '
     C                   MOVEL     *BLANKS       XTITEM
     C* STLOCN = ' '
     C                   MOVEL     *BLANKS       XTLOCN
     C* STDTTR = 0
     C                   Z-ADD     *ZERO         WTDTTR
     C* STTQTY = 0
     C                   Z-ADD     *ZERO         XTTQTY
     C* STTREF = ' '
     C                   MOVEL     *BLANKS       XTTREF
     C* STUCST = 0
     C                   Z-ADD     *ZERO         XTUCST
     C* STTIME = 0
     C                   Z-ADD     *ZERO         XTTIME
     C* EDCARR = ' '
     C                   MOVEL     *BLANKS       XDCARR
     C* STWHST = USWHSE
     C                   MOVE      WSWHSE        XTWHST
     C* STLOCT = ' '
     C                   MOVEL     *BLANKS       XTLOCT
     C* HLTIME = 0
     C                   Z-ADD     *ZERO         HLTIME
     C* HLDTTR = 0
     C                   Z-ADD     *ZERO         HLDTTR
     C* STWEIG = 0
     C                   Z-ADD     *ZERO         XTWEIG
     C* CHECK = ' '
     C                   MOVE      *BLANKS       CHECK
     C* WKWDES = *blanks
     C                   MOVEL     *BLANKS       WKWDES
     C* WKLDES = *blanks
     C                   MOVEL     *BLANKS       WKLDES
     C* ITIDESC = *blanks
     C                   MOVEL     *BLANKS       WK0005
     C* WKDESW = *blanks
     C                   MOVEL     *BLANKS       WKDESW
     C* WKDESL = *blanks
     C                   MOVEL     *BLANKS       WKDESL
     C* STSUPPN = *blanks
     C                   MOVEL     *BLANKS       WK0012
     C* STBRNBR = *blanks
     C                   MOVEL     *BLANKS       WK0009
     C* WKALOC = *blanks
     C                   MOVEL     *BLANKS       WKALOC
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* *** Set todays date
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0007
     C* SYDATI = ##date  ; system date
     C                   Z-ADD     ##DATE        RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0023 = SYDATO  ; Populate the screen field
     C                   MOVE      RN0007        FL0023
     C*                                                               *
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C*
     C                   EXSR      S016
     C*                                                               *
     C* *** Protect Warehouse fields if User restricted
     C* IF USWHSE <> ' '
     C     WSWHSE        IFNE      *BLANKS
     C* FLDATR STWHSE,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XTWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR STWHST,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XTWHST  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ttotht = ' '
     C     WTOTHT        IFEQ      *BLANKS
     C* GRPATR other,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'OTHER   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* GRPATR other,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'OTHER   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF tttrnc = cdtrnp | tttrnc = cdtrnr
     C     XTTRNC        IFEQ      WDTRNP
     C     XTTRNC        OREQ      WDTRNR
     C* GRPATR purrec,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'PURREC  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* GRPATR purrec,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'PURREC  '    FLDNAM
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
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '00100101'    *IN(7)
     C                   MOVEA     '01010101'    *IN(15)
     C                   MOVEA     '01010'       *IN(23)
     C                   MOVEA     '10'          *IN(29)
     C                   MOVEA     '10'          *IN(32)
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
     C* IF %clf(STOKMOV.STOKMOV.STWHSE)=*YES & USWHSE = ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WSWHSE        IFEQ      *BLANKS
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
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
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0030
     C* GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSE
     C*
     C                   EXSR      S017
     C* WKWDES = whwdesc
     C                   MOVE      WK0030        WKWDES
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C*
     C                   EXSR      S018
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       WK0033
     C* GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     C*
     C                   EXSR      S019
     C* WKLDES = wldesc
     C                   MOVE      WK0033        WKLDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STITEM)=*yes & stwhse <> ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0060
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     XTWHSE        IFNE      *BLANKS
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0060        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      1
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
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C*
     C                   EXSR      S018
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       WK0033
     C* GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     C*
     C                   EXSR      S019
     C* WKLDES = wldesc
     C                   MOVE      WK0033        WKLDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STLOCN)=*yes & stwhse <> ' ' & STITEM <> ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     XTWHSE        IFNE      *BLANKS
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     XTITEM        IFNE      *BLANKS
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* F02003 = ' '
     C                   MOVEL     *BLANKS       F02003
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
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       WK0033
     C* GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     C*
     C                   EXSR      S019
     C* WKLDES = wldesc
     C                   MOVE      WK0033        WKLDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STLOCN)=*yes & stwhse <> ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0060
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     XTWHSE        IFNE      *BLANKS
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0060        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      1
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
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0005
     C* GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C*
     C                   EXSR      S018
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       WK0033
     C* GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     C*
     C                   EXSR      S019
     C* WKLDES = wldesc
     C                   MOVE      WK0033        WKLDES
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STOKMOV.STOKMOV.STWHST)=*YES & USWHSE = ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTWHST  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WSWHSE        IFEQ      *BLANKS
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* F02002 = ' '
     C                   MOVEL     *BLANKS       F02002
     C* EXSCR SCwhst
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
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0030
     C* GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSt
     C*
     C                   EXSR      S020
     C* WKDESW = whwdesc
     C                   MOVE      WK0030        WKDESW
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STLOCT)=*yes & stwhst <> ' '
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XTLOCT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0060
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     XTWHST        IFNE      *BLANKS
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0060        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      1
     C* F02003 = ' '
     C                   MOVEL     *BLANKS       F02003
     C* EXSCR SCloct
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
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       WK0033
     C* GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHST,STLOCT
     C*
     C                   EXSR      S021
     C* WKDESL = wldesc
     C                   MOVE      WK0033        WKDESL
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(STsuppn)=*yes
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0012  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* F04003 = ' '
     C                   MOVEL     *BLANKS       F04003
     C* F04BRN = ' '
     C                   MOVEL     *BLANKS       F04BRN
     C* EXSCR SC0015
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S011
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* IF f04003 <> ' '
     C     F04003        IFNE      *BLANKS
     C* STSUPPN = f04003
     C                   MOVE      F04003        WK0012
     C* STBRNBR = f04brn
     C                   MOVE      F04BRN        WK0009
     C* END                                                           *
     C                   END
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
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
     C                   MOVEL     C0001         MSGDTA
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
     C* *** Check fileds are required
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* *** Set the changed date for validation
     C* SYCMD = 0
     C                   Z-ADD     *ZERO         RN0002
     C* SYDERR = '0' ; set off date error
     C                   MOVE      '0'           RN0009
     C* SYDATAI = FL0023 ; keyed date
     C                   MOVE      FL0023        RN0004
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* SYDATV = SYCMD
     C                   Z-ADD     RN0002        RN0008
     C* EXSUBR SY0030
     C                   EXSR      SY0030
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* IF SYDERR = '1' ; the transaction date is in error
     C     RN0009        IFEQ      '1'
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR FL0023,'FLD0012','errors'
     C                   MOVEL     'FLD0012'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0023  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* SYDATI = SYCMD
     C                   Z-ADD     RN0002        RN0005
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* FL0023 = SYDATO  ; re-format the date if no seps are keyed
     C                   MOVE      RN0007        FL0023
     C* END                                                           *
     C                   END
     C*                                                               *
     C* On hand to be calculated
     C* IF ttonhc<>'N'
     C     WTONHC        IFNE      'N'
     C* IF stlocn = ' ' ; Location must be entered
     C     XTLOCN        IFEQ      *BLANKS
     C* DSPERR stlocn,'fld0022','errors'
     C                   MOVEL     'fld0022'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF sttqty = 0   ; Quantity must be entered
     C     XTTQTY        IFEQ      *ZERO
     C* DSPERR sttqty,'fld0075','errors'
     C                   MOVEL     'fld0075'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTTQTY  '    FLDNAM
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
     C* Negative allowed
     C* IF ttnega = 'N' & sttqty < *zero
     C     WTNEGA        IFEQ      'N'
     C     XTTQTY        ANDLT     *ZERO
     C* DSPERR sttqty,'USR0012','errors'
     C                   MOVEL     'USR0012'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTTQTY  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* Reference must be entered
     C* IF ttrefe = 'Y' & sttref = ' '
     C     WTREFE        IFEQ      'Y'
     C     XTTREF        ANDEQ     *BLANKS
     C* DSPERR sttref,'fld0058','errors'
     C                   MOVEL     'fld0058'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTTREF  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* Generate Reference must be entered
     C* IF ttrefe = 'N' & sttref = ' '
     C     WTREFE        IFEQ      'N'
     C     XTTREF        ANDEQ     *BLANKS
     C* ##USR = *USERID
     C                   MOVE      *BLANKS       ##USR
     C                   MOVEL     USER          ##USR
     C* ##TIM = %CTC(*TIME)
     C                   TIME                    XDTIME
     C*  Convert To Character
     C                   MOVE      *BLANK        ##TIM
     C                   MOVEL     XTIME         ##TIM
     C* STTREF = %CON(##USR,##TIM)
     C*  Concatenate
     C     ##USR         CAT(P)    ##TIM:0       ARSLT0
     C                   MOVE      *BLANKS       XTTREF
     C                   MOVEL     ARSLT0        XTTREF
     C* END                                                           *
     C                   END
     C* Calculate cost
     C* IF ttupdc = 'Y' & stucst = *zero
     C     WTUPDC        IFEQ      'Y'
     C     XTUCST        ANDEQ     *ZERO
     C* DSPERR stucst,'fld0060','errors'
     C                   MOVEL     'fld0060'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTUCST  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* Check available stock
     C* WKALOC = 'Y'
     C                   MOVE      'Y'           WKALOC
     C* IF (ttonhc='S'|ttonhc='R') & error = 'N'
     C     WTONHC        IFEQ      'S'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WTONHC        IFEQ      'R'
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     ERROR         IFEQ      'N'
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhse,stlocn,stitem
     C*
     C                   EXSR      S022
     C* IF (wiqoh - :172 - sttqty) < *zero
     C     WK0040        SUB       WK0039        RN0060
     C                   SUB       XTTQTY        RN0060
     C     RN0060        IFLT      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      1
     C* EXSCR scaloc
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S010
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
     C* END                                                           *
     C                   END
     C* Continue if allocation accepted
     C* IF wkaloc = 'Y'
     C     WKALOC        IFEQ      'Y'
     C* If all ok check for other transaction
     C* IF ttotht <> ' '
     C     WTOTHT        IFNE      *BLANKS
     C* WKPCK = ttpckl ; store picking list flag - the next getrec will overwrit
     C*         e it - kp 16/04/02
     C                   MOVE      WTPCKL        WKPCK
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,ttotht
     C*
     C                   EXSR      S023
     C*                                                               *
     C* Cannot transfer to same warehouse location
     C* IF stwhst = stwhse & stloct = stlocn
     C     XTWHST        IFEQ      XTWHSE
     C     XTLOCT        ANDEQ     XTLOCN
     C* DSPERR stloct,'usr0009','errors'
     C                   MOVEL     'usr0009'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTLOCT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* On hand to be calculated
     C* IF ttonhc<>'N'
     C     WTONHC        IFNE      'N'
     C* IF stloct=' '
     C     XTLOCT        IFEQ      *BLANKS
     C* DSPERR stloct,'fld0022','errors'
     C                   MOVEL     'fld0022'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTLOCT  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF stwhst=' '
     C     XTWHST        IFEQ      *BLANKS
     C* DSPERR stwhst,'fld0068','errors'
     C                   MOVEL     'fld0068'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XTWHST  '    FLDNAM
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
     C* Check available stock
     C* WKALOC = 'Y'
     C                   MOVE      'Y'           WKALOC
     C* IF (ttonhc='S'|ttonhc='R') & error = 'N'
     C     WTONHC        IFEQ      'S'
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     WTONHC        IFEQ      'R'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0060        IFEQ      1
     C     NRSLT0        OREQ      1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     ERROR         IFEQ      'N'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0060        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      1
     C* GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhst,stloct,stitem
     C*
     C                   EXSR      S024
     C* IF (wiqoh - :172 - sttqty) < *zero
     C     WK0040        SUB       WK0039        NRSLT0
     C                   SUB       XTTQTY        NRSLT0
     C     NRSLT0        IFLT      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* EXSCR scaloc
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S010
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
     C* END                                                           *
     C                   END
     C*                                                               *
     C* GETREC d.imstrn,f.imstrn,*eq,stttyp
     C*
     C                   EXSR      S025
     C* END                                                           *
     C                   END
     C* Continue if allocation accepted
     C* IF wkaloc = 'Y'
     C     WKALOC        IFEQ      'Y'
     C* Check for delivery
     C* IF stttyp = cdtrnp & (Check = ' '|hltime<>sttime|hldttr<>SYCMD)
     C     WTTTYP        IFEQ      WDTRNP
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     CHECK         IFEQ      *BLANKS
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     HLTIME        IFNE      XTTIME
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        OREQ      1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     HLDTTR        IFNE      RN0002
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        OREQ      1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* WK0801 = SYCMD
     C                   Z-ADD     RN0002        WK0801
     C* GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0801,STTIME
     C*
     C                   EXSR      S026
     C*                                                               *
     C* IF %sts(d.stokmov,f.expdel)=*yes
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C* DSPERR FL0023,'usr0004','errors'
     C                   MOVEL     'usr0004'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0023  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* CHECK = 'Y'
     C                   MOVE      'Y'           CHECK
     C* HLTIME = sttime
     C                   Z-ADD     XTTIME        HLTIME
     C* HLDTTR = SYCMD
     C                   Z-ADD     RN0002        HLDTTR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Perform updates to file on function key 14
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* If default cost find it
     C* IF ttupdc = 'D' & stucst = 0
     C     WTUPDC        IFEQ      'D'
     C     XTUCST        ANDEQ     *ZERO
     C* GETREC d.stokmov,f.waredet,*eq,stcoyno,stwhse,stitem
     C*
     C                   EXSR      S027
     C* IF whctyp = 1
     C     WK0029        IFEQ      1
     C* STUCST = itstuc
     C                   Z-ADD     WTSTUC        XTUCST
     C* END                                                           *
     C                   END
     C* IF whctyp = 2
     C     WK0029        IFEQ      2
     C* STUCST = wdlcst
     C                   Z-ADD     WK0021        XTUCST
     C* END                                                           *
     C                   END
     C* IF whctyp = 3
     C     WK0029        IFEQ      3
     C* STUCST = wducst
     C                   Z-ADD     WK0025        XTUCST
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Modified by KP - TTPCKL gets corrupted if a double sided transaction
     C*     is entered
     C* Add to stock movements
     C* IF ttotht <> ' '
     C     WTOTHT        IFNE      *BLANKS
     C* STPCKL = wkpck
     C                   MOVE      WKPCK         WK0011
     C* ELSE                                                          *
     C                   ELSE
     C* STPCKL = ttpckl
     C                   MOVE      WTPCKL        WK0011
     C* END                                                           *
     C                   END
     C*                                                               *
     C* STDTTR = sycmd
     C                   Z-ADD     RN0002        WTDTTR
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* STDTAC = ##DATE
     C                   Z-ADD     ##DATE        WTDTAC
     C* WRITE D.STOKMOV,F.STOKMOV
     C*
     C                   EXSR      S028
     C* EXSUBR wdupd
     C                   EXSR      WDUPD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* If purcase add to expected delivery
     C* IF stttyp = cdtrnp
     C     WTTTYP        IFEQ      WDTRNP
     C* GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0601,STTIME,STTREF
     C*
     C                   EXSR      S029
     C* IF %sts(D.STOKMOV,F.EXPDEL) = *no
     C*  Status of last file I/O
     C     STS09         IFNE      *ZERO
     C* EDCOYNO = stcoyno
     C                   MOVE      WK0010        WK0002
     C* EDDTTR = stdttr
     C                   Z-ADD     WTDTTR        WDDTTR
     C* EDTIME = sttime
     C                   Z-ADD     XTTIME        WDTIME
     C* EDTREF = sttref
     C                   MOVE      XTTREF        WDTREF
     C* EDSUPPN = stsuppn
     C                   MOVE      WK0012        WK0003
     C* EDBRNBR = stbrnbr
     C                   MOVE      WK0009        WK0001
     C* WRITE d.stokmov,f.expdel
     C*
     C                   EXSR      S030
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF ttotht <> ' '
     C     WTOTHT        IFNE      *BLANKS
     C* STTTYP = ttotht
     C                   MOVE      WTOTHT        WTTTYP
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C*
     C                   EXSR      S016
     C* STPCKL = ttpckl
     C                   MOVE      WTPCKL        WK0011
     C* WKWHSE = stwhse
     C                   MOVE      XTWHSE        WKWHSE
     C* WKLOCN = stlocn
     C                   MOVE      XTLOCN        WKLOCN
     C* STWHSE = stwhst
     C                   MOVE      XTWHST        XTWHSE
     C* STLOCN = stloct
     C                   MOVE      XTLOCT        XTLOCN
     C* STWHST = wkwhse
     C                   MOVE      WKWHSE        XTWHST
     C* STLOCT = wklocn
     C                   MOVE      WKLOCN        XTLOCT
     C* WRITE D.STOKMOV,F.STOKMOV
     C*
     C                   EXSR      S028
     C* EXSUBR wdupd
     C                   EXSR      WDUPD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C*                                                               *
     C* EXTSCR                                                        *
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
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 -   List of Items In Warehouse
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '000'         *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST03 = ' '
     C                   MOVEL     *BLANKS       FST03
     C* LST03 = ' '
     C                   MOVEL     *BLANKS       LST03
     C* SVK03 = ' '
     C                   MOVEL     *BLANKS       SVK03
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK002 = STCOYNO
     C                   MOVE      WK0010        SVK002
     C* SVK003 = STWHSE
     C                   MOVE      XTWHSE        SVK003
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
     C                   MOVEA     '0'           *IN(11)
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
     C                   Z-ADD     1             Z9
     C* DOW (I03<=C03)&(T01(I03)<>1&t01(i03)<>6)
     C     Z9            DOWLE     Z2
     C     T01(Z9)       ANDNE     1
     C     T01(Z9)       ANDNE     6
     C* I03 = I03+1
     C     Z9            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z9
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I03<=C03)&(T01(I03)=1)
     C     Z9            IFLE      Z2
     C     T01(Z9)       ANDEQ     1
     C* STITEM = B01(I03)
     C                   MOVE      *BLANKS       XTITEM
     C                   MOVEL     B01(Z9)       XTITEM
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
     C* EXTSCR                                                        *
     C                   GOTO      $00399
     C* END                                                           *
     C                   END
     C* IF (I03<=C03)&(T01(I03)=6)
     C     Z9            IFLE      Z2
     C     T01(Z9)       ANDEQ     6
     C* STITEM = B01(I03)
     C                   MOVE      *BLANKS       XTITEM
     C                   MOVEL     B01(Z9)       XTITEM
     C* EXIT = 'N'
     C                   MOVE      'N'           EXIT
     C* EXSCR sc0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   EXSR      S007
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00399
     C                   END
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* IF exit = 'Y'
     C     EXIT          IFEQ      'Y'
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
     C* S004 -       List of Warehouses
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
     C* SVWHSE = STWHSE
     C                   MOVE      XTWHSE        SVWHSE
     C* SVK005 = STCOYNO
     C                   MOVE      WK0010        SVK005
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
     C                   Z-ADD     1             Y1
     C* DOW (I04<=C04)&(T04(I04)<>1&t04(i04)<>6&t04(i04)<>7)
     C     Y1            DOWLE     Z3
     C     T04(Y1)       ANDNE     1
     C     T04(Y1)       ANDNE     6
     C     T04(Y1)       ANDNE     7
     C* I04 = I04+1
     C     Y1            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I04<=C04)&(T04(I04)=1)
     C     Y1            IFLE      Z3
     C     T04(Y1)       ANDEQ     1
     C* STWHSE = B02(I04)
     C                   MOVE      B02(Y1)       XTWHSE
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C* IF (I04<=C04)&(T04(I04)=6)
     C     Y1            IFLE      Z3
     C     T04(Y1)       ANDEQ     6
     C* STWHSE = B02(I04)
     C                   MOVE      B02(Y1)       XTWHSE
     C* EXIT = 'N'
     C                   MOVE      'N'           EXIT
     C* EXSCR sc0003
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S003
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* STWHSE = SVWHSE
     C                   MOVE      SVWHSE        XTWHSE
     C* IF exit = 'Y'
     C     EXIT          IFEQ      'Y'
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF (I04<=C04)&(T04(I04)=7)
     C     Y1            IFLE      Z3
     C     T04(Y1)       ANDEQ     7
     C* STWHSE = B02(I04)
     C                   MOVE      B02(Y1)       XTWHSE
     C* EXIT = 'N'
     C                   MOVE      'N'           EXIT
     C* EXSCR sc0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* STWHSE = SVWHSE
     C                   MOVE      SVWHSE        XTWHSE
     C* IF exit = 'Y'
     C     EXIT          IFEQ      'Y'
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
     C* S005 - List of Locations in Warehouse
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '000'         *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST05 = ' '
     C                   MOVEL     *BLANKS       FST05
     C* LST05 = ' '
     C                   MOVEL     *BLANKS       LST05
     C* SVK05 = ' '
     C                   MOVEL     *BLANKS       SVK05
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK007 = STCOYNO
     C                   MOVE      WK0010        SVK007
     C* SVK008 = STWHSE
     C                   MOVE      XTWHSE        SVK008
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
     C                   MOVEA     '0'           *IN(11)
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
     C                   Z-ADD     1             Y2
     C* DOW (I05<=C05)&(T07(I05)<>1&t07(i05)<>6)
     C     Y2            DOWLE     Z4
     C     T07(Y2)       ANDNE     1
     C     T07(Y2)       ANDNE     6
     C* I05 = I05+1
     C     Y2            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I05<=C05)&(T07(I05)=1)
     C     Y2            IFLE      Z4
     C     T07(Y2)       ANDEQ     1
     C* STLOCN = B03(I05)
     C                   MOVE      B03(Y2)       XTLOCN
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* IF (I05<=C05)&(T07(I05)=6)
     C     Y2            IFLE      Z4
     C     T07(Y2)       ANDEQ     6
     C* STLOCN = B03(I05)
     C                   MOVE      B03(Y2)       XTLOCN
     C* EXIT = 'N'
     C                   MOVE      'N'           EXIT
     C* EXSCR sc0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* IF exit = 'Y'
     C     EXIT          IFEQ      'Y'
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00599        ENDSR
     C/EJECT
     C*****************************************************************
     C* S006 -   List of Items in Location
     C*****************************************************************
     C     S006          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST06 = ' '
     C                   MOVEL     *BLANKS       FST06
     C* LST06 = ' '
     C                   MOVEL     *BLANKS       LST06
     C* SVK06 = ' '
     C                   MOVEL     *BLANKS       SVK06
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK010 = STCOYNO
     C                   MOVE      WK0010        SVK010
     C* SVK011 = STWHSE
     C                   MOVE      XTWHSE        SVK011
     C* SVK012 = STLOCN
     C                   MOVE      XTLOCN        SVK012
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
     C                   MOVEA     '00'          *IN(11)
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
     C                   Z-ADD     1             Y3
     C* DOW (I06<=C06)&(T10(I06)<>1)
     C     Y3            DOWLE     Z5
     C     T10(Y3)       ANDNE     1
     C* I06 = I06+1
     C     Y3            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y3
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I06<=C06)&(T10(I06)=1)
     C     Y3            IFLE      Z5
     C     T10(Y3)       ANDEQ     1
     C* STITEM = B04(I06)
     C                   MOVE      *BLANKS       XTITEM
     C                   MOVEL     B04(Y3)       XTITEM
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
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
     C* S007 -   List of Locations for Item
     C*****************************************************************
     C     S007          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST07 = ' '
     C                   MOVEL     *BLANKS       FST07
     C* LST07 = ' '
     C                   MOVEL     *BLANKS       LST07
     C* SVK07 = ' '
     C                   MOVEL     *BLANKS       SVK07
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK014 = STCOYNO
     C                   MOVE      WK0010        SVK014
     C* SVK015 = STWHSE
     C                   MOVE      XTWHSE        SVK015
     C* SVK016 = stitem
     C                   MOVE      *BLANKS       SVK016
     C                   MOVEL     XTITEM        SVK016
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
     C                   MOVEA     '00'          *IN(11)
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
     C                   Z-ADD     1             Y4
     C* DOW (I07<=C07)&(T14(I07)<>1)
     C     Y4            DOWLE     Z6
     C     T14(Y4)       ANDNE     1
     C* I07 = I07+1
     C     Y4            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I07<=C07)&(T14(I07)=1)
     C     Y4            IFLE      Z6
     C     T14(Y4)       ANDEQ     1
     C* STLOCN = B05(I07)
     C                   MOVE      B05(Y4)       XTLOCN
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
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
     C* FST04 = ' '
     C                   MOVEL     *BLANKS       FST04
     C* LST04 = ' '
     C                   MOVEL     *BLANKS       LST04
     C* SVK04 = ' '
     C                   MOVEL     *BLANKS       SVK04
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK005 = STCOYNO
     C                   MOVE      WK0010        SVK005
     C* S04CNT = 005
     C                   Z-ADD     005           S04CNT
     C* ** Array forward read.
     C* EXSUBR S04AFR
     C                   EXSR      S501
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
     C* SVK04 = FST04
     C                   MOVE      FST04         SVK04
     C* ** Array Backwards read.
     C* EXSUBR S04ABR
     C                   EXSR      S500
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
     C* SVK04 = LST04
     C                   MOVE      LST04         SVK04
     C* ** Array Forward Read.
     C* EXSUBR S04AFR
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I04 = 1
     C                   Z-ADD     1             Y1
     C* DOW (I04<=C04)&(T04(I04)<>1&t04(i04)<>6)
     C     Y1            DOWLE     Z3
     C     T04(Y1)       ANDNE     1
     C     T04(Y1)       ANDNE     6
     C* I04 = I04+1
     C     Y1            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y1
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I04<=C04)&(T04(I04)=1)
     C     Y1            IFLE      Z3
     C     T04(Y1)       ANDEQ     1
     C* STWHST = B02(I04)
     C                   MOVE      B02(Y1)       XTWHST
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
     C* EXTSCR                                                        *
     C                   GOTO      $00899
     C* END                                                           *
     C                   END
     C* IF (I04<=C04)&(T04(I04)=6)
     C     Y1            IFLE      Z3
     C     T04(Y1)       ANDEQ     6
     C* STWHST = B02(I04)
     C                   MOVE      B02(Y1)       XTWHST
     C* EXIT = 'N'
     C                   MOVE      'N'           EXIT
     C* EXSCR scloct
     C                   ADD       1             SP
     C                   MOVEL     'SCWHST  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN06
     C                   EXSR      S009
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVEA     IN06          *IN
     C                   MOVE      '1'           *IN79
     C* IF exit = 'Y'
     C     EXIT          IFEQ      'Y'
     C* EXTSCR                                                        *
     C                   GOTO      $00899
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00899        ENDSR
     C/EJECT
     C*****************************************************************
     C* S009 -   List of Locations for Item
     C*****************************************************************
     C     S009          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST07 = ' '
     C                   MOVEL     *BLANKS       FST07
     C* LST07 = ' '
     C                   MOVEL     *BLANKS       LST07
     C* SVK07 = ' '
     C                   MOVEL     *BLANKS       SVK07
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK014 = STCOYNO
     C                   MOVE      WK0010        SVK014
     C* SVK015 = STWHST
     C                   MOVE      XTWHST        SVK015
     C* SVK016 = STITEM
     C                   MOVE      *BLANKS       SVK016
     C                   MOVEL     XTITEM        SVK016
     C* S07CNT = 005
     C                   Z-ADD     005           S07CNT
     C* ** Array forward read.
     C* EXSUBR S07AFR
     C                   EXSR      S504
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
     C                   MOVEA     '00'          *IN(11)
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
     C* SVK07 = FST07
     C                   MOVE      FST07         SVK07
     C* ** Array Backwards read.
     C* EXSUBR S07ABR
     C                   EXSR      S503
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
     C* SVK07 = LST07
     C                   MOVE      LST07         SVK07
     C* ** Array Forward Read.
     C* EXSUBR S07AFR
     C                   EXSR      S504
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I07 = 1
     C                   Z-ADD     1             Y4
     C* DOW (I07<=C07)&(T14(I07)<>1)
     C     Y4            DOWLE     Z6
     C     T14(Y4)       ANDNE     1
     C* I07 = I07+1
     C     Y4            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I07<=C07)&(T14(I07)=1)
     C     Y4            IFLE      Z6
     C     T14(Y4)       ANDEQ     1
     C* STLOCT = B05(I07)
     C                   MOVE      B05(Y4)       XTLOCT
     C* EXIT = 'Y'
     C                   MOVE      'Y'           EXIT
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
     C* S010 -         Allocate screen
     C*****************************************************************
     C     S010          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* *** Obtain Substitute & Superceding items.
     C* GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYNO,STITEM
     C*
     C                   EXSR      S031
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
     C                   MOVEA     '00'          *IN(1)
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
     C* Rtrn
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* WKALOC = ' '
     C                   MOVE      *BLANKS       WKALOC
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Subs
     C*
     C     *INKQ         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* IF itsubs <> ' '
     C     XTSUBS        IFNE      *BLANKS
     C* STITEM = itsubs
     C                   MOVE      XTSUBS        XTITEM
     C* WKALOC = ' '
     C                   MOVE      *BLANKS       WKALOC
     C* GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C*
     C                   EXSR      S018
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Super
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* IF itsupg <> ' '
     C     XTSUPG        IFNE      *BLANKS
     C* STITEM = itsupg
     C                   MOVE      XTSUPG        XTITEM
     C* WKALOC = ' '
     C                   MOVE      *BLANKS       WKALOC
     C* GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C*
     C                   EXSR      S018
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* WKALOC = 'Y'
     C                   MOVE      'Y'           WKALOC
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C                   END
     C                   END
     C     $01099        ENDSR
     C/EJECT
     C*****************************************************************
     C* S011 -         List Suppliers
     C*****************************************************************
     C     S011          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST15 = ' '
     C                   MOVEL     *BLANKS       FST15
     C* LST15 = ' '
     C                   MOVEL     *BLANKS       LST15
     C* SVK15 = ' '
     C                   MOVEL     *BLANKS       SVK15
     C* FST026 = ' '
     C                   MOVEL     *BLANKS       FST026
     C* LST026 = ' '
     C                   MOVEL     *BLANKS       LST026
     C* SVK026 = ' '
     C                   MOVEL     *BLANKS       SVK026
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK025 = prCOYNO
     C                   MOVE      PRM002        SVK025
     C* S15CNT = 005
     C                   Z-ADD     005           S15CNT
     C* ** Array forward read.
     C* EXSUBR S15AFR
     C                   EXSR      S15AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
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
     C                   EXFMT     SCR011
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
     C                   GOTO      $01199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Alpha Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* EXSCR scsalp
     C                   ADD       1             SP
     C                   MOVEL     'SC0015  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN07
     C                   EXSR      S012
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C                   MOVEA     IN07          *IN
     C                   MOVE      '1'           *IN79
     C* IF f04003<> ' '
     C     F04003        IFNE      *BLANKS
     C* EXTSCR                                                        *
     C                   GOTO      $01199
     C* ELSE                                                          *
     C                   ELSE
     C* SVK026 = *blanks
     C                   MOVEL     *BLANKS       SVK026
     C* SVK15 = *blanks
     C                   MOVEL     *BLANKS       SVK15
     C* EXSUBR s15afr
     C                   EXSR      S15AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK026 = FST026
     C                   MOVE      FST026        SVK026
     C* SVK15 = FST15
     C                   MOVE      FST15         SVK15
     C* ** Array Backwards read.
     C* EXSUBR S15ABR
     C                   EXSR      S15ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK026 = LST026
     C                   MOVE      LST026        SVK026
     C* SVK15 = LST15
     C                   MOVE      LST15         SVK15
     C* ** Array Forward Read.
     C* EXSUBR S15AFR
     C                   EXSR      S15AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I15 = 1
     C                   Z-ADD     1             Y5
     C* DOW (I15<=C15)&(T07(I15)<>1)
     C     Y5            DOWLE     Z7
     C     T07(Y5)       ANDNE     1
     C* I15 = I15+1
     C     Y5            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y5
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I15<=C15)&(T07(I15)=1)
     C     Y5            IFLE      Z7
     C     T07(Y5)       ANDEQ     1
     C* F04003 = Bsu(I15)
     C                   MOVE      BSU(Y5)       F04003
     C* F04BRN = Tbr(I15)
     C                   MOVE      TBR(Y5)       F04BRN
     C* EXTSCR                                                        *
     C                   GOTO      $01199
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF fl0021 <> ' '
     C     FL0021        IFNE      *BLANKS
     C* SVK026 = fl0021
     C                   MOVE      FL0021        SVK026
     C* SVK15 = fl0022
     C                   MOVE      FL0022        SVK15
     C* EXSUBR s15afr
     C                   EXSR      S15AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S012 -   List Suppliers in Alpha Seq
     C*****************************************************************
     C     S012          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FSTALP = ' '
     C                   MOVEL     *BLANKS       FSTALP
     C* LSTALP = ' '
     C                   MOVEL     *BLANKS       LSTALP
     C* SVKALP = ' '
     C                   MOVEL     *BLANKS       SVKALP
     C* FST026 = ' '
     C                   MOVEL     *BLANKS       FST026
     C* LST026 = ' '
     C                   MOVEL     *BLANKS       LST026
     C* SVK026 = ' '
     C                   MOVEL     *BLANKS       SVK026
     C* FST15 = ' '
     C                   MOVEL     *BLANKS       FST15
     C* LST15 = ' '
     C                   MOVEL     *BLANKS       LST15
     C* SVK15 = ' '
     C                   MOVEL     *BLANKS       SVK15
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK025 = prCOYNO
     C                   MOVE      PRM002        SVK025
     C* S15CNT = 005
     C                   Z-ADD     005           S15CNT
     C* ** Array forward read.
     C* EXSUBR S15AFR
     C                   EXSR      S507
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
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
     C                   EXFMT     SCR012
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
     C                   GOTO      $01299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Number Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVKALP = FSTalp
     C                   MOVE      FSTALP        SVKALP
     C* SVK026 = FST026
     C                   MOVE      FST026        SVK026
     C* SVK15 = FST15
     C                   MOVE      FST15         SVK15
     C* ** Array Backwards read.
     C* EXSUBR S15ABR
     C                   EXSR      S506
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVKALP = LSTalp
     C                   MOVE      LSTALP        SVKALP
     C* SVK026 = LST026
     C                   MOVE      LST026        SVK026
     C* SVK15 = LST15
     C                   MOVE      LST15         SVK15
     C* ** Array Forward Read.
     C* EXSUBR S15AFR
     C                   EXSR      S507
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I15 = 1
     C                   Z-ADD     1             Y5
     C* DOW (I15<=C15)&(T07(I15)<>1)
     C     Y5            DOWLE     Z7
     C     T07(Y5)       ANDNE     1
     C* I15 = I15+1
     C     Y5            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y5
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I15<=C15)&(T07(I15)=1)
     C     Y5            IFLE      Z7
     C     T07(Y5)       ANDEQ     1
     C* F04003 = Bsu(I15)
     C                   MOVE      BSU(Y5)       F04003
     C* F04BRN = Tbr(I15)
     C                   MOVE      TBR(Y5)       F04BRN
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF pssalp <> ' '
     C     PSSALP        IFNE      *BLANKS
     C* SVKALP = pssalp
     C                   MOVE      PSSALP        SVKALP
     C* SVK026 = ' '
     C                   MOVEL     *BLANKS       SVK026
     C* SVK15 = ' '
     C                   MOVEL     *BLANKS       SVK15
     C* EXSUBR s15afr
     C                   EXSR      S507
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01299        ENDSR
     C/EJECT
     C*****************************************************************
     C* SPBACT - Performs all the program begin actions.
     C*****************************************************************
     C     SPBACT        BEGSR
     C*
     C* PGMBEGACT                                                     *
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
     C* GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C*
     C                   EXSR      S032
     C* GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     C*
     C                   EXSR      S033
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
     C     SID(CT)       IFEQ      'SCWHST'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR008
     C                   ELSE
     C     SID(CT)       IFEQ      'SCLOCT'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR009
     C                   ELSE
     C     SID(CT)       IFEQ      'SCALOC'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR010
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0015'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR011
     C                   ELSE
     C     SID(CT)       IFEQ      'SCSALP'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR012
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
     C* IF ##YEAR > 39
     C     ##YEAR        IFGT      39
     C* ##DATE = 19000000 + *YMD
     C     19000000      ADD       XYMD          RN0061
     C                   Z-ADD     RN0061        ##DATE
     C* ELSE                                                          *
     C                   ELSE
     C* ##DATE = 20000000 + *YMD
     C     20000000      ADD       XYMD          RN0061
     C                   Z-ADD     RN0061        ##DATE
     C* END                                                           *
     C                   END
     C*
     C     $SYSDA        ENDSR
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
     C* GETBLK D.IMSTRN,F.IMSTRN,*PV,SVK001
     C*
     C                   EXSR      S034
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK001        KTCO01
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
     C     SWRD05        DOUNE     'Y'                                          RD.SW.IMSTRN
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       XTDESC
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0014         READE     IMSTRN                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTTRNC                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   END
     C*
     C     SWRD05        IFEQ      'Y'                                          RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR FL0001,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = TTCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0004        A01(Z1)
     C* A002(C01) = TTTRNC
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XTTRNC        A02(Z1)
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       XTDESC
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
     C                   EXSR      S036                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Z8
     C* DOBLK D.IMSTRN
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
     C     Z8            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z8
     C* ** display detail screen
     C* IF (FL0001=1)
     C     FL0001        IFEQ      1
     C* ** set keys from hidden key arrays.
     C* TTCOYNO = A001(I01)
     C                   MOVE      A01(Z8)       WK0004
     C* TTTRNC = A002(I01)
     C                   MOVE      A02(Z8)       XTTRNC
     C* SVK001 = A001(I01)
     C                   MOVE      A01(Z8)       SVK001
     C* SVKTRN = A002(I01)
     C                   MOVE      A02(Z8)       SVKTRN
     C* ** Get record and any secondary records.
     C* GETREC D.IMSTRN,F.IMSTRN,*EQ,TTCOYNO,TTTRNC
     C*
     C                   EXSR      S037
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
     C                   MOVEL     C0002         MSGDTA
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
     C* FLDATR FL0001,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.IMSTRN,F.IMSTRN,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK001        KTCO01
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
     C     SWRD05        DOUNE     'Y'                                          RD.SW.IMSTRN
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       XTDESC
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0014         READE     IMSTRN                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTTRNC                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   END
     C*
     C     SWRD05        IFEQ      'Y'                                          RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR FL0001,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = TTCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0004        A01(Z1)
     C* A002(C01) = TTTRNC
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XTTRNC        A02(Z1)
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       XTDESC
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
     C                   EXSR      S036                                         RESET FP
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
     C* S03ABR - SCRN SUB
     C*****************************************************************
     C     S03ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C03 = 0
     C                   Z-ADD     *ZERO         Z2
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKMOV,F.WAREDET,SVK002,SVK003,SVK03
     C*
     C                   EXSR      S038
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WAREDET,*PV,SVK002,SVK003
     C*
     C                   EXSR      S039
     C* DOW (C03<S03CNT)&%STS(D.STOKMOV,F.WAREDET)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z2
     C* GETREC D.STOKMOV,F.WAREDET,*PV,SVK002,SVK003
     C*
     C                   EXSR      S039
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WAREDET,SVK002,SVK003,SVK03
     C*
     C                   EXSR      S038
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
     C     Z2            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z2
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
     C* GETREC D.STOKMOV,F.WAREDET,*NE,SVK002,SVK003
     C*
     C                   EXSR      S041
     C* DOW (C03<S03CNT)&%STS(D.STOKMOV,F.WAREDET)=*YES
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C03 = C03+1
     C     Z2            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z2
     C* ** Unprotect select field.
     C* FLDATR T01(C03),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z2            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C03) = STOKMOV.WAREDET.WDITEM
     C                   MOVE      *BLANKS       B01(Z2)
     C                   MOVEL     WK0020        B01(Z2)
     C* ** load screen array.
     C* T02(C03) = STOKMOV.WAREDET.WDITEM
     C                   MOVE      *BLANKS       T02(Z2)
     C                   MOVE      WK0020        T02(Z2)
     C* GETREC d.itmmast,f.itmmast,*eq,prcoyno,wditem
     C*
     C                   EXSR      S043
     C* T03(C03) = itidesc
     C                   MOVE      *BLANKS       T03(Z2)
     C                   MOVE      WK0005        T03(Z2)
     C* ** Save first record on screen.
     C* IF C03=1
     C     Z2            IFEQ      1
     C* FST03 = B01(C03)
     C                   MOVE      B01(Z2)       FST03
     C* END                                                           *
     C                   END
     C* IF C03<S03CNT
     C     Z2            IFLT      S03CNT
     C* GETREC D.STOKMOV,F.WAREDET,*NE,SVK002,SVK003
     C*
     C                   EXSR      S041
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z2            IFLT      S03CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     C*
     C                   EXSR      S044
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     C*
     C                   EXSR      S045
     C* DOW (C04<S04CNT)&%STS(D.STOKMOV,F.WAREHED)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z3
     C* GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     C*
     C                   EXSR      S045
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* S500 - SCRN SUB
     C*****************************************************************
     C     S500          BEGSR
     C*
     C* ** Array backwards read.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     C*
     C                   EXSR      S044
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     C*
     C                   EXSR      S045
     C* DOW (C04<S04CNT)&%STS(D.STOKMOV,F.WAREHED)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z3
     C* GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     C*
     C                   EXSR      S045
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S04ALD
     C                   EXSR      S502
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S500
     C                   END
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* S04AFR - SCRN SUB
     C*****************************************************************
     C     S04AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     C*
     C                   EXSR      S044
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
     C* S501 - SCRN SUB
     C*****************************************************************
     C     S501          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     C*
     C                   EXSR      S044
     C* ** Load arrays from this point.
     C* EXSUBR S04ALD
     C                   EXSR      S502
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S501
     C                   END
     C*
     C     $S501         ENDSR
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
     C     Z3            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z3
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
     C* GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     C*
     C                   EXSR      S047
     C* DOW (C04<S04CNT)&%STS(D.STOKMOV,F.WAREHED)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z3
     C* ** Unprotect select field.
     C* FLDATR T04(C04),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C04) = STOKMOV.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       B02(Z3)
     C                   MOVE      WK0031        B02(Z3)
     C* ** load screen array.
     C* T05(C04) = STOKMOV.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       T05(Z3)
     C                   MOVE      WK0031        T05(Z3)
     C* T06(C04) = STOKMOV.WAREHED.WHWDESC
     C                   MOVE      *BLANKS       T06(Z3)
     C                   MOVE      WK0030        T06(Z3)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z3            IFEQ      1
     C* FST04 = B02(C04)
     C                   MOVE      B02(Z3)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z3            IFLT      S04CNT
     C* GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     C*
     C                   EXSR      S047
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* S502 - SCRN SUB
     C*****************************************************************
     C     S502          BEGSR
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
     C     Z3            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z3
     C* FLDATR T04(C04),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCWHST  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C04 = 0
     C                   Z-ADD     *ZERO         Z3
     C* GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     C*
     C                   EXSR      S047
     C* DOW (C04<S04CNT)&%STS(D.STOKMOV,F.WAREHED)=*YES
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C04 = C04+1
     C     Z3            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z3
     C* ** Unprotect select field.
     C* FLDATR T04(C04),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z3            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCWHST  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C04) = STOKMOV.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       B02(Z3)
     C                   MOVE      WK0031        B02(Z3)
     C* ** load screen array.
     C* T05(C04) = STOKMOV.WAREHED.WHWHSE
     C                   MOVE      *BLANKS       T05(Z3)
     C                   MOVE      WK0031        T05(Z3)
     C* T06(C04) = STOKMOV.WAREHED.WHWDESC
     C                   MOVE      *BLANKS       T06(Z3)
     C                   MOVE      WK0030        T06(Z3)
     C* ** Save first record on screen.
     C* IF C04=1
     C     Z3            IFEQ      1
     C* FST04 = B02(C04)
     C                   MOVE      B02(Z3)       FST04
     C* END                                                           *
     C                   END
     C* IF C04<S04CNT
     C     Z3            IFLT      S04CNT
     C* GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     C*
     C                   EXSR      S047
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z3            IFLT      S04CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C04>0
     C     Z3            IFGT      *ZERO
     C* LST04 = B02(C04)
     C                   MOVE      B02(Z3)       LST04
     C* END                                                           *
     C                   END
     C*
     C     $S502         ENDSR
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
     C* SETLL D.STOKMOV,F.WARELOC,SVK007,SVK008,SVK05
     C*
     C                   EXSR      S049
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WARELOC,*PV,SVK007,SVK008
     C*
     C                   EXSR      S050
     C* DOW (C05<S05CNT)&%STS(D.STOKMOV,F.WARELOC)=*YES
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z4            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z4
     C* GETREC D.STOKMOV,F.WARELOC,*PV,SVK007,SVK008
     C*
     C                   EXSR      S050
     C* END                                                           *
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WARELOC,SVK007,SVK008,SVK05
     C*
     C                   EXSR      S049
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
     C     Z4            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z4
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
     C* GETREC D.STOKMOV,F.WARELOC,*NE,SVK007,SVK008
     C*
     C                   EXSR      S052
     C* DOW (C05<S05CNT)&%STS(D.STOKMOV,F.WARELOC)=*YES
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C05 = C05+1
     C     Z4            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z4
     C* ** Unprotect select field.
     C* FLDATR T07(C05),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z4            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B03(C05) = STOKMOV.WARELOC.WLLOCN
     C                   MOVE      *BLANKS       B03(Z4)
     C                   MOVE      WK0034        B03(Z4)
     C* ** load screen array.
     C* T08(C05) = STOKMOV.WARELOC.WLLOCN
     C                   MOVE      *BLANKS       T08(Z4)
     C                   MOVE      WK0034        T08(Z4)
     C* T09(C05) = STOKMOV.WARELOC.WLDESC
     C                   MOVE      *BLANKS       T09(Z4)
     C                   MOVE      WK0033        T09(Z4)
     C* ** Save first record on screen.
     C* IF C05=1
     C     Z4            IFEQ      1
     C* FST05 = B03(C05)
     C                   MOVE      B03(Z4)       FST05
     C* END                                                           *
     C                   END
     C* IF C05<S05CNT
     C     Z4            IFLT      S05CNT
     C* GETREC D.STOKMOV,F.WARELOC,*NE,SVK007,SVK008
     C*
     C                   EXSR      S052
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z4            IFLT      S05CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WLOCITM,SVK010,SVK011,SVK012,SVK06
     C*
     C                   EXSR      S054
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WLOCITM,*PV,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S055
     C* DOW (C06<S06CNT)&%STS(D.STOKMOV,F.WLOCITM)=*YES
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z5            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z5
     C* GETREC D.STOKMOV,F.WLOCITM,*PV,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S055
     C* END                                                           *
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WLOCITM,SVK010,SVK011,SVK012,SVK06
     C*
     C                   EXSR      S054
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
     C* T13 = 0
     C                   Z-ADD     *ZERO         T13
     C* C06 = 0
     C                   Z-ADD     *ZERO         Z5
     C* ** protect select field
     C* DOW C06<S06CNT
     C     Z5            DOWLT     S06CNT
     C* C06 = C06+1
     C     Z5            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z5
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
     C* GETREC D.STOKMOV,F.WLOCITM,*NE,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S057
     C* DOW (C06<S06CNT)&%STS(D.STOKMOV,F.WLOCITM)=*YES
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C06 = C06+1
     C     Z5            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z5
     C* ** Unprotect select field.
     C* FLDATR T10(C06),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T10     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B04(C06) = STOKMOV.WLOCITM.WIITEM
     C                   MOVE      *BLANKS       B04(Z5)
     C                   MOVEL     WK0037        B04(Z5)
     C* ** load screen array.
     C* T11(C06) = STOKMOV.WLOCITM.WIITEM
     C                   MOVE      *BLANKS       T11(Z5)
     C                   MOVE      WK0037        T11(Z5)
     C* T12(C06) = STOKMOV.WLOCITM.WILOCN
     C                   MOVE      *BLANKS       T12(Z5)
     C                   MOVE      WK0038        T12(Z5)
     C* T13(C06) = STOKMOV.WLOCITM.WIQOH - stokmov.wlocitm.wiqal
     C     WK0040        SUB       WK0039        RN0060
     C                   Z-ADD     RN0060        T13(Z5)
     C* ** Save first record on screen.
     C* IF C06=1
     C     Z5            IFEQ      1
     C* FST06 = B04(C06)
     C                   MOVE      B04(Z5)       FST06
     C* END                                                           *
     C                   END
     C* IF C06<S06CNT
     C     Z5            IFLT      S06CNT
     C* GETREC D.STOKMOV,F.WLOCITM,*NE,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S057
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z5            IFLT      S06CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS08         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     C*
     C                   EXSR      S059
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S060
     C* DOW (C07<S07CNT)&%STS(D.STOKMOV,F.WLOCITM1)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z6
     C* GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S060
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
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
     C* S503 - SCRN SUB
     C*****************************************************************
     C     S503          BEGSR
     C*
     C* ** Array backwards read.
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     C*
     C                   EXSR      S059
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S060
     C* DOW (C07<S07CNT)&%STS(D.STOKMOV,F.WLOCITM1)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z6
     C* GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S060
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S07ALD
     C                   EXSR      S505
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S503
     C                   END
     C*
     C     $S503         ENDSR
     C/EJECT
     C*****************************************************************
     C* S07AFR - SCRN SUB
     C*****************************************************************
     C     S07AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     C*
     C                   EXSR      S059
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
     C* S504 - SCRN SUB
     C*****************************************************************
     C     S504          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     C*
     C                   EXSR      S059
     C* ** Load arrays from this point.
     C* EXSUBR S07ALD
     C                   EXSR      S505
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S504
     C                   END
     C*
     C     $S504         ENDSR
     C/EJECT
     C*****************************************************************
     C* S07ALD - SCRN SUB
     C*****************************************************************
     C     S07ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T14 = 0
     C                   Z-ADD     *ZERO         T14
     C* B05 = ' '
     C                   MOVEA     *BLANKS       B05
     C* T16 = ' '
     C                   MOVEA     *BLANKS       T16
     C* T18 = 0
     C                   Z-ADD     *ZERO         T18
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C07<S07CNT
     C     Z6            DOWLT     S07CNT
     C* C07 = C07+1
     C     Z6            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z6
     C* FLDATR T14(C07),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* DOW (C07<S07CNT)&%STS(D.STOKMOV,F.WLOCITM1)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z6
     C* ** Unprotect select field.
     C* FLDATR T14(C07),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B05(C07) = STOKMOV.WLOCITM1.WIlocn
     C                   MOVE      *BLANKS       B05(Z6)
     C                   MOVE      WK0045        B05(Z6)
     C* ** load screen array.
     C* T16(C07) = STOKMOV.WLOCITM1.WILOCN
     C                   MOVE      *BLANKS       T16(Z6)
     C                   MOVE      WK0045        T16(Z6)
     C* T18(C07) = STOKMOV.WLOCITM1.WIQOH - stokmov.wlocitm1.wiqal
     C     WK0047        SUB       WK0046        RN0060
     C                   Z-ADD     RN0060        T18(Z6)
     C* ** Save first record on screen.
     C* IF C07=1
     C     Z6            IFEQ      1
     C* FST07 = B05(C07)
     C                   MOVE      B05(Z6)       FST07
     C* END                                                           *
     C                   END
     C* IF C07<S07CNT
     C     Z6            IFLT      S07CNT
     C* GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C07>0
     C     Z6            IFGT      *ZERO
     C* LST07 = B05(C07)
     C                   MOVE      B05(Z6)       LST07
     C* END                                                           *
     C                   END
     C*
     C     $S07AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S505 - SCRN SUB
     C*****************************************************************
     C     S505          BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T14 = 0
     C                   Z-ADD     *ZERO         T14
     C* B05 = ' '
     C                   MOVEA     *BLANKS       B05
     C* T16 = ' '
     C                   MOVEA     *BLANKS       T16
     C* T18 = 0
     C                   Z-ADD     *ZERO         T18
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C07<S07CNT
     C     Z6            DOWLT     S07CNT
     C* C07 = C07+1
     C     Z6            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z6
     C* FLDATR T14(C07),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCLOCT  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* DOW (C07<S07CNT)&%STS(D.STOKMOV,F.WLOCITM1)=*YES
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C07 = C07+1
     C     Z6            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z6
     C* ** Unprotect select field.
     C* FLDATR T14(C07),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCLOCT  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B05(C07) = STOKMOV.WLOCITM1.WIlocn
     C                   MOVE      *BLANKS       B05(Z6)
     C                   MOVE      WK0045        B05(Z6)
     C* ** load screen array.
     C* T16(C07) = STOKMOV.WLOCITM1.WILOCN
     C                   MOVE      *BLANKS       T16(Z6)
     C                   MOVE      WK0045        T16(Z6)
     C* T18(C07) = STOKMOV.WLOCITM1.WIQOH
     C                   Z-ADD     WK0047        T18(Z6)
     C* ** Save first record on screen.
     C* IF C07=1
     C     Z6            IFEQ      1
     C* FST07 = B05(C07)
     C                   MOVE      B05(Z6)       FST07
     C* END                                                           *
     C                   END
     C* IF C07<S07CNT
     C     Z6            IFLT      S07CNT
     C* GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S07CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C07>0
     C     Z6            IFGT      *ZERO
     C* LST07 = B05(C07)
     C                   MOVE      B05(Z6)       LST07
     C* END                                                           *
     C                   END
     C*
     C     $S505         ENDSR
     C/EJECT
     C*****************************************************************
     C* S15ABR - SCRN SUB
     C*****************************************************************
     C     S15ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C*
     C                   EXSR      S064
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C*
     C                   EXSR      S065
     C* DOW (C15<S15CNT)&%STS(D.WAREHED,F.SUPLIER)=*YES
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS16         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z7            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z7
     C* GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C*
     C                   EXSR      S065
     C* END                                                           *
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS16         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S15ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S15AB
     C                   END
     C*
     C     $S15AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S506 - SCRN SUB
     C*****************************************************************
     C     S506          BEGSR
     C*
     C* ** Array backwards read.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** Set pointer to first record on screen.
     C* SETLL D.suplier1,F.SUPLIER1,SVK025,svkalp,SVK026,SVK15
     C*
     C                   EXSR      S067
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.suplier1,F.SUPLIER1,*PV,SVK025
     C*
     C                   EXSR      S068
     C* DOW (C15<S15CNT)&%STS(D.suplier1,F.SUPLIER1)=*YES
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z7            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z7
     C* GETREC D.suplier1,F.SUPLIER1,*PV,SVK025
     C*
     C                   EXSR      S068
     C* END                                                           *
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S508
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S506
     C                   END
     C*
     C     $S506         ENDSR
     C/EJECT
     C*****************************************************************
     C* S15AFR - SCRN SUB
     C*****************************************************************
     C     S15AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C*
     C                   EXSR      S064
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S15ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S15AF
     C                   END
     C*
     C     $S15AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S507 - SCRN SUB
     C*****************************************************************
     C     S507          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.suplier1,F.SUPLIER1,SVK025,svkalp,SVK026,SVK15
     C*
     C                   EXSR      S067
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S508
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S507
     C                   END
     C*
     C     $S507         ENDSR
     C/EJECT
     C*****************************************************************
     C* S15ALD - SCRN SUB
     C*****************************************************************
     C     S15ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T07 = 0
     C                   Z-ADD     *ZERO         T07
     C* BSU = ' '
     C                   MOVEA     *BLANKS       BSU
     C* TSU = ' '
     C                   MOVEA     *BLANKS       TSU
     C* TBR = ' '
     C                   MOVEA     *BLANKS       TBR
     C* TSN = ' '
     C                   MOVEA     *BLANKS       TSN
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** protect select field
     C* DOW C15<S15CNT
     C     Z7            DOWLT     S15CNT
     C* C15 = C15+1
     C     Z7            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z7
     C* FLDATR T07(C15),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0015  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C*
     C                   EXSR      S070
     C* DOW (C15<S15CNT)&%STS(D.WAREHED,F.SUPLIER)=*YES
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS16         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z7            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z7
     C* ** Unprotect select field.
     C* FLDATR T07(C15),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0015  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* BSU(C15) = WAREHED.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       BSU(Z7)
     C                   MOVE      WK0014        BSU(Z7)
     C* ** load screen array.
     C* TSU(C15) = WAREHED.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       TSU(Z7)
     C                   MOVE      WK0014        TSU(Z7)
     C* TBR(C15) = WAREHED.SUPLIER.SUBRNBR
     C                   MOVE      *BLANKS       TBR(Z7)
     C                   MOVE      WK0013        TBR(Z7)
     C* TSN(C15) = WAREHED.SUPLIER.SUNAME
     C                   MOVE      *BLANKS       TSN(Z7)
     C                   MOVE      WUNAME        TSN(Z7)
     C* ** Save first record on screen.
     C* IF C15=1
     C     Z7            IFEQ      1
     C* FST026 = Bsu(C15)
     C                   MOVE      BSU(Z7)       FST026
     C* FST15 = tbr(C15)
     C                   MOVE      TBR(Z7)       FST15
     C* END                                                           *
     C                   END
     C* IF C15<S15CNT
     C     Z7            IFLT      S15CNT
     C* GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C*
     C                   EXSR      S070
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS16         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C15>0
     C     Z7            IFGT      *ZERO
     C* LST026 = Bsu(C15)
     C                   MOVE      BSU(Z7)       LST026
     C* LST15 = tbr(C15)
     C                   MOVE      TBR(Z7)       LST15
     C* END                                                           *
     C                   END
     C*
     C     $S15AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S508 - SCRN SUB
     C*****************************************************************
     C     S508          BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T07 = 0
     C                   Z-ADD     *ZERO         T07
     C* BSU = ' '
     C                   MOVEA     *BLANKS       BSU
     C* TSU = ' '
     C                   MOVEA     *BLANKS       TSU
     C* TBR = ' '
     C                   MOVEA     *BLANKS       TBR
     C* TSN = ' '
     C                   MOVEA     *BLANKS       TSN
     C* TAL = ' '
     C                   MOVEA     *BLANKS       TAL
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** protect select field
     C* DOW C15<S15CNT
     C     Z7            DOWLT     S15CNT
     C* C15 = C15+1
     C     Z7            ADD       1             RN0061
     C                   Z-ADD     RN0061        Z7
     C* FLDATR T07(C15),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCSALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z7
     C* GETREC D.suplier1,F.SUPLIER1,*NE,SVK025
     C*
     C                   EXSR      S072
     C* DOW (C15<S15CNT)&%STS(D.SUPLIER1,F.SUPLIER1)=*YES
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0060        IFEQ      XYES
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C                   Z-ADD     RN0061        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z7            ADD       1             RN0060
     C                   Z-ADD     RN0060        Z7
     C* ** Unprotect select field.
     C* FLDATR T07(C15),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCSALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* BSU(C15) = suplier1.SUPLIER1.SUSUPPN
     C                   MOVE      *BLANKS       BSU(Z7)
     C                   MOVE      WK0018        BSU(Z7)
     C* ** load screen array.
     C* TSU(C15) = suplier1.SUPLIER1.SUSUPPN
     C                   MOVE      *BLANKS       TSU(Z7)
     C                   MOVE      WK0018        TSU(Z7)
     C* TBR(C15) = suplier1.SUPLIER1.SUBRNBR
     C                   MOVE      *BLANKS       TBR(Z7)
     C                   MOVE      WK0016        TBR(Z7)
     C* TSN(C15) = suplier1.SUPLIER1.SUNAME
     C                   MOVE      *BLANKS       TSN(Z7)
     C                   MOVE      WK0017        TSN(Z7)
     C* TAL(C15) = suplier1.SUPLIER1.SUalpha
     C                   MOVE      *BLANKS       TAL(Z7)
     C                   MOVE      WK0015        TAL(Z7)
     C* ** Save first record on screen.
     C* IF C15=1
     C     Z7            IFEQ      1
     C* FSTALP = tal(C15)
     C                   MOVE      TAL(Z7)       FSTALP
     C* FST026 = tsu(c15)
     C                   MOVE      TSU(Z7)       FST026
     C* FST15 = tbr(c15)
     C                   MOVE      TBR(Z7)       FST15
     C* END                                                           *
     C                   END
     C* IF C15<S15CNT
     C     Z7            IFLT      S15CNT
     C* GETREC D.suplier1,F.SUPLIER1,*NE,SVK025
     C*
     C                   EXSR      S072
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z7            IFLT      S15CNT
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      XYES
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0060        IFEQ      1
     C     RN0061        ANDEQ     1
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C                   Z-ADD     RN0060        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C15>0
     C     Z7            IFGT      *ZERO
     C* LSTALP = tal(C15)
     C                   MOVE      TAL(Z7)       LSTALP
     C* LST026 = tsu(c15)
     C                   MOVE      TSU(Z7)       LST026
     C* LST15 = tbr(c15)
     C                   MOVE      TBR(Z7)       LST15
     C* END                                                           *
     C                   END
     C*
     C     $S508         ENDSR
     C/EJECT
     C*****************************************************************
     C* WDUPD - Update warehouse details
     C*****************************************************************
     C     WDUPD         BEGSR
     C*
     C*                                                               *
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C*
     C                   EXSR      S016
     C* GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,STCOYNO,STWHSE,STITEM
     C*
     C                   EXSR      S074
     C* Update cost
     C* IF ttupdc = 'Y' | ttupdc = 'D'
     C     WTUPDC        IFEQ      'Y'
     C     WTUPDC        OREQ      'D'
     C* IF ttonhc = 'A' & (wdqoh + sttqty) <> 0  ; ** if new total nmot zero cal
     C*    ulate weighted cost
     C     WTONHC        IFEQ      'A'
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     WK0023        ADD       XTTQTY        RN0060
     C     RN0060        IFNE      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      1
     C* WK3091 = ((wdqoh * wducst) + (sttqty * stucst)) / (wdqoh + sttqty)
     C     WK0023        MULT      WK0025        RN0060
     C     XTTQTY        MULT      XTUCST        RN0061
     C                   ADD       RN0061        RN0060
     C     WK0023        ADD       XTTQTY        RN0061
     C                   DIV       RN0061        RN0060
     C                   Z-ADD     RN0060        WK3091
     C* WDUCST = wk3091
     C                   Z-ADD     WK3091        WK0025
     C* END                                                           *
     C                   END
     C* IF ttonhc = 'S' & (wdqoh - sttqty) <> 0
     C     WTONHC        IFEQ      'S'
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     WK0023        SUB       XTTQTY        RN0060
     C     RN0060        IFNE      *ZERO
     C                   Z-ADD     1             RN0060
     C                   ELSE
     C                   Z-ADD     0             RN0060
     C                   END
     C     RN0061        IFEQ      1
     C     RN0060        ANDEQ     1
     C                   Z-ADD     1             RN0061
     C                   ELSE
     C                   Z-ADD     0             RN0061
     C                   END
     C     RN0061        IFEQ      1
     C* WK3091 = ((wdqoh * wducst) + (sttqty * stucst)) / (wdqoh - sttqty)
     C     WK0023        MULT      WK0025        RN0060
     C     XTTQTY        MULT      XTUCST        RN0061
     C                   ADD       RN0061        RN0060
     C     WK0023        SUB       XTTQTY        RN0061
     C                   DIV       RN0061        RN0060
     C                   Z-ADD     RN0060        WK3091
     C* WDUCST = wk3091
     C                   Z-ADD     WK3091        WK0025
     C* END                                                           *
     C                   END
     C* Cost at last receipt if receipt
     C* IF stttyp = cdtrnr
     C     WTTTYP        IFEQ      WDTRNR
     C* WDLCST = stucst
     C                   Z-ADD     XTUCST        WK0021
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* *** Update on hand or allocated
     C* IF ttonhc = 'A' | ttonhc = 'S' | ttonhc = 'R'  ;** must be add or subtra
     C*    ct
     C     WTONHC        IFEQ      'A'
     C     WTONHC        OREQ      'S'
     C     WTONHC        OREQ      'R'
     C* GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhse,stlocn,stitem
     C*
     C                   EXSR      S022
     C* IF ttonhc = 'A'
     C     WTONHC        IFEQ      'A'
     C* WDQOH = wdqoh + sttqty
     C     WK0023        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0023
     C* WIQOH = wiqoh + sttqty
     C     WK0040        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0040
     C* END                                                           *
     C                   END
     C* IF TTONHC = 'S'  ;  If subtract from on hand add to allocated if picking
     C*    list
     C     WTONHC        IFEQ      'S'
     C* IF ttpckl = 'N'                  ;** Picking list updates allocated
     C     WTPCKL        IFEQ      'N'
     C* WDQOH = wdqoh - sttqty
     C     WK0023        SUB       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0023
     C* WIQOH = wiqoh - sttqty
     C     WK0040        SUB       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0040
     C* ELSE                                                          *
     C                   ELSE
     C* WDQAL = wdqal + sttqty
     C     WK0022        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0022
     C* :0172 = :172 + sttqty
     C     WK0039        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0039
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF TTONHC = 'R'  ;  Update reserved
     C     WTONHC        IFEQ      'R'
     C* WDQOR = wdqor + sttqty
     C     WK0024        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0024
     C* WDQOH = wdqoh - sttqty
     C     WK0023        SUB       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0023
     C* :0173 = :173 + sttqty
     C     WK0041        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0041
     C* WIQOH = wiqoh - sttqty
     C     WK0040        SUB       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0040
     C* END                                                           *
     C                   END
     C*                                                               *
     C* UPDATE d.stokmov,f.wlocitm
     C*
     C                   EXSR      S075
     C* END                                                           *
     C                   END
     C* UPDATE d.stokmov,f.waredet
     C*
     C                   EXSR      S077
     C* *** Update trans summary if not reserved
     C* GETREC D.STOKMOV,F.WRITTYP,*EQ,STCOYNO,STWHSE,STITEM,STTTYP
     C*
     C                   EXSR      S079
     C* WK1321 = stucst * sttqty
     C     XTUCST        MULT      XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK1321
     C* IF %sts(D.STOKMOV,F.WRITTYP)=*yes
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* WTTRPQ = wttrpq + sttqty
     C     WK0052        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0052
     C* WTTRYQ = wttryq + sttqty
     C     WK0054        ADD       XTTQTY        RN0061
     C                   Z-ADD     RN0061        WK0054
     C* WTTRPV = wttrpv + wk1321
     C     WK0053        ADD       WK1321        RN0061
     C                   Z-ADD     RN0061        WK0053
     C* WTTRYV = wttryv + wk1321
     C     WK0055        ADD       WK1321        RN0061
     C                   Z-ADD     RN0061        WK0055
     C* UPDATE d.stokmov,f.writtyp
     C*
     C                   EXSR      S080
     C* ELSE                                                          *
     C                   ELSE
     C* WTCOYNO = stcoyno
     C                   MOVE      WK0010        WK0049
     C* WTWHSE = stwhse
     C                   MOVE      XTWHSE        WK0056
     C* WTITEM = stitem
     C                   MOVE      XTITEM        WK0050
     C* WTTRNC = stttyp
     C                   MOVE      WTTTYP        WK0051
     C* WTTRPQ = sttqty
     C                   Z-ADD     XTTQTY        WK0052
     C* WTTRYQ = sttqty
     C                   Z-ADD     XTTQTY        WK0054
     C* WTTRPV = wk1321
     C                   Z-ADD     WK1321        WK0053
     C* WTTRYV = wk1321
     C                   Z-ADD     WK1321        WK0055
     C* WRITE d.stokmov,f.writtyp
     C*
     C                   EXSR      S081
     C* END                                                           *
     C                   END
     C*
     C     $WDUPD        ENDSR
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
     C                   MOVEL     *BLANKS       RN0007
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
     C     RN0011        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0007        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0007        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0011        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0007        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0007        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0014:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0007        CAT(P)    RN0001:0      ARSLT0
     C                   MOVE      *BLANKS       RN0007
     C                   MOVEL     ARSLT0        RN0007
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0005        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0007
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0005        RN0005
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0014        RN0014
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0011        RN0011
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
     C                   Z-ADD     *ZEROS        RN0006
     C* ***                                                           *
     C* IF SYDSEP = ' '
     C     RN0014        IFEQ      *BLANKS
     C* SYDSEP = '/'           ;default seperator
     C                   MOVE      '/'           RN0014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA10 = *blanks
     C                   MOVEA     *BLANKS       A03
     C* WKDA10 = %MVA(SYDATAI); char date to array
     C*  Move array instruction
     C                   MOVEA     RN0004        A03
     C* WKDA8 = *blanks
     C                   MOVEA     *BLANKS       A04
     C* SY1 = 1 ; input index
     C                   Z-ADD     1             Y6
     C* SY2 = 1 ; output index
     C                   Z-ADD     1             Y7
     C*                                                               *
     C* DOW sy1 < 11
     C     Y6            DOWLT     11
     C* *** Drop the seperators
     C* IF WKDA10(SY1) <> ' ' & SY2 < 9 ; process the input
     C     A03(Y6)       IFNE      *BLANKS
     C     Y7            ANDLT     9
     C*                                                               *
     C* *** Drop anything that is not a number
     C*                                                               *
     C* IF WKDA10(SY1) >= '0' *and WKDA10(SY1) <='9'
     C     A03(Y6)       IFGE      '0'
     C     A03(Y6)       ANDLE     '9'
     C* WKDA8(SY2) = WKDA10(SY1)
     C                   MOVE      *BLANKS       A04(Y7)
     C                   MOVE      A03(Y6)       A04(Y7)
     C* *** Ignore non-numerics
     C* SY2 = sy2 + 1
     C     Y7            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* SY1 = sy1 + 1
     C     Y6            ADD       1             RN0061
     C                   Z-ADD     RN0061        Y6
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA8F = %MVA(wkda8) ; array to field
     C*  Move array instruction
     C                   MOVEA     A04           WKDA8F
     C* SYDATNO = %CTN(WKDA8F); stripped date to number
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        RN0006
     C                   MOVE      WKDA8F        RN0006
     C* ***                                                           *
     C* *** Create system base date
     C* ***                                                           *
     C* IF SYDFMT = '1' ; the input date should be in DMC format
     C     RN0011        IFEQ      '1'
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
     C     RN0011        IFEQ      '2'
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
     C                   Z-ADD     *ZEROS        RN0012
     C                   MOVE      SYDMCA        RN0012
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
     C                   MOVE      RN0011        RN0011
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
     C                   MOVE      '0'           RN0009
     C* IF sydatv <> 0
     C     RN0008        IFNE      *ZERO
     C*                                                               *
     C* *** Split the date
     C*                                                               *
     C* SYCYN = %ljf(sydatv)  ; CYY portion
     C*  Left Justify field into result field
     C                   MOVEL     RN0008        SYCYN
     C* SYMDN = %rjf(sydatv)  ; MMDD portion
     C*  Right Justify field into result field
     C                   MOVE      RN0008        SYMDN
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
     C                   Z-ADD     NRSLT         RN0061
     C                   Z-ADD     RN0061        WKLEAP
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
     C                   MOVE      '1'           RN0009
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the months
     C*                                                               *
     C* IF symmn <1 *or symmn >12
     C     SYMMN         IFLT      1
     C     SYMMN         ORGT      12
     C* SYDERR = '1' ; 1=error 0=Valid   ; the month is invalid
     C                   MOVE      '1'           RN0009
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the days
     C*                                                               *
     C* IF syddn <1 *or syddn > wkend
     C     SYDDN         IFLT      1
     C     SYDDN         ORGT      WKEND
     C* SYDERR = '1' ; 1=error 0=Valid   ; the days are invalid
     C                   MOVE      '1'           RN0009
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Init Fields
     C* SYDATV = 0
     C                   Z-ADD     *ZERO         RN0008
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
     C* S013   - SETLL D.IMSTRN,F.IMSTRN,SVK001,SVKtrn
     C**************************************************************************
     C     S013          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   MOVEL     *LOVAL        HD0004                         Company number
     C                   MOVEL     *LOVAL        HTTRNC                         Transaction Type
     C*
     C                   MOVEL     SVK001        KTCO01
     C                   MOVEL     SVK001        HD0004                         Company number
     C                   MOVEL     SVK001        RN0029                         Company number
     C                   MOVEL     SVKTRN        KTTR02
     C                   MOVEL     SVKTRN        HTTRNC                         Transaction Type
     C                   MOVEL     SVKTRN        TTTRNC                         Transaction Type
     C*
     C     K0001         SETLL     IMSTRN                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S014   - GETREC D.SECURTY,F.SECITP,*EQ,PRCOYNO,USERID,TTTRNC
     C**************************************************************************
     C     S014          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     USERID        KSUS02
     C                   MOVEL     *BLANK        KTTR03
     C                   MOVEL     XTTRNC        KTTR03
     C     K0008         CHAIN     SECITP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.SECITP    IMST
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.SECITP    IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S015   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,USERID
     C**************************************************************************
     C     S015          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM002        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     USERID        KSUS02
     C     K0009         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S016   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM002        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     WTTTYP        KTTR02
     C     K0001         CHAIN     IMSTRN                             9091
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
     C* S017   - GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSE
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHSE        KTWH03
     C     K0010         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - GETREC d.itmmast,f.itmmast,*eq,stcoyno,stitem
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     WK0010        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     XTITEM        KTIT04
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHSE,STLOCN
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHSE        KTWH03
     C                   MOVEL     *BLANK        KTLO04
     C                   MOVEL     XTLOCN        KTLO04
     C     K0012         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - GETREC D.STOKMOV,F.WAREHED,*eq,STCOYNO,STWHSt
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHST        KTWH03
     C     K0010         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.STOKMOV,F.WARELOC,*eq,STCOYNO,STWHST,STLOCT
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHST        KTWH03
     C                   MOVEL     *BLANK        KTLO04
     C                   MOVEL     XTLOCT        KTLO04
     C     K0012         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhse,stlocn,stitem
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHSE        KTWH03
     C                   MOVEL     *BLANK        KTLO04
     C                   MOVEL     XTLOCN        KTLO04
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     XTITEM        KTIT05
     C     K0013         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,ttotht
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     PRM002        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     WTOTHT        KTTR02
     C     K0001         CHAIN     IMSTRN                             9091
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
     C* S024   - GETREC d.stokmov,f.wlocitm,*eq,stcoyno,stwhst,stloct,stitem
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHST        KTWH03
     C                   MOVEL     *BLANK        KTLO04
     C                   MOVEL     XTLOCT        KTLO04
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     XTITEM        KTIT05
     C     K0013         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - GETREC d.imstrn,f.imstrn,*eq,stttyp
     C**************************************************************************
     C     S025          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     WTTTYP        KTCO01
     C     K0014         CHAIN     IMSTRN                             9091
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
     C* S026   - GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0801,STTIME
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   Z-ADD     WK0801        KDDT03
     C                   Z-ADD     XTTIME        KDTI04
     C     K0015         CHAIN     EXPDEL                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.EXPDEL    WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.EXPDEL    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - GETREC d.stokmov,f.waredet,*eq,stcoyno,stwhse,stitem
     C**************************************************************************
     C     S027          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   MOVEL     *BLANK        KTWH03
     C                   MOVEL     XTWHSE        KTWH03
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     XTITEM        KTIT05
     C     K0016         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - WRITE D.STOKMOV,F.STOKMOV
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   WRITE     FMT003                               90      ADD REC TO STOKMOV
     C                   Z-ADD     STS18         STS11                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC18         REC11
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(2)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(3)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - GETREC D.STOKMOV,F.EXPDEL,*EQ,STCOYNO,WK0601,STTIME,STTREF
     C**************************************************************************
     C     S029          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     WK0010        KTCO02
     C                   Z-ADD     WK0601        KDDT03
     C                   Z-ADD     XTTIME        KDTI04
     C                   MOVEL     *BLANK        KDTR05
     C                   MOVEL     XTTREF        KDTR05
     C     K0017         CHAIN     EXPDEL                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.EXPDEL    WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.EXPDEL    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - WRITE d.stokmov,f.expdel
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   WRITE     EXPDELFX                             90      ADD REC TO EXPDEL
     C                   Z-ADD     STS17         STS09                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC17         REC09
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(4)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(5)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - GETREC D.ITMMAST,F.ITMMAST,*EQ,PRCOYNO,STITEM
     C**************************************************************************
     C     S031          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     PRM002        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     XTITEM        KTIT04
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - GETREC D.COMPANY,F.COMPANY,*EQ,PRCOYNO
     C**************************************************************************
     C     S032          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM002        KYCO01
     C     K0018         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - GETREC D.COMPANY,F.IMSCPYD,*EQ,PRCOYNO
     C**************************************************************************
     C     S033          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM002        KYCO01
     C     K0018         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.IMSCPYD   IMST
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.IMSCPYD   IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - GETBLK D.IMSTRN,F.IMSTRN,*PV,SVK001
     C**************************************************************************
     C     S034          BEGSR
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK001        KTCO01
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
     C     SWRD05        DOUNE     'Y'                                          RD.SW.IMSTRN
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C     K0014         READPE    IMSTRN                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC05                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0004                         Company number
     C                   MOVEL     *BLANK        HTTRNC                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   END
     C*
     C     SWRD05        IFEQ      'Y'                                          RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S035                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - Process To Reset File Pointer(BOF) - IMSTRN
     C**************************************************************************
     C     S035          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IMSTRN
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0029        KTCO01
     C     K0014         SETLL     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - Process To Reset File Pointer(EOF) - IMSTRN
     C**************************************************************************
     C     S036          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IMSTRN
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IMSTRN
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0029        KTCO01
     C     K0014         SETGT     IMSTRN
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - GETREC D.IMSTRN,F.IMSTRN,*EQ,TTCOYNO,TTTRNC
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     WK0004        KTCO01
     C                   MOVEL     *BLANK        KTTR02
     C                   MOVEL     XTTRNC        KTTR02
     C     K0001         CHAIN     IMSTRN                             9091
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
     C* S038   - SETLL D.STOKMOV,F.WAREDET,SVK002,SVK003,SVK03
     C**************************************************************************
     C     S038          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C*
     C                   MOVEL     SVK002        KDCO01
     C                   MOVEL     SVK002        HD0017                         Company number
     C                   MOVEL     SVK002        RN0052                         Company number
     C                   MOVEL     SVK003        KDWH02
     C                   MOVEL     SVK003        HDWHSE                         Warehouse Number
     C                   MOVEL     SVK003        WDWHSE                         Warehouse Number
     C                   MOVEL     SVK03         KDIT03
     C                   MOVEL     SVK03         HDITEM                         Item Number
     C                   MOVEL     SVK03         WDITEM                         Item Number
     C*
     C     K0019         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS10                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - GETREC D.STOKMOV,F.WAREDET,*PV,SVK002,SVK003
     C**************************************************************************
     C     S039          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK002        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     SVK003        KDWH02
     C     K0020         READPE(N) WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S040                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - Process To Reset File Pointer(BOF) - WAREDET
     C**************************************************************************
     C     S040          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0052        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0020         SETLL     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - GETREC D.STOKMOV,F.WAREDET,*NE,SVK002,SVK003
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK002        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     SVK003        KDWH02
     C     K0020         READE(N)  WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S042                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S042   - Process To Reset File Pointer(EOF) - WAREDET
     C**************************************************************************
     C     S042          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0052        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0020         SETGT     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S043   - GETREC d.itmmast,f.itmmast,*eq,prcoyno,wditem
     C**************************************************************************
     C     S043          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     PRM002        KTCO03
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WK0020        KTIT04
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST   ITMC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - SETLL D.STOKMOV,F.WAREHED,SVK005,SVK04
     C**************************************************************************
     C     S044          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C*
     C                   MOVEL     SVK005        KHCO01
     C                   MOVEL     SVK005        HD0018                         Company number
     C                   MOVEL     SVK005        RN0054                         Company number
     C                   MOVEL     SVK04         KHWH02
     C                   MOVEL     SVK04         HHWHSE                         Warehouse Number
     C                   MOVEL     SVK04         WHWHSE                         Warehouse Number
     C*
     C     K0021         SETLL     WAREHED                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS04                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S045   - GETREC D.STOKMOV,F.WAREHED,*PV,SVK005
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK005        KHCO01
     C     K0022         READPE    WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S046                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S046   - Process To Reset File Pointer(BOF) - WAREHED
     C**************************************************************************
     C     S046          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0054        KHCO01
     C     K0022         SETLL     WAREHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S047   - GETREC D.STOKMOV,F.WAREHED,*NE,SVK005
     C**************************************************************************
     C     S047          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK005        KHCO01
     C     K0022         READE     WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S048                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - Process To Reset File Pointer(EOF) - WAREHED
     C**************************************************************************
     C     S048          BEGSR
     C*
     C     SWRD04        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS04         ANDNE     1122                                         RCD LOCK
     C     STS04         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS04         SVS04                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0054        KHCO01
     C     K0022         SETGT     WAREHED
     C                   Z-ADD     SVS04         STS04                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S049   - SETLL D.STOKMOV,F.WARELOC,SVK007,SVK008,SVK05
     C**************************************************************************
     C     S049          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C*
     C                   MOVEL     SVK007        KLCO01
     C                   MOVEL     SVK007        HD0019                         Company number
     C                   MOVEL     SVK007        RN0056                         Company number
     C                   MOVEL     SVK008        KLWH02
     C                   MOVEL     SVK008        HLWHSE                         Warehouse Number
     C                   MOVEL     SVK008        WLWHSE                         Warehouse Number
     C                   MOVEL     SVK05         KLLO03
     C                   MOVEL     SVK05         HLLOCN                         Location
     C                   MOVEL     SVK05         WLLOCN                         Location
     C*
     C     K0023         SETLL     WARELOC                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS12                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - GETREC D.STOKMOV,F.WARELOC,*PV,SVK007,SVK008
     C**************************************************************************
     C     S050          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK007        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK008        KLWH02
     C     K0024         READPE    WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S051                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - Process To Reset File Pointer(BOF) - WARELOC
     C**************************************************************************
     C     S051          BEGSR
     C*
     C     SWRD12        IFNE      'Y'                                          RD.SW.WARELOC   WLOC
     C     STS12         ANDNE     1122                                         RCD LOCK
     C     STS12         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     STS12         SVS12                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0056        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0024         SETLL     WARELOC
     C                   Z-ADD     SVS12         STS12                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S052   - GETREC D.STOKMOV,F.WARELOC,*NE,SVK007,SVK008
     C**************************************************************************
     C     S052          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK007        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK008        KLWH02
     C     K0024         READE     WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S053                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - Process To Reset File Pointer(EOF) - WARELOC
     C**************************************************************************
     C     S053          BEGSR
     C*
     C     SWRD12        IFNE      'Y'                                          RD.SW.WARELOC   WLOC
     C     STS12         ANDNE     1122                                         RCD LOCK
     C     STS12         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD12                         RD.SW.WARELOC   WLOC
     C                   Z-ADD     STS12         SVS12                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0056        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0024         SETGT     WARELOC
     C                   Z-ADD     SVS12         STS12                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S054   - SETLL D.STOKMOV,F.WLOCITM,SVK010,SVK011,SVK012,SVK06
     C**************************************************************************
     C     S054          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C*
     C                   MOVEL     SVK010        KICO01
     C                   MOVEL     SVK010        HD0020                         Company number
     C                   MOVEL     SVK010        RN0057                         Company number
     C                   MOVEL     SVK011        KIWH02
     C                   MOVEL     SVK011        HIWHSE                         Warehouse Number
     C                   MOVEL     SVK011        WIWHSE                         Warehouse Number
     C                   MOVEL     SVK012        KILO03
     C                   MOVEL     SVK012        HILOCN                         Location
     C                   MOVEL     SVK012        WILOCN                         Location
     C                   MOVEL     SVK06         KIIT04
     C                   MOVEL     SVK06         HIITEM                         Item Number
     C                   MOVEL     SVK06         WIITEM                         Item Number
     C*
     C     K0025         SETLL     WLOCITM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS08                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S055   - GETREC D.STOKMOV,F.WLOCITM,*PV,SVK010,SVK011,SVK012
     C**************************************************************************
     C     S055          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK010        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK011        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     SVK012        KILO03
     C     K0026         READPE(N) WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S056                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S056   - Process To Reset File Pointer(BOF) - WLOCITM
     C**************************************************************************
     C     S056          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.WLOCITM   WLOC
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0057        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KILO03                         Location
     C                   MOVEL     WILOCN        KILO03
     C     K0026         SETLL     WLOCITM
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S057   - GETREC D.STOKMOV,F.WLOCITM,*NE,SVK010,SVK011,SVK012
     C**************************************************************************
     C     S057          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK010        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK011        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     SVK012        KILO03
     C     K0026         READE(N)  WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S058                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S058   - Process To Reset File Pointer(EOF) - WLOCITM
     C**************************************************************************
     C     S058          BEGSR
     C*
     C     SWRD08        IFNE      'Y'                                          RD.SW.WLOCITM   WLOC
     C     STS08         ANDNE     1122                                         RCD LOCK
     C     STS08         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD08                         RD.SW.WLOCITM   WLOC
     C                   Z-ADD     STS08         SVS08                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0057        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KILO03                         Location
     C                   MOVEL     WILOCN        KILO03
     C     K0026         SETGT     WLOCITM
     C                   Z-ADD     SVS08         STS08                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S059   - SETLL D.STOKMOV,F.WLOCITM1,SVK014,SVK015,SVK016,SVK07
     C**************************************************************************
     C     S059          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C                   MOVEL     *LOVAL        HD0023                         Location
     C*
     C                   MOVEL     SVK014        KICO01
     C                   MOVEL     SVK014        HD0021                         Company number
     C                   MOVEL     SVK014        RN0058                         Company number
     C                   MOVEL     SVK015        KIWH02
     C                   MOVEL     SVK015        HD0024                         Warehouse Number
     C                   MOVEL     SVK015        WIWHSE                         Warehouse Number
     C                   MOVEL     SVK016        KIIT03
     C                   MOVEL     SVK016        HD0022                         Item Number
     C                   MOVEL     SVK016        WIITEM                         Item Number
     C                   MOVEL     SVK07         KILO04
     C                   MOVEL     SVK07         HD0023                         Location
     C                   MOVEL     SVK07         WILOCN                         Location
     C*
     C     K0027         SETLL     WLOCITM1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S060   - GETREC D.STOKMOV,F.WLOCITM1,*PV,SVK014,SVK015,SVK016
     C**************************************************************************
     C     S060          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK014        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK015        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK016        KIIT03
     C     K0028         READPE    WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S061                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S061   - Process To Reset File Pointer(BOF) - WLOCITM1
     C**************************************************************************
     C     S061          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.WLOCITM1  WRIT
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0028         SETLL     WLOCITM1
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S062   - GETREC D.STOKMOV,F.WLOCITM1,*NE,SVK014,SVK015,SVK016
     C**************************************************************************
     C     S062          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK014        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK015        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK016        KIIT03
     C     K0028         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S063                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S063   - Process To Reset File Pointer(EOF) - WLOCITM1
     C**************************************************************************
     C     S063          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.WLOCITM1  WRIT
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0058        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0028         SETGT     WLOCITM1
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S064   - SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C**************************************************************************
     C     S064          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD02                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD08                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HD0010                         Branch Number
     C*
     C                   MOVEL     SVK025        KUCO01
     C                   MOVEL     SVK025        HD0011                         Company number
     C                   MOVEL     SVK025        RN0041                         Company number
     C                   MOVEL     SVK026        KUSU02
     C                   MOVEL     SVK026        HD0012                         Supplier Number
     C                   MOVEL     SVK026        RN0043                         Supplier Number
     C                   MOVEL     SVK15         KUBR03
     C                   MOVEL     SVK15         HD0010                         Branch Number
     C                   MOVEL     SVK15         RN0039                         Branch Number
     C*
     C     K0029         SETLL     SUPLIER                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS16                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S065   - GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C**************************************************************************
     C     S065          BEGSR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0030         READPE    SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC16                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S066                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S066   - Process To Reset File Pointer(BOF) - SUPLIER
     C**************************************************************************
     C     S066          BEGSR
     C*
     C     SWRD16        IFNE      'Y'                                          RD.SW.SUPLIER   UOM
     C     STS16         ANDNE     1122                                         RCD LOCK
     C     STS16         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     STS16         SVS16                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0041        KUCO01
     C     K0030         SETLL     SUPLIER
     C                   Z-ADD     SVS16         STS16                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S067   - SETLL D.suplier1,F.SUPLIER1,SVK025,svkalp,SVK026,SVK15
     C**************************************************************************
     C     S067          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER1
     C                   MOVEL     *LOVAL        HD0015                         Company number
     C                   MOVEL     *LOVAL        HD0013                         Alpha Search
     C                   MOVEL     *LOVAL        HD0016                         Supplier Number
     C                   MOVEL     *LOVAL        HD0014                         Branch Number
     C*
     C                   MOVEL     SVK025        KUCO01
     C                   MOVEL     SVK025        HD0015                         Company number
     C                   MOVEL     SVK025        RN0048                         Company number
     C                   MOVEL     SVKALP        KUAL02
     C                   MOVEL     SVKALP        HD0013                         Alpha Search
     C                   MOVEL     SVKALP        RN0045                         Alpha Search
     C                   MOVEL     SVK026        KUSU03
     C                   MOVEL     SVK026        HD0016                         Supplier Number
     C                   MOVEL     SVK026        RN0050                         Supplier Number
     C                   MOVEL     SVK15         KUBR04
     C                   MOVEL     SVK15         HD0014                         Branch Number
     C                   MOVEL     SVK15         RN0046                         Branch Number
     C*
     C     K0031         SETLL     SUPLIER1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S068   - GETREC D.suplier1,F.SUPLIER1,*PV,SVK025
     C**************************************************************************
     C     S068          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0030         READPE    SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S069                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S069   - Process To Reset File Pointer(BOF) - SUPLIER1
     C**************************************************************************
     C     S069          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER1
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0048        KUCO01
     C     K0030         SETLL     SUPLIER1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(6)         MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S070   - GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C**************************************************************************
     C     S070          BEGSR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0030         READE     SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC16                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S071                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S071   - Process To Reset File Pointer(EOF) - SUPLIER
     C**************************************************************************
     C     S071          BEGSR
     C*
     C     SWRD16        IFNE      'Y'                                          RD.SW.SUPLIER   UOM
     C     STS16         ANDNE     1122                                         RCD LOCK
     C     STS16         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD16                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     STS16         SVS16                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0041        KUCO01
     C     K0030         SETGT     SUPLIER
     C                   Z-ADD     SVS16         STS16                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S072   - GETREC D.suplier1,F.SUPLIER1,*NE,SVK025
     C**************************************************************************
     C     S072          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0030         READE     SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S073                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S073   - Process To Reset File Pointer(EOF) - SUPLIER1
     C**************************************************************************
     C     S073          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.SUPLIER1
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0048        KUCO01
     C     K0030         SETGT     SUPLIER1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(7)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S074   - GETREC D.STOKMOV,F.WAREDET,*LOCK,*EQ,STCOYNO,STWHSE,STITEM
     C**************************************************************************
     C     S074          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     WK0010        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     XTWHSE        KDWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     XTITEM        KDIT03
     C     K0019         CHAIN     WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S075   - UPDATE d.stokmov,f.wlocitm
     C**************************************************************************
     C     S075          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     HD0020        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     HIWHSE        KIWH02
     C                   MOVEL     *BLANK        KILO03                         Location
     C                   MOVEL     HILOCN        KILO03
     C                   MOVEL     *BLANK        KIIT04                         Item Number
     C                   MOVEL     HIITEM        KIIT04
     C     K0025         CHAIN     WLOCITM                            9091      CHAIN  WLOCITM
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0057        IFEQ      WK0036
     C     WIITEM        ANDEQ     WK0037
     C     WILOCN        ANDEQ     WK0038
     C     WIQAL         ANDEQ     WK0039
     C     WIQOH         ANDEQ     WK0040
     C     WIQOR         ANDEQ     WK0041
     C     WIWHSE        ANDEQ     WK0042
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   ELSE
     C*
     C                   EXSR      S076                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WLOCITMF                             90      UPDATE WLOCITM
     C                   ELSE
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS08
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(10)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(11)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S076   - Referential Integrity Check (Update) For File WLOCITM
     C**************************************************************************
     C     S076          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0057        IFNE      WK0036
     C     WIWHSE        ORNE      WK0042
     C     WIITEM        ORNE      WK0037
     C*
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0042        KIWH02                         Warehouse Number
     C                   MOVEL     WK0037        KIIT03                         Item Number
     C     K0028         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(8)         MSGDTA                         Cannot add Location
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $076
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0057        IFNE      WK0036
     C     WIWHSE        ORNE      WK0042
     C     WILOCN        ORNE      WK0038
     C*
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0042        KIWH02                         Warehouse Number
     C                   MOVEL     WK0038        KILO03                         Location
     C     K0026         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(9)         MSGDTA                         Cannot add Location
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $076
     C                   END
     C                   END                                                    END-Compare fld.
     C     $076          ENDSR
     C/EJECT
     C**************************************************************************
     C* S077   - UPDATE d.stokmov,f.waredet
     C**************************************************************************
     C     S077          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     HD0017        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     HDWHSE        KDWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HDITEM        KDIT03
     C     K0019         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0052        IFEQ      WK0019
     C     WDITEM        ANDEQ     WK0020
     C     WDLCST        ANDEQ     WK0021
     C     WDQAL         ANDEQ     WK0022
     C     WDQOH         ANDEQ     WK0023
     C     WDQOR         ANDEQ     WK0024
     C     WDUCST        ANDEQ     WK0025
     C     WDUOM         ANDEQ     WK0026
     C     WDWHSE        ANDEQ     WK0027
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S078                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS10
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(14)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(15)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S078   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S078          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0052        IFNE      WK0019
     C     WDWHSE        ORNE      WK0027
     C     WDITEM        ORNE      WK0020
     C                   MOVEL     RN0052        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0019         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(12)        MSGDTA                         DEL0002-Cannot delet
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $078
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0052        IFNE      WK0019
     C     WDITEM        ORNE      WK0020
     C*
     C                   MOVEL     WK0019        KDCO01                         Company number
     C                   MOVEL     WK0020        KDIT02                         Item Number
     C     K0032         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(13)        MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $078
     C                   END
     C                   END                                                    END-Compare fld.
     C     $078          ENDSR
     C/EJECT
     C**************************************************************************
     C* S079   - GETREC D.STOKMOV,F.WRITTYP,*EQ,STCOYNO,STWHSE,STITEM,STTTYP
     C**************************************************************************
     C     S079          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO04
     C                   MOVEL     WK0010        KTCO04
     C                   MOVEL     *BLANK        KTWH05
     C                   MOVEL     XTWHSE        KTWH05
     C                   MOVEL     *BLANK        KTIT06
     C                   MOVEL     XTITEM        KTIT06
     C                   MOVEL     *BLANK        KTTR07
     C                   MOVEL     WTTTYP        KTTR07
     C     K0033         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WRITTYP
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WRITTYP
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S080   - UPDATE d.stokmov,f.writtyp
     C**************************************************************************
     C     S080          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO04                         Company number
     C                   MOVEL     HD0025        KTCO04
     C                   MOVEL     *BLANK        KTWH05                         Warehouse Number
     C                   MOVEL     HTWHSE        KTWH05
     C                   MOVEL     *BLANK        KTIT06                         Item Number
     C                   MOVEL     HD0026        KTIT06
     C                   MOVEL     *BLANK        KTTR07                         Transaction Type
     C                   MOVEL     HD0027        KTTR07
     C     K0033         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0059        IFEQ      WK0049
     C     WTITEM        ANDEQ     WK0050
     C     WTTRNC        ANDEQ     WK0051
     C     WTTRPQ        ANDEQ     WK0052
     C     WTTRPV        ANDEQ     WK0053
     C     WTTRYQ        ANDEQ     WK0054
     C     WTTRYV        ANDEQ     WK0055
     C     WTWHSE        ANDEQ     WK0056
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(16)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(17)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S081   - WRITE d.stokmov,f.writtyp
     C**************************************************************************
     C     S081          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRITTYPF                             90      ADD REC TO WRITTYP
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(18)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(19)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for STOKMOV
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     K0002         CHAIN     WAREHED                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTWHSE'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
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
     C                   MOVEL     'FIL0068'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0003         CHAIN     WAREDET                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTITEM'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
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
     C                   MOVEL     'FIL0019'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0004         CHAIN     WLOCITM                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XTLOCN        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTLOCN'      FLDNAM
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
     C                   MOVEL     'USR0010'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XTTQTY        IFEQ      N1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTTQTY'      FLDNAM
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
     C                   MOVEL     'FLD0077'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XTUCST        IFLE      N1(2)                                        High value
     C     XTUCST        ANDGE     N1(1)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTUCST'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
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
     C                   MOVEL     'FLD0060'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XTWEIG        IFLE      N1(3)                                        High value
     C     XTWEIG        ANDGE     N1(1)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTWEIG'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
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
     C                   MOVEL     'FLD0067'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XTTIME        IFLE      N1(4)                                        High value
     C     XTTIME        ANDGE     N1(1)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTTIME'      FLDNAM
     C                   MOVEL     'SC0002'      FLDSCR
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
     C                   MOVEL     'FLD0076'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0005         CHAIN     SUPLIER                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     WK0012        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0012'      FLDNAM
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
     C                   MOVEL     'FIL0056'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0006         CHAIN     WAREHED                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XTWHST        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTWHST'      FLDNAM
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
     C     K0007         CHAIN     WLOCITM                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XTLOCT        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XTLOCT'      FLDNAM
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
     C                   MOVEL     'FIL0022'     MSGID                          Message id.
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
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    EXPDELX                              91      EXPDELX   STOKMOVX
     C                   UNLOCK    STOKMOVX                             91      STOKMOVX  MSTOKMOVD
     C                   READ      STOKMOV                                90
     C                   READ      EXPDELX                                90
     C                   READ      STOKMOVX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            ITMMAST
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
     C     WFILE#        IFEQ      2                                            WLOCITM1
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
     C     WFILE#        IFEQ      3                                            SUPLIER1
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
     C     WFILE#        IFEQ      4                                            WAREHED
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
     C     WFILE#        IFEQ      6                                            COMPANY
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
     C     WFILE#        IFEQ      7                                            IMSCPYD
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
     C     WFILE#        IFEQ      8                                            WLOCITM
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
     C     WFILE#        IFEQ      9                                            EXPDEL
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
     C     WFILE#        IFEQ      10                                           WAREDET
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
     C     WFILE#        IFEQ      11                                           STOKMOV
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
     C     WFILE#        IFEQ      12                                           WARELOC
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
     C     WFILE#        IFEQ      13                                           SECITP
     C     STS13         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS13                          ASSET LOCK STATUS
     C                   ELSE
     C     STS13         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS13                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      14                                           SECIMS
     C     STS14         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS14                          ASSET LOCK STATUS
     C                   ELSE
     C     STS14         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS14                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      15                                           WRITTYP
     C     STS15         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS15                          ASSET LOCK STATUS
     C                   ELSE
     C     STS15         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS15                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      16                                           SUPLIER
     C     STS16         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS16                          ASSET LOCK STATUS
     C                   ELSE
     C     STS16         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS16                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      17                                           EXPDELX
     C     STS17         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS17                          ASSET LOCK STATUS
     C                   ELSE
     C     STS17         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS17                          TRIGGER TO EXEC NEXT
     C                   END
     C                   END
     C                   END
     C     WFILE#        IFEQ      18                                           STOKMOVX
     C     STS18         IFEQ      1218                                         LOCK(SYS)
     C                   Z-ADD     1122          STS18                          ASSET LOCK STATUS
     C                   ELSE
     C     STS18         IFEQ      1211                                         CLOSED FILE
     C                   EXSR      *PSSR
     C                   ELSE
     C                   Z-ADD     1121          STS18                          TRIGGER TO EXEC NEXT
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
     C*          | Move Fields From Work Area To File - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     WK0036        RN0057                         Company number
     C                   MOVEL     WK0037        WIITEM                         Item Number
     C                   MOVEL     WK0038        WILOCN                         Location
     C                   Z-ADD     WK0039        WIQAL                          Quantity Allocated
     C                   Z-ADD     WK0040        WIQOH                          Quantity on hand
     C                   Z-ADD     WK0041        WIQOR                          Quantity on reserve
     C                   MOVEL     WK0042        WIWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - EXPDEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     WK0001        RN0022                         Branch Number
     C                   MOVEL     XDCARR        EDCARR                         Carrier
     C                   MOVEL     WK0002        RN0023                         Company number
     C                   Z-ADD     WDDTTR        EDDTTR                         Transaction Date
     C                   MOVEL     WK0003        RN0024                         Supplier Number
     C                   Z-ADD     WDTIME        EDTIME                         Expected time
     C                   MOVEL     WDTREF        EDTREF                         Transaction Referenc
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     WK0019        RN0052                         Company number
     C                   MOVEL     WK0020        WDITEM                         Item Number
     C                   Z-ADD     WK0021        WDLCST                         Cost at last receipt
     C                   Z-ADD     WK0022        WDQAL                          Quantity Allocated
     C                   Z-ADD     WK0023        WDQOH                          Quantity on hand
     C                   Z-ADD     WK0024        WDQOR                          Quantity on reserve
     C                   Z-ADD     WK0025        WDUCST                         Unit Cost
     C                   MOVEL     WK0026        WDUOM                          Unit of Measure
     C                   MOVEL     WK0027        WDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     WK0009        RN0035                         Branch Number
     C                   MOVEL     WK0010        RN0036                         Company number
     C                   Z-ADD     WTDTAC        STDTAC                         Actual Date
     C                   Z-ADD     WTDTTR        STDTTR                         Transaction Date
     C                   MOVEL     XTITEM        STITEM                         Item Number
     C                   MOVEL     XTLOCN        STLOCN                         Location
     C                   MOVEL     XTLOCT        STLOCT                         Other Location
     C                   MOVEL     WK0011        STPCKL                         Picking List Y/N
     C                   Z-ADD     WTSEQ         STSEQ                          Picking List No.
     C                   MOVEL     WK0012        RN0037                         Supplier Number
     C                   Z-ADD     XTTIME        STTIME                         Expected Time
     C                   Z-ADD     XTTQTY        STTQTY                         Transaction Quantity
     C                   MOVEL     XTTREF        STTREF                         Transaction Referenc
     C                   MOVEL     WTTTYP        STTTYP                         Transaction Type
     C                   Z-ADD     XTUCST        STUCST                         Unit Cost
     C                   Z-ADD     XTWEIG        STWEIG                         Weight
     C                   MOVEL     XTWHSE        STWHSE                         Warehouse Number
     C                   MOVEL     XTWHST        STWHST                         Other Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     WK0049        RN0059                         Company number
     C                   MOVEL     WK0050        WTITEM                         Item Number
     C                   MOVEL     WK0051        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0052        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0053        WTTRPV                         Trans Period Value
     C                   Z-ADD     WK0054        WTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WK0055        WTTRYV                         Trans YTD Value
     C                   MOVEL     WK0056        WTWHSE                         Warehouse Number
     C                   END
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
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0032        WK0005                         Item Description
     C                   Z-ADD     ITQTYO        WTQTYO                         Outer Quantity
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   MOVEL     ITSUBS        XTSUBS                         Substitute item numb
     C                   MOVEL     ITSUPG        XTSUPG                         Superceding item 'To
     C                   Z-ADD     ITWEIG        WTWEIG                         Item weight
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0031        HD0005                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0058        WK0043                         Company number
     C                   MOVEL     WIITEM        WK0044                         Item Number
     C                   MOVEL     WILOCN        WK0045                         Location
     C                   Z-ADD     WIQAL         WK0046                         Quantity Allocated
     C                   Z-ADD     WIQOH         WK0047                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0048                         Warehouse Number
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0058        HD0021                         Company number
     C                   MOVEL     WIWHSE        HD0024                         Warehouse Number
     C                   MOVEL     WIITEM        HD0022                         Item Number
     C                   MOVEL     WILOCN        HD0023                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     RN0045        WK0015                         Alpha Search
     C                   MOVEL     RN0046        WK0016                         Branch Number
     C                   MOVEL     SUNAME        WK0017                         Customer name
     C                   MOVEL     RN0050        WK0018                         Supplier Number
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0048        HD0015                         Company number
     C                   MOVEL     RN0045        HD0013                         Alpha Search
     C                   MOVEL     RN0050        HD0016                         Supplier Number
     C                   MOVEL     RN0046        HD0014                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     RN0054        WK0028                         Company number
     C                   Z-ADD     WHCTYP        WK0029                         Costing Type
     C                   MOVEL     RN0055        WK0030                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        WK0031                         Warehouse Number
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0054        HD0018                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0029        WK0004                         Company number
     C                   MOVEL     TTDESC        XTDESC                         Description
     C                   MOVEL     TTNEGA        WTNEGA                         Negative allowed
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   MOVEL     TTOTHT        WTOTHT                         Other Transaction Co
     C                   MOVEL     TTPCKL        WTPCKL                         Picking List Y/N
     C                   MOVEL     TTREFE        WTREFE                         Enter Reference
     C                   MOVEL     TTTRNC        XTTRNC                         Transaction Type
     C                   MOVEL     TTUPDC        WTUPDC                         Update Cost
     C                   MOVEL     TTUSDC        WTUSDC                         Used Calculation
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0029        HD0004                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0016        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     CDTRNP        WDTRNP                         Purchasing Trans
     C                   MOVEL     CDTRNR        WDTRNR                         Receiving Trans
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0025        HD0003                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     RN0057        WK0036                         Company number
     C                   MOVEL     WIITEM        WK0037                         Item Number
     C                   MOVEL     WILOCN        WK0038                         Location
     C                   Z-ADD     WIQAL         WK0039                         Quantity Allocated
     C                   Z-ADD     WIQOH         WK0040                         Quantity on hand
     C                   Z-ADD     WIQOR         WK0041                         Quantity on reserve
     C                   MOVEL     WIWHSE        WK0042                         Warehouse Number
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0057        HD0020                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - EXPDEL
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     RN0022        WK0001                         Branch Number
     C                   MOVEL     EDCARR        XDCARR                         Carrier
     C                   MOVEL     RN0023        WK0002                         Company number
     C                   Z-ADD     EDDTTR        WDDTTR                         Transaction Date
     C                   MOVEL     RN0024        WK0003                         Supplier Number
     C                   Z-ADD     EDTIME        WDTIME                         Expected time
     C                   MOVEL     EDTREF        WDTREF                         Transaction Referenc
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0023        HD0002                         Company number
     C                   Z-ADD     EDDTTR        HDDTTR                         Transaction Date
     C                   Z-ADD     EDTIME        HDTIME                         Expected time
     C                   MOVEL     EDTREF        HDTREF                         Transaction Referenc
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     RN0052        WK0019                         Company number
     C                   MOVEL     WDITEM        WK0020                         Item Number
     C                   Z-ADD     WDLCST        WK0021                         Cost at last receipt
     C                   Z-ADD     WDQAL         WK0022                         Quantity Allocated
     C                   Z-ADD     WDQOH         WK0023                         Quantity on hand
     C                   Z-ADD     WDQOR         WK0024                         Quantity on reserve
     C                   Z-ADD     WDUCST        WK0025                         Unit Cost
     C                   MOVEL     WDUOM         WK0026                         Unit of Measure
     C                   MOVEL     WDWHSE        WK0027                         Warehouse Number
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0052        HD0017                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     RN0035        WK0009                         Branch Number
     C                   MOVEL     RN0036        WK0010                         Company number
     C                   Z-ADD     STDTAC        WTDTAC                         Actual Date
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STITEM        XTITEM                         Item Number
     C                   MOVEL     STLOCN        XTLOCN                         Location
     C                   MOVEL     STLOCT        XTLOCT                         Other Location
     C                   MOVEL     STPCKL        WK0011                         Picking List Y/N
     C                   Z-ADD     STSEQ         WTSEQ                          Picking List No.
     C                   MOVEL     RN0037        WK0012                         Supplier Number
     C                   Z-ADD     STTIME        XTTIME                         Expected Time
     C                   Z-ADD     STTQTY        XTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        XTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   Z-ADD     STUCST        XTUCST                         Unit Cost
     C                   Z-ADD     STWEIG        XTWEIG                         Weight
     C                   MOVEL     STWHSE        XTWHSE                         Warehouse Number
     C                   MOVEL     STWHST        XTWHST                         Other Warehouse
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0036        HD0009                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   MOVEL     RN0056        WK0032                         Company number
     C                   MOVEL     WLDESC        WK0033                         Location Description
     C                   MOVEL     WLLOCN        WK0034                         Location
     C                   MOVEL     WLWHSE        WK0035                         Warehouse Number
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     RN0056        HD0019                         Company number
     C                   MOVEL     WLWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECITP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      13
     C                   MOVEL     RN0034        WK0007                         Company number
     C                   MOVEL     UTTRNC        WK0008                         Transaction Type
     C                   MOVEL     UTUSER        WTUSER                         User
     C                   Z-ADD     REC13         HRC13
     C                   MOVEL     RN0034        HD0007                         Company number
     C                   MOVEL     UTUSER        HTUSER                         User
     C                   MOVEL     UTTRNC        HD0008                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      14
     C                   MOVEL     RN0033        WK0006                         Company number
     C                   MOVEL     USUSER        WSUSER                         User
     C                   MOVEL     USWHSE        WSWHSE                         Allowed Warehouse
     C                   Z-ADD     REC14         HRC14
     C                   MOVEL     RN0033        HD0006                         Company number
     C                   MOVEL     USUSER        HSUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     RN0059        WK0049                         Company number
     C                   MOVEL     WTITEM        WK0050                         Item Number
     C                   MOVEL     WTTRNC        WK0051                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0052                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0053                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0054                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0055                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0056                         Warehouse Number
     C                   Z-ADD     REC15         HRC15
     C                   MOVEL     RN0059        HD0025                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HD0026                         Item Number
     C                   MOVEL     WTTRNC        HD0027                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      16
     C                   MOVEL     RN0039        WK0013                         Branch Number
     C                   MOVEL     SUNAME        WUNAME                         Customer name
     C                   MOVEL     RN0043        WK0014                         Supplier Number
     C                   Z-ADD     REC16         HRC16
     C                   MOVEL     RN0041        HD0011                         Company number
     C                   MOVEL     RN0043        HD0012                         Supplier Number
     C                   MOVEL     RN0039        HD0010                         Branch Number
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

Record added to file IMS Stock movement history  ST
Unable to add record to file IMS Stock movement history  ST
Record added to file IMS Expected Deliveries     ED
Unable to add record to file IMS Expected Deliveries     ED
The beginning of the file was reached
The end of the file was reached
Cannot add Location Record Location Does no t exist
Cannot add Location Record Location Does not Exist
Record update for file IMS Warehouse Location Item WI
Unable to update record for file IMS Warehouse Location Item WI
DEL0002-Cannot delete item used in locations
WAREDET   ITMMAST
Record update for file IMS Warehouse Item Details  WD
Unable to update record for file IMS Warehouse Item Details  WD
Record update for file IMS Warehouse Item Types    WT
Unable to update record for file IMS Warehouse Item Types    WT
Record added to file IMS Warehouse Item Types    WT
Unable to add record to file IMS Warehouse Item Types    WT
**   Numeric Constant Array - N1
000000000000000000000000000000
000000000000009999999999900000
000000000099999999999990000000
000000000000000240000000000000
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    XTWHSE    000005050507
SC0002    XTITEM    000005850604
SC0002    XTLOCN    000007450754
SC0002    XTWHST    000014651467
SC0002    XTLOCT    000015451554
SC0002    WK0012    000013851390
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCALOC    XTSUBS    0000  01      01
SCALOC    XTSUPG    0000  02      02
SCLOCT    XTITEM    0000  11      11
SCLOCT    XTWHSE    0000  12      12
SC0001    XYDESC    0000  05      05
SC0002    XYDESC    0000  33      33
SC0002    XTDESC    0000  10      10
SC0002    WK0005    0000  07      07
SC0002    XTITEM    0000  1112    11                   Y
SC0002    XTLOCN    0000  1314    13                   Y
SC0002    XTLOCT    0000  1516    15                   Y
SC0002    WK0012    0000  0809    08                   Y
SC0002    XTTIME    0000  1718    17                   Y
SC0002    XTTQTY    0000  1920    19                   Y
SC0002    XTUCST    0000  2324    23                   Y
SC0002    XTWEIG    0000  2526    25                   Y
SC0002    XTWHSE    0000  2729    27  28               Y
SC0002    XTWHST    0000  3032    30  31               Y
SC0003    XTWHSE    0000  11      11
SC0005    XTWHSE    0000  11      11
SC0006    XTLOCN    0000  11      11
SC0006    XTWHSE    0000  12      12
SC0007    XTITEM    0000  11      11
SC0007    XTWHSE    0000  12      12
SCLOCT    T14       0001            0201
SCLOCT    T14       0002            0403
SCLOCT    T14       0003            0605
SCLOCT    T14       0004            0807
SCLOCT    T14       0005            1009
SCSALP    T07       0001            0201
SCSALP    T07       0002            0403
SCSALP    T07       0003            0605
SCSALP    T07       0004            0807
SCSALP    T07       0005            1009
SCWHST    T04       0001            0201
SCWHST    T04       0002            0403
SCWHST    T04       0003            0605
SCWHST    T04       0004            0807
SCWHST    T04       0005            1009
SC0001    FL0001    0000  0103    010402               Y
SC0002    FL0023    0000  0102    01                   Y
SC0002    XTTREF    0000  2122    21                   Y
SC0002    OTHER     0000            0403
SC0002    PURREC    0000            0605
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
SC0007    T14       0001            0201
SC0007    T14       0002            0403
SC0007    T14       0003            0605
SC0007    T14       0004            0807
SC0007    T14       0005            1009
SC0015    T07       0001            0201
SC0015    T07       0002            0403
SC0015    T07       0003            0605
SC0015    T07       0004            0807
SC0015    T07       0005            1009
