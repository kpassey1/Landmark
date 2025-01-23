     F/TITLE MWAREHED   Work with Warehouse Details
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MWAREHED
     F*  Application ID      -    MWAREHED
     F*  Application Name    -      Work with Warehouse Details
     F*  Date Generated      -    Jan 11, 2012
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  ITMMAST1    - (I/DISK   ) IMS Alpha seq
     F*  ITMMAST     - (I/DISK   ) IMS Item master             IT
     F*  STOKMOV1    - (I/DISK   ) IMS Whs Loc Item Tr date
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  SUPLIER1    - (I/DISK   ) IMS Name seq
     F*  WAREHED     - (U/DISK   ) IMS Warehouse Header        WH
     F*  SECIMS      - (I/DISK   ) IMS User Security           US
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  WARETYP     - (I/DISK   ) IMS Warehouse Types         WT
     F*  WAREDET     - (U/DISK   ) IMS Warehouse Item Details  WD
     F*  STOVGP      - (I/DISK   ) IMS Stock turnover groups   TG
     F*  SUPLIER     - (I/DISK   ) IMS Supplier Master         SU
     F*  UOM         - (I/DISK   ) IMS Unit of measure         UM
     F*  WLOCITM1    - (I/DISK   ) IMS Loc Item In item loc
     F*  WARELOC     - (U/DISK   ) IMS Warehouse Locations     WL
     F*  WRITTYP     - (I/DISK   ) IMS Warehouse Item Types    WT
     F*  WLOCITM     - (U/DISK   ) IMS Warehouse Location Item WI
     F*  FILE0001    - (U/DISK   ) IMS Loc Item In item loc
     F*  MWAREHEDD   - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCIALP     -     List of Items in Alpha
     F*
     F*  01     - SCR020 / T01 : DSPATR(PR)
     F*  02     - SCR020 / T01 : DSPATR(ND)
     F*  03     - SCR020 / T01 : DSPATR(PR)
     F*  04     - SCR020 / T01 : DSPATR(ND)
     F*  05     - SCR020 / T01 : DSPATR(PR)
     F*  06     - SCR020 / T01 : DSPATR(ND)
     F*  07     - SCR020 / T01 : DSPATR(PR)
     F*  08     - SCR020 / T01 : DSPATR(ND)
     F*  09     - SCR020 / T01 : DSPATR(PR)
     F*  10     - SCR020 / T01 : DSPATR(ND)
     F*  80     - SCR020 / T01 : DSPATR(PC)
     F*  80     - SCR020 / T01 : DSPATR(PC)
     F*  80     - SCR020 / T01 : DSPATR(PC)
     F*  80     - SCR020 / T01 : DSPATR(PC)
     F*  80     - SCR020 / T01 : DSPATR(PC)
     F* N79     - SCR020 PUTOVR
     F*
     F*  SCMOVE     - List Screen for stokmov
     F*
     F*  01     - SCR008S1 / FL0023 : DSPATR(ND)
     F*  02     - SCR008 / WDITEM : DSPATR(PC)
     F*  02     - SCR008 / WDITEM : DSPATR(RI)
     F*  03     - SCR008S1 / STLOCN : DSPATR(PC)
     F*  03     - SCR008S1 / STLOCN : DSPATR(RI)
     F*  04     - SCR008S1 / STTQTY : DSPATR(PC)
     F*  04     - SCR008S1 / STTQTY : DSPATR(RI)
     F*  05     - SCR008S1 / STTREF : DSPATR(PC)
     F*  05     - SCR008S1 / STTREF : DSPATR(RI)
     F*  06     - SCR008 / CYDESC : DSPATR(PC)
     F*  06     - SCR008 / CYDESC : DSPATR(RI)
     F*  63     - SCR008C1 SFLDSPCTL
     F*  64     - SCR008C1 SFLDSP
     F*  65     - SCR008S1 SFLNXTCHG
     F*  66     - SCR008C1 SFLINZ
     F*  99     - SCR008 OVERLAY
     F* N63     - SCR008C1 SFLCLR
     F* N64     - SCR008C1 ERASE(SCR008S1)
     F* N67     - SCR008C1 SFLEND
     F* N79     - SCR008 PUTOVR
     F* N79     - SCR008C1 PUTOVR
     F*
     F*  SCSALP     -     List Suppliers in Alpha
     F*
     F*  01     - SCR021 / T07 : DSPATR(PR)
     F*  02     - SCR021 / T07 : DSPATR(ND)
     F*  03     - SCR021 / T07 : DSPATR(PR)
     F*  04     - SCR021 / T07 : DSPATR(ND)
     F*  05     - SCR021 / T07 : DSPATR(PR)
     F*  06     - SCR021 / T07 : DSPATR(ND)
     F*  07     - SCR021 / T07 : DSPATR(PR)
     F*  08     - SCR021 / T07 : DSPATR(ND)
     F*  09     - SCR021 / T07 : DSPATR(PR)
     F*  10     - SCR021 / T07 : DSPATR(ND)
     F*  80     - SCR021 / T07 : DSPATR(PC)
     F*  80     - SCR021 / T07 : DSPATR(PC)
     F*  80     - SCR021 / T07 : DSPATR(PC)
     F*  80     - SCR021 / T07 : DSPATR(PC)
     F*  80     - SCR021 / T07 : DSPATR(PC)
     F* N79     - SCR021 PUTOVR
     F*
     F*  SC0001     - List Screen for WAREHED
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
     F*  05     - SCR001C1 / PS0102 : DSPATR(PR)
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
     F*  SC0002     - Detail Screen for WAREHED
     F*
     F*  01     - SCR002 / WHCTYP : DSPATR(PR)
     F*  01     - SCR002 / WHREPC : DSPATR(PR)
     F*  01     - SCR002 / RN0045 : DSPATR(PR)
     F*  01     - SCR002 / WHWTYP : DSPATR(PR)
     F*  02     - SCR002 / WHCTYP : DSPATR(UL)
     F*  02     - SCR002 / WHREPC : DSPATR(UL)
     F*  02     - SCR002 / RN0045 : DSPATR(UL)
     F*  02     - SCR002 / WHWTYP : DSPATR(UL)
     F*  03     - SCR002 / RN0045 : DSPATR(PC)
     F*  03     - SCR002 / RN0045 : DSPATR(RI)
     F*  04     - SCR002 / WHCTYP : DSPATR(PC)
     F*  04     - SCR002 / WHCTYP : DSPATR(RI)
     F*  05     - SCR002 / WHWHSE : DSPATR(PC)
     F*  05     - SCR002 / WHWHSE : DSPATR(RI)
     F*  06     - SCR002 / WHWHSE : DSPATR(PR)
     F*  07     - SCR002 / WHWHSE : DSPATR(UL)
     F*  08     - SCR002 / WHWTYP : DSPATR(PC)
     F*  08     - SCR002 / WHWTYP : DSPATR(RI)
     F*  09     - SCR002 / CYDESC : DSPATR(PC)
     F*  09     - SCR002 / CYDESC : DSPATR(RI)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     - List Screen for WAREDET
     F*
     F*  01     - SCR003S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR003S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR003S1 / FL0002 : DSPATR(PR)
     F*  03     - SCR003S1 / FL0002 : DSPATR(UL)
     F*  04     - SCR003S1 / FL0002 : DSPATR(ND)
     F*  05     - SCR003S1 / WDITEM : DSPATR(PC)
     F*  05     - SCR003S1 / WDITEM : DSPATR(RI)
     F*  06     - SCR003 / CYDESC : DSPATR(PC)
     F*  06     - SCR003 / CYDESC : DSPATR(RI)
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
     F*  SC0004     - Detail Screen for WAREDET
     F*
     F*  01     - SCR004 / WDEOQ : DSPATR(PR)
     F*  01     - SCR004 / WDFIXQ : DSPATR(PR)
     F*  01     - SCR004 / WDLCST : DSPATR(PR)
     F*  01     - SCR004 / WDLTIM : DSPATR(PR)
     F*  01     - SCR004 / WDMAXB : DSPATR(PR)
     F*  01     - SCR004 / WDMINB : DSPATR(PR)
     F*  01     - SCR004 / WDSAFE : DSPATR(PR)
     F*  01     - SCR004 / WDSBRN : DSPATR(PR)
     F*  01     - SCR004 / WDSTOG : DSPATR(PR)
     F*  01     - SCR004 / RN0043 : DSPATR(PR)
     F*  01     - SCR004 / WDUCST : DSPATR(PR)
     F*  01     - SCR004 / WDUOM : DSPATR(PR)
     F*  02     - SCR004 / WDEOQ : DSPATR(UL)
     F*  02     - SCR004 / WDFIXQ : DSPATR(UL)
     F*  02     - SCR004 / WDLCST : DSPATR(UL)
     F*  02     - SCR004 / WDLTIM : DSPATR(UL)
     F*  02     - SCR004 / WDMAXB : DSPATR(UL)
     F*  02     - SCR004 / WDMINB : DSPATR(UL)
     F*  02     - SCR004 / WDSAFE : DSPATR(UL)
     F*  02     - SCR004 / WDSBRN : DSPATR(UL)
     F*  02     - SCR004 / WDSTOG : DSPATR(UL)
     F*  02     - SCR004 / RN0043 : DSPATR(UL)
     F*  02     - SCR004 / WDUCST : DSPATR(UL)
     F*  02     - SCR004 / WDUOM : DSPATR(UL)
     F*  03     - SCR004 / RN0043 : DSPATR(PC)
     F*  03     - SCR004 / RN0043 : DSPATR(RI)
     F*  04     - SCR004 / WDEOQ : DSPATR(PC)
     F*  04     - SCR004 / WDEOQ : DSPATR(RI)
     F*  05     - SCR004 / WDFIXQ : DSPATR(PC)
     F*  05     - SCR004 / WDFIXQ : DSPATR(RI)
     F*  06     - SCR004 / WDITEM : DSPATR(PC)
     F*  06     - SCR004 / WDITEM : DSPATR(RI)
     F*  07     - SCR004 / WDITEM : DSPATR(PR)
     F*  08     - SCR004 / WDITEM : DSPATR(UL)
     F*  09     - SCR004 / WDLCST : DSPATR(PC)
     F*  09     - SCR004 / WDLCST : DSPATR(RI)
     F*  10     - SCR004 / WDLTIM : DSPATR(PC)
     F*  10     - SCR004 / WDLTIM : DSPATR(RI)
     F*  11     - SCR004 / WDMAXB : DSPATR(PC)
     F*  11     - SCR004 / WDMAXB : DSPATR(RI)
     F*  12     - SCR004 / WDMINB : DSPATR(PC)
     F*  12     - SCR004 / WDMINB : DSPATR(RI)
     F*  13     - SCR004 / WDSAFE : DSPATR(PC)
     F*  13     - SCR004 / WDSAFE : DSPATR(RI)
     F*  14     - SCR004 / WDSTOG : DSPATR(PC)
     F*  14     - SCR004 / WDSTOG : DSPATR(RI)
     F*  15     - SCR004 / WDUCST : DSPATR(PC)
     F*  15     - SCR004 / WDUCST : DSPATR(RI)
     F*  16     - SCR004 / WDUOM : DSPATR(PC)
     F*  16     - SCR004 / WDUOM : DSPATR(RI)
     F*  17     - SCR004 / CYDESC : DSPATR(PC)
     F*  17     - SCR004 / CYDESC : DSPATR(RI)
     F*  99     - SCR004 OVERLAY
     F* N79     - SCR004 PUTOVR
     F*
     F*  SC0005     - List Screen for WLOCITM1
     F*
     F*  01     - SCR005S1 / FL0004 : DSPATR(PC)
     F*  01     - SCR005S1 / FL0004 : DSPATR(RI)
     F*  02     - SCR005S1 / FL0004 : DSPATR(PR)
     F*  03     - SCR005S1 / FL0004 : DSPATR(UL)
     F*  04     - SCR005S1 / FL0004 : DSPATR(ND)
     F*  05     - SCR005S1 / WILOCN : DSPATR(PC)
     F*  05     - SCR005S1 / WILOCN : DSPATR(RI)
     F*  06     - SCR005 / CYDESC : DSPATR(PC)
     F*  06     - SCR005 / CYDESC : DSPATR(RI)
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
     F*  SC0006     - Detail Screen for WLOCITM1
     F*
     F*  01     - SCR006 / WIMINB : DSPATR(PC)
     F*  01     - SCR006 / WIMINB : DSPATR(RI)
     F*  02     - SCR006 / WIMINB : DSPATR(PR)
     F*  03     - SCR006 / WIMINB : DSPATR(UL)
     F*  04     - SCR006 / WILOCN : DSPATR(PC)
     F*  04     - SCR006 / WILOCN : DSPATR(RI)
     F*  05     - SCR006 / WILOCN : DSPATR(PR)
     F*  06     - SCR006 / WILOCN : DSPATR(UL)
     F*  07     - SCR006 / WLDESC : DSPATR(PC)
     F*  07     - SCR006 / WLDESC : DSPATR(RI)
     F*  08     - SCR006 / CYDESC : DSPATR(PC)
     F*  08     - SCR006 / CYDESC : DSPATR(RI)
     F*  99     - SCR006 OVERLAY
     F* N79     - SCR006 PUTOVR
     F*
     F*  SC0007     - List Screen for WRITTYP
     F*
     F*  01     - SCR007 / CYDESC : DSPATR(PC)
     F*  01     - SCR007 / CYDESC : DSPATR(RI)
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
     F*  SC0009     - List Screen for WARELOC
     F*
     F*  01     - SCR009S1 / FL0006 : DSPATR(PC)
     F*  01     - SCR009S1 / FL0006 : DSPATR(RI)
     F*  02     - SCR009S1 / FL0006 : DSPATR(PR)
     F*  03     - SCR009S1 / FL0006 : DSPATR(UL)
     F*  04     - SCR009S1 / FL0006 : DSPATR(ND)
     F*  05     - SCR009 / CYDESC : DSPATR(PC)
     F*  05     - SCR009 / CYDESC : DSPATR(RI)
     F*  63     - SCR009C1 SFLDSPCTL
     F*  64     - SCR009C1 SFLDSP
     F*  65     - SCR009S1 SFLNXTCHG
     F*  66     - SCR009C1 SFLINZ
     F*  99     - SCR009 OVERLAY
     F* N63     - SCR009C1 SFLCLR
     F* N64     - SCR009C1 ERASE(SCR009S1)
     F* N67     - SCR009C1 SFLEND
     F* N79     - SCR009 PUTOVR
     F* N79     - SCR009C1 PUTOVR
     F*
     F*  SC0010     - Detail Screen for WARELOC
     F*
     F*  01     - SCR010 / WLDESC : DSPATR(PR)
     F*  01     - SCR010 / WLHITE : DSPATR(PR)
     F*  01     - SCR010 / WLPCKA : DSPATR(PR)
     F*  01     - SCR010 / WLPCKF : DSPATR(PR)
     F*  01     - SCR010 / WLPCKR : DSPATR(PR)
     F*  01     - SCR010 / WLRSTN : DSPATR(PR)
     F*  01     - SCR010 / WLSIZE : DSPATR(PR)
     F*  01     - SCR010 / WLWEIG : DSPATR(PR)
     F*  02     - SCR010 / WLDESC : DSPATR(UL)
     F*  02     - SCR010 / WLHITE : DSPATR(UL)
     F*  02     - SCR010 / WLPCKA : DSPATR(UL)
     F*  02     - SCR010 / WLPCKF : DSPATR(UL)
     F*  02     - SCR010 / WLPCKR : DSPATR(UL)
     F*  02     - SCR010 / WLRSTN : DSPATR(UL)
     F*  02     - SCR010 / WLSIZE : DSPATR(UL)
     F*  02     - SCR010 / WLWEIG : DSPATR(UL)
     F*  03     - SCR010 / WLDESC : DSPATR(PC)
     F*  03     - SCR010 / WLDESC : DSPATR(RI)
     F*  04     - SCR010 / WLHITE : DSPATR(PC)
     F*  04     - SCR010 / WLHITE : DSPATR(RI)
     F*  05     - SCR010 / WLLOCN : DSPATR(PC)
     F*  05     - SCR010 / WLLOCN : DSPATR(RI)
     F*  06     - SCR010 / WLLOCN : DSPATR(PR)
     F*  07     - SCR010 / WLLOCN : DSPATR(UL)
     F*  08     - SCR010 / WLPCKA : DSPATR(PC)
     F*  08     - SCR010 / WLPCKA : DSPATR(RI)
     F*  09     - SCR010 / WLPCKF : DSPATR(PC)
     F*  09     - SCR010 / WLPCKF : DSPATR(RI)
     F*  10     - SCR010 / WLSIZE : DSPATR(PC)
     F*  10     - SCR010 / WLSIZE : DSPATR(RI)
     F*  11     - SCR010 / WLWEIG : DSPATR(PC)
     F*  11     - SCR010 / WLWEIG : DSPATR(RI)
     F*  12     - SCR010 / CYDESC : DSPATR(PC)
     F*  12     - SCR010 / CYDESC : DSPATR(RI)
     F*  99     - SCR010 OVERLAY
     F* N79     - SCR010 PUTOVR
     F*
     F*  SC0011     - List Screen for WLOCITM
     F*
     F*  01     - SCR011S1 / FL0007 : DSPATR(PC)
     F*  01     - SCR011S1 / FL0007 : DSPATR(RI)
     F*  02     - SCR011S1 / FL0007 : DSPATR(PR)
     F*  03     - SCR011S1 / FL0007 : DSPATR(UL)
     F*  04     - SCR011S1 / FL0007 : DSPATR(ND)
     F*  05     - SCR011S1 / WIITEM : DSPATR(PC)
     F*  05     - SCR011S1 / WIITEM : DSPATR(RI)
     F*  06     - SCR011 / CYDESC : DSPATR(PC)
     F*  06     - SCR011 / CYDESC : DSPATR(RI)
     F*  63     - SCR011C1 SFLDSPCTL
     F*  64     - SCR011C1 SFLDSP
     F*  65     - SCR011S1 SFLNXTCHG
     F*  66     - SCR011C1 SFLINZ
     F*  99     - SCR011 OVERLAY
     F* N63     - SCR011C1 SFLCLR
     F* N64     - SCR011C1 ERASE(SCR011S1)
     F* N67     - SCR011C1 SFLEND
     F* N79     - SCR011 PUTOVR
     F* N79     - SCR011C1 PUTOVR
     F*
     F*  SC0012     - Detail Screen for WLOCITM
     F*
     F*  01     - SCR012 / RN0017 : DSPATR(PC)
     F*  01     - SCR012 / RN0017 : DSPATR(RI)
     F*  02     - SCR012 / WIITEM : DSPATR(PC)
     F*  02     - SCR012 / WIITEM : DSPATR(RI)
     F*  03     - SCR012 / WIITEM : DSPATR(PR)
     F*  04     - SCR012 / WIITEM : DSPATR(UL)
     F*  05     - SCR012 / WIMINB : DSPATR(PC)
     F*  05     - SCR012 / WIMINB : DSPATR(RI)
     F*  06     - SCR012 / WIMINB : DSPATR(PR)
     F*  07     - SCR012 / WIMINB : DSPATR(UL)
     F*  08     - SCR012 / CYDESC : DSPATR(PC)
     F*  08     - SCR012 / CYDESC : DSPATR(RI)
     F*  99     - SCR012 OVERLAY
     F* N79     - SCR012 PUTOVR
     F*
     F*  SC0013     -         List of Items
     F*
     F*  01     - SCR013 / T01 : DSPATR(PR)
     F*  02     - SCR013 / T01 : DSPATR(ND)
     F*  03     - SCR013 / T01 : DSPATR(PR)
     F*  04     - SCR013 / T01 : DSPATR(ND)
     F*  05     - SCR013 / T01 : DSPATR(PR)
     F*  06     - SCR013 / T01 : DSPATR(ND)
     F*  07     - SCR013 / T01 : DSPATR(PR)
     F*  08     - SCR013 / T01 : DSPATR(ND)
     F*  09     - SCR013 / T01 : DSPATR(PR)
     F*  10     - SCR013 / T01 : DSPATR(ND)
     F*  80     - SCR013 / T01 : DSPATR(PC)
     F*  80     - SCR013 / T01 : DSPATR(PC)
     F*  80     - SCR013 / T01 : DSPATR(PC)
     F*  80     - SCR013 / T01 : DSPATR(PC)
     F*  80     - SCR013 / T01 : DSPATR(PC)
     F* N79     - SCR013 PUTOVR
     F*
     F*  SC0014     -      List Turnover Groups
     F*
     F*  01     - SCR014 / T04 : DSPATR(PR)
     F*  02     - SCR014 / T04 : DSPATR(ND)
     F*  03     - SCR014 / T04 : DSPATR(PR)
     F*  04     - SCR014 / T04 : DSPATR(ND)
     F*  05     - SCR014 / T04 : DSPATR(PR)
     F*  06     - SCR014 / T04 : DSPATR(ND)
     F*  07     - SCR014 / T04 : DSPATR(PR)
     F*  08     - SCR014 / T04 : DSPATR(ND)
     F*  09     - SCR014 / T04 : DSPATR(PR)
     F*  10     - SCR014 / T04 : DSPATR(ND)
     F*  80     - SCR014 / T04 : DSPATR(PC)
     F*  80     - SCR014 / T04 : DSPATR(PC)
     F*  80     - SCR014 / T04 : DSPATR(PC)
     F*  80     - SCR014 / T04 : DSPATR(PC)
     F*  80     - SCR014 / T04 : DSPATR(PC)
     F* N79     - SCR014 PUTOVR
     F*
     F*  SC0015     -        List Suppliers
     F*
     F*  01     - SCR015 / T07 : DSPATR(PR)
     F*  02     - SCR015 / T07 : DSPATR(ND)
     F*  03     - SCR015 / T07 : DSPATR(PR)
     F*  04     - SCR015 / T07 : DSPATR(ND)
     F*  05     - SCR015 / T07 : DSPATR(PR)
     F*  06     - SCR015 / T07 : DSPATR(ND)
     F*  07     - SCR015 / T07 : DSPATR(PR)
     F*  08     - SCR015 / T07 : DSPATR(ND)
     F*  09     - SCR015 / T07 : DSPATR(PR)
     F*  10     - SCR015 / T07 : DSPATR(ND)
     F*  80     - SCR015 / T07 : DSPATR(PC)
     F*  80     - SCR015 / T07 : DSPATR(PC)
     F*  80     - SCR015 / T07 : DSPATR(PC)
     F*  80     - SCR015 / T07 : DSPATR(PC)
     F*  80     - SCR015 / T07 : DSPATR(PC)
     F* N79     - SCR015 PUTOVR
     F*
     F*  SC0016     -      List Unit Of Measure
     F*
     F*  01     - SCR016 / T11 : DSPATR(PR)
     F*  02     - SCR016 / T11 : DSPATR(ND)
     F*  03     - SCR016 / T11 : DSPATR(PR)
     F*  04     - SCR016 / T11 : DSPATR(ND)
     F*  05     - SCR016 / T11 : DSPATR(PR)
     F*  06     - SCR016 / T11 : DSPATR(ND)
     F*  07     - SCR016 / T11 : DSPATR(PR)
     F*  08     - SCR016 / T11 : DSPATR(ND)
     F*  09     - SCR016 / T11 : DSPATR(PR)
     F*  10     - SCR016 / T11 : DSPATR(ND)
     F*  80     - SCR016 / T11 : DSPATR(PC)
     F*  80     - SCR016 / T11 : DSPATR(PC)
     F*  80     - SCR016 / T11 : DSPATR(PC)
     F*  80     - SCR016 / T11 : DSPATR(PC)
     F*  80     - SCR016 / T11 : DSPATR(PC)
     F* N79     - SCR016 PUTOVR
     F*
     F*  SC0017     -     List of Warehouse Types
     F*
     F*  01     - SCR017 / T14 : DSPATR(PR)
     F*  02     - SCR017 / T14 : DSPATR(ND)
     F*  03     - SCR017 / T14 : DSPATR(PR)
     F*  04     - SCR017 / T14 : DSPATR(ND)
     F*  05     - SCR017 / T14 : DSPATR(PR)
     F*  06     - SCR017 / T14 : DSPATR(ND)
     F*  07     - SCR017 / T14 : DSPATR(PR)
     F*  08     - SCR017 / T14 : DSPATR(ND)
     F*  09     - SCR017 / T14 : DSPATR(PR)
     F*  10     - SCR017 / T14 : DSPATR(ND)
     F*  80     - SCR017 / T14 : DSPATR(PC)
     F*  80     - SCR017 / T14 : DSPATR(PC)
     F*  80     - SCR017 / T14 : DSPATR(PC)
     F*  80     - SCR017 / T14 : DSPATR(PC)
     F*  80     - SCR017 / T14 : DSPATR(PC)
     F* N79     - SCR017 PUTOVR
     F*
     F*  SC0018     - List of Locations in Warehouse
     F*
     F*  01     - SCR018 / T01 : DSPATR(PR)
     F*  02     - SCR018 / T01 : DSPATR(ND)
     F*  03     - SCR018 / T01 : DSPATR(PR)
     F*  04     - SCR018 / T01 : DSPATR(ND)
     F*  05     - SCR018 / T01 : DSPATR(PR)
     F*  06     - SCR018 / T01 : DSPATR(ND)
     F*  07     - SCR018 / T01 : DSPATR(PR)
     F*  08     - SCR018 / T01 : DSPATR(ND)
     F*  09     - SCR018 / T01 : DSPATR(PR)
     F*  10     - SCR018 / T01 : DSPATR(ND)
     F*  11     - SCR018 / RN0045 : DSPATR(PC)
     F*  11     - SCR018 / RN0045 : DSPATR(RI)
     F*  12     - SCR018 / WHWHSE : DSPATR(PC)
     F*  12     - SCR018 / WHWHSE : DSPATR(RI)
     F*  80     - SCR018 / T01 : DSPATR(PC)
     F*  80     - SCR018 / T01 : DSPATR(PC)
     F*  80     - SCR018 / T01 : DSPATR(PC)
     F*  80     - SCR018 / T01 : DSPATR(PC)
     F*  80     - SCR018 / T01 : DSPATR(PC)
     F* N79     - SCR018 PUTOVR
     F*
     F*  SC0019     -   List of Items in Warehouse
     F*
     F*  01     - SCR019 / T01 : DSPATR(PR)
     F*  02     - SCR019 / T01 : DSPATR(ND)
     F*  03     - SCR019 / T01 : DSPATR(PR)
     F*  04     - SCR019 / T01 : DSPATR(ND)
     F*  05     - SCR019 / T01 : DSPATR(PR)
     F*  06     - SCR019 / T01 : DSPATR(ND)
     F*  07     - SCR019 / T01 : DSPATR(PR)
     F*  08     - SCR019 / T01 : DSPATR(ND)
     F*  09     - SCR019 / T01 : DSPATR(PR)
     F*  10     - SCR019 / T01 : DSPATR(ND)
     F*  11     - SCR019 / RN0045 : DSPATR(PC)
     F*  11     - SCR019 / RN0045 : DSPATR(RI)
     F*  12     - SCR019 / WHWHSE : DSPATR(PC)
     F*  12     - SCR019 / WHWHSE : DSPATR(RI)
     F*  80     - SCR019 / T01 : DSPATR(PC)
     F*  80     - SCR019 / T01 : DSPATR(PC)
     F*  80     - SCR019 / T01 : DSPATR(PC)
     F*  80     - SCR019 / T01 : DSPATR(PC)
     F*  80     - SCR019 / T01 : DSPATR(PC)
     F* N79     - SCR019 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for WAREHED
     F* S002 - Detail Screen for WAREHED
     F* S003 - List Screen for WAREDET
     F* S004 - Detail Screen for WAREDET
     F* S005 - List Screen for WLOCITM1
     F* S006 - Detail Screen for WLOCITM1
     F* S007 - List Screen for WRITTYP
     F* S008 - List Screen for stokmov
     F* S009 - List Screen for WARELOC
     F* S010 - Detail Screen for WARELOC
     F* S011 - List Screen for WLOCITM
     F* S012 - Detail Screen for WLOCITM
     F* S013 -         List of Items
     F* S014 -      List Turnover Groups
     F* S015 -        List Suppliers
     F* S016 -      List Unit Of Measure
     F* S017 -     List of Warehouse Types
     F* S018 - List of Locations in Warehouse
     F* S019 -   List of Items in Warehouse
     F* S020 -     List of Items in Alpha
     F* S021 -     List Suppliers in Alpha
     F* SREDSP -  Redisplay Windows within stack.
     F* SYSDAT - System Date
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
     F* S07FWD - SCRN SUB
     F* S500 - SCRN SUB
     F* S09BKW - SCRN SUB
     F* S09EDT - SCRN SUB
     F* S09FWD - SCRN SUB
     F* S11BKW - SCRN SUB
     F* S11EDT - SCRN SUB
     F* S11FWD - SCRN SUB
     F* S13ABR - SCRN SUB
     F* S501 - SCRN SUB
     F* S502 - SCRN SUB
     F* S503 - SCRN SUB
     F* S13AFR - SCRN SUB
     F* S504 - SCRN SUB
     F* S505 - SCRN SUB
     F* S506 - SCRN SUB
     F* S13ALD - SCRN SUB
     F* S507 - SCRN SUB
     F* S508 - SCRN SUB
     F* S509 - SCRN SUB
     F* S14ABR - SCRN SUB
     F* S14AFR - SCRN SUB
     F* S14ALD - SCRN SUB
     F* S15ABR - SCRN SUB
     F* S510 - SCRN SUB
     F* S15AFR - SCRN SUB
     F* S511 - SCRN SUB
     F* S15ALD - SCRN SUB
     F* S512 - SCRN SUB
     F* S16ABR - SCRN SUB
     F* S16AFR - SCRN SUB
     F* S16ALD - SCRN SUB
     F* S17ABR - SCRN SUB
     F* S17AFR - SCRN SUB
     F* S17ALD - SCRN SUB
     F* SY0010 - Format Date
     F* SMSG - calls message handling program to either clear, add, or
     F* S022   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,WK10A1
     F* S023   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,usugrp
     F* S024   - GETREC d.company,f.company,*eq,prcoyno
     F* S025   - SETLL D.WAREHED,F.WAREHED,SVK001,SVK002
     F* S026   - GETREC D.WAREHED,F.WAREHED,*lock,*eq,SVK001,SVK002
     F* S027   - GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     F* S028   - GETREC D.WAREHED,F.WAREHED,*eq,SVK001,SVK002
     F* S029   - SETLL D.WAREHED,F.WAREDET,PRCOYNO,WHWHSE
     F* S030   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYNO,WHWHSE
     F* S031   - Process To Reset File Pointer(EOF) - WAREDET
     F* S032   - DELETE D.WAREHED,F.WAREHED
     F* S033   - UPDATE D.WAREHED,F.WAREHED
     F* S034   - WRITE D.WAREHED,F.WAREHED
     F* S035   - SETLL D.WAREHED,F.WAREDET,SVK003,SVK004,SVK005
     F* S036   - GETREC D.WAREHED,F.WAREDET,*lock,*eq,SVK003,SVK004,SVK005
     F* S037   - GETREC D.WAREHED,F.WAREDET,*eq,SVK003,SVK004,SVK005
     F* S038   - GETREC D.WAREHED,F.ITMMAST,*eq,WDCOYNO,WDITEM
     F* S039   - GETREC D.WAREHED,F.STOVGP,*eq,WDCOYNO,WDSTOG
     F* S040   - GETREC D.WAREHED,F.SUPLIER,*eq,WDCOYNO,WDSUPPN
     F* S041   - GETREC D.WAREHED,F.UOM,*eq,WDCOYNO,WDUOM
     F* S042   - GETREC D.WAREHED,F.SUPLIER,*EQ,WDCOYNO,WDSUPPN,WDSBRN
     F* S043   - DELETE D.WAREHED,F.WAREDET
     F* S044   - Referential Integrity Check (Delete) For File WAREDET
     F* S045   - UPDATE D.WAREHED,F.WAREDET
     F* S046   - Referential Integrity Check (Update) For File WAREDET
     F* S047   - WRITE D.WAREHED,F.WAREDET
     F* S048   - Referential Integrity Check (Add) For File WAREDET
     F* S049   - GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     F* S050   - SETLL D.WAREHED,F.WLOCITM1,SVK006,SVK007,SVK008,SVK009
     F* S051   - GETREC D.WAREHED,F.WLOCITM1,*lock,*eq,SVK006,SVK007,SVK008,SVK0
     F* S052   - GETREC D.WAREHED,F.WLOCITM1,*eq,SVK006,SVK007,SVK008,SVK009
     F* S053   - GETREC D.WAREHED,F.WARELOC,*EQ,:131,:132,:315
     F* S054   - GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,:0315
     F* S055   - DELETE D.WAREHED,F.WLOCITM1
     F* S056   - UPDATE D.WAREHED,F.WLOCITM1
     F* S057   - Referential Integrity Check (Update) For File WLOCITM1
     F* S058   - WRITE D.WAREHED,F.WLOCITM1
     F* S059   - Referential Integrity Check (Add) For File WLOCITM1
     F* S060   - SETLL D.WAREHED,F.WRITTYP,SVK010,SVK011,SVK012,SVK013
     F* S061   - SETLL D.STOKMOV1,F.STOKMOV1,SVK010,SVK011,SVK012
     F* S062   - SETLL D.WAREHED,F.WARELOC,SVK014,SVK015,SVK016
     F* S063   - GETREC D.WAREHED,F.WARELOC,*lock,*eq,SVK014,SVK015,SVK016
     F* S064   - GETREC D.WAREHED,F.WARELOC,*eq,SVK014,SVK015,SVK016
     F* S065   - DELETE D.WAREHED,F.WARELOC
     F* S066   - Referential Integrity Check (Delete) For File WARELOC
     F* S067   - UPDATE D.WAREHED,F.WARELOC
     F* S068   - Referential Integrity Check (Update) For File WARELOC
     F* S069   - WRITE D.WAREHED,F.WARELOC
     F* S070   - SETLL D.WAREHED,F.WLOCITM,SVK017,SVK018,SVK019,SVK020
     F* S071   - GETREC D.WAREHED,F.WLOCITM,*lock,*eq,SVK017,SVK018,SVK019,SVK02
     F* S072   - GETREC D.WAREHED,F.WLOCITM,*eq,SVK017,SVK018,SVK019,SVK020
     F* S073   - GETREC d.warehed,f.itmmast,*eq,prcoyno,:66
     F* S074   - DELETE D.WAREHED,F.WLOCITM
     F* S075   - UPDATE D.WAREHED,F.WLOCITM
     F* S076   - Referential Integrity Check (Update) For File WLOCITM
     F* S077   - WRITE D.WAREHED,F.WLOCITM
     F* S078   - Referential Integrity Check (Add) For File WLOCITM
     F* S079   - GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno
     F* S080   - Process To Reset File Pointer(BOF) - WAREHED
     F* S081   - Process To Reset File Pointer(EOF) - WAREHED
     F* S082   - GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno,uswhse
     F* S083   - Process To Reset File Pointer(BOF) - WAREHED
     F* S084   - Process To Reset File Pointer(EOF) - WAREHED
     F* S085   - GETREC D.WAREHED,F.WAREHED,*EQ,WHCOYNO,WHWHSE
     F* S086   - GETBLK D.WAREHED,F.WAREDET,F.ITMMAST,*PV,SVK003,SVK004
     F* S087   - Process To Reset File Pointer(BOF) - WAREDET   ITMMAST
     F* S088   - Process To Reset File Pointer(EOF) - WAREDET   ITMMAST
     F* S089   - GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     F* S090   - GETBLK D.WAREHED,F.WLOCITM1,*PV,SVK006,SVK007,SVK008
     F* S091   - Process To Reset File Pointer(BOF) - WLOCITM1
     F* S092   - Process To Reset File Pointer(EOF) - WLOCITM1
     F* S093   - GETREC D.WAREHED,F.WLOCITM1,*EQ,:0131,:0132,:0133,:0315
     F* S094   - GETBLK D.WAREHED,F.WRITTYP,*PV,SVK010,SVK011,SVK012
     F* S095   - Process To Reset File Pointer(BOF) - WRITTYP
     F* S096   - Process To Reset File Pointer(EOF) - WRITTYP
     F* S097   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,wttrnc
     F* S098   - Process To Reset File Pointer(EOF) - STOKMOV1
     F* S099   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     F* S100   - GETBLK D.WAREHED,F.WARELOC,*PV,SVK014,SVK015
     F* S101   - Process To Reset File Pointer(BOF) - WARELOC
     F* S102   - Process To Reset File Pointer(EOF) - WARELOC
     F* S103   - GETREC D.WAREHED,F.WARELOC,*EQ,WLCOYNO,WLWHSE,WLLOCN
     F* S104   - GETBLK D.WAREHED,F.WLOCITM,*PV,SVK017,SVK018,SVK019
     F* S105   - Process To Reset File Pointer(BOF) - WLOCITM
     F* S106   - Process To Reset File Pointer(EOF) - WLOCITM
     F* S107   - GETREC D.WAREHED,F.WLOCITM,*EQ,:0128,:0129,:0316,:0066
     F* S108   - SETLL D.WAREHED,F.ITMMAST,SVK021,SVK13
     F* S109   - GETREC D.WAREHED,F.ITMMAST,*PV,SVK021
     F* S110   - Process To Reset File Pointer(BOF) - ITMMAST
     F* S111   - SETLL D.WAREHED,F.wareloc,SVK021,whwhse,SVKloc
     F* S112   - GETREC D.WAREHED,F.wareloc,*PV,SVK021,whwhse
     F* S113   - Process To Reset File Pointer(BOF) - WARELOC
     F* S114   - SETLL D.WAREHED,F.waredet,SVK021,whwhse,SVK13
     F* S115   - GETREC D.WAREHED,F.waredet,*PV,SVK021,whwhse
     F* S116   - Process To Reset File Pointer(BOF) - WAREDET
     F* S117   - SETLL D.ITMMAST1,F.ITMMAST1,SVK021,svkial,SVK13
     F* S118   - GETREC D.ITMMAST1,F.ITMMAST1,*PV,SVK021
     F* S119   - Process To Reset File Pointer(BOF) - ITMMAST1
     F* S120   - GETREC D.WAREHED,F.ITMMAST,*NE,SVK021
     F* S121   - Process To Reset File Pointer(EOF) - ITMMAST
     F* S122   - GETREC D.WAREHED,F.wareloc,*NE,SVK021,whwhse
     F* S123   - Process To Reset File Pointer(EOF) - WARELOC
     F* S124   - GETREC D.WAREHED,F.waredet,*NE,SVK021,whwhse
     F* S125   - Process To Reset File Pointer(EOF) - WAREDET
     F* S126   - GETREC D.ITMMAST1,F.ITMMAST1,*NE,SVK021
     F* S127   - Process To Reset File Pointer(EOF) - ITMMAST1
     F* S128   - SETLL D.WAREHED,F.STOVGP,SVK023,SVK14
     F* S129   - GETREC D.WAREHED,F.STOVGP,*PV,SVK023
     F* S130   - Process To Reset File Pointer(BOF) - STOVGP
     F* S131   - GETREC D.WAREHED,F.STOVGP,*NE,SVK023
     F* S132   - Process To Reset File Pointer(EOF) - STOVGP
     F* S133   - SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     F* S134   - GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     F* S135   - Process To Reset File Pointer(BOF) - SUPLIER
     F* S136   - SETLL D.SUPLIER1,F.SUPLIER1,SVK025,svkial,SVK026,SVK15
     F* S137   - GETREC D.SUPLIER1,F.SUPLIER1,*PV,SVK025
     F* S138   - Process To Reset File Pointer(BOF) - SUPLIER1
     F* S139   - GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     F* S140   - Process To Reset File Pointer(EOF) - SUPLIER
     F* S141   - GETREC D.SUPLIER1,F.SUPLIER1,*NE,SVK025
     F* S142   - Process To Reset File Pointer(EOF) - SUPLIER1
     F* S143   - SETLL D.WAREHED,F.UOM,SVK028,SVK16
     F* S144   - GETREC D.WAREHED,F.UOM,*PV,SVK028
     F* S145   - Process To Reset File Pointer(BOF) - UOM
     F* S146   - GETREC D.WAREHED,F.UOM,*NE,SVK028
     F* S147   - Process To Reset File Pointer(EOF) - UOM
     F* S148   - SETLL D.WAREHED,F.WARETYP,SVK030,SVK17
     F* S149   - GETREC D.WAREHED,F.WARETYP,*PV,SVK030
     F* S150   - Process To Reset File Pointer(BOF) - WARETYP
     F* S151   - GETREC D.WAREHED,F.WARETYP,*NE,SVK030
     F* S152   - Process To Reset File Pointer(EOF) - WARETYP
     F* S002V - Detail Screen for WAREHED
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
     Fmwarehedd CF   E             WORKSTN
     F                                     SFILE(SCR008S1:RRN05)
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR003S1:RRN02)
     F                                     SFILE(SCR005S1:RRN03)
     F                                     SFILE(SCR007S1:RRN04)
     F                                     SFILE(SCR009S1:RRN06)
     F                                     SFILE(SCR011S1:RRN07)
     F                                     INFDS(DSPFDS)
     FITMMAST1  IF   E           K DISK
     F                                     RENAME(ITMSTRF:FMT001)
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FSTOKMOV1  IF   E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FSUPLIER1  IF   E           K DISK
     F                                     RENAME(SUPLIERF:FMT002)
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSECIMS    IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FWARETYP   IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FSTOVGP    IF   E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FUOM       IF   E           K DISK
     F                                     INFDS(FIDS13)
     F                                     INFSR(SFERR)
     FWLOCITM1  IF   E           K DISK
     F                                     RENAME(WLOCITMF:FMT003)
     F                                     INFDS(FIDS14)
     F                                     INFSR(SFERR)
     FWRITTYP   IF   E           K DISK
     F                                     INFDS(FIDS16)
     F                                     INFSR(SFERR)
     FWAREHED   UF A E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FWAREDET   UF A E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FWARELOC   UF A E           K DISK
     F                                     INFDS(FIDS15)
     F                                     INFSR(SFERR)
     FWLOCITM   UF A E           K DISK
     F                                     INFDS(FIDS17)
     F                                     INFSR(SFERR)
     FFILE0001  UF A E             DISK
     f                                     extdesc('WLOCITM1')
     F                                     INFDS(FIDS18)
     F                                     RENAME(WLOCITMF:FMT004)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D A01             S              3    DIM(12)
     D A02             S              3    DIM(12)
     D A03             S              3    DIM(10)
     D A04             S              3    DIM(10)
     D A05             S             15    DIM(10)
     D A06             S              3    DIM(9)
     D A07             S              3    DIM(9)
     D A08             S             15    DIM(9)
     D A09             S             10    DIM(9)
     D A10             S              3    DIM(10)
     D A11             S              3    DIM(10)
     D A12             S             10    DIM(10)
     D A13             S              3    DIM(9)
     D A14             S              3    DIM(9)
     D A15             S             10    DIM(9)
     D A16             S             15    DIM(9)
     D B01             S             15    DIM(5)
     D B02             S              1    DIM(5)
     D B03             S              6    DIM(5)
     D B04             S              5    DIM(5)
     D B05             S              2    DIM(5)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(42) CTDATA PERRCD(1)             Alpha constants i
     D N1              S             30  9 DIM(9) CTDATA PERRCD(1)              Numeric constants
     D DA4             S             24    DIM(10) CTDATA PERRCD(1)             CLF : Cursor Loca
     D DA5             S              8    DIM(10) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(110) CTDATA PERRCD(1)            Fld Attr. Indic t
     D DA2             S             34    DIM(110) ALT(DA1)
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS13          DS
     D  STS13            *STATUS
     D  REC13                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS15          DS
     D  STS15            *STATUS
     D  REC15                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS17          DS
     D  STS17            *STATUS
     D  REC17                397    400B 0
     D FIDS14          DS
     D  STS14            *STATUS
     D  REC14                397    400B 0
     D FIDS16          DS
     D  STS16            *STATUS
     D  REC16                397    400B 0
     D FIDS18          DS
     D  STS18            *STATUS
     D  REC18                397    400B 0
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
     D  TAL                    1     50    DIM(5)
     D  TAL001                 1     10
     D  TAL002                11     20
     D  TAL003                21     30
     D  TAL004                31     40
     D  TAL005                41     50
     D @DS005          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS006          DS
     D  T02                    1    100    DIM(5)
     D  T02001                 1     20
     D  T02002                21     40
     D  T02003                41     60
     D  T02004                61     80
     D  T02005                81    100
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
     D  T05                    1      5    DIM(5)
     D  T05001                 1      1
     D  T05002                 2      2
     D  T05003                 3      3
     D  T05004                 4      4
     D  T05005                 5      5
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
     D  T08                    1     30    DIM(5)
     D  T08001                 1      6
     D  T08002                 7     12
     D  T08003                13     18
     D  T08004                19     24
     D  T08005                25     30
     D @DS013          DS
     D  T09                    1     15    DIM(5)
     D  T09001                 1      3
     D  T09002                 4      6
     D  T09003                 7      9
     D  T09004                10     12
     D  T09005                13     15
     D @DS014          DS
     D  T10                    1    200    DIM(5)
     D  T10001                 1     40
     D  T10002                41     80
     D  T10003                81    120
     D  T10004               121    160
     D  T10005               161    200
     D @DS015          DS
     D  T11                    1      5P 0 DIM(5)
     D  T11001                 1      1P 0
     D  T11002                 2      2P 0
     D  T11003                 3      3P 0
     D  T11004                 4      4P 0
     D  T11005                 5      5P 0
     D @DS016          DS
     D  T12                    1     25    DIM(5)
     D  T12001                 1      5
     D  T12002                 6     10
     D  T12003                11     15
     D  T12004                16     20
     D  T12005                21     25
     D @DS017          DS
     D  T13                    1     25P 0 DIM(5)
     D  T13001                 1      5P 0
     D  T13002                 6     10P 0
     D  T13003                11     15P 0
     D  T13004                16     20P 0
     D  T13005                21     25P 0
     D @DS018          DS
     D  T14                    1      5P 0 DIM(5)
     D  T14001                 1      1P 0
     D  T14002                 2      2P 0
     D  T14003                 3      3P 0
     D  T14004                 4      4P 0
     D  T14005                 5      5P 0
     D @DS019          DS
     D  T15                    1     10    DIM(5)
     D  T15001                 1      2
     D  T15002                 3      4
     D  T15003                 5      6
     D  T15004                 7      8
     D  T15005                 9     10
     D @DS020          DS
     D  T16                    1    200    DIM(5)
     D  T16001                 1     40
     D  T16002                41     80
     D  T16003                81    120
     D  T16004               121    160
     D  T16005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0008
     I              CYEMPCOL                    RN0009
     I              CYEMPHEAD                   RN0010
     I              CYPRDHEAD                   RN0011
     I              CYREFHEAD                   RN0012
     I              CYSDESC                     RN0013
     IIMSTRMF
     I              TTCOYNO                     RN0014
     IITMSTRF
     I              ITALPHA                     RN0015
     I              ITCOYNO                     RN0016
     I              ITIDESC                     RN0017
     IFMT001
     I              ITALPHA                     RN0018
     I              ITCOYNO                     RN0019
     I              ITIDESC                     RN0020
     ISECIMSF
     I              USCOYNO                     RN0021
     ISTOKMOVF
     I              STBRNBR                     RN0022
     I              STCOYNO                     RN0023
     I              STITEM                      RN0024
     I              STSUPPN                     RN0025
     ISTOVGPF
     I              TGCOYNO                     RN0026
     ISUPLIERF
     I              SUALPHA                     RN0027
     I              SUBRNBR                     RN0028
     I              SUCONNAM                    RN0029
     I              SUCOYNO                     RN0030
     I              SUPSTCD                     RN0031
     I              SUSUPPN                     RN0032
     I              SUTELEPH                    RN0033
     IFMT002
     I              SUALPHA                     RN0034
     I              SUBRNBR                     RN0035
     I              SUCONNAM                    RN0036
     I              SUCOYNO                     RN0037
     I              SUPSTCD                     RN0038
     I              SUSUPPN                     RN0039
     I              SUTELEPH                    RN0040
     IUOMF
     I              UMCOYNO                     RN0041
     IWDETAILF
     I              WDCOYNO                     RN0042
     I              WDSUPPN                     RN0043
     IWAREHEDF
     I              WHCOYNO                     RN0044
     I              WHWDESC                     RN0045
     IWARELOCF
     I              WLCOYNO                     RN0046
     IWARETYPF
     I              WTCOYNO                     RN0047
     I              WTWDESC                     RN0048
     IWLOCITMF
     I              WICOYNO                     RN0049
     IFMT003
     I              WICOYNO                     RN0050
     IWRITTYPF
     I              WTCOYNO                     RN0051
     IFMT004
     I              WICOYNO                     RN0050
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
     C                   KFLD                    KSCO01
     C                   KFLD                    KSUS02
     C*
     C     K0002         KLIST
     C                   KFLD                    KYCO01
     C*
     C     K0003         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C*
     C     K0004         KLIST
     C                   KFLD                    WK0020
     C                   KFLD                    XHWTYP
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWT02
     C*
     C     K0006         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C*
     C     K0007         KLIST
     C                   KFLD                    WK0015
     C                   KFLD                    XDITEM
     C*
     C     K0008         KLIST
     C                   KFLD                    WK0015
     C                   KFLD                    XDUOM
     C*
     C     K0009         KLIST
     C                   KFLD                    WK0015
     C                   KFLD                    WK0018
     C                   KFLD                    XDSBRN
     C*
     C     K0010         KLIST
     C                   KFLD                    WK0015
     C                   KFLD                    XDSTOG
     C*
     C     K0011         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDIT02
     C*
     C     K0012         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDST02
     C*
     C     K0013         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDSU02
     C*
     C     K0014         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDUO02
     C*
     C     K0015         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KDSU02
     C                   KFLD                    KUBR03
     C*
     C     K0016         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C                   KFLD                    KDIT03
     C*
     C     K0017         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDIT02
     C*
     C     K0018         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C                   KFLD                    KLLO04
     C*
     C     K0019         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C*
     C     K0020         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C*
     C     K0021         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C*
     C     K0022         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KDIT03
     C                   KFLD                    KTTR04
     C*
     C     K0023         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTWH02
     C                   KFLD                    KTIT03
     C*
     C     K0024         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C                   KFLD                    KLLO03
     C*
     C     K0025         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHWH02
     C                   KFLD                    KLLO03
     C                   KFLD                    KDIT04
     C*
     C     K0026         KLIST
     C                   KFLD                    WK0024
     C                   KFLD                    XHWHSE
     C                   KFLD                    XIITEM
     C*
     C     K0027         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0028         KLIST
     C                   KFLD                    KDCO01
     C                   KFLD                    KDWH02
     C*
     C     K0029         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTIT04
     C*
     C     K0030         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KIIT03
     C                   KFLD                    KILO04
     C*
     C     K0031         KLIST
     C                   KFLD                    KTCO03
     C                   KFLD                    KTWH04
     C                   KFLD                    KTIT05
     C*
     C     K0032         KLIST
     C                   KFLD                    KTCO04
     C                   KFLD                    KTTR05
     C*
     C     K0033         KLIST
     C                   KFLD                    KTCO05
     C                   KFLD                    KTTR06
     C*
     C     K0034         KLIST
     C                   KFLD                    KLCO01
     C                   KFLD                    KLWH02
     C*
     C     K0035         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KIWH02
     C                   KFLD                    KILO03
     C                   KFLD                    KIIT04
     C*
     C     K0036         KLIST
     C                   KFLD                    KTCO02
     C*
     C     K0037         KLIST
     C                   KFLD                    KTCO02
     C                   KFLD                    KTAL03
     C                   KFLD                    KTIT04
     C*
     C     K0038         KLIST
     C                   KFLD                    KGCO01
     C                   KFLD                    KGST02
     C*
     C     K0039         KLIST
     C                   KFLD                    KGCO01
     C*
     C     K0040         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0041         KLIST
     C                   KFLD                    KUCO01
     C*
     C     K0042         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUAL02
     C                   KFLD                    KUSU03
     C                   KFLD                    KUBR04
     C*
     C     K0043         KLIST
     C                   KFLD                    KMCO01
     C                   KFLD                    KMUO02
     C*
     C     K0044         KLIST
     C                   KFLD                    KMCO01
     C*
     C     K0045         KLIST
     C                   KFLD                    KTCO03
     C                   KFLD                    KTWT04
     C*
     C     K0046         KLIST
     C                   KFLD                    KTCO03
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    TTDESC        WTDESC                         Description
     C     *LIKE         DEFINE    TTONHC        WTONHC                         On Hand Calculation
     C     *LIKE         DEFINE    RN0016        WK0001                         Company number
     C     *LIKE         DEFINE    ITITEM        WK0003                         Item Number
     C     *LIKE         DEFINE    ITSTUC        WTSTUC                         Standard unit cost
     C     *LIKE         DEFINE    ITUOM         WTUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0018        WK0004                         Alpha Search
     C     *LIKE         DEFINE    RN0020        WK0005                         Item Description
     C     *LIKE         DEFINE    ITITEM        WK0006                         Item Number
     C     *LIKE         DEFINE    USUGRP        WSUGRP                         Group User
     C     *LIKE         DEFINE    USWHSE        WSWHSE                         Allowed Warehouse
     C     *LIKE         DEFINE    STDTTR        WTDTTR                         Transaction Date
     C     *LIKE         DEFINE    STLOCT        WTLOCT                         Other Location
     C     *LIKE         DEFINE    STTIME        WTTIME                         Expected Time
     C     *LIKE         DEFINE    STTTYP        WTTTYP                         Transaction Type
     C     *LIKE         DEFINE    STWHST        WTWHST                         Other Warehouse
     C     *LIKE         DEFINE    RN0026        WK0007                         Company number
     C     *LIKE         DEFINE    TGSTOG        WGSTOG                         Stock Turnover Group
     C     *LIKE         DEFINE    RN0028        WK0008                         Branch Number
     C     *LIKE         DEFINE    RN0030        WK0009                         Company number
     C     *LIKE         DEFINE    RN0032        WK0010                         Supplier Number
     C     *LIKE         DEFINE    RN0034        WK0011                         Alpha Search
     C     *LIKE         DEFINE    RN0035        WK0012                         Branch Number
     C     *LIKE         DEFINE    SUNAME        WUNAME                         Customer name
     C     *LIKE         DEFINE    RN0039        WK0013                         Supplier Number
     C     *LIKE         DEFINE    RN0041        WK0014                         Company number
     C     *LIKE         DEFINE    UMQTYO        WMQTYO                         Quantity per unit
     C     *LIKE         DEFINE    UMUOM         WMUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0042        WK0015                         Company number
     C     *LIKE         DEFINE    WDCRDT        WK0016                         Created Date
     C     *LIKE         DEFINE    WDLMDT        WK0017                         Amended date
     C     *LIKE         DEFINE    WDWHSE        WK0019                         Warehouse Number
     C     *LIKE         DEFINE    RN0044        WK0020                         Company number
     C     *LIKE         DEFINE    WHCRDT        WK0021                         Created Date
     C     *LIKE         DEFINE    WHDTLM        WK0022                         Amended date
     C     *LIKE         DEFINE    RN0046        WK0024                         Company number
     C     *LIKE         DEFINE    WLCRDT        WK0025                         Created Date
     C     *LIKE         DEFINE    WLLMDT        WK0026                         Date last maintained
     C     *LIKE         DEFINE    WLWHSE        WK0027                         Warehouse Number
     C     *LIKE         DEFINE    RN0047        WK0028                         Company number
     C     *LIKE         DEFINE    WTWTYP        WK0030                         Warehouse Type
     C     *LIKE         DEFINE    RN0049        WK0031                         Company number
     C     *LIKE         DEFINE    WICRDT        WK0032                         Created Date
     C     *LIKE         DEFINE    WILMDT        WK0033                         Amended date
     C     *LIKE         DEFINE    WILOCN        WK0034                         Location
     C     *LIKE         DEFINE    WIWHSE        WK0035                         Warehouse Number
     C     *LIKE         DEFINE    RN0050        WK0036                         Company number
     C     *LIKE         DEFINE    WICRDT        WK0038                         Created Date
     C     *LIKE         DEFINE    WIITEM        WK0039                         Item Number
     C     *LIKE         DEFINE    WILMDT        WK0041                         Amended date
     C     *LIKE         DEFINE    WIWHSE        WK0045                         Warehouse Number
     C     *LIKE         DEFINE    RN0051        WK0046                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0047                         Item Number
     C     *LIKE         DEFINE    WTWHSE        WK0048                         Warehouse Number
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0008        HD0001
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0014        HD0002
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0019        HD0005
     C     *LIKE         DEFINE    RN0018        HD0004
     C     *LIKE         DEFINE    ITITEM        HD0006
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0021        HD0007
     C     *LIKE         DEFINE    USUSER        HSUSER
     C     *LIKE         DEFINE    REC11         HRC11
     C     *LIKE         DEFINE    RN0026        HD0010
     C     *LIKE         DEFINE    TGSTOG        HGSTOG
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0037        HD0016
     C     *LIKE         DEFINE    RN0034        HD0014
     C     *LIKE         DEFINE    RN0039        HD0017
     C     *LIKE         DEFINE    RN0035        HD0015
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    RN0030        HD0012
     C     *LIKE         DEFINE    RN0032        HD0013
     C     *LIKE         DEFINE    RN0028        HD0011
     C     *LIKE         DEFINE    REC13         HRC13
     C     *LIKE         DEFINE    RN0041        HD0018
     C     *LIKE         DEFINE    UMUOM         HMUOM
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0047        HD0022
     C     *LIKE         DEFINE    WTWTYP        HTWTYP
     C                   MOVE      *ZEROS        ROW1              3 0
     C                   MOVE      *ZEROS        COL1              3 0
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        NARG3            30 9          Numeric argumnt
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
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
     C                   MOVE      *ZEROS        ##DATE            8 0
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *BLANKS       BAT               1
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C07               3 0
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y1                3 0          Loop Counter . . . .
     C                   MOVE      *BLANKS       DTCRDT           10
     C                   MOVE      *BLANKS       DTDTLM           10
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FIRDT            15 6
     C                   MOVE      *BLANKS       FIRST             1
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *BLANKS       FL0003           40
     C                   MOVE      *ZEROS        FL0004            1 0
     C                   MOVE      *ZEROS        FL0006            1 0
     C                   MOVE      *ZEROS        FL0007            1 0
     C                   MOVE      *BLANKS       FL0008           10
     C                   MOVE      *BLANKS       FL0009           10
     C                   MOVE      *BLANKS       FL0010           30
     C                   MOVE      *BLANKS       FL0011           10
     C                   MOVE      *BLANKS       FL0012           10
     C                   MOVE      *BLANKS       FL0013           20
     C                   MOVE      *BLANKS       FL0014           10
     C                   MOVE      *BLANKS       FL0015           10
     C                   MOVE      *BLANKS       FL0016           30
     C                   MOVE      *BLANKS       FL0017           10
     C                   MOVE      *BLANKS       FL0018           10
     C                   MOVE      *BLANKS       FL0019           10
     C                   MOVE      *BLANKS       FL0020           20
     C                   MOVE      *BLANKS       FL0021            6
     C                   MOVE      *BLANKS       FL0022            3
     C                   MOVE      *BLANKS       FL0023           10
     C                   MOVE      *BLANKS       FL0024           15
     C                   MOVE      *ZEROS        FL0025            9 0
     C                   MOVE      *BLANKS       FSTIAL           10
     C                   MOVE      *BLANKS       FSTLOC           10
     C                   MOVE      *BLANKS       RN0001           20            FSTLOC13
     C                   MOVE      *BLANKS       FST026            6
     C                   MOVE      *BLANKS       FST13            15
     C                   MOVE      *BLANKS       FST14             1
     C                   MOVE      *BLANKS       FST15             3
     C                   MOVE      *BLANKS       FST16             5
     C                   MOVE      *BLANKS       FST17             2
     C                   MOVE      *BLANKS       F02001            2
     C                   MOVE      *BLANKS       F04BRN            3
     C                   MOVE      *BLANKS       F04001           15
     C                   MOVE      *BLANKS       F04002            1
     C                   MOVE      *BLANKS       F04003            6
     C                   MOVE      *BLANKS       F04004            5
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *ZEROS        Y2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        X2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        X3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LSTIAL           10
     C                   MOVE      *BLANKS       LSTLOC           10
     C                   MOVE      *BLANKS       LST026            6
     C                   MOVE      *BLANKS       LST13            15
     C                   MOVE      *BLANKS       LST14             1
     C                   MOVE      *BLANKS       LST15             3
     C                   MOVE      *BLANKS       LST16             5
     C                   MOVE      *BLANKS       LST17             2
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *BLANKS       ONE               1
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRACT             1
     C                   MOVE      *BLANKS       PRALWD            1
     C                   MOVE      *BLANKS       PS0102            3
     C                   MOVE      *BLANKS       PS0301           15
     C                   MOVE      *BLANKS       PS0501           10
     C                   MOVE      *BLANKS       PS0701            2
     C                   MOVE      *BLANKS       PS0901           10
     C                   MOVE      *BLANKS       PS1101           20
     C                   MOVE      *BLANKS       STITEM           15
     C                   MOVE      *BLANKS       STWHSE            3
     C                   MOVE      *BLANKS       SVKIAL           10
     C                   MOVE      *BLANKS       SVKLOC           10
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002            3
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004            3
     C                   MOVE      *BLANKS       SVK005           15
     C                   MOVE      *BLANKS       SVK006            3
     C                   MOVE      *BLANKS       SVK007            3
     C                   MOVE      *BLANKS       SVK008           15
     C                   MOVE      *BLANKS       SVK009           10
     C                   MOVE      *BLANKS       SVK010            3
     C                   MOVE      *BLANKS       SVK011            3
     C                   MOVE      *BLANKS       SVK012           15
     C                   MOVE      *BLANKS       SVK013            2
     C                   MOVE      *BLANKS       SVK014            3
     C                   MOVE      *BLANKS       SVK015            3
     C                   MOVE      *BLANKS       SVK016           10
     C                   MOVE      *BLANKS       SVK017            3
     C                   MOVE      *BLANKS       SVK018            3
     C                   MOVE      *BLANKS       SVK019           10
     C                   MOVE      *BLANKS       SVK020           15
     C                   MOVE      *BLANKS       SVK021            3
     C                   MOVE      *BLANKS       SVK022           15
     C                   MOVE      *BLANKS       SVK023            3
     C                   MOVE      *BLANKS       SVK024            1
     C                   MOVE      *BLANKS       SVK025            3
     C                   MOVE      *BLANKS       SVK026            6
     C                   MOVE      *BLANKS       SVK027            3
     C                   MOVE      *BLANKS       SVK028            3
     C                   MOVE      *BLANKS       SVK029            5
     C                   MOVE      *BLANKS       SVK030            3
     C                   MOVE      *BLANKS       SVK031            2
     C                   MOVE      *BLANKS       SVK13            15
     C                   MOVE      *BLANKS       SVK14             1
     C                   MOVE      *BLANKS       SVK15             3
     C                   MOVE      *BLANKS       SVK16             5
     C                   MOVE      *BLANKS       SVK17             2
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0002            4            SYCCYYA
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0003            8 0          SYDATI
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0004           10            SYDATO
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDAT1           15 6
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0005            1            SYDFMT
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0006            1            SYDSEP
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0007            4            SYMMDDA
     C                   MOVE      *ZEROS        S13CNT            3 0
     C                   MOVE      *ZEROS        S14CNT            3 0
     C                   MOVE      *ZEROS        S15CNT            3 0
     C                   MOVE      *ZEROS        S16CNT            3 0
     C                   MOVE      *ZEROS        S17CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *ZEROS        WKCOL             3 0
     C                   MOVE      *ZEROS        WKQOH             9 0
     C                   MOVE      *ZEROS        WKROW             3 0
     C                   MOVE      *BLANKS       WKUSER           10
     C                   MOVE      *BLANKS       WK10A1           10
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK13             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK15             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK17             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK14             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK16             1 0          File lock flag
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
     C                   MOVE      *BLANKS       IN08             99            Save Ind
     C                   MOVE      *BLANKS       IN09             99            Save Ind
     C                   MOVE      *BLANKS       IN10             99            Save Ind
     C                   MOVE      *BLANKS       IN11             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD07            1            RD STS
     C                   MOVE      *BLANKS       SWRD04            1            RD STS
     C                   MOVE      *BLANKS       SWRD06            1            RD STS
     C                   MOVE      *BLANKS       KSCO01            3            USCOYNO
     C                   MOVE      *BLANKS       KSUS02           10            USUSER
     C                   MOVE      *BLANKS       SWRD08            1            RD STS          0030
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       SWRD10            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD13            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD14            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD16            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD15            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD17            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD09            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH02            3            WHWHSE
     C                   MOVE      *BLANKS       KHWT02            2            WHWTYP
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *BLANKS       KDIT03           20            WDITEM
     C                   MOVE      *BLANKS       KDIT02           20            WDITEM
     C                   MOVE      *BLANKS       KDST02            1            WDSTOG
     C                   MOVE      *BLANKS       KDSU02            6            WDSUPPN
     C                   MOVE      *BLANKS       KDUO02            5            WDUOM
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       KDCO01            3            WDCOYNO
     C                   MOVE      *BLANKS       KDWH02            3            WDWHSE
     C                   MOVE      *BLANKS       INS03            99            Savd.Ind
     C                   MOVE      *BLANKS       KLLO04           10            WLLOCN
     C                   MOVE      *BLANKS       KLLO03           10            WLLOCN
     C                   MOVE      *BLANKS       KICO01            3            WICOYNO
     C                   MOVE      *BLANKS       KIWH02            3            WIWHSE
     C                   MOVE      *BLANKS       KIIT03           20            WIITEM
     C                   MOVE      *BLANKS       KILO03           10            WILOCN
     C                   MOVE      *BLANKS       INS04            99            Savd.Ind
     C                   MOVE      *BLANKS       KTTR04            2            WTTRNC
     C                   MOVE      *BLANKS       INS05            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          0030
     C                   MOVE      *BLANKS       KTCO01            3            STCOYNO
     C                   MOVE      *BLANKS       KTWH02            3            STWHSE
     C                   MOVE      *BLANKS       KTIT03           20            STITEM
     C                   MOVE      *BLANKS       INS06            99            Savd.Ind
     C                   MOVE      *BLANKS       KLCO01            3            WLCOYNO
     C                   MOVE      *BLANKS       KLWH02            3            WLWHSE
     C                   MOVE      *BLANKS       INS07            99            Savd.Ind
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       RN0053           99
     C                   MOVE      *BLANKS       KTCO02            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT04           20            ITITEM
     C                   MOVE      *BLANKS       KILO04           10            WILOCN
     C                   MOVE      *BLANKS       KTCO03            3            WTCOYNO
     C                   MOVE      *BLANKS       KTWH04            3            WTWHSE
     C                   MOVE      *BLANKS       KTIT05           20            WTITEM
     C                   MOVE      *BLANKS       KTCO04            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR05            2            TTTRNC
     C                   MOVE      *BLANKS       KTCO05            3            TTCOYNO
     C                   MOVE      *BLANKS       KTTR06            2            TTTRNC
     C                   MOVE      *BLANKS       KIIT04           20            WIITEM
     C                   MOVE      *BLANKS       SWRD01            1            RD STS  reached
     C                   MOVE      *BLANKS       KTAL03           10            ITALPHA
     C                   MOVE      *BLANKS       KGCO01            3            TGCOYNO
     C                   MOVE      *BLANKS       KGST02            1            TGSTOG
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       SWRD05            1            RD STS  reached
     C                   MOVE      *BLANKS       KUAL02           10            SUALPHA
     C                   MOVE      *BLANKS       KUSU03            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR04            3            SUBRNBR
     C                   MOVE      *BLANKS       KMCO01            3            UMCOYNO
     C                   MOVE      *BLANKS       KMUO02            5            UMUOM
     C                   MOVE      *BLANKS       KTWT04            2            WTWTYP
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *ZEROS        EXISTF            1 0          Existence chk flg
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *BLANKS       RN0054           99
     C                   MOVE      *BLANKS       ARSLT0          256
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
     C                   MOVE      *ZEROS        T11001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T11002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T11003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T11004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T11005                         Init DS/*DTA flds
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
     C                   MOVEL     'LANDIMS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
     C                   Z-ADD     1             XRN01
     C                   Z-ADD     1             XRN02
     C                   Z-ADD     1             XRN03
     C                   Z-ADD     1             XRN04
     C                   Z-ADD     1             XRN05
     C                   Z-ADD     1             XRN06
     C                   Z-ADD     1             XRN07
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
     C                   Z-ADD     *ZEROS        SVS10             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        RN0052           30 9
     C                   Z-ADD     *ZEROS        SRN03             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN03             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN03             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS14             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SRN04             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN04             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN04             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN05             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN05             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN05             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN06             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN06             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN06             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS15             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SRN07             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN07             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN07             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS17             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        WRRN03            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ03            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WRRN04            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ04            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS16             5 0          SV STS
     C                   Z-ADD     *ZEROS        WRRN05            3 0          WRK RRN         0030
     C                   Z-ADD     *ZEROS        WADJ05            3 0          WRK ADJ         0030
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS
     C                   Z-ADD     *ZEROS        WRRN06            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ06            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WRRN07            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ07            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS01             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS11             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS12             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS13             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS09             5 0          SV STS
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
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0002'      S002
     C     SCRNID        CASEQ     'SC0003'      S003
     C     SCRNID        CASEQ     'SC0004'      S004
     C     SCRNID        CASEQ     'SC0005'      S005
     C     SCRNID        CASEQ     'SC0006'      S006
     C     SCRNID        CASEQ     'SC0007'      S007
     C     SCRNID        CASEQ     'SCMOVE'      S008
     C     SCRNID        CASEQ     'SC0009'      S009
     C     SCRNID        CASEQ     'SC0010'      S010
     C     SCRNID        CASEQ     'SC0011'      S011
     C     SCRNID        CASEQ     'SC0012'      S012
     C     SCRNID        CASEQ     'SC0013'      S013
     C     SCRNID        CASEQ     'SC0014'      S014
     C     SCRNID        CASEQ     'SC0015'      S015
     C     SCRNID        CASEQ     'SC0016'      S016
     C     SCRNID        CASEQ     'SC0017'      S017
     C     SCRNID        CASEQ     'SC0018'      S018
     C     SCRNID        CASEQ     'SC0019'      S019
     C     SCRNID        CASEQ     'SCIALP'      S020
     C     SCRNID        CASEQ     'SCSALP'      S021
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
     C* S001 - List Screen for WAREHED
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
     C* Get user record for warehouse
     C* WK10A1 = *userid
     C                   MOVE      *BLANKS       WK10A1
     C                   MOVEL     USER          WK10A1
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,WK10A1
     C*
     C                   EXSR      S022
     C* IF usugrp <> ' '
     C     WSUGRP        IFNE      *BLANKS
     C* GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,usugrp
     C*
     C                   EXSR      S023
     C* END                                                           *
     C                   END
     C* IF uswhse <> ' '
     C     WSWHSE        IFNE      *BLANKS
     C* ONE = 'Y'
     C                   MOVE      'Y'           ONE
     C* FLDATR ps0102,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'PS0102  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* PS0102 = uswhse
     C                   MOVE      WSWHSE        PS0102
     C* END                                                           *
     C                   END
     C* GETREC d.company,f.company,*eq,prcoyno
     C*
     C                   EXSR      S024
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0005
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0006
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* WHWHSE = ' '
     C                   MOVEL     *BLANKS       XHWHSE
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* Set Key values to parms passed
     C* SVK001 = PRcoyno
     C                   MOVE      PRM001        SVK001
     C* SVK002 = uswhse
     C                   MOVE      WSWHSE        SVK002
     C*                                                               *
     C* Set Reposition values to parms passed
     C*                                                               *
     C* Set file for list to first record in file
     C* SETLL D.WAREHED,F.WAREHED,SVK001,SVK002
     C*
     C                   EXSR      S025
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
     C* SETLL D.WAREHED,F.WAREHED,SVK001,SVK002
     C*
     C                   EXSR      S025
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
     C* IF PS0102<>' '
     C     PS0102        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
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
     C* SETLL D.WAREHED,F.WAREHED,SVK001,SVK002
     C*
     C                   EXSR      S025
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
     C* S002 - Detail Screen for WAREHED
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0'           *IN(9)
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
     C                   GOTO      $00299
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
     C* SVK001 = WHCOYNO
     C                   MOVE      WK0020        SVK001
     C* SVK002 = WHWHSE
     C                   MOVE      XHWHSE        SVK002
     C* WHWHSE = ' '
     C                   MOVEL     *BLANKS       XHWHSE
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* WHWTYP = ' '
     C                   MOVEL     *BLANKS       XHWTYP
     C* WHCTYP = 0
     C                   Z-ADD     *ZERO         XHCTYP
     C* WHREPC = ' '
     C                   MOVE      *BLANKS       XHREPC
     C* WHDTLM = 0
     C                   Z-ADD     *ZERO         WK0022
     C* WHLMBY = ' '
     C                   MOVEL     *BLANKS       XHLMBY
     C* WHCRDT = 0
     C                   Z-ADD     *ZERO         WK0021
     C* WHCRBY = ' '
     C                   MOVEL     *BLANKS       XHCRBY
     C* WTWDESC = ' '
     C                   MOVEL     *BLANKS       WK0029
     C* WHCOYNO = SVK001
     C                   MOVE      SVK001        WK0020
     C* WHWHSE = SVK002
     C                   MOVE      SVK002        XHWHSE
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR WAREHED.WAREHED.WHWHSE,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XHWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'INPUT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.WAREHED,F.WAREHED,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S026
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WAREHED)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK06         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREHED)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
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
     C* GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     C*
     C                   EXSR      S027
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
     C* GETREC D.WAREHED,F.WAREHED,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S026
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WAREHED)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK06         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREHED)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
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
     C* GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     C*
     C                   EXSR      S027
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.WAREHED,F.WAREHED,*eq,SVK001,SVK002
     C*
     C                   EXSR      S028
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREHED)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
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
     C* GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     C*
     C                   EXSR      S027
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
     C* FLDATR WAREHED.WAREHED.WHWHSE,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XHWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'INPUT   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* WHCOYNO = prcoyno
     C                   MOVE      PRM001        WK0020
     C* WHWHSE = ' '
     C                   MOVEL     *BLANKS       XHWHSE
     C* WHWDESC = ' '
     C                   MOVEL     *BLANKS       WK0023
     C* WHWTYP = ' '
     C                   MOVEL     *BLANKS       XHWTYP
     C* WHCTYP = 0
     C                   Z-ADD     *ZERO         XHCTYP
     C* WHREPC = ' '
     C                   MOVE      *BLANKS       XHREPC
     C* WHDTLM = 0
     C                   Z-ADD     *ZERO         WK0022
     C* WHLMBY = ' '
     C                   MOVEL     *BLANKS       XHLMBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WHCRDT = ##DATE
     C                   Z-ADD     ##DATE        WK0021
     C* WHCRBY = *userid
     C                   MOVE      *BLANKS       XHCRBY
     C                   MOVEL     USER          XHCRBY
     C* WTWDESC = ' '
     C                   MOVEL     *BLANKS       WK0029
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* SYDATI = whdtlm  ; date maintained
     C                   Z-ADD     WK0022        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* DTDTLM = SYDATO
     C                   MOVE      RN0004        DTDTLM
     C*                                                               *
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0004
     C* SYDATI = whcrdt  ; date created
     C                   Z-ADD     WK0021        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* DTCRDT = SYDATO
     C                   MOVE      RN0004        DTCRDT
     C*                                                               *
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
     C                   MOVEA     '000'         *IN(3)
     C                   MOVEA     '00'          *IN(8)
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
     C* IF %clf(WAREHED.WAREHED.WHWTYP)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XHWTYP  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* EXSCR SC0017
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S017
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
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* WHWTYP = F02001
     C                   MOVE      F02001        XHWTYP
     C* END                                                           *
     C                   END
     C* WTWDESC = ' '
     C                   MOVEL     *BLANKS       WK0029
     C* GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     C*
     C                   EXSR      S027
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
     C* RLSREC D.WAREHED,F.WAREHED
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   UNLOCK    WAREHED                              91      RLS LCK WAREHED
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
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* Check WAREDET for entries
     C* SETLL D.WAREHED,F.WAREDET,PRCOYNO,WHWHSE
     C*
     C                   EXSR      S029
     C* GETREC D.WAREHED,F.WAREDET,*NE,PRCOYNO,WHWHSE
     C*
     C                   EXSR      S030
     C* Ensure no items attached
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C* DSPERR *NONE,'DEL0004','ERRORS',*LIBL
     C                   MOVEL     'DEL0004'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* ELSE                                                          *
     C                   ELSE
     C* DELETE D.WAREHED,F.WAREHED
     C*
     C                   EXSR      S032
     C* END                                                           *
     C                   END
     C* IF %STS(D.WAREHED,F.WAREHED)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* WHLMBY = *userid
     C                   MOVE      *BLANKS       XHLMBY
     C                   MOVEL     USER          XHLMBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WHDTLM = ##DATE
     C                   Z-ADD     ##DATE        WK0022
     C* UPDATE D.WAREHED,F.WAREHED
     C*
     C                   EXSR      S033
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.WAREHED,F.WAREHED
     C*
     C                   EXSR      S034
     C* ** Set keys for first record to display.
     C* SVK001 = WHCOYNO
     C                   MOVE      WK0020        SVK001
     C* SVK002 = WHWHSE
     C                   MOVE      XHWHSE        SVK002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.WAREHED,F.WAREHED)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
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
     C* S003 - List Screen for WAREDET
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '001000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK005 = PS0301
     C                   MOVE      PS0301        SVK005
     C*                                                               *
     C* Set Keys to values from header file.
     C* WDCOYNO = WHCOYNO
     C                   MOVE      WK0020        WK0015
     C* WDWHSE = WHWHSE
     C                   MOVE      XHWHSE        WK0019
     C* SVK003 = WHCOYNO
     C                   MOVE      WK0020        SVK003
     C* SVK004 = WHWHSE
     C                   MOVE      XHWHSE        SVK004
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.WAREHED,F.WAREDET,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S035
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
     C                   MOVEA     '00'          *IN(5)
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
     C* SETLL D.WAREHED,F.WAREDET,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S035
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
     C* SETLL D.WAREHED,F.WAREDET,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S035
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
     C* S004 - Detail Screen for WAREDET
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00000000'    *IN(9)
     C                   MOVEA     '0'           *IN(17)
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
     C                   GOTO      $00499
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
     C* SVK003 = WDCOYNO
     C                   MOVE      WK0015        SVK003
     C* SVK004 = WDWHSE
     C                   MOVE      WK0019        SVK004
     C* SVK005 = WDITEM
     C                   MOVE      *BLANKS       SVK005
     C                   MOVEL     XDITEM        SVK005
     C* WDITEM = ' '
     C                   MOVEL     *BLANKS       XDITEM
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* WDUOM = ' '
     C                   MOVEL     *BLANKS       XDUOM
     C* WDSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* WDSBRN = ' '
     C                   MOVEL     *BLANKS       XDSBRN
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C* WDSTOG = ' '
     C                   MOVE      *BLANKS       XDSTOG
     C* TGDESC = ' '
     C                   MOVEL     *BLANKS       XGDESC
     C* WDMINB = 0
     C                   Z-ADD     *ZERO         XDMINB
     C* WDMAXB = 0
     C                   Z-ADD     *ZERO         XDMAXB
     C* WDFIXQ = 0
     C                   Z-ADD     *ZERO         XDFIXQ
     C* WDSAFE = 0
     C                   Z-ADD     *ZERO         XDSAFE
     C* WDEOQ = 0
     C                   Z-ADD     *ZERO         XDEOQ
     C* WDLTIM = 0
     C                   Z-ADD     *ZERO         XDLTIM
     C* WDUCST = 0
     C                   Z-ADD     *ZERO         XDUCST
     C* WDLCST = 0
     C                   Z-ADD     *ZERO         XDLCST
     C* WDOBAL = 0
     C                   Z-ADD     *ZERO         XDOBAL
     C* WDQOH = 0
     C                   Z-ADD     *ZERO         XDQOH
     C* WDQAL = 0
     C                   Z-ADD     *ZERO         XDQAL
     C* WDQOR = 0
     C                   Z-ADD     *ZERO         XDQOR
     C* WDQOO = 0
     C                   Z-ADD     *ZERO         XDQOO
     C* WDQBQ = 0
     C                   Z-ADD     *ZERO         XDQBQ
     C* WDCRBY = ' '
     C                   MOVEL     *BLANKS       XDCRBY
     C* WDCRDT = 0
     C                   Z-ADD     *ZERO         WK0016
     C* WDLMBY = ' '
     C                   MOVEL     *BLANKS       XDLMBY
     C* WDLMDT = 0
     C                   Z-ADD     *ZERO         WK0017
     C* WDCOYNO = SVK003
     C                   MOVE      SVK003        WK0015
     C* WDWHSE = SVK004
     C                   MOVE      SVK004        WK0019
     C* WDITEM = SVK005
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     SVK005        XDITEM
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR WAREHED.WAREDET.WDITEM,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XDITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP001'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.WAREHED,F.WAREDET,*lock,*eq,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S036
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WAREDET)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK10         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREDET)=*no
     C*  Status of last file I/O
     C     STS10         IFNE      *ZERO
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
     C                   MOVEL     'GROUP001'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.WAREHED,F.WAREDET,*lock,*eq,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S036
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WAREDET)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK10         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREDET)=*no
     C*  Status of last file I/O
     C     STS10         IFNE      *ZERO
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
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.WAREHED,F.WAREDET,*eq,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S037
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WAREDET)=*no
     C*  Status of last file I/O
     C     STS10         IFNE      *ZERO
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
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* Get secondary records if any were selected.
     C* GETREC D.WAREHED,F.ITMMAST,*eq,WDCOYNO,WDITEM
     C*
     C                   EXSR      S038
     C* GETREC D.WAREHED,F.STOVGP,*eq,WDCOYNO,WDSTOG
     C*
     C                   EXSR      S039
     C* GETREC D.WAREHED,F.SUPLIER,*eq,WDCOYNO,WDSUPPN
     C*
     C                   EXSR      S040
     C* GETREC D.WAREHED,F.UOM,*eq,WDCOYNO,WDUOM
     C*
     C                   EXSR      S041
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* FLDATR WAREHED.WAREDET.WDITEM,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XDITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP001'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SATRIB
     C* WDITEM = ' '
     C                   MOVEL     *BLANKS       XDITEM
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* WDUOM = ' '
     C                   MOVEL     *BLANKS       XDUOM
     C* WDSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0018
     C* WDSBRN = ' '
     C                   MOVEL     *BLANKS       XDSBRN
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C* WDSTOG = ' '
     C                   MOVE      *BLANKS       XDSTOG
     C* TGDESC = ' '
     C                   MOVEL     *BLANKS       XGDESC
     C* WDMINB = 0
     C                   Z-ADD     *ZERO         XDMINB
     C* WDMAXB = 0
     C                   Z-ADD     *ZERO         XDMAXB
     C* WDFIXQ = 0
     C                   Z-ADD     *ZERO         XDFIXQ
     C* WDSAFE = 0
     C                   Z-ADD     *ZERO         XDSAFE
     C* WDEOQ = 0
     C                   Z-ADD     *ZERO         XDEOQ
     C* WDLTIM = 0
     C                   Z-ADD     *ZERO         XDLTIM
     C* WDUCST = 0
     C                   Z-ADD     *ZERO         XDUCST
     C* WDLCST = 0
     C                   Z-ADD     *ZERO         XDLCST
     C* WDOBAL = 0
     C                   Z-ADD     *ZERO         XDOBAL
     C* WDQOH = 0
     C                   Z-ADD     *ZERO         XDQOH
     C* WDQAL = 0
     C                   Z-ADD     *ZERO         XDQAL
     C* WDQOR = 0
     C                   Z-ADD     *ZERO         XDQOR
     C* WDQOO = 0
     C                   Z-ADD     *ZERO         XDQOO
     C* WDQBQ = 0
     C                   Z-ADD     *ZERO         XDQBQ
     C* WDCRBY = *userid
     C                   MOVE      *BLANKS       XDCRBY
     C                   MOVEL     USER          XDCRBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* WDCRDT = ##DATE
     C                   Z-ADD     ##DATE        WK0016
     C* WDLMBY = ' '
     C                   MOVEL     *BLANKS       XDLMBY
     C* WDLMDT = 0
     C                   Z-ADD     *ZERO         WK0017
     C* WDCOYNO = WHCOYNO
     C                   MOVE      WK0020        WK0015
     C* WDWHSE = WHWHSE
     C                   MOVE      XHWHSE        WK0019
     C* SVK003 = WHCOYNO
     C                   MOVE      WK0020        SVK003
     C* SVK004 = WHWHSE
     C                   MOVE      XHWHSE        SVK004
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* FIRST = 'N'
     C                   MOVE      'N'           FIRST
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* *** Format the date maintained
     C* SYDATI = wdlmdt
     C                   Z-ADD     WK0017        RN0003
     C* EXSUBR sy0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* FL0008 = sydato
     C                   MOVE      RN0004        FL0008
     C* *** And the date created
     C* SYDATI = wdcrdt
     C                   Z-ADD     WK0016        RN0003
     C* EXSUBR sy0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* FL0009 = sydato
     C                   MOVE      RN0004        FL0009
     C*                                                               *
     C* WKROW = 6
     C                   Z-ADD     6             WKROW
     C* WKCOL = 23
     C                   Z-ADD     23            WKCOL
     C* POSCUR WKROW,WKCOL
     C                   Z-ADD     WKROW         LIN
     C                   Z-ADD     WKCOL         POS
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
     C                   MOVEA     '0000'        *IN(3)
     C                   MOVEA     '00000000'    *IN(9)
     C                   MOVEA     '0'           *IN(17)
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
     C* IF %clf(WDITEM)=*yes & mode = 6
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XDITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     MODE          IFEQ      6
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* F04001 = ' '
     C                   MOVEL     *BLANKS       F04001
     C* EXSCR SC0013
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S013
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
     C* IF F04001<>' '
     C     F04001        IFNE      *BLANKS
     C* WDITEM = F04001
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     F04001        XDITEM
     C* END                                                           *
     C                   END
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* GETREC D.WAREHED,F.ITMMAST,*eq,WDCOYNO,WDITEM
     C*
     C                   EXSR      S038
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(WAREHED.WAREDET.WDSTOG)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XDSTOG  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0052
     C     RN0052        IFEQ      1
     C* F04002 = ' '
     C                   MOVE      *BLANKS       F04002
     C* EXSCR SC0014
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S014
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
     C* IF F04002<>' '
     C     F04002        IFNE      *BLANKS
     C* WDSTOG = F04002
     C                   MOVE      F04002        XDSTOG
     C* END                                                           *
     C                   END
     C* TGDESC = ' '
     C                   MOVEL     *BLANKS       XGDESC
     C* GETREC D.WAREHED,F.STOVGP,*eq,WDCOYNO,WDSTOG
     C*
     C                   EXSR      S039
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(WAREHED.WAREDET.WDSUPPN)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0018  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0052
     C     RN0052        IFEQ      1
     C* F04003 = ' '
     C                   MOVEL     *BLANKS       F04003
     C* F04BRN = ' '
     C                   MOVEL     *BLANKS       F04BRN
     C* EXSCR SC0015
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S015
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
     C* IF F04003<>' '
     C     F04003        IFNE      *BLANKS
     C* WDSUPPN = F04003
     C                   MOVE      F04003        WK0018
     C* WDSBRN = F04brn
     C                   MOVE      F04BRN        XDSBRN
     C* END                                                           *
     C                   END
     C* SUNAME = ' '
     C                   MOVEL     *BLANKS       XUNAME
     C* GETREC D.WAREHED,F.SUPLIER,*EQ,WDCOYNO,WDSUPPN,WDSBRN
     C*
     C                   EXSR      S042
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(WAREHED.WAREDET.WDUOM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XDUOM   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0004  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0052
     C     RN0052        IFEQ      1
     C* F04004 = ' '
     C                   MOVEL     *BLANKS       F04004
     C* EXSCR SC0016
     C                   ADD       1             SP
     C                   MOVEL     'SC0004  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S016
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
     C* IF F04004<>' '
     C     F04004        IFNE      *BLANKS
     C* WDUOM = F04004
     C                   MOVE      F04004        XDUOM
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
     C* RLSREC D.WAREHED,F.WAREDET
     C*
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
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
     C* *** Perform updates to file on function key 14
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.WAREHED,F.WAREDET
     C*
     C                   EXSR      S043
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
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
     C*                                                               *
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* ** Revise
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* Move defaults if add
     C* IF mode = 6 & first = 'N'
     C     MODE          IFEQ      6
     C     FIRST         ANDEQ     'N'
     C* FIRST = 'Y'
     C                   MOVE      'Y'           FIRST
     C* GETREC d.warehed,f.itmmast,*eq,wdcoyno,wditem
     C*
     C                   EXSR      S038
     C* IF wduom = ' '
     C     XDUOM         IFEQ      *BLANKS
     C* WDUOM = ituom
     C                   MOVE      WTUOM         XDUOM
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF wdlcst = *zero
     C     XDLCST        IFEQ      *ZERO
     C* WDLCST = itstuc
     C                   Z-ADD     WTSTUC        XDLCST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF wducst = *zero
     C     XDUCST        IFEQ      *ZERO
     C* WDUCST = itstuc
     C                   Z-ADD     WTSTUC        XDUCST
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* Only update if no error
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* WDLMBY = *userid
     C                   MOVE      *BLANKS       XDLMBY
     C                   MOVEL     USER          XDLMBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* WDLMDT = ##DATE
     C                   Z-ADD     ##DATE        WK0017
     C* UPDATE D.WAREHED,F.WAREDET
     C*
     C                   EXSR      S045
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.WAREHED,F.WAREDET
     C*
     C                   EXSR      S047
     C* ** Set keys for first record to display.
     C* SVK003 = WDCOYNO
     C                   MOVE      WK0015        SVK003
     C* SVK004 = WDWHSE
     C                   MOVE      WK0019        SVK004
     C* SVK005 = WDITEM
     C                   MOVE      *BLANKS       SVK005
     C                   MOVEL     XDITEM        SVK005
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C* END                                                           *
     C                   END
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
     C* S005 - List Screen for WLOCITM1
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '001000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK009 = PS0501
     C                   MOVE      PS0501        SVK009
     C*                                                               *
     C* Set Keys to values from header file.
     C* :0131 = WDCOYNO
     C                   MOVE      WK0015        WK0036
     C* :0132 = WDWHSE
     C                   MOVE      WK0019        WK0045
     C* :0133 = WDITEM
     C                   MOVE      XDITEM        WK0039
     C* SVK006 = WDCOYNO
     C                   MOVE      WK0015        SVK006
     C* SVK007 = WDWHSE
     C                   MOVE      WK0019        SVK007
     C* SVK008 = WDITEM
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     XDITEM        SVK008
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     C*
     C                   EXSR      S049
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.WAREHED,F.WLOCITM1,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S050
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
     C                   MOVEA     '00'          *IN(5)
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
     C* *** Return to previous screen on
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
     C                   MOVEA     *IN           IN05
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.WAREHED,F.WLOCITM1,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S050
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
     C*                                                               *
     C* IF PS0501<>' '
     C     PS0501        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK009 = PS0501
     C                   MOVE      PS0501        SVK009
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
     C* SETLL D.WAREHED,F.WLOCITM1,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S050
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
     C* S006 - Detail Screen for WLOCITM1
     C*****************************************************************
     C     S006          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
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
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       XLDESC
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
     C* SVK006 = :0131
     C                   MOVE      WK0036        SVK006
     C* SVK007 = :0132
     C                   MOVE      WK0045        SVK007
     C* SVK008 = :0133
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     WK0039        SVK008
     C* SVK009 = :0315
     C                   MOVE      XILOCN        SVK009
     C* :0315 = ' '
     C                   MOVEL     *BLANKS       XILOCN
     C* :0038 = 0
     C                   Z-ADD     *ZERO         WK0042
     C* :0035 = 0
     C                   Z-ADD     *ZERO         WK0044
     C* :0036 = 0
     C                   Z-ADD     *ZERO         WK0043
     C* :0039 = ' '
     C                   MOVEL     *BLANKS       WK0037
     C* :0040 = 0
     C                   Z-ADD     *ZERO         WK0038
     C* :0041 = ' '
     C                   MOVEL     *BLANKS       WK0040
     C* :0042 = 0
     C                   Z-ADD     *ZERO         WK0041
     C* :0131 = SVK006
     C                   MOVE      SVK006        WK0036
     C* :0132 = SVK007
     C                   MOVE      SVK007        WK0045
     C* :0133 = SVK008
     C                   MOVE      *BLANKS       WK0039
     C                   MOVEL     SVK008        WK0039
     C* :0315 = SVK009
     C                   MOVE      SVK009        XILOCN
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR :0315,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XILOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* FLDATR WAREHED.WLOCITM1.WIMINB,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'WK0042  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.WAREHED,F.WLOCITM1,*lock,*eq,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S051
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WLOCITM1)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK14         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM1)=*no
     C*  Status of last file I/O
     C     STS14         IFNE      *ZERO
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
     C* FLDATR WAREHED.WLOCITM1.WIMINB,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0042  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.WAREHED,F.WLOCITM1,*lock,*eq,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S051
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WLOCITM1)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK14         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM1)=*no
     C*  Status of last file I/O
     C     STS14         IFNE      *ZERO
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
     C* GETREC D.WAREHED,F.WLOCITM1,*eq,SVK006,SVK007,SVK008,SVK009
     C*
     C                   EXSR      S052
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM1)=*no
     C*  Status of last file I/O
     C     STS14         IFNE      *ZERO
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
     C* GETREC D.WAREHED,F.WARELOC,*EQ,:131,:132,:315
     C*
     C                   EXSR      S053
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* FLDATR :0315,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XILOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR WAREHED.WLOCITM1.WIMINB,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'WK0042  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* :315 = ' '
     C                   MOVEL     *BLANKS       XILOCN
     C* :0038 = 0
     C                   Z-ADD     *ZERO         WK0042
     C* :0035 = 0
     C                   Z-ADD     *ZERO         WK0044
     C* :0036 = 0
     C                   Z-ADD     *ZERO         WK0043
     C* :0039 = *userid
     C                   MOVE      *BLANKS       WK0037
     C                   MOVEL     USER          WK0037
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* :0040 = ##DATE
     C                   Z-ADD     ##DATE        WK0038
     C* :0041 = ' '
     C                   MOVEL     *BLANKS       WK0040
     C* :0042 = 0
     C                   Z-ADD     *ZERO         WK0041
     C* :0131 = WDCOYNO
     C                   MOVE      WK0015        WK0036
     C* :0132 = WDWHSE
     C                   MOVE      WK0019        WK0045
     C* :0133 = WDITEM
     C                   MOVE      XDITEM        WK0039
     C* SVK006 = WDCOYNO
     C                   MOVE      WK0015        SVK006
     C* SVK007 = WDWHSE
     C                   MOVE      WK0019        SVK007
     C* SVK008 = WDITEM
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     XDITEM        SVK008
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C*                                                               *
     C* SYDATI = :40
     C                   Z-ADD     WK0038        RN0003
     C* EXSUBR sy0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* FL0011 = SYDATO
     C                   MOVE      RN0004        FL0011
     C*                                                               *
     C* SYDATI = :42
     C                   Z-ADD     WK0041        RN0003
     C* EXSUBR sy0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* FL0012 = SYDATO
     C                   MOVE      RN0004        FL0012
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
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '0'           *IN(4)
     C                   MOVEA     '00'          *IN(7)
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
     C* IF %CLF(:0315)=*YES & MODE=6
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XILOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         RN0052
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     MODE          IFEQ      6
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      1
     C* F04001 = ' '
     C                   MOVEL     *BLANKS       F04001
     C* EXSCR SC0018
     C                   ADD       1             SP
     C                   MOVEL     'SC0006  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN06
     C                   EXSR      S018
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C                   MOVEA     IN06          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F04001<>' '
     C     F04001        IFNE      *BLANKS
     C* :0315 = %ljf(F04001)
     C*  Left Justify field into result field
     C                   MOVEL     F04001        XILOCN
     C* END                                                           *
     C                   END
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       XLDESC
     C* GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,:0315
     C*
     C                   EXSR      S054
     C* END                                                           *
     C                   END
     C* :0315 *BLANKS
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
     C* RLSREC D.WAREHED,F.WLOCITM1
     C*
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
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
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C*                                                               *
     C* IF warehed.wlocitm1.wiqoh <> 0
     C     WK0044        IFNE      *ZERO
     C* DSPERR *none,'usr0005','errors'
     C                   MOVEL     'usr0005'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* ELSE                                                          *
     C                   ELSE
     C* DELETE D.WAREHED,F.WLOCITM1
     C*
     C                   EXSR      S055
     C* IF %STS(D.WAREHED,F.WLOCITM1)=*YES
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C* END                                                           *
     C                   END
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
     C*                                                               *
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* :0041 = *userid
     C                   MOVE      *BLANKS       WK0040
     C                   MOVEL     USER          WK0040
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* :0042 = ##DATE
     C                   Z-ADD     ##DATE        WK0041
     C* UPDATE D.WAREHED,F.WLOCITM1
     C*
     C                   EXSR      S056
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* :0039 = *userid
     C                   MOVE      *BLANKS       WK0037
     C                   MOVEL     USER          WK0037
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* :0040 = ##DATE
     C                   Z-ADD     ##DATE        WK0038
     C* WRITE D.WAREHED,F.WLOCITM1
     C*
     C                   EXSR      S058
     C* ** Set keys for first record to display.
     C* SVK006 = :0131
     C                   MOVE      WK0036        SVK006
     C* SVK007 = :0132
     C                   MOVE      WK0045        SVK007
     C* SVK008 = :0133
     C                   MOVE      *BLANKS       SVK008
     C                   MOVEL     WK0039        SVK008
     C* SVK009 = :0315
     C                   MOVE      XILOCN        SVK009
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %STS(D.WAREHED,F.WLOCITM1)=*YES
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $00699
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
     C* S007 - List Screen for WRITTYP
     C*****************************************************************
     C     S007          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK013 = PS0701
     C                   MOVE      PS0701        SVK013
     C*                                                               *
     C* Set Keys to values from header file.
     C* :0134 = WDCOYNO
     C                   MOVE      WK0015        WK0046
     C* WTWHSE = WDWHSE
     C                   MOVE      WK0019        WK0048
     C* WTITEM = WDITEM
     C                   MOVE      XDITEM        WK0047
     C* SVK010 = WDCOYNO
     C                   MOVE      WK0015        SVK010
     C* SVK011 = WDWHSE
     C                   MOVE      WK0019        SVK011
     C* SVK012 = WDITEM
     C                   MOVE      *BLANKS       SVK012
     C                   MOVEL     XDITEM        SVK012
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     C*
     C                   EXSR      S049
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.WAREHED,F.WRITTYP,SVK010,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S060
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
     C* *** Return to previous screen on
     C* *** on function key 12
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
     C* *** Scroll information backwards
     C*     2. Fill panel.
     C* EXSUBR S07BKW
     C                   EXSR      S07BKW
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
     C* *** Scroll information forwards
     C*     2. Fill Panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check for any selected records on post-enter.
     C*                                                               *
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0701<>' '
     C     PS0701        IFNE      *BLANKS
     C* SVK013 = PS0701
     C                   MOVE      PS0701        SVK013
     C* PS0701 = ' '
     C                   MOVEL     *BLANKS       PS0701
     C* SETLL D.WAREHED,F.WRITTYP,SVK010,SVK011,SVK012,SVK013
     C*
     C                   EXSR      S060
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00799        ENDSR
     C/EJECT
     C*****************************************************************
     C* S008 - List Screen for stokmov
     C*****************************************************************
     C     S008          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '000000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* Set Keys to values from header file.
     C* STWHSE = WDWHSE
     C                   MOVE      WK0019        STWHSE
     C* STITEM = WDITEM
     C                   MOVE      *BLANKS       STITEM
     C                   MOVEL     XDITEM        STITEM
     C* SVK010 = WDCOYNO
     C                   MOVE      WK0015        SVK010
     C* SVK011 = WDWHSE
     C                   MOVE      WK0019        SVK011
     C* SVK012 = WDITEM
     C                   MOVE      *BLANKS       SVK012
     C                   MOVEL     XDITEM        SVK012
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     C*
     C                   EXSR      S049
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.STOKMOV1,F.STOKMOV1,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S061
     C* WKQOH = wdqoh
     C                   Z-ADD     XDQOH         WKQOH
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S07FWD
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
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
     C                   WRITE     SCR008
     C* Turn off SFLDSP in case of empty subfile
     C     RRN05         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN05         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN05         DRN05
     C                   EXFMT     SCR008C1
     C     SFLRRN        IFGT      0
     C     DRN05         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN05
     C                   Z-ADD     SFLRRN        DRN05
     C                   END
     C                   MOVEA     '00000'       *IN(2)
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
     C                   GOTO      $00899
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
     C                   GOTO      $00899
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Scroll information forwards
     C*     2. Fill Panel.
     C* IF %sts(d.stokmov1,f.stokmov1)= *yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* EXSUBR S07FWD
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C                   END
     C     $00899        ENDSR
     C/EJECT
     C*****************************************************************
     C* S009 - List Screen for WARELOC
     C*****************************************************************
     C     S009          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK016 = PS0901
     C                   MOVE      PS0901        SVK016
     C*                                                               *
     C* Set Keys to values from header file.
     C* WLCOYNO = WHCOYNO
     C                   MOVE      WK0020        WK0024
     C* WLWHSE = WHWHSE
     C                   MOVE      XHWHSE        WK0027
     C* SVK014 = WHCOYNO
     C                   MOVE      WK0020        SVK014
     C* SVK015 = WHWHSE
     C                   MOVE      XHWHSE        SVK015
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.WAREHED,F.WARELOC,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S09FWD
     C                   EXSR      S09FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
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
     C                   WRITE     SCR009
     C* Turn off SFLDSP in case of empty subfile
     C     RRN06         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN06         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN06         DRN06
     C                   EXFMT     SCR009C1
     C     SFLRRN        IFGT      0
     C     DRN06         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN06
     C                   Z-ADD     SFLRRN        DRN06
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
     C                   GOTO      $00999
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
     C                   GOTO      $00999
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
     C* EXSCR SC0010
     C                   ADD       1             SP
     C                   MOVEL     'SC0009  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN07
     C                   EXSR      S010
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C                   MOVEA     IN07          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.WAREHED,F.WARELOC,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* EXSUBR S09FWD
     C                   EXSR      S09FWD
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
     C*     1. Check for any selected records.
     C* EXSUBR S09EDT
     C                   EXSR      S09EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S09BKW
     C                   EXSR      S09BKW
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
     C*     1. Check for selected records.
     C* EXSUBR S09EDT
     C                   EXSR      S09EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S09FWD
     C                   EXSR      S09FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
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
     C* EXSUBR S09EDT
     C                   EXSR      S09EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00999
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0901<>' '
     C     PS0901        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK016 = PS0901
     C                   MOVE      PS0901        SVK016
     C* PS0901 = ' '
     C                   MOVEL     *BLANKS       PS0901
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.WAREHED,F.WARELOC,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S062
     C* EXSUBR S09FWD
     C                   EXSR      S09FWD
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
     C* S010 - Detail Screen for WARELOC
     C*****************************************************************
     C     S010          BEGSR
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
     C                   GOTO      $01099
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
     C* SVK014 = WLCOYNO
     C                   MOVE      WK0024        SVK014
     C* SVK015 = WLWHSE
     C                   MOVE      WK0027        SVK015
     C* SVK016 = WLLOCN
     C                   MOVE      XLLOCN        SVK016
     C* WLLOCN = ' '
     C                   MOVEL     *BLANKS       XLLOCN
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       XLDESC
     C* WLPCKR = ' '
     C                   MOVEL     *BLANKS       XLPCKR
     C* WLPCKA = ' '
     C                   MOVE      *BLANKS       XLPCKA
     C* WLPCKF = ' '
     C                   MOVE      *BLANKS       XLPCKF
     C* WLSIZE = 0
     C                   Z-ADD     *ZERO         XLSIZE
     C* WLHITE = 0
     C                   Z-ADD     *ZERO         XLHITE
     C* WLWEIG = 0
     C                   Z-ADD     *ZERO         XLWEIG
     C* WLRSTN = ' '
     C                   MOVEL     *BLANKS       XLRSTN
     C* WLCRBY = ' '
     C                   MOVEL     *BLANKS       XLCRBY
     C* WLCRDT = 0
     C                   Z-ADD     *ZERO         WK0025
     C* WLLMBY = ' '
     C                   MOVEL     *BLANKS       XLLMBY
     C* WLLMDT = 0
     C                   Z-ADD     *ZERO         WK0026
     C* WLCOYNO = SVK014
     C                   MOVE      SVK014        WK0024
     C* WLWHSE = SVK015
     C                   MOVE      SVK015        WK0027
     C* WLLOCN = SVK016
     C                   MOVE      SVK016        XLLOCN
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR WAREHED.WARELOC.WLLOCN,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XLLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP002'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.WAREHED,F.WARELOC,*lock,*eq,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S063
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WARELOC)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK15         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WARELOC)=*no
     C*  Status of last file I/O
     C     STS15         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01099
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
     C* GRPATR input,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'GROUP002'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.WAREHED,F.WARELOC,*lock,*eq,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S063
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WARELOC)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK15         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WARELOC)=*no
     C*  Status of last file I/O
     C     STS15         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01099
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
     C* GETREC D.WAREHED,F.WARELOC,*eq,SVK014,SVK015,SVK016
     C*
     C                   EXSR      S064
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WARELOC)=*no
     C*  Status of last file I/O
     C     STS15         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01099
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
     C* GRPATR input,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'GROUP002'    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wllocn,*ul
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XLLOCN  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* WLLOCN = ' '
     C                   MOVEL     *BLANKS       XLLOCN
     C* WLDESC = ' '
     C                   MOVEL     *BLANKS       XLDESC
     C* WLPCKR = ' '
     C                   MOVEL     *BLANKS       XLPCKR
     C* WLPCKA = ' '
     C                   MOVE      *BLANKS       XLPCKA
     C* WLPCKF = ' '
     C                   MOVE      *BLANKS       XLPCKF
     C* WLSIZE = 0
     C                   Z-ADD     *ZERO         XLSIZE
     C* WLHITE = 0
     C                   Z-ADD     *ZERO         XLHITE
     C* WLWEIG = 0
     C                   Z-ADD     *ZERO         XLWEIG
     C* WLRSTN = ' '
     C                   MOVEL     *BLANKS       XLRSTN
     C* WLCRBY = *userid
     C                   MOVE      *BLANKS       XLCRBY
     C                   MOVEL     USER          XLCRBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C* WLCRDT = ##DATE
     C                   Z-ADD     ##DATE        WK0025
     C* WLLMBY = ' '
     C                   MOVEL     *BLANKS       XLLMBY
     C* WLLMDT = 0
     C                   Z-ADD     *ZERO         WK0026
     C* WLCOYNO = WHCOYNO
     C                   MOVE      WK0020        WK0024
     C* WLWHSE = WHWHSE
     C                   MOVE      XHWHSE        WK0027
     C* SVK014 = WHCOYNO
     C                   MOVE      WK0020        SVK014
     C* SVK015 = WHWHSE
     C                   MOVE      XHWHSE        SVK015
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C*                                                               *
     C* SYDATI = wlcrdt
     C                   Z-ADD     WK0025        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C* FL0014 = SYDATO
     C                   MOVE      RN0004        FL0014
     C*                                                               *
     C* SYDATI = wllmdt
     C                   Z-ADD     WK0026        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C* FL0015 = SYDATO
     C                   MOVE      RN0004        FL0015
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
     C                   MOVEA     '000'         *IN(3)
     C                   MOVEA     '00000'       *IN(8)
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
     C* RLSREC D.WAREHED,F.WARELOC
     C*
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   UNLOCK    WARELOC                              91      RLS LCK WARELOC
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $01099
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
     C* DELETE D.WAREHED,F.WARELOC
     C*
     C                   EXSR      S065
     C* IF %STS(D.WAREHED,F.WARELOC)=*YES
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S010V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.WAREHED,F.WARELOC
     C*
     C                   EXSR      S067
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.WAREHED,F.WARELOC
     C*
     C                   EXSR      S069
     C* ** Set keys for first record to display.
     C* SVK014 = WLCOYNO
     C                   MOVE      WK0024        SVK014
     C* SVK015 = WLWHSE
     C                   MOVE      WK0027        SVK015
     C* SVK016 = WLLOCN
     C                   MOVE      XLLOCN        SVK016
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %STS(D.WAREHED,F.WARELOC)=*YES
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $01099
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
     C* S011 - List Screen for WLOCITM
     C*****************************************************************
     C     S011          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '001000'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Reset Key values, start at beginning of file
     C* SVK020 = PS1101
     C                   MOVE      *BLANKS       SVK020
     C                   MOVEL     PS1101        SVK020
     C*                                                               *
     C* Set Keys to values from header file.
     C* :0128 = WLCOYNO
     C                   MOVE      WK0024        WK0031
     C* :0129 = WLWHSE
     C                   MOVE      WK0027        WK0035
     C* :0316 = WLLOCN
     C                   MOVE      XLLOCN        WK0034
     C* SVK017 = WLCOYNO
     C                   MOVE      WK0024        SVK017
     C* SVK018 = WLWHSE
     C                   MOVE      WK0027        SVK018
     C* SVK019 = WLLOCN
     C                   MOVE      XLLOCN        SVK019
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.WAREHED,F.WLOCITM,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S070
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S11FWD
     C                   EXSR      S11FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
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
     C                   WRITE     SCR011
     C* Turn off SFLDSP in case of empty subfile
     C     RRN07         IFLT      1
     C                   MOVE      '0'           *IN64
     C                   ELSE
     C                   MOVE      '1'           *IN64
     C                   END
     C     ERN07         IFEQ      1
     C                   MOVE      '1'           *IN67
     C                   ELSE
     C                   MOVE      '0'           *IN67
     C                   END
     C                   Z-ADD     RRN07         DRN07
     C                   EXFMT     SCR011C1
     C     SFLRRN        IFGT      0
     C     DRN07         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN07
     C                   Z-ADD     SFLRRN        DRN07
     C                   END
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '00'          *IN(5)
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
     C                   GOTO      $01199
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
     C                   GOTO      $01199
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
     C* EXSCR SC0012
     C                   ADD       1             SP
     C                   MOVEL     'SC0011  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN08
     C                   EXSR      S012
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C                   MOVEA     IN08          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.WAREHED,F.WLOCITM,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S070
     C* EXSUBR S11FWD
     C                   EXSR      S11FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
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
     C* EXSUBR S11EDT
     C                   EXSR      S11EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S11BKW
     C                   EXSR      S11BKW
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
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S11EDT
     C                   EXSR      S11EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S11FWD
     C                   EXSR      S11FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
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
     C* EXSUBR S11EDT
     C                   EXSR      S11EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS1101<>' '
     C     PS1101        IFNE      *BLANKS
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* SVK020 = PS1101
     C                   MOVE      *BLANKS       SVK020
     C                   MOVEL     PS1101        SVK020
     C* PS1101 = ' '
     C                   MOVEL     *BLANKS       PS1101
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.WAREHED,F.WLOCITM,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S070
     C* EXSUBR S11FWD
     C                   EXSR      S11FWD
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
     C* S012 - Detail Screen for WLOCITM
     C*****************************************************************
     C     S012          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
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
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0002
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
     C* SVK017 = :0128
     C                   MOVE      WK0031        SVK017
     C* SVK018 = :0129
     C                   MOVE      WK0035        SVK018
     C* SVK019 = :0316
     C                   MOVE      WK0034        SVK019
     C* SVK020 = :0066
     C                   MOVE      *BLANKS       SVK020
     C                   MOVEL     XIITEM        SVK020
     C* :0066 = ' '
     C                   MOVEL     *BLANKS       XIITEM
     C* :0070 = 0
     C                   Z-ADD     *ZERO         XIMINB
     C* :0067 = 0
     C                   Z-ADD     *ZERO         XIQOH
     C* :0068 = 0
     C                   Z-ADD     *ZERO         XIQAL
     C* :0071 = ' '
     C                   MOVEL     *BLANKS       XICRBY
     C* :0072 = 0
     C                   Z-ADD     *ZERO         WK0032
     C* :0073 = ' '
     C                   MOVEL     *BLANKS       XILMBY
     C* :0074 = 0
     C                   Z-ADD     *ZERO         WK0033
     C* :0128 = SVK017
     C                   MOVE      SVK017        WK0031
     C* :0129 = SVK018
     C                   MOVE      SVK018        WK0035
     C* :0316 = SVK019
     C                   MOVE      SVK019        WK0034
     C* :0066 = SVK020
     C                   MOVE      *BLANKS       XIITEM
     C                   MOVEL     SVK020        XIITEM
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR WAREHED.WLOCITM.WIITEM,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* FLDATR WAREHED.WLOCITM.WIMINB,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XIMINB  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETREC D.WAREHED,F.WLOCITM,*lock,*eq,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S071
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WLOCITM)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK17         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM)=*no
     C*  Status of last file I/O
     C     STS17         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Edit'
     C                   MOVEL     C0001         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01299
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
     C* FLDATR WAREHED.WLOCITM.WIMINB,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XIMINB  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.WAREHED,F.WLOCITM,*lock,*eq,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S071
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.WAREHED,F.WLOCITM)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK17         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM)=*no
     C*  Status of last file I/O
     C     STS17         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Delete'
     C                   MOVEL     C0002         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01299
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
     C* GETREC D.WAREHED,F.WLOCITM,*eq,SVK017,SVK018,SVK019,SVK020
     C*
     C                   EXSR      S072
     C*                                                               *
     C* If record not found, Display message
     C* and return.
     C* IF %sts(D.WAREHED,F.WLOCITM)=*no
     C*  Status of last file I/O
     C     STS17         IFNE      *ZERO
     C* DSPERR *none,'Record not found for Display'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $01299
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
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,:66
     C*
     C                   EXSR      S073
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* FLDATR WAREHED.WLOCITM.WIITEM,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR WAREHED.WLOCITM.WIMINB,*UL
     C                   MOVE      'X'           #UL
     C                   MOVEL     'XIMINB  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C* :0066 = ' '
     C                   MOVEL     *BLANKS       XIITEM
     C* :0070 = 0
     C                   Z-ADD     *ZERO         XIMINB
     C* :0067 = 0
     C                   Z-ADD     *ZERO         XIQOH
     C* :0068 = 0
     C                   Z-ADD     *ZERO         XIQAL
     C* :0071 = *userid
     C                   MOVE      *BLANKS       XICRBY
     C                   MOVEL     USER          XICRBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* :0072 = ##DATE
     C                   Z-ADD     ##DATE        WK0032
     C* :0073 = ' '
     C                   MOVEL     *BLANKS       XILMBY
     C* :0074 = 0
     C                   Z-ADD     *ZERO         WK0033
     C* :0128 = WLCOYNO
     C                   MOVE      WK0024        WK0031
     C* :0129 = WLWHSE
     C                   MOVE      WK0027        WK0035
     C* :0316 = WLLOCN
     C                   MOVE      XLLOCN        WK0034
     C* SVK017 = WLCOYNO
     C                   MOVE      WK0024        SVK017
     C* SVK018 = WLWHSE
     C                   MOVE      WK0027        SVK018
     C* SVK019 = WLLOCN
     C                   MOVE      XLLOCN        SVK019
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* END                                                           *
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* *** Format the dates for output
     C* SYDATI = :72
     C                   Z-ADD     WK0032        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* FL0017 = SYDATO
     C                   MOVE      RN0004        FL0017
     C* SYDATI = :74
     C                   Z-ADD     WK0033        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* FL0018 = SYDATO
     C                   MOVE      RN0004        FL0018
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
     C                   MOVEA     '00'          *IN(1)
     C                   MOVEA     '0'           *IN(5)
     C                   MOVEA     '0'           *IN(8)
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
     C* IF %clf(WAREHED.Wlocitm.WiITEM)=*yes & mode=6
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XIITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     MODE          IFEQ      6
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* F04001 = ' '
     C                   MOVEL     *BLANKS       F04001
     C* EXSCR SC0019
     C                   ADD       1             SP
     C                   MOVEL     'SC0012  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN09
     C                   EXSR      S019
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C                   MOVEA     IN09          *IN
     C                   MOVE      '1'           *IN79
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* IF F04001<>' '
     C     F04001        IFNE      *BLANKS
     C* :0066 = F04001
     C                   MOVE      *BLANKS       XIITEM
     C                   MOVEL     F04001        XIITEM
     C* END                                                           *
     C                   END
     C* ITIDESC = ' '
     C                   MOVEL     *BLANKS       WK0002
     C* GETREC D.WAREHED,F.ITMMAST,*eq,PRCOYNO,:66
     C*
     C                   EXSR      S073
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
     C* RLSREC D.WAREHED,F.WLOCITM
     C*
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   UNLOCK    WLOCITM                              91      RLS LCK WLOCITM
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $01299
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
     C*                                                               *
     C* IF warehed.wlocitm.wiqoh <> 0
     C     XIQOH         IFNE      *ZERO
     C* DSPERR *none,'usr0005','errors'
     C                   MOVEL     'usr0005'     MSGID
     C                   MOVEL     'errors'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C* ELSE                                                          *
     C                   ELSE
     C* DELETE D.WAREHED,F.WLOCITM
     C*
     C                   EXSR      S074
     C* IF %STS(D.WAREHED,F.WLOCITM)=*YES
     C*  Status of last file I/O
     C     STS17         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S012V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C* *** Perform updates to file on function key 14
     C*                                                               *
     C* IF mode <> 4
     C     MODE          IFNE      4
     C* ** Revise
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* :0073 = *userid
     C                   MOVE      *BLANKS       XILMBY
     C                   MOVEL     USER          XILMBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* :0074 = ##DATE
     C                   Z-ADD     ##DATE        WK0033
     C* UPDATE D.WAREHED,F.WLOCITM
     C*
     C                   EXSR      S075
     C* ELSE                                                          *
     C                   ELSE
     C* ** Create
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* :0071 = *userid
     C                   MOVE      *BLANKS       XICRBY
     C                   MOVEL     USER          XICRBY
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01299
     C                   END
     C* :0072 = ##DATE
     C                   Z-ADD     ##DATE        WK0032
     C* WRITE D.WAREHED,F.WLOCITM
     C*
     C                   EXSR      S077
     C* ** Set keys for first record to display.
     C* SVK017 = :0128
     C                   MOVE      WK0031        SVK017
     C* SVK018 = :0129
     C                   MOVE      WK0035        SVK018
     C* SVK019 = :0316
     C                   MOVE      WK0034        SVK019
     C* SVK020 = :0066
     C                   MOVE      *BLANKS       SVK020
     C                   MOVEL     XIITEM        SVK020
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF %STS(D.WAREHED,F.WLOCITM)=*YES
     C*  Status of last file I/O
     C     STS17         IFEQ      *ZERO
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S013 -         List of Items
     C*****************************************************************
     C     S013          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST13 = ' '
     C                   MOVEL     *BLANKS       FST13
     C* LST13 = ' '
     C                   MOVEL     *BLANKS       LST13
     C* SVK13 = ' '
     C                   MOVEL     *BLANKS       SVK13
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK021 = WDCOYNO
     C                   MOVE      WK0015        SVK021
     C* S13CNT = 005
     C                   Z-ADD     005           S13CNT
     C* ** Array forward read.
     C* EXSUBR S13AFR
     C                   EXSR      S13AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01399
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
     C                   EXFMT     SCR013
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
     C                   GOTO      $01399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Alpha Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* EXSCR scialp
     C                   ADD       1             SP
     C                   MOVEL     'SC0013  '    SID(SP)
     C                   MOVE      'W'           STY(SP)
     C                   MOVEA     *IN           IN10
     C                   EXSR      S020
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01399
     C                   END
     C                   MOVEA     IN10          *IN
     C                   MOVE      '1'           *IN79
     C* IF f04001 <> ' '
     C     F04001        IFNE      *BLANKS
     C* EXTSCR                                                        *
     C                   GOTO      $01399
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
     C* SVK13 = FST13
     C                   MOVE      FST13         SVK13
     C* ** Array Backwards read.
     C* EXSUBR S13ABR
     C                   EXSR      S13ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK13 = LST13
     C                   MOVE      LST13         SVK13
     C* ** Array Forward Read.
     C* EXSUBR S13AFR
     C                   EXSR      S13AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01399
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I13 = 1
     C                   Z-ADD     1             Y7
     C* DOW (I13<=C13)&(T01(I13)<>1)
     C     Y7            DOWLE     Z6
     C     T01(Y7)       ANDNE     1
     C* I13 = I13+1
     C     Y7            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I13<=C13)&(T01(I13)=1)
     C     Y7            IFLE      Z6
     C     T01(Y7)       ANDEQ     1
     C* F04001 = B01(I13)
     C                   MOVE      B01(Y7)       F04001
     C* EXTSCR                                                        *
     C                   GOTO      $01399
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF fl0020 <> ' '
     C     FL0020        IFNE      *BLANKS
     C* SVK13 = fl0020
     C                   MOVE      *BLANKS       SVK13
     C                   MOVEL     FL0020        SVK13
     C* FL0020 = ' '
     C                   MOVEL     *BLANKS       FL0020
     C* EXSUBR s13afr
     C                   EXSR      S13AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01399
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S014 -      List Turnover Groups
     C*****************************************************************
     C     S014          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST14 = ' '
     C                   MOVE      *BLANKS       FST14
     C* LST14 = ' '
     C                   MOVE      *BLANKS       LST14
     C* SVK14 = ' '
     C                   MOVE      *BLANKS       SVK14
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK023 = WDCOYNO
     C                   MOVE      WK0015        SVK023
     C* S14CNT = 005
     C                   Z-ADD     005           S14CNT
     C* ** Array forward read.
     C* EXSUBR S14AFR
     C                   EXSR      S14AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
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
     C                   EXFMT     SCR014
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
     C                   GOTO      $01499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK14 = FST14
     C                   MOVE      FST14         SVK14
     C* ** Array Backwards read.
     C* EXSUBR S14ABR
     C                   EXSR      S14ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK14 = LST14
     C                   MOVE      LST14         SVK14
     C* ** Array Forward Read.
     C* EXSUBR S14AFR
     C                   EXSR      S14AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I14 = 1
     C                   Z-ADD     1             Y8
     C* DOW (I14<=C14)&(T04(I14)<>1)
     C     Y8            DOWLE     Z7
     C     T04(Y8)       ANDNE     1
     C* I14 = I14+1
     C     Y8            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y8
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I14<=C14)&(T04(I14)=1)
     C     Y8            IFLE      Z7
     C     T04(Y8)       ANDEQ     1
     C* F04002 = B02(I14)
     C                   MOVE      B02(Y8)       F04002
     C* EXTSCR                                                        *
     C                   GOTO      $01499
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01499        ENDSR
     C/EJECT
     C*****************************************************************
     C* S015 -        List Suppliers
     C*****************************************************************
     C     S015          BEGSR
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
     C* SVK025 = WDCOYNO
     C                   MOVE      WK0015        SVK025
     C* S15CNT = 005
     C                   Z-ADD     005           S15CNT
     C* ** Array forward read.
     C* EXSUBR S15AFR
     C                   EXSR      S15AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01599
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
     C                   EXFMT     SCR015
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
     C                   GOTO      $01599
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
     C                   MOVEA     *IN           IN11
     C                   EXSR      S021
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C                   EXSR      SREDSP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01599
     C                   END
     C                   MOVEA     IN11          *IN
     C                   MOVE      '1'           *IN79
     C* IF f04003<> ' '
     C     F04003        IFNE      *BLANKS
     C* EXTSCR                                                        *
     C                   GOTO      $01599
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
     C                   GOTO      $01599
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
     C                   GOTO      $01599
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I15 = 1
     C                   Z-ADD     1             Y9
     C* DOW (I15<=C15)&(T07(I15)<>1)
     C     Y9            DOWLE     Z8
     C     T07(Y9)       ANDNE     1
     C* I15 = I15+1
     C     Y9            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y9
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I15<=C15)&(T07(I15)=1)
     C     Y9            IFLE      Z8
     C     T07(Y9)       ANDEQ     1
     C* F04003 = B03(I15)
     C                   MOVE      B03(Y9)       F04003
     C* F04BRN = T09(I15)
     C                   MOVE      T09(Y9)       F04BRN
     C* EXTSCR                                                        *
     C                   GOTO      $01599
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
     C                   GOTO      $01599
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01599        ENDSR
     C/EJECT
     C*****************************************************************
     C* S016 -      List Unit Of Measure
     C*****************************************************************
     C     S016          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST16 = ' '
     C                   MOVEL     *BLANKS       FST16
     C* LST16 = ' '
     C                   MOVEL     *BLANKS       LST16
     C* SVK16 = ' '
     C                   MOVEL     *BLANKS       SVK16
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK028 = WDCOYNO
     C                   MOVE      WK0015        SVK028
     C* S16CNT = 005
     C                   Z-ADD     005           S16CNT
     C* ** Array forward read.
     C* EXSUBR S16AFR
     C                   EXSR      S16AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01699
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
     C                   EXFMT     SCR016
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
     C                   GOTO      $01699
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK16 = FST16
     C                   MOVE      FST16         SVK16
     C* ** Array Backwards read.
     C* EXSUBR S16ABR
     C                   EXSR      S16ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK16 = LST16
     C                   MOVE      LST16         SVK16
     C* ** Array Forward Read.
     C* EXSUBR S16AFR
     C                   EXSR      S16AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01699
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I16 = 1
     C                   Z-ADD     1             X2
     C* DOW (I16<=C16)&(T11(I16)<>1)
     C     X2            DOWLE     Z9
     C     T11(X2)       ANDNE     1
     C* I16 = I16+1
     C     X2            ADD       1             RN0052
     C                   Z-ADD     RN0052        X2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I16<=C16)&(T11(I16)=1)
     C     X2            IFLE      Z9
     C     T11(X2)       ANDEQ     1
     C* F04004 = B04(I16)
     C                   MOVE      B04(X2)       F04004
     C* EXTSCR                                                        *
     C                   GOTO      $01699
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01699        ENDSR
     C/EJECT
     C*****************************************************************
     C* S017 -     List of Warehouse Types
     C*****************************************************************
     C     S017          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST17 = ' '
     C                   MOVEL     *BLANKS       FST17
     C* LST17 = ' '
     C                   MOVEL     *BLANKS       LST17
     C* SVK17 = ' '
     C                   MOVEL     *BLANKS       SVK17
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK030 = WHCOYNO
     C                   MOVE      WK0020        SVK030
     C* S17CNT = 005
     C                   Z-ADD     005           S17CNT
     C* ** Array forward read.
     C* EXSUBR S17AFR
     C                   EXSR      S17AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01799
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
     C                   EXFMT     SCR017
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
     C                   GOTO      $01799
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK17 = FST17
     C                   MOVE      FST17         SVK17
     C* ** Array Backwards read.
     C* EXSUBR S17ABR
     C                   EXSR      S17ABR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK17 = LST17
     C                   MOVE      LST17         SVK17
     C* ** Array Forward Read.
     C* EXSUBR S17AFR
     C                   EXSR      S17AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I17 = 1
     C                   Z-ADD     1             X3
     C* DOW (I17<=C17)&(T14(I17)<>1)
     C     X3            DOWLE     Y1
     C     T14(X3)       ANDNE     1
     C* I17 = I17+1
     C     X3            ADD       1             RN0052
     C                   Z-ADD     RN0052        X3
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I17<=C17)&(T14(I17)=1)
     C     X3            IFLE      Y1
     C     T14(X3)       ANDEQ     1
     C* F02001 = B05(I17)
     C                   MOVE      B05(X3)       F02001
     C* EXTSCR                                                        *
     C                   GOTO      $01799
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01799        ENDSR
     C/EJECT
     C*****************************************************************
     C* S018 - List of Locations in Warehouse
     C*****************************************************************
     C     S018          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FSTLOC = ' '
     C                   MOVEL     *BLANKS       FSTLOC
     C* LSTLOC = ' '
     C                   MOVEL     *BLANKS       LSTLOC
     C* SVKLOC = ' '
     C                   MOVEL     *BLANKS       SVKLOC
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK021 = WDCOYNO
     C                   MOVE      WK0015        SVK021
     C* S13CNT = 005
     C                   Z-ADD     005           S13CNT
     C* ** Array forward read.
     C* EXSUBR S13AFR
     C                   EXSR      S504
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01899
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
     C                   EXFMT     SCR018
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
     C                   GOTO      $01899
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVKLOC = fstloc
     C                   MOVE      FSTLOC        SVKLOC
     C* ** Array Backwards read.
     C* EXSUBR S13ABR
     C                   EXSR      S501
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVKLOC = LSTloc
     C                   MOVE      LSTLOC        SVKLOC
     C* ** Array Forward Read.
     C* EXSUBR S13AFR
     C                   EXSR      S504
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I13 = 1
     C                   Z-ADD     1             Y7
     C* DOW (I13<=C13)&(T01(I13)<>1)
     C     Y7            DOWLE     Z6
     C     T01(Y7)       ANDNE     1
     C* I13 = I13+1
     C     Y7            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I13<=C13)&(T01(I13)=1)
     C     Y7            IFLE      Z6
     C     T01(Y7)       ANDEQ     1
     C* F04001 = %ljf(B01(I13))
     C*  Left Justify field into result field
     C                   MOVEL     B01(Y7)       F04001
     C* EXTSCR                                                        *
     C                   GOTO      $01899
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01899        ENDSR
     C/EJECT
     C*****************************************************************
     C* S019 -   List of Items in Warehouse
     C*****************************************************************
     C     S019          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '0000'        *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST13 = ' '
     C                   MOVEL     *BLANKS       FST13
     C* LST13 = ' '
     C                   MOVEL     *BLANKS       LST13
     C* SVK13 = ' '
     C                   MOVEL     *BLANKS       SVK13
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK021 = PRcoyno
     C                   MOVE      PRM001        SVK021
     C* S13CNT = 005
     C                   Z-ADD     005           S13CNT
     C* ** Array forward read.
     C* EXSUBR S13AFR
     C                   EXSR      S505
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01999
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
     C                   EXFMT     SCR019
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
     C                   GOTO      $01999
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK13 = fst13
     C                   MOVE      FST13         SVK13
     C* ** Array Backwards read.
     C* EXSUBR S13ABR
     C                   EXSR      S502
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK13 = LST13
     C                   MOVE      LST13         SVK13
     C* ** Array Forward Read.
     C* EXSUBR S13AFR
     C                   EXSR      S505
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01999
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I13 = 1
     C                   Z-ADD     1             Y7
     C* DOW (I13<=C13)&(T01(I13)<>1)
     C     Y7            DOWLE     Z6
     C     T01(Y7)       ANDNE     1
     C* I13 = I13+1
     C     Y7            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I13<=C13)&(T01(I13)=1)
     C     Y7            IFLE      Z6
     C     T01(Y7)       ANDEQ     1
     C* F04001 = B01(I13)
     C                   MOVE      B01(Y7)       F04001
     C* EXTSCR                                                        *
     C                   GOTO      $01999
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01999        ENDSR
     C/EJECT
     C*****************************************************************
     C* S020 -     List of Items in Alpha
     C*****************************************************************
     C     S020          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST13 = ' '
     C                   MOVEL     *BLANKS       FST13
     C* LST13 = ' '
     C                   MOVEL     *BLANKS       LST13
     C* SVK13 = ' '
     C                   MOVEL     *BLANKS       SVK13
     C* FSTIAL = ' '
     C                   MOVEL     *BLANKS       FSTIAL
     C* LSTIAL = ' '
     C                   MOVEL     *BLANKS       LSTIAL
     C* SVKIAL = ' '
     C                   MOVEL     *BLANKS       SVKIAL
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK021 = WDCOYNO
     C                   MOVE      WK0015        SVK021
     C* S13CNT = 005
     C                   Z-ADD     005           S13CNT
     C* ** Array forward read.
     C* EXSUBR S13AFR
     C                   EXSR      S506
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02099
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
     C                   EXFMT     SCR020
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
     C                   GOTO      $02099
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Number Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $02099
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK13 = FST13
     C                   MOVE      FST13         SVK13
     C* SVKIAL = FSTial
     C                   MOVE      FSTIAL        SVKIAL
     C* ** Array Backwards read.
     C* EXSUBR S13ABR
     C                   EXSR      S503
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02099
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Fwd
     C*
     C     *IN61         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK13 = LST13
     C                   MOVE      LST13         SVK13
     C* SVKIAL = LSTial
     C                   MOVE      LSTIAL        SVKIAL
     C* ** Array Forward Read.
     C* EXSUBR S13AFR
     C                   EXSR      S506
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02099
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I13 = 1
     C                   Z-ADD     1             Y7
     C* DOW (I13<=C13)&(T01(I13)<>1)
     C     Y7            DOWLE     Z6
     C     T01(Y7)       ANDNE     1
     C* I13 = I13+1
     C     Y7            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I13<=C13)&(T01(I13)=1)
     C     Y7            IFLE      Z6
     C     T01(Y7)       ANDEQ     1
     C* F04001 = B01(I13)
     C                   MOVE      B01(Y7)       F04001
     C* EXTSCR                                                        *
     C                   GOTO      $02099
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF fl0019 <> ' '
     C     FL0019        IFNE      *BLANKS
     C* SVKIAL = fl0019
     C                   MOVE      FL0019        SVKIAL
     C* FL0019 = ' '
     C                   MOVEL     *BLANKS       FL0019
     C* SVK13 = ' '
     C                   MOVEL     *BLANKS       SVK13
     C* EXSUBR s13afr
     C                   EXSR      S506
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02099
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $02099        ENDSR
     C/EJECT
     C*****************************************************************
     C* S021 -     List Suppliers in Alpha
     C*****************************************************************
     C     S021          BEGSR
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
     C* FSTIAL = ' '
     C                   MOVEL     *BLANKS       FSTIAL
     C* LSTIAL = ' '
     C                   MOVEL     *BLANKS       LSTIAL
     C* SVKIAL = ' '
     C                   MOVEL     *BLANKS       SVKIAL
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK025 = WDCOYNO
     C                   MOVE      WK0015        SVK025
     C* S15CNT = 005
     C                   Z-ADD     005           S15CNT
     C* ** Array forward read.
     C* EXSUBR S15AFR
     C                   EXSR      S511
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02199
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
     C                   EXFMT     SCR021
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
     C                   GOTO      $02199
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Number Seq
     C*
     C     *INKS         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $02199
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
     C* SVKIAL = fstial
     C                   MOVE      FSTIAL        SVKIAL
     C* ** Array Backwards read.
     C* EXSUBR S15ABR
     C                   EXSR      S510
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02199
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
     C* SVKIAL = LSTial
     C                   MOVE      LSTIAL        SVKIAL
     C* ** Array Forward Read.
     C* EXSUBR S15AFR
     C                   EXSR      S511
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I15 = 1
     C                   Z-ADD     1             Y9
     C* DOW (I15<=C15)&(T07(I15)<>1)
     C     Y9            DOWLE     Z8
     C     T07(Y9)       ANDNE     1
     C* I15 = I15+1
     C     Y9            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y9
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I15<=C15)&(T07(I15)=1)
     C     Y9            IFLE      Z8
     C     T07(Y9)       ANDEQ     1
     C* F04003 = B03(I15)
     C                   MOVE      B03(Y9)       F04003
     C* F04BRN = T09(I15)
     C                   MOVE      T09(Y9)       F04BRN
     C* EXTSCR                                                        *
     C                   GOTO      $02199
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF fl0019 <> ' '
     C     FL0019        IFNE      *BLANKS
     C* SVKIAL = fl0019
     C                   MOVE      FL0019        SVKIAL
     C* SVK026 = ' '
     C                   MOVEL     *BLANKS       SVK026
     C* SVK15 = ' '
     C                   MOVEL     *BLANKS       SVK15
     C* FL0019 = ' '
     C                   MOVEL     *BLANKS       FL0019
     C* EXSUBR s15afr
     C                   EXSR      S511
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $02199
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $02199        ENDSR
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
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0005'
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR005
     C                   WRITE     SCR005C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0006'
     C                   MOVEA     IN06          *IN
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
     C     SID(CT)       IFEQ      'SCMOVE'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR008
     C                   WRITE     SCR008C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0009'
     C                   MOVEA     IN07          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR009
     C                   WRITE     SCR009C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0010'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR010
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0011'
     C                   MOVEA     IN08          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR011
     C                   WRITE     SCR011C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0012'
     C                   MOVEA     IN09          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR012
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0013'
     C                   MOVEA     IN10          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR013
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0014'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR014
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0015'
     C                   MOVEA     IN11          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR015
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0016'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR016
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0017'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR017
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0018'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR018
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0019'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR019
     C                   ELSE
     C     SID(CT)       IFEQ      'SCIALP'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR020
     C                   ELSE
     C     SID(CT)       IFEQ      'SCSALP'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR021
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
     C     19000000      ADD       XYMD          RN0052
     C                   Z-ADD     RN0052        ##DATE
     C* ELSE                                                          *
     C                   ELSE
     C* ##DATE = 20000000 + *YMD
     C     20000000      ADD       XYMD          RN0052
     C                   Z-ADD     RN0052        ##DATE
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
     C* IF one <> 'Y'
     C     ONE           IFNE      'Y'
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno
     C*
     C                   EXSR      S079
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0027         READE(N)  WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
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
     C     Z1            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = WHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0020        A01(Z1)
     C* A002(C01) = WHWHSE
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHWHSE        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
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
     C                   EXSR      S081                                         CHK EOF
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno,uswhse
     C*
     C                   EXSR      S082
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0003         READE(N)  WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
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
     C     Z1            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = WHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0020        A01(Z1)
     C* A002(C01) = WHWHSE
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHWHSE        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
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
     C                   EXSR      S084                                         CHK EOF
     C* END                                                           *
     C                   END
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
     C                   Z-ADD     *ZERO         Y2
     C* DOBLK D.WAREHED
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
     C     Y2            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y2
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0001=2)|(FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* WHCOYNO = A001(I01)
     C                   MOVE      A01(Y2)       WK0020
     C* WHWHSE = A002(I01)
     C                   MOVE      A02(Y2)       XHWHSE
     C* ** Get record and any secondary records.
     C* GETREC D.WAREHED,F.WAREHED,*EQ,WHCOYNO,WHWHSE
     C*
     C                   EXSR      S085
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
     C* WHCOYNO = A001(I01)
     C                   MOVE      A01(Y2)       WK0020
     C* WHWHSE = A002(I01)
     C                   MOVE      A02(Y2)       XHWHSE
     C* SVK002 = A002(I01)
     C                   MOVE      A02(Y2)       SVK002
     C* GETREC D.WAREHED,F.WAREHED,*EQ,WHCOYNO,WHWHSE
     C*
     C                   EXSR      S085
     C* IF %STS(D.WAREHED,F.WAREHED)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
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
     C*                                                               *
     C* IF FL0001=07
     C     FL0001        IFEQ      07
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* WHCOYNO = A001(I01)
     C                   MOVE      A01(Y2)       WK0020
     C* WHWHSE = A002(I01)
     C                   MOVE      A02(Y2)       XHWHSE
     C* SVK002 = A002(I01)
     C                   MOVE      A02(Y2)       SVK002
     C* GETREC D.WAREHED,F.WAREHED,*EQ,WHCOYNO,WHWHSE
     C*
     C                   EXSR      S085
     C* IF %STS(D.WAREHED,F.WAREHED)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* EXSCR SC0009
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S009
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
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C* IF one <> 'Y'
     C     ONE           IFNE      'Y'
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREHED,*NE,PRCOYNO
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0027         READE(N)  WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = WHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0020        A01(Z1)
     C* A002(C01) = WHWHSE
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHWHSE        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
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
     C                   EXSR      S081                                         RESET FP
     C* ELSE                                                          *
     C                   ELSE
     C* FLDATR fl0001,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREHED,*NE,PRCOYNO,uswhse
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0003         READE(N)  WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0001,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = WHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0020        A01(Z1)
     C* A002(C01) = WHWHSE
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHWHSE        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0023
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
     C                   EXSR      S084                                         RESET FP
     C* END                                                           *
     C                   END
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
     C* FLDATR fl0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREDET,F.ITMMAST,*PV,SVK003,SVK004
     C*
     C                   EXSR      S086
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     SVK004        KDWH02
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
     C     SWRD10        DOUNE     'Y'                                          RD.SW.WAREDET   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     *ZEROS        XDQOH
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C     K0028         READE(N)  WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0019                         Company number
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   END
     C*
     C     SWRD10        IFEQ      'Y'                                          RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0042        KTCO02
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WDITEM        KTIT04
     C     K0029         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C* FLDATR fl0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z2
     C* A003(C03) = WDCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0015        A03(Z2)
     C* A004(C03) = WDWHSE
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WK0019        A04(Z2)
     C* A005(C03) = WDITEM
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVEL     XDITEM        A05(Z2)
     C* IF %STS(D.WAREHED,F.ITMMAST)=*YES
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* FL0003 = ITIDESC
     C                   MOVE      WK0002        FL0003
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
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     *ZEROS        XDQOH
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
     C                   EXSR      S088                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Y3
     C* DOBLK D.WAREHED
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
     C                   MOVEA     '00'          *IN(5)
     C* I03 = I03+1
     C     Y3            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y3
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0002=2)|(FL0002=4)|(FL0002=5)
     C     FL0002        IFEQ      2
     C     FL0002        OREQ      4
     C     FL0002        OREQ      5
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* ** set keys from hidden key arrays.
     C* WDCOYNO = A003(I03)
     C                   MOVE      A03(Y3)       WK0015
     C* WDWHSE = A004(I03)
     C                   MOVE      A04(Y3)       WK0019
     C* WDITEM = A005(I03)
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     A05(Y3)       XDITEM
     C* ** Get record and any secondary records.
     C* GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S089
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
     C* IF FL0002=06
     C     FL0002        IFEQ      06
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* WDCOYNO = A003(I03)
     C                   MOVE      A03(Y3)       WK0015
     C* WDWHSE = A004(I03)
     C                   MOVE      A04(Y3)       WK0019
     C* WDITEM = A005(I03)
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     A05(Y3)       XDITEM
     C* SVK005 = A005(I03)
     C                   MOVE      A05(Y3)       SVK005
     C* GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S089
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
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
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR FL0002,'Record Not Found'
     C                   MOVEL     C0005         MSGDTA
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF FL0002=07
     C     FL0002        IFEQ      07
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* WDCOYNO = A003(I03)
     C                   MOVE      A03(Y3)       WK0015
     C* WDWHSE = A004(I03)
     C                   MOVE      A04(Y3)       WK0019
     C* WDITEM = A005(I03)
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     A05(Y3)       XDITEM
     C* SVK005 = A005(I03)
     C                   MOVE      A05(Y3)       SVK005
     C* GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S089
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
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
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR FL0002,'Record Not Found'
     C                   MOVEL     C0005         MSGDTA
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
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF FL0002=08
     C     FL0002        IFEQ      08
     C* MODE = FL0002
     C                   Z-ADD     FL0002        MODE
     C* WDCOYNO = A003(I03)
     C                   MOVE      A03(Y3)       WK0015
     C* WDWHSE = A004(I03)
     C                   MOVE      A04(Y3)       WK0019
     C* WDITEM = A005(I03)
     C                   MOVE      *BLANKS       XDITEM
     C                   MOVEL     A05(Y3)       XDITEM
     C* SVK005 = A005(I03)
     C                   MOVE      A05(Y3)       SVK005
     C* GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     C*
     C                   EXSR      S089
     C* IF %STS(D.WAREHED,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C* EXSCR SCmove
     C                   ADD       1             SP
     C                   MOVEL     'SC0003  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR003S1                             90
     C                   EXSR      S008
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
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR FL0002,'Record Not Found'
     C                   MOVEL     C0005         MSGDTA
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
     C                   MOVEA     '00'          *IN(5)
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
     C* FLDATR fl0002,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WAREDET,F.ITMMAST,*NE,SVK003,SVK004
     C*
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     SVK004        KDWH02
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
     C     SWRD10        DOUNE     'Y'                                          RD.SW.WAREDET   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     *ZEROS        XDQOH
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C     K0028         READE(N)  WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0019                         Company number
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   END
     C*
     C     SWRD10        IFEQ      'Y'                                          RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0042        KTCO02
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WDITEM        KTIT04
     C     K0029         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C* FLDATR fl0002,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0002  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0003  '    FLDSCR
     C                   EXSR      SATRIB
     C* C03 = C03+1
     C     Z2            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z2
     C* A003(C03) = WDCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0015        A03(Z2)
     C* A004(C03) = WDWHSE
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WK0019        A04(Z2)
     C* A005(C03) = WDITEM
     C                   MOVE      *BLANKS       A05(Z2)
     C                   MOVEL     XDITEM        A05(Z2)
     C* IF %STS(D.WAREHED,F.ITMMAST)=*YES
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* FL0003 = ITIDESC
     C                   MOVE      WK0002        FL0003
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
     C                   MOVEL     *BLANKS       XDITEM
     C                   MOVEL     *BLANKS       FL0003
     C                   Z-ADD     *ZEROS        XDQOH
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
     C                   EXSR      S088                                         RESET FP
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
     C* A006 = ' '
     C                   MOVEA     *BLANKS       A06
     C* A007 = ' '
     C                   MOVEA     *BLANKS       A07
     C* A008 = ' '
     C                   MOVEA     *BLANKS       A08
     C* A009 = ' '
     C                   MOVEA     *BLANKS       A09
     C* FLDATR fl0004,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WLOCITM1,*PV,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S090
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK006        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK007        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK008        KIIT03
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
     C     SWRD14        DOUNE     'Y'                                          RD.SW.WLOCITM1  WRIT
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0004
     C                   MOVEL     *BLANKS       XILOCN
     C                   MOVEL     *BLANKS       FL0010
     C                   Z-ADD     *ZEROS        WK0044
     C                   Z-ADD     *ZEROS        WK0043
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C     K0020         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0024                         Company number
     C                   MOVEL     *BLANK        HD0027                         Warehouse Number
     C                   MOVEL     *BLANK        HD0025                         Item Number
     C                   MOVEL     *BLANK        HD0026                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   END
     C*
     C     SWRD14        IFEQ      'Y'                                          RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0004,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z3
     C* A006(C05) = :0131
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WK0036        A06(Z3)
     C* A007(C05) = :0132
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      WK0045        A07(Z3)
     C* A008(C05) = :0133
     C                   MOVE      *BLANKS       A08(Z3)
     C                   MOVEL     WK0039        A08(Z3)
     C* A009(C05) = :0315
     C                   MOVE      *BLANKS       A09(Z3)
     C                   MOVE      XILOCN        A09(Z3)
     C* GETREC D.WAREHED,F.WARELOC,*EQ,:131,:132,:0315
     C*
     C                   EXSR      S053
     C* IF %sts(D.WAREHED,F.WARELOC)=*yes
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* FL0010 = %ljf(wldesc)
     C*  Left Justify field into result field
     C                   MOVEL     XLDESC        FL0010
     C* END                                                           *
     C                   END
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
     C                   Z-ADD     *ZEROS        FL0004
     C                   MOVEL     *BLANKS       XILOCN
     C                   MOVEL     *BLANKS       FL0010
     C                   Z-ADD     *ZEROS        WK0044
     C                   Z-ADD     *ZEROS        WK0043
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
     C                   EXSR      S092                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Y4
     C* DOBLK D.WAREHED
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
     C                   MOVEA     '00'          *IN(5)
     C* I05 = I05+1
     C     Y4            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y4
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0004=2)|(FL0004=4)|(FL0004=5)
     C     FL0004        IFEQ      2
     C     FL0004        OREQ      4
     C     FL0004        OREQ      5
     C* MODE = FL0004
     C                   Z-ADD     FL0004        MODE
     C* ** set keys from hidden key arrays.
     C* WICOYNO = A006(I05)
     C                   MOVE      A06(Y4)       WK0036
     C* WIWHSE = A007(I05)
     C                   MOVE      A07(Y4)       WK0045
     C* WIITEM = A008(I05)
     C                   MOVE      *BLANKS       WK0039
     C                   MOVEL     A08(Y4)       WK0039
     C* :0315 = A009(I05)
     C                   MOVE      A09(Y4)       XILOCN
     C* ** Get record and any secondary records.
     C* GETREC D.WAREHED,F.WLOCITM1,*EQ,:0131,:0132,:0133,:0315
     C*
     C                   EXSR      S093
     C* ** Display Screen.
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   UPDATE    SCR005S1                             90
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05ED
     C                   END
     C     RRN03         CHAIN     SCR005S1                           9091
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* FL0004 = 0
     C                   Z-ADD     *ZERO         FL0004
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0004<>0)&(UPDFLG=0)
     C     FL0004        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0004,'Invalid action choice'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0004  '    FLDNAM
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
     C                   MOVEA     '00'          *IN(5)
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
     C* A006 = ' '
     C                   MOVEA     *BLANKS       A06
     C* A007 = ' '
     C                   MOVEA     *BLANKS       A07
     C* A008 = ' '
     C                   MOVEA     *BLANKS       A08
     C* A009 = ' '
     C                   MOVEA     *BLANKS       A09
     C* FLDATR fl0004,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WLOCITM1,*NE,SVK006,SVK007,SVK008
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK006        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK007        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK008        KIIT03
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
     C     SWRD14        DOUNE     'Y'                                          RD.SW.WLOCITM1  WRIT
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0004
     C                   MOVEL     *BLANKS       XILOCN
     C                   MOVEL     *BLANKS       FL0010
     C                   Z-ADD     *ZEROS        WK0044
     C                   Z-ADD     *ZEROS        WK0043
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C     K0020         READE     WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0024                         Company number
     C                   MOVEL     *BLANK        HD0027                         Warehouse Number
     C                   MOVEL     *BLANK        HD0025                         Item Number
     C                   MOVEL     *BLANK        HD0026                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   END
     C*
     C     SWRD14        IFEQ      'Y'                                          RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0004,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0004  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z3
     C* A006(C05) = :0131
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WK0036        A06(Z3)
     C* A007(C05) = :0132
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      WK0045        A07(Z3)
     C* A008(C05) = :0133
     C                   MOVE      *BLANKS       A08(Z3)
     C                   MOVEL     WK0039        A08(Z3)
     C* A009(C05) = :0315
     C                   MOVE      *BLANKS       A09(Z3)
     C                   MOVE      XILOCN        A09(Z3)
     C* GETREC D.WAREHED,F.WARELOC,*EQ,:131,:132,:315
     C*
     C                   EXSR      S053
     C* IF %sts(D.WAREHED,F.WARELOC)=*yes
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* FL0010 = %ljf(wldesc)
     C*  Left Justify field into result field
     C                   MOVEL     XLDESC        FL0010
     C* END                                                           *
     C                   END
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
     C                   Z-ADD     *ZEROS        FL0004
     C                   MOVEL     *BLANKS       XILOCN
     C                   MOVEL     *BLANKS       FL0010
     C                   Z-ADD     *ZEROS        WK0044
     C                   Z-ADD     *ZEROS        WK0043
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
     C                   EXSR      S092                                         RESET FP
     C*                                                               *
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
     C* GETBLK D.WAREHED,F.WRITTYP,*PV,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S094
     C*
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     SVK010        KTCO03
     C                   MOVEL     *BLANK        KTWH04
     C                   MOVEL     SVK011        KTWH04
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     SVK012        KTIT05
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR007S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR007C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD16        DOUNE     'Y'                                          RD.SW.WRITTYP   WLOC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0013
     C                   Z-ADD     *ZEROS        XTTRPQ
     C                   Z-ADD     *ZEROS        XTTRPV
     C                   Z-ADD     *ZEROS        XTTRYQ
     C                   Z-ADD     *ZEROS        XTTRYV
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C     K0031         READE     WRITTYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC16                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0028                         Company number
     C                   MOVEL     *BLANK        HD0031                         Warehouse Number
     C                   MOVEL     *BLANK        HD0029                         Item Number
     C                   MOVEL     *BLANK        HD0030                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   END
     C*
     C     SWRD16        IFEQ      'Y'                                          RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,wttrnc
     C*
     C                   EXSR      S097
     C* IF %STS(d.imstrn,f.imstrn)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* FL0013 = %ljf(ttdesc)
     C*  Left Justify field into result field
     C                   MOVEL     WTDESC        FL0013
     C* END                                                           *
     C                   END
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0013
     C                   Z-ADD     *ZEROS        XTTRPQ
     C                   Z-ADD     *ZEROS        XTTRPV
     C                   Z-ADD     *ZEROS        XTTRYQ
     C                   Z-ADD     *ZEROS        XTTRYV
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
     C                   EXSR      S096                                         CHK EOF
     C*
     C     $S07BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S07FWD - SCRN SUB
     C*****************************************************************
     C     S07FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C07 = 0
     C                   Z-ADD     *ZERO         C07
     C* GETBLK D.WAREHED,F.WRITTYP,*NE,SVK010,SVK011,SVK012
     C*
     C*
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     SVK010        KTCO03
     C                   MOVEL     *BLANK        KTWH04
     C                   MOVEL     SVK011        KTWH04
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     SVK012        KTIT05
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR007S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR007C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD16        DOUNE     'Y'                                          RD.SW.WRITTYP   WLOC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0013
     C                   Z-ADD     *ZEROS        XTTRPQ
     C                   Z-ADD     *ZEROS        XTTRPV
     C                   Z-ADD     *ZEROS        XTTRYQ
     C                   Z-ADD     *ZEROS        XTTRYV
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C     K0031         READE     WRITTYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC16                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0028                         Company number
     C                   MOVEL     *BLANK        HD0031                         Warehouse Number
     C                   MOVEL     *BLANK        HD0029                         Item Number
     C                   MOVEL     *BLANK        HD0030                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   END
     C*
     C     SWRD16        IFEQ      'Y'                                          RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* C07 = C07+1
     C     C07           ADD       1             RN0052
     C                   Z-ADD     RN0052        C07
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,wttrnc
     C*
     C                   EXSR      S097
     C* IF %STS(d.imstrn,f.imstrn)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* FL0013 = %ljf(ttdesc)
     C*  Left Justify field into result field
     C                   MOVEL     WTDESC        FL0013
     C* END                                                           *
     C                   END
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
     C                   MOVEL     *BLANKS       XTTRNC
     C                   MOVEL     *BLANKS       FL0013
     C                   Z-ADD     *ZEROS        XTTRPQ
     C                   Z-ADD     *ZEROS        XTTRPV
     C                   Z-ADD     *ZEROS        XTTRYQ
     C                   Z-ADD     *ZEROS        XTTRYV
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
     C                   EXSR      S096                                         RESET FP
     C*                                                               *
     C* IF c07 = 0
     C     C07           IFEQ      *ZERO
     C* EXSUBR s07bkw
     C                   EXSR      S07BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S07FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S07FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - SCRN SUB
     C*****************************************************************
     C     S500          BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* FLDATR fl0023,*nd
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0023  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCMOVE  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0025,*nd
     C* GETBLK D.STOKMOV1,F.STOKMOV1,*NE,SVK010,SVK011,SVK012
     C*
     C*
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK010        KTCO01
     C                   MOVEL     *BLANK        KTWH02
     C                   MOVEL     SVK011        KTWH02
     C                   MOVEL     *BLANK        KTIT03
     C                   MOVEL     SVK012        KTIT03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     13            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR008S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR008C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN05
     C*
     C                   Z-ADD     1             XRN05                          Init Next RRN
     C                   Z-ADD     XRN05         SRN05
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS05
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.STOKMOV1
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   MOVEL     *BLANKS       FL0023
     C                   MOVEL     *BLANKS       XTLOCN
     C                   MOVEL     *BLANKS       FL0024
     C                   Z-ADD     *ZEROS        XTTQTY
     C                   MOVEL     *BLANKS       XTTREF
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0023         READE     STOKMOV1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.STOKMOV1
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HTWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HD0009                         Item Number
     C                   Z-ADD     *ZERO         HTDTTR                         Transaction Date
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKMOV1
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.STOKMOV1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0023,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0023  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCMOVE  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR fl0025,*ds
     C* GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C*
     C                   EXSR      S099
     C* *** Format the date
     C* SYDATI = STDTTR    ; Input date
     C                   Z-ADD     WTDTTR        RN0003
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S500
     C                   END
     C* FL0023 = SYDATO
     C                   MOVE      RN0004        FL0023
     C* IF %STS(d.imstrn,f.imstrn)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* FL0024 = %ljf(ttdesc)
     C*  Left Justify field into result field
     C                   MOVEL     WTDESC        FL0024
     C* END                                                           *
     C                   END
     C* FL0025 = wkqoh
     C                   Z-ADD     WKQOH         FL0025
     C* On hand calc reversed for from on hand
     C* IF ttonhc = 'A'
     C     WTONHC        IFEQ      'A'
     C* WKQOH = wkqoh - sttqty
     C     WKQOH         SUB       XTTQTY        RN0052
     C                   Z-ADD     RN0052        WKQOH
     C* END                                                           *
     C                   END
     C* IF ttonhc = 'S' | ttonhc = 'R'
     C     WTONHC        IFEQ      'S'
     C     WTONHC        OREQ      'R'
     C* WKQOH = wkqoh + sttqty
     C     WKQOH         ADD       XTTQTY        RN0052
     C                   Z-ADD     RN0052        WKQOH
     C* END                                                           *
     C                   END
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN05
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR008S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN05         NXTRRN
     C                   MOVEL     *BLANKS       FL0023
     C                   MOVEL     *BLANKS       XTLOCN
     C                   MOVEL     *BLANKS       FL0024
     C                   Z-ADD     *ZEROS        XTTQTY
     C                   MOVEL     *BLANKS       XTTREF
     C                   MOVEA     INS05         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR008S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR008S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR008S1                             90
     C                   MOVEA     INS05         *IN
     C                   END
     C     RRN05         IFGT      SRN05
     C                   Z-ADD     SRN05         RRN05
     C                   END
     C                   EXSR      S098                                         CHK EOF
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* S09BKW - SCRN SUB
     C*****************************************************************
     C     S09BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z4
     C* A014 = ' '
     C                   MOVEA     *BLANKS       A10
     C* A015 = ' '
     C                   MOVEA     *BLANKS       A11
     C* A016 = ' '
     C                   MOVEA     *BLANKS       A12
     C* FLDATR fl0006,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WARELOC,*PV,SVK014,SVK015
     C*
     C                   EXSR      S100
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK014        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK015        KLWH02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     10            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR009S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR009C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN06
     C*
     C                   Z-ADD     1             XRN06                          Init Next RRN
     C                   Z-ADD     XRN06         SRN06
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS06
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD15        DOUNE     'Y'                                          RD.SW.WARELOC   ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0006
     C                   MOVEL     *BLANKS       XLLOCN
     C                   MOVEL     *BLANKS       XLDESC
     C                   MOVEL     *BLANKS       XLPCKR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C     K0034         READE(N)  WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0021                         Company number
     C                   MOVEL     *BLANK        HLWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HLLOCN                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   END
     C*
     C     SWRD15        IFEQ      'Y'                                          RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0006,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* C09 = C09+1
     C     Z4            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z4
     C* A014(C09) = WLCOYNO
     C                   MOVE      *BLANKS       A10(Z4)
     C                   MOVE      WK0024        A10(Z4)
     C* A015(C09) = WLWHSE
     C                   MOVE      *BLANKS       A11(Z4)
     C                   MOVE      WK0027        A11(Z4)
     C* A016(C09) = WLLOCN
     C                   MOVE      *BLANKS       A12(Z4)
     C                   MOVE      XLLOCN        A12(Z4)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN06
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN06                          INCREMENT RRN
     C                   WRITE     SCR009S1                             90
     C                   ADD       1             XRN06                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN06         NXTRRN
     C                   Z-ADD     *ZEROS        FL0006
     C                   MOVEL     *BLANKS       XLLOCN
     C                   MOVEL     *BLANKS       XLDESC
     C                   MOVEL     *BLANKS       XLPCKR
     C                   MOVEA     INS06         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN06                          INCREMENT RRN
     C                   WRITE     SCR009S1                             90
     C                   ADD       1             XRN06                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR009S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR009S1                             90
     C                   MOVEA     INS06         *IN
     C                   END
     C     RRN06         IFGT      SRN06
     C                   Z-ADD     SRN06         RRN06
     C                   END
     C                   EXSR      S102                                         CHK EOF
     C*
     C     $S09BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S09EDT - SCRN SUB
     C*****************************************************************
     C     S09EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I09 = 0
     C                   Z-ADD     *ZERO         Y5
     C* DOBLK D.WAREHED
     C*
     C                   Z-ADD     RRN06         SRN06                          Save RRN
     C                   Z-ADD     1             RRN06                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS06
     C     SRN06         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR009S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C* I09 = I09+1
     C     Y5            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y5
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0006=2)|(FL0006=4)|(FL0006=5)
     C     FL0006        IFEQ      2
     C     FL0006        OREQ      4
     C     FL0006        OREQ      5
     C* MODE = FL0006
     C                   Z-ADD     FL0006        MODE
     C* ** set keys from hidden key arrays.
     C* WLCOYNO = A014(I09)
     C                   MOVE      A10(Y5)       WK0024
     C* WLWHSE = A015(I09)
     C                   MOVE      A11(Y5)       WK0027
     C* WLLOCN = A016(I09)
     C                   MOVE      A12(Y5)       XLLOCN
     C* ** Get record and any secondary records.
     C* GETREC D.WAREHED,F.WARELOC,*EQ,WLCOYNO,WLWHSE,WLLOCN
     C*
     C                   EXSR      S103
     C* ** Display Screen.
     C* EXSCR SC0010
     C                   ADD       1             SP
     C                   MOVEL     'SC0009  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN07
     C                   UPDATE    SCR009S1                             90
     C                   EXSR      S010
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S09ED
     C                   END
     C     RRN06         CHAIN     SCR009S1                           9091
     C                   MOVEA     IN07          *IN
     C                   MOVE      '1'           *IN79
     C* FL0006 = 0
     C                   Z-ADD     *ZERO         FL0006
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Process any optional action codes.
     C*    1. Set keys from hidden key arrays.
     C*    2. Get record and any secondary records.
     C*    3. Display Screen.
     C*                                                               *
     C* IF FL0006=06
     C     FL0006        IFEQ      06
     C* MODE = FL0006
     C                   Z-ADD     FL0006        MODE
     C* WLCOYNO = A014(I09)
     C                   MOVE      A10(Y5)       WK0024
     C* WLWHSE = A015(I09)
     C                   MOVE      A11(Y5)       WK0027
     C* WLLOCN = A016(I09)
     C                   MOVE      A12(Y5)       XLLOCN
     C* GETREC D.WAREHED,F.WARELOC,*EQ,WLCOYNO,WLWHSE,WLLOCN
     C*
     C                   EXSR      S103
     C* IF %STS(D.WAREHED,F.WARELOC)=*YES
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C* EXSCR SC0011
     C                   ADD       1             SP
     C                   MOVEL     'SC0009  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN07
     C                   UPDATE    SCR009S1                             90
     C                   EXSR      S011
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S09ED
     C                   END
     C     RRN06         CHAIN     SCR009S1                           9091
     C                   MOVEA     IN07          *IN
     C                   MOVE      '1'           *IN79
     C* FL0006 = 0
     C                   Z-ADD     *ZERO         FL0006
     C* ELSE                                                          *
     C                   ELSE
     C* DSPERR FL0006,'Record Not Found'
     C                   MOVEL     C0005         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
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
     C* IF (FL0006<>0)&(UPDFLG=0)
     C     FL0006        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0006,'Invalid action choice'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR009S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '0'           *IN(5)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN06         RRN06
     C                   MOVEA     INS06         *IN
     C*
     C*
     C*
     C     $S09ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S09FWD - SCRN SUB
     C*****************************************************************
     C     S09FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z4
     C* A014 = ' '
     C                   MOVEA     *BLANKS       A10
     C* A015 = ' '
     C                   MOVEA     *BLANKS       A11
     C* A016 = ' '
     C                   MOVEA     *BLANKS       A12
     C* FLDATR fl0006,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WARELOC,*NE,SVK014,SVK015
     C*
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK014        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK015        KLWH02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     10            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR009S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR009C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN06
     C*
     C                   Z-ADD     1             XRN06                          Init Next RRN
     C                   Z-ADD     XRN06         SRN06
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS06
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD15        DOUNE     'Y'                                          RD.SW.WARELOC   ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0006
     C                   MOVEL     *BLANKS       XLLOCN
     C                   MOVEL     *BLANKS       XLDESC
     C                   MOVEL     *BLANKS       XLPCKR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C     K0034         READE(N)  WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0021                         Company number
     C                   MOVEL     *BLANK        HLWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HLLOCN                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   END
     C*
     C     SWRD15        IFEQ      'Y'                                          RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0006,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0006  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* C09 = C09+1
     C     Z4            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z4
     C* A014(C09) = WLCOYNO
     C                   MOVE      *BLANKS       A10(Z4)
     C                   MOVE      WK0024        A10(Z4)
     C* A015(C09) = WLWHSE
     C                   MOVE      *BLANKS       A11(Z4)
     C                   MOVE      WK0027        A11(Z4)
     C* A016(C09) = WLLOCN
     C                   MOVE      *BLANKS       A12(Z4)
     C                   MOVE      XLLOCN        A12(Z4)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN06
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN06                          INCREMENT RRN
     C                   WRITE     SCR009S1                             90
     C                   ADD       1             XRN06                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN06         NXTRRN
     C                   Z-ADD     *ZEROS        FL0006
     C                   MOVEL     *BLANKS       XLLOCN
     C                   MOVEL     *BLANKS       XLDESC
     C                   MOVEL     *BLANKS       XLPCKR
     C                   MOVEA     INS06         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN06                          INCREMENT RRN
     C                   WRITE     SCR009S1                             90
     C                   ADD       1             XRN06                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR009S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR009S1                             90
     C                   MOVEA     INS06         *IN
     C                   END
     C     RRN06         IFGT      SRN06
     C                   Z-ADD     SRN06         RRN06
     C                   END
     C                   EXSR      S102                                         RESET FP
     C* IF c09 = 0
     C     Z4            IFEQ      *ZERO
     C* EXSUBR s09bkw
     C                   EXSR      S09BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S09FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S09FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S11BKW - SCRN SUB
     C*****************************************************************
     C     S11BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C11 = 0
     C                   Z-ADD     *ZERO         Z5
     C* A017 = ' '
     C                   MOVEA     *BLANKS       A13
     C* A018 = ' '
     C                   MOVEA     *BLANKS       A14
     C* A019 = ' '
     C                   MOVEA     *BLANKS       A15
     C* A020 = ' '
     C                   MOVEA     *BLANKS       A16
     C* FLDATR fl0007,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0011  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WLOCITM,*PV,SVK017,SVK018,SVK019
     C*
     C                   EXSR      S104
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK017        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK018        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     SVK019        KILO03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR011S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR011C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN07
     C*
     C                   Z-ADD     1             XRN07                          Init Next RRN
     C                   Z-ADD     XRN07         SRN07
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS07
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD17        DOUNE     'Y'                                          RD.SW.WLOCITM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0007
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       FL0016
     C                   Z-ADD     *ZEROS        XIQOH
     C                   Z-ADD     *ZEROS        XIQAL
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0021         READE(N)  WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0023                         Company number
     C                   MOVEL     *BLANK        HIWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HILOCN                         Location
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* FLDATR fl0007,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0011  '    FLDSCR
     C                   EXSR      SATRIB
     C* C11 = C11+1
     C     Z5            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z5
     C* A017(C11) = :0128
     C                   MOVE      *BLANKS       A13(Z5)
     C                   MOVE      WK0031        A13(Z5)
     C* A018(C11) = :0129
     C                   MOVE      *BLANKS       A14(Z5)
     C                   MOVE      WK0035        A14(Z5)
     C* A019(C11) = :0316
     C                   MOVE      *BLANKS       A15(Z5)
     C                   MOVE      WK0034        A15(Z5)
     C* A020(C11) = :0066
     C                   MOVE      *BLANKS       A16(Z5)
     C                   MOVEL     XIITEM        A16(Z5)
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,:66
     C*
     C                   EXSR      S073
     C* IF %sts(d.warehed,f.itmmast)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* FL0016 = %ljf(itidesc)
     C*  Left Justify field into result field
     C                   MOVEL     WK0002        FL0016
     C* END                                                           *
     C                   END
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN07
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN07                          INCREMENT RRN
     C                   WRITE     SCR011S1                             90
     C                   ADD       1             XRN07                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN07         NXTRRN
     C                   Z-ADD     *ZEROS        FL0007
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       FL0016
     C                   Z-ADD     *ZEROS        XIQOH
     C                   Z-ADD     *ZEROS        XIQAL
     C                   MOVEA     INS07         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN07                          INCREMENT RRN
     C                   WRITE     SCR011S1                             90
     C                   ADD       1             XRN07                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR011S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR011S1                             90
     C                   MOVEA     INS07         *IN
     C                   END
     C     RRN07         IFGT      SRN07
     C                   Z-ADD     SRN07         RRN07
     C                   END
     C                   EXSR      S106                                         CHK EOF
     C*
     C     $S11BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S11EDT - SCRN SUB
     C*****************************************************************
     C     S11EDT        BEGSR
     C*
     C* ** Process Maintenance on Detail Panel (MB)
     C* **   1. Check for any selected records, If record
     C* **      selected, display detail panel.
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I11 = 0
     C                   Z-ADD     *ZERO         Y6
     C* DOBLK D.WAREHED
     C*
     C                   Z-ADD     RRN07         SRN07                          Save RRN
     C                   Z-ADD     1             RRN07                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS07
     C     SRN07         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR011S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '00'          *IN(5)
     C* I11 = I11+1
     C     Y6            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y6
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0007=2)|(FL0007=4)|(FL0007=5)
     C     FL0007        IFEQ      2
     C     FL0007        OREQ      4
     C     FL0007        OREQ      5
     C* MODE = FL0007
     C                   Z-ADD     FL0007        MODE
     C* ** set keys from hidden key arrays.
     C* :0128 = A017(I11)
     C                   MOVE      A13(Y6)       WK0031
     C* :0129 = A018(I11)
     C                   MOVE      A14(Y6)       WK0035
     C* :0316 = A019(I11)
     C                   MOVE      A15(Y6)       WK0034
     C* :0066 = A020(I11)
     C                   MOVE      *BLANKS       XIITEM
     C                   MOVEL     A16(Y6)       XIITEM
     C* ** Get record and any secondary records.
     C* GETREC D.WAREHED,F.WLOCITM,*EQ,:0128,:0129,:0316,:0066
     C*
     C                   EXSR      S107
     C* ** Display Screen.
     C* EXSCR SC0012
     C                   ADD       1             SP
     C                   MOVEL     'SC0011  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN08
     C                   UPDATE    SCR011S1                             90
     C                   EXSR      S012
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S11ED
     C                   END
     C     RRN07         CHAIN     SCR011S1                           9091
     C                   MOVEA     IN08          *IN
     C                   MOVE      '1'           *IN79
     C* FL0007 = 0
     C                   Z-ADD     *ZERO         FL0007
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0007<>0)&(UPDFLG=0)
     C     FL0007        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0007,'Invalid action choice'
     C                   MOVEL     C0006         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0011  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR011S1                             90
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C                   MOVEA     '00'          *IN(5)
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   END
     C*
     C                   Z-ADD     SRN07         RRN07
     C                   MOVEA     INS07         *IN
     C*
     C*
     C*
     C     $S11ED        ENDSR
     C/EJECT
     C*****************************************************************
     C* S11FWD - SCRN SUB
     C*****************************************************************
     C     S11FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C11 = 0
     C                   Z-ADD     *ZERO         Z5
     C* A017 = ' '
     C                   MOVEA     *BLANKS       A13
     C* A018 = ' '
     C                   MOVEA     *BLANKS       A14
     C* A019 = ' '
     C                   MOVEA     *BLANKS       A15
     C* A020 = ' '
     C                   MOVEA     *BLANKS       A16
     C* FLDATR fl0007,*pr,*nd
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0011  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.WAREHED,F.WLOCITM,*NE,SVK017,SVK018,SVK019
     C*
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK017        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK018        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     SVK019        KILO03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     9             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR011S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR011C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN07
     C*
     C                   Z-ADD     1             XRN07                          Init Next RRN
     C                   Z-ADD     XRN07         SRN07
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS07
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD17        DOUNE     'Y'                                          RD.SW.WLOCITM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0007
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       FL0016
     C                   Z-ADD     *ZEROS        XIQOH
     C                   Z-ADD     *ZEROS        XIQAL
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0021         READE(N)  WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0023                         Company number
     C                   MOVEL     *BLANK        HIWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HILOCN                         Location
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR fl0007,*ds
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0007  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0011  '    FLDSCR
     C                   EXSR      SATRIB
     C* C11 = C11+1
     C     Z5            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z5
     C* A017(C11) = :0128
     C                   MOVE      *BLANKS       A13(Z5)
     C                   MOVE      WK0031        A13(Z5)
     C* A018(C11) = :0129
     C                   MOVE      *BLANKS       A14(Z5)
     C                   MOVE      WK0035        A14(Z5)
     C* A019(C11) = :0316
     C                   MOVE      *BLANKS       A15(Z5)
     C                   MOVE      WK0034        A15(Z5)
     C* A020(C11) = :0066
     C                   MOVE      *BLANKS       A16(Z5)
     C                   MOVEL     XIITEM        A16(Z5)
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,:66
     C*
     C                   EXSR      S073
     C* IF %sts(d.warehed,f.itmmast)=*yes
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C* FL0016 = %ljf(itidesc)
     C*  Left Justify field into result field
     C                   MOVEL     WK0002        FL0016
     C* END                                                           *
     C                   END
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN07
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN07                          INCREMENT RRN
     C                   WRITE     SCR011S1                             90
     C                   ADD       1             XRN07                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN07         NXTRRN
     C                   Z-ADD     *ZEROS        FL0007
     C                   MOVEL     *BLANKS       XIITEM
     C                   MOVEL     *BLANKS       FL0016
     C                   Z-ADD     *ZEROS        XIQOH
     C                   Z-ADD     *ZEROS        XIQAL
     C                   MOVEA     INS07         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN07                          INCREMENT RRN
     C                   WRITE     SCR011S1                             90
     C                   ADD       1             XRN07                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR011S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR011S1                             90
     C                   MOVEA     INS07         *IN
     C                   END
     C     RRN07         IFGT      SRN07
     C                   Z-ADD     SRN07         RRN07
     C                   END
     C                   EXSR      S106                                         RESET FP
     C*                                                               *
     C* IF c11 = 0
     C     Z5            IFEQ      *ZERO
     C* EXSUBR s11bkw
     C                   EXSR      S11BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S11FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S11FW        ENDSR
     C/EJECT
     C*****************************************************************
     C* S13ABR - SCRN SUB
     C*****************************************************************
     C     S13ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.ITMMAST,SVK021,SVK13
     C*
     C                   EXSR      S108
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.ITMMAST,*PV,SVK021
     C*
     C                   EXSR      S109
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.ITMMAST)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* GETREC D.WAREHED,F.ITMMAST,*PV,SVK021
     C*
     C                   EXSR      S109
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S13ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S13AB
     C                   END
     C*
     C     $S13AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S501 - SCRN SUB
     C*****************************************************************
     C     S501          BEGSR
     C*
     C* ** Array backwards read.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.wareloc,SVK021,whwhse,SVKloc
     C*
     C                   EXSR      S111
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.wareloc,*PV,SVK021,whwhse
     C*
     C                   EXSR      S112
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.wareloc)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* GETREC D.WAREHED,F.wareloc,*PV,SVK021,whwhse
     C*
     C                   EXSR      S112
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S507
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S501
     C                   END
     C*
     C     $S501         ENDSR
     C/EJECT
     C*****************************************************************
     C* S502 - SCRN SUB
     C*****************************************************************
     C     S502          BEGSR
     C*
     C* ** Array backwards read.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.waredet,SVK021,whwhse,SVK13
     C*
     C                   EXSR      S114
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.waredet,*PV,SVK021,whwhse
     C*
     C                   EXSR      S115
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.waredet)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* GETREC D.WAREHED,F.waredet,*PV,SVK021,whwhse
     C*
     C                   EXSR      S115
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S508
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S502
     C                   END
     C*
     C     $S502         ENDSR
     C/EJECT
     C*****************************************************************
     C* S503 - SCRN SUB
     C*****************************************************************
     C     S503          BEGSR
     C*
     C* ** Array backwards read.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.ITMMAST1,F.ITMMAST1,SVK021,svkial,SVK13
     C*
     C                   EXSR      S117
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.ITMMAST1,F.ITMMAST1,*PV,SVK021
     C*
     C                   EXSR      S118
     C* DOW (C13<S13CNT)&%STS(D.ITMMAST1,F.ITMMAST1)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* GETREC D.ITMMAST1,F.ITMMAST1,*PV,SVK021
     C*
     C                   EXSR      S118
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S509
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S503
     C                   END
     C*
     C     $S503         ENDSR
     C/EJECT
     C*****************************************************************
     C* S13AFR - SCRN SUB
     C*****************************************************************
     C     S13AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.ITMMAST,SVK021,SVK13
     C*
     C                   EXSR      S108
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S13ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S13AF
     C                   END
     C*
     C     $S13AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S504 - SCRN SUB
     C*****************************************************************
     C     S504          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.wareloc,SVK021,whwhse,SVKloc
     C*
     C                   EXSR      S111
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S507
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S504
     C                   END
     C*
     C     $S504         ENDSR
     C/EJECT
     C*****************************************************************
     C* S505 - SCRN SUB
     C*****************************************************************
     C     S505          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.waredet,SVK021,whwhse,SVK13
     C*
     C                   EXSR      S114
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S508
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S505
     C                   END
     C*
     C     $S505         ENDSR
     C/EJECT
     C*****************************************************************
     C* S506 - SCRN SUB
     C*****************************************************************
     C     S506          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.itmmast1,F.ITMMAST1,SVK021,svkial,SVK13
     C*
     C                   EXSR      S117
     C* ** Load arrays from this point.
     C* EXSUBR S13ALD
     C                   EXSR      S509
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S506
     C                   END
     C*
     C     $S506         ENDSR
     C/EJECT
     C*****************************************************************
     C* S13ALD - SCRN SUB
     C*****************************************************************
     C     S13ALD        BEGSR
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
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C13<S13CNT
     C     Z6            DOWLT     S13CNT
     C* C13 = C13+1
     C     Z6            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z6
     C* FLDATR T01(C13),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0013  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.WAREHED,F.ITMMAST,*NE,SVK021
     C*
     C                   EXSR      S120
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.ITMMAST)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* ** Unprotect select field.
     C* FLDATR T01(C13),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0013  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C13) = WAREHED.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       B01(Z6)
     C                   MOVEL     WK0003        B01(Z6)
     C* ** load screen array.
     C* T02(C13) = WAREHED.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       T02(Z6)
     C                   MOVE      WK0003        T02(Z6)
     C* T03(C13) = WAREHED.ITMMAST.ITIDESC
     C                   MOVE      *BLANKS       T03(Z6)
     C                   MOVE      WK0002        T03(Z6)
     C* ** Save first record on screen.
     C* IF C13=1
     C     Z6            IFEQ      1
     C* FST13 = B01(C13)
     C                   MOVE      B01(Z6)       FST13
     C* END                                                           *
     C                   END
     C* IF C13<S13CNT
     C     Z6            IFLT      S13CNT
     C* GETREC D.WAREHED,F.ITMMAST,*NE,SVK021
     C*
     C                   EXSR      S120
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS02         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C13>0
     C     Z6            IFGT      *ZERO
     C* LST13 = B01(C13)
     C                   MOVE      B01(Z6)       LST13
     C* END                                                           *
     C                   END
     C*
     C     $S13AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S507 - SCRN SUB
     C*****************************************************************
     C     S507          BEGSR
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
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C13<S13CNT
     C     Z6            DOWLT     S13CNT
     C* C13 = C13+1
     C     Z6            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z6
     C* FLDATR T01(C13),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0018  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.WAREHED,F.wareloc,*NE,SVK021,whwhse
     C*
     C                   EXSR      S122
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.wareloc)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* ** Unprotect select field.
     C* FLDATR T01(C13),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0018  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C13) = %ljf(WAREHED.wareloc.wllocn)
     C*  Left Justify field into result field
     C                   MOVEL     XLLOCN        B01(Z6)
     C* ** load screen array.
     C* T02(C13) = %ljf(WAREHED.wareloc.wllocn)
     C*  Left Justify field into result field
     C                   MOVEL     XLLOCN        T02(Z6)
     C* T03(C13) = WAREHED.wareloc.wldesc
     C                   MOVE      *BLANKS       T03(Z6)
     C                   MOVE      XLDESC        T03(Z6)
     C* ** Save first record on screen.
     C* IF C13=1
     C     Z6            IFEQ      1
     C* FSTLOC = %ljf(b01(C13))
     C*  Left Justify field into result field
     C                   MOVEL     B01(Z6)       FSTLOC
     C* END                                                           *
     C                   END
     C* IF C13<S13CNT
     C     Z6            IFLT      S13CNT
     C* GETREC D.WAREHED,F.wareloc,*NE,SVK021,whwhse
     C*
     C                   EXSR      S122
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS15         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C13>0
     C     Z6            IFGT      *ZERO
     C* LSTLOC = %ljf(B01(C13))
     C*  Left Justify field into result field
     C                   MOVEL     B01(Z6)       LSTLOC
     C* END                                                           *
     C                   END
     C*
     C     $S507         ENDSR
     C/EJECT
     C*****************************************************************
     C* S508 - SCRN SUB
     C*****************************************************************
     C     S508          BEGSR
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
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C13<S13CNT
     C     Z6            DOWLT     S13CNT
     C* C13 = C13+1
     C     Z6            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z6
     C* FLDATR T01(C13),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0019  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.WAREHED,F.waredet,*NE,SVK021,whwhse
     C*
     C                   EXSR      S124
     C* DOW (C13<S13CNT)&%STS(D.WAREHED,F.waredet)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* ** Unprotect select field.
     C* FLDATR T01(C13),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0019  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C13) = WAREHED.waredet.wditem
     C                   MOVE      *BLANKS       B01(Z6)
     C                   MOVEL     XDITEM        B01(Z6)
     C* ** load screen array.
     C* T02(C13) = WAREHED.waredet.wditem
     C                   MOVE      *BLANKS       T02(Z6)
     C                   MOVE      XDITEM        T02(Z6)
     C* GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     C*
     C                   EXSR      S049
     C* T03(C13) = WAREHED.itmmast.itidesc
     C                   MOVE      *BLANKS       T03(Z6)
     C                   MOVE      WK0002        T03(Z6)
     C* ** Save first record on screen.
     C* IF C13=1
     C     Z6            IFEQ      1
     C* FST13 = b01(C13)
     C                   MOVE      B01(Z6)       FST13
     C* END                                                           *
     C                   END
     C* IF C13<S13CNT
     C     Z6            IFLT      S13CNT
     C* GETREC D.WAREHED,F.waredet,*NE,SVK021,whwhse
     C*
     C                   EXSR      S124
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS10         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C13>0
     C     Z6            IFGT      *ZERO
     C* LST13 = B01(C13)
     C                   MOVE      B01(Z6)       LST13
     C* END                                                           *
     C                   END
     C*
     C     $S508         ENDSR
     C/EJECT
     C*****************************************************************
     C* S509 - SCRN SUB
     C*****************************************************************
     C     S509          BEGSR
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
     C* TAL = ' '
     C                   MOVEA     *BLANKS       TAL
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C13<S13CNT
     C     Z6            DOWLT     S13CNT
     C* C13 = C13+1
     C     Z6            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z6
     C* FLDATR T01(C13),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCIALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C13 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.ITMMAST1,F.ITMMAST1,*NE,SVK021
     C*
     C                   EXSR      S126
     C* DOW (C13<S13CNT)&%STS(D.ITMMAST1,F.ITMMAST1)=*YES
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C13 = C13+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* ** Unprotect select field.
     C* FLDATR T01(C13),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCIALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C13) = ITMMAST1.ITMMAST1.ITITEM
     C                   MOVE      *BLANKS       B01(Z6)
     C                   MOVEL     WK0006        B01(Z6)
     C* ** load screen array.
     C* T02(C13) = ITMMAST1.ITMMAST1.ITITEM
     C                   MOVE      *BLANKS       T02(Z6)
     C                   MOVE      WK0006        T02(Z6)
     C* T03(C13) = ITMMAST1.ITMMAST1.ITIDESC
     C                   MOVE      *BLANKS       T03(Z6)
     C                   MOVE      WK0005        T03(Z6)
     C* TAL(C13) = ITMMAST1.ITMMAST1.ITalpha
     C                   MOVE      *BLANKS       TAL(Z6)
     C                   MOVE      WK0004        TAL(Z6)
     C* ** Save first record on screen.
     C* IF C13=1
     C     Z6            IFEQ      1
     C* FST13 = B01(C13)
     C                   MOVE      B01(Z6)       FST13
     C* FSTIAL = tal(C13)
     C                   MOVE      TAL(Z6)       FSTIAL
     C* END                                                           *
     C                   END
     C* IF C13<S13CNT
     C     Z6            IFLT      S13CNT
     C* GETREC D.ITMMAST1,F.ITMMAST1,*NE,SVK021
     C*
     C                   EXSR      S126
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S13CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C13>0
     C     Z6            IFGT      *ZERO
     C* LST13 = B01(C13)
     C                   MOVE      B01(Z6)       LST13
     C* LSTIAL = tal(C13)
     C                   MOVE      TAL(Z6)       LSTIAL
     C* END                                                           *
     C                   END
     C*
     C     $S509         ENDSR
     C/EJECT
     C*****************************************************************
     C* S14ABR - SCRN SUB
     C*****************************************************************
     C     S14ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C14 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.STOVGP,SVK023,SVK14
     C*
     C                   EXSR      S128
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.STOVGP,*PV,SVK023
     C*
     C                   EXSR      S129
     C* DOW (C14<S14CNT)&%STS(D.WAREHED,F.STOVGP)=*YES
     C     Z7            IFLT      S14CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C14 = C14+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* GETREC D.WAREHED,F.STOVGP,*PV,SVK023
     C*
     C                   EXSR      S129
     C* END                                                           *
     C     Z7            IFLT      S14CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S14ALD
     C                   EXSR      S14ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S14AB
     C                   END
     C*
     C     $S14AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S14AFR - SCRN SUB
     C*****************************************************************
     C     S14AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.STOVGP,SVK023,SVK14
     C*
     C                   EXSR      S128
     C* ** Load arrays from this point.
     C* EXSUBR S14ALD
     C                   EXSR      S14ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S14AF
     C                   END
     C*
     C     $S14AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S14ALD - SCRN SUB
     C*****************************************************************
     C     S14ALD        BEGSR
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
     C* C14 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** protect select field
     C* DOW C14<S14CNT
     C     Z7            DOWLT     S14CNT
     C* C14 = C14+1
     C     Z7            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z7
     C* FLDATR T04(C14),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0014  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C14 = 0
     C                   Z-ADD     *ZERO         Z7
     C* GETREC D.WAREHED,F.STOVGP,*NE,SVK023
     C*
     C                   EXSR      S131
     C* DOW (C14<S14CNT)&%STS(D.WAREHED,F.STOVGP)=*YES
     C     Z7            IFLT      S14CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C14 = C14+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* ** Unprotect select field.
     C* FLDATR T04(C14),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0014  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C14) = WAREHED.STOVGP.TGSTOG
     C                   MOVE      *BLANKS       B02(Z7)
     C                   MOVE      WGSTOG        B02(Z7)
     C* ** load screen array.
     C* T05(C14) = WAREHED.STOVGP.TGSTOG
     C                   MOVE      *BLANKS       T05(Z7)
     C                   MOVE      WGSTOG        T05(Z7)
     C* T06(C14) = WAREHED.STOVGP.TGDESC
     C                   MOVE      *BLANKS       T06(Z7)
     C                   MOVE      XGDESC        T06(Z7)
     C* ** Save first record on screen.
     C* IF C14=1
     C     Z7            IFEQ      1
     C* FST14 = B02(C14)
     C                   MOVE      B02(Z7)       FST14
     C* END                                                           *
     C                   END
     C* IF C14<S14CNT
     C     Z7            IFLT      S14CNT
     C* GETREC D.WAREHED,F.STOVGP,*NE,SVK023
     C*
     C                   EXSR      S131
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z7            IFLT      S14CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS11         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C14>0
     C     Z7            IFGT      *ZERO
     C* LST14 = B02(C14)
     C                   MOVE      B02(Z7)       LST14
     C* END                                                           *
     C                   END
     C*
     C     $S14AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S15ABR - SCRN SUB
     C*****************************************************************
     C     S15ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C*
     C                   EXSR      S133
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C*
     C                   EXSR      S134
     C* DOW (C15<S15CNT)&%STS(D.WAREHED,F.SUPLIER)=*YES
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C*
     C                   EXSR      S134
     C* END                                                           *
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
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
     C* S510 - SCRN SUB
     C*****************************************************************
     C     S510          BEGSR
     C*
     C* ** Array backwards read.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** Set pointer to first record on screen.
     C* SETLL D.SUPLIER1,F.SUPLIER1,SVK025,svkial,SVK026,SVK15
     C*
     C                   EXSR      S136
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.SUPLIER1,F.SUPLIER1,*PV,SVK025
     C*
     C                   EXSR      S137
     C* DOW (C15<S15CNT)&%STS(D.SUPLIER1,F.SUPLIER1)=*YES
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* GETREC D.SUPLIER1,F.SUPLIER1,*PV,SVK025
     C*
     C                   EXSR      S137
     C* END                                                           *
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S512
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S510
     C                   END
     C*
     C     $S510         ENDSR
     C/EJECT
     C*****************************************************************
     C* S15AFR - SCRN SUB
     C*****************************************************************
     C     S15AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C*
     C                   EXSR      S133
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
     C* S511 - SCRN SUB
     C*****************************************************************
     C     S511          BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.SUPLIER1,F.SUPLIER1,SVK025,svkial,SVK026,SVK15
     C*
     C                   EXSR      S136
     C* ** Load arrays from this point.
     C* EXSUBR S15ALD
     C                   EXSR      S512
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S511
     C                   END
     C*
     C     $S511         ENDSR
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
     C* B03 = ' '
     C                   MOVEA     *BLANKS       B03
     C* T08 = ' '
     C                   MOVEA     *BLANKS       T08
     C* T09 = ' '
     C                   MOVEA     *BLANKS       T09
     C* T10 = ' '
     C                   MOVEA     *BLANKS       T10
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** protect select field
     C* DOW C15<S15CNT
     C     Z8            DOWLT     S15CNT
     C* C15 = C15+1
     C     Z8            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z8
     C* FLDATR T07(C15),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0015  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C*
     C                   EXSR      S139
     C* DOW (C15<S15CNT)&%STS(D.WAREHED,F.SUPLIER)=*YES
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* ** Unprotect select field.
     C* FLDATR T07(C15),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0015  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B03(C15) = WAREHED.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       B03(Z8)
     C                   MOVE      WK0010        B03(Z8)
     C* ** load screen array.
     C* T08(C15) = WAREHED.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       T08(Z8)
     C                   MOVE      WK0010        T08(Z8)
     C* T09(C15) = WAREHED.SUPLIER.SUBRNBR
     C                   MOVE      *BLANKS       T09(Z8)
     C                   MOVE      WK0008        T09(Z8)
     C* T10(C15) = WAREHED.SUPLIER.SUNAME
     C                   MOVE      *BLANKS       T10(Z8)
     C                   MOVE      XUNAME        T10(Z8)
     C* ** Save first record on screen.
     C* IF C15=1
     C     Z8            IFEQ      1
     C* FST026 = B03(C15)
     C                   MOVE      B03(Z8)       FST026
     C* FST15 = t09(C15)
     C                   MOVE      T09(Z8)       FST15
     C* END                                                           *
     C                   END
     C* IF C15<S15CNT
     C     Z8            IFLT      S15CNT
     C* GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C*
     C                   EXSR      S139
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C15>0
     C     Z8            IFGT      *ZERO
     C* LST026 = B03(C15)
     C                   MOVE      B03(Z8)       LST026
     C* LST15 = t09(C15)
     C                   MOVE      T09(Z8)       LST15
     C* END                                                           *
     C                   END
     C*
     C     $S15AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S512 - SCRN SUB
     C*****************************************************************
     C     S512          BEGSR
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
     C* T10 = ' '
     C                   MOVEA     *BLANKS       T10
     C* TAL = ' '
     C                   MOVEA     *BLANKS       TAL
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** protect select field
     C* DOW C15<S15CNT
     C     Z8            DOWLT     S15CNT
     C* C15 = C15+1
     C     Z8            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z8
     C* FLDATR T07(C15),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCSALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C15 = 0
     C                   Z-ADD     *ZERO         Z8
     C* GETREC D.SUPLIER1,F.SUPLIER1,*NE,SVK025
     C*
     C                   EXSR      S141
     C* DOW (C15<S15CNT)&%STS(D.SUPLIER1,F.SUPLIER1)=*YES
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C15 = C15+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* ** Unprotect select field.
     C* FLDATR T07(C15),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCSALP  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B03(C15) = SUPLIER1.SUPLIER1.SUSUPPN
     C                   MOVE      *BLANKS       B03(Z8)
     C                   MOVE      WK0013        B03(Z8)
     C* ** load screen array.
     C* TAL(C15) = SUPLIER1.SUPLIER1.SUalpha
     C                   MOVE      *BLANKS       TAL(Z8)
     C                   MOVE      WK0011        TAL(Z8)
     C* T08(C15) = SUPLIER1.SUPLIER1.SUSUPPN
     C                   MOVE      *BLANKS       T08(Z8)
     C                   MOVE      WK0013        T08(Z8)
     C* T09(C15) = SUPLIER1.SUPLIER1.SUBRNBR
     C                   MOVE      *BLANKS       T09(Z8)
     C                   MOVE      WK0012        T09(Z8)
     C* T10(C15) = SUPLIER1.SUPLIER1.SUNAME
     C                   MOVE      *BLANKS       T10(Z8)
     C                   MOVE      WUNAME        T10(Z8)
     C* ** Save first record on screen.
     C* IF C15=1
     C     Z8            IFEQ      1
     C* FSTIAL = tal(C15)
     C                   MOVE      TAL(Z8)       FSTIAL
     C* FST026 = B03(C15)
     C                   MOVE      B03(Z8)       FST026
     C* FST15 = t09(C15)
     C                   MOVE      T09(Z8)       FST15
     C* END                                                           *
     C                   END
     C* IF C15<S15CNT
     C     Z8            IFLT      S15CNT
     C* GETREC D.SUPLIER1,F.SUPLIER1,*NE,SVK025
     C*
     C                   EXSR      S141
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z8            IFLT      S15CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C15>0
     C     Z8            IFGT      *ZERO
     C* LSTIAL = tal(C15)
     C                   MOVE      TAL(Z8)       LSTIAL
     C* LST026 = B03(C15)
     C                   MOVE      B03(Z8)       LST026
     C* LST15 = t09(C15)
     C                   MOVE      T09(Z8)       LST15
     C* END                                                           *
     C                   END
     C*
     C     $S512         ENDSR
     C/EJECT
     C*****************************************************************
     C* S16ABR - SCRN SUB
     C*****************************************************************
     C     S16ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C16 = 0
     C                   Z-ADD     *ZERO         Z9
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.UOM,SVK028,SVK16
     C*
     C                   EXSR      S143
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.UOM,*PV,SVK028
     C*
     C                   EXSR      S144
     C* DOW (C16<S16CNT)&%STS(D.WAREHED,F.UOM)=*YES
     C     Z9            IFLT      S16CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C16 = C16+1
     C     Z9            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z9
     C* GETREC D.WAREHED,F.UOM,*PV,SVK028
     C*
     C                   EXSR      S144
     C* END                                                           *
     C     Z9            IFLT      S16CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S16ALD
     C                   EXSR      S16ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S16AB
     C                   END
     C*
     C     $S16AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S16AFR - SCRN SUB
     C*****************************************************************
     C     S16AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.UOM,SVK028,SVK16
     C*
     C                   EXSR      S143
     C* ** Load arrays from this point.
     C* EXSUBR S16ALD
     C                   EXSR      S16ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S16AF
     C                   END
     C*
     C     $S16AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S16ALD - SCRN SUB
     C*****************************************************************
     C     S16ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T11 = 0
     C                   Z-ADD     *ZERO         T11
     C* B04 = ' '
     C                   MOVEA     *BLANKS       B04
     C* T12 = ' '
     C                   MOVEA     *BLANKS       T12
     C* T13 = 0
     C                   Z-ADD     *ZERO         T13
     C* C16 = 0
     C                   Z-ADD     *ZERO         Z9
     C* ** protect select field
     C* DOW C16<S16CNT
     C     Z9            DOWLT     S16CNT
     C* C16 = C16+1
     C     Z9            ADD       1             RN0052
     C                   Z-ADD     RN0052        Z9
     C* FLDATR T11(C16),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T11     '    FLDNAM
     C                   Z-ADD     Z9            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0016  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C16 = 0
     C                   Z-ADD     *ZERO         Z9
     C* GETREC D.WAREHED,F.UOM,*NE,SVK028
     C*
     C                   EXSR      S146
     C* DOW (C16<S16CNT)&%STS(D.WAREHED,F.UOM)=*YES
     C     Z9            IFLT      S16CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C16 = C16+1
     C     Z9            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z9
     C* ** Unprotect select field.
     C* FLDATR T11(C16),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T11     '    FLDNAM
     C                   Z-ADD     Z9            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0016  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B04(C16) = WAREHED.UOM.UMUOM
     C                   MOVE      *BLANKS       B04(Z9)
     C                   MOVE      WMUOM         B04(Z9)
     C* ** load screen array.
     C* T12(C16) = WAREHED.UOM.UMUOM
     C                   MOVE      *BLANKS       T12(Z9)
     C                   MOVE      WMUOM         T12(Z9)
     C* T13(C16) = WAREHED.UOM.UMQTYO
     C                   Z-ADD     WMQTYO        T13(Z9)
     C* ** Save first record on screen.
     C* IF C16=1
     C     Z9            IFEQ      1
     C* FST16 = B04(C16)
     C                   MOVE      B04(Z9)       FST16
     C* END                                                           *
     C                   END
     C* IF C16<S16CNT
     C     Z9            IFLT      S16CNT
     C* GETREC D.WAREHED,F.UOM,*NE,SVK028
     C*
     C                   EXSR      S146
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z9            IFLT      S16CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C16>0
     C     Z9            IFGT      *ZERO
     C* LST16 = B04(C16)
     C                   MOVE      B04(Z9)       LST16
     C* END                                                           *
     C                   END
     C*
     C     $S16AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S17ABR - SCRN SUB
     C*****************************************************************
     C     S17ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C17 = 0
     C                   Z-ADD     *ZERO         Y1
     C* ** Set pointer to first record on screen.
     C* SETLL D.WAREHED,F.WARETYP,SVK030,SVK17
     C*
     C                   EXSR      S148
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.WAREHED,F.WARETYP,*PV,SVK030
     C*
     C                   EXSR      S149
     C* DOW (C17<S17CNT)&%STS(D.WAREHED,F.WARETYP)=*YES
     C     Y1            IFLT      S17CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C17 = C17+1
     C     Y1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y1
     C* GETREC D.WAREHED,F.WARETYP,*PV,SVK030
     C*
     C                   EXSR      S149
     C* END                                                           *
     C     Y1            IFLT      S17CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S17ALD
     C                   EXSR      S17ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S17AB
     C                   END
     C*
     C     $S17AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S17AFR - SCRN SUB
     C*****************************************************************
     C     S17AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.WAREHED,F.WARETYP,SVK030,SVK17
     C*
     C                   EXSR      S148
     C* ** Load arrays from this point.
     C* EXSUBR S17ALD
     C                   EXSR      S17ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S17AF
     C                   END
     C*
     C     $S17AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S17ALD - SCRN SUB
     C*****************************************************************
     C     S17ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T14 = 0
     C                   Z-ADD     *ZERO         T14
     C* B05 = ' '
     C                   MOVEA     *BLANKS       B05
     C* T15 = ' '
     C                   MOVEA     *BLANKS       T15
     C* T16 = ' '
     C                   MOVEA     *BLANKS       T16
     C* C17 = 0
     C                   Z-ADD     *ZERO         Y1
     C* ** protect select field
     C* DOW C17<S17CNT
     C     Y1            DOWLT     S17CNT
     C* C17 = C17+1
     C     Y1            ADD       1             RN0052
     C                   Z-ADD     RN0052        Y1
     C* FLDATR T14(C17),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Y1            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0017  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C17 = 0
     C                   Z-ADD     *ZERO         Y1
     C* GETREC D.WAREHED,F.WARETYP,*NE,SVK030
     C*
     C                   EXSR      S151
     C* DOW (C17<S17CNT)&%STS(D.WAREHED,F.WARETYP)=*YES
     C     Y1            IFLT      S17CNT
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
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
     C     RN0052        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C                   Z-ADD     RN0052        RSLT01
     C     RSLT01        DOWEQ     1
     C* C17 = C17+1
     C     Y1            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y1
     C* ** Unprotect select field.
     C* FLDATR T14(C17),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T14     '    FLDNAM
     C                   Z-ADD     Y1            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0017  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B05(C17) = WAREHED.WARETYP.WTWTYP
     C                   MOVE      *BLANKS       B05(Y1)
     C                   MOVE      WK0030        B05(Y1)
     C* ** load screen array.
     C* T15(C17) = WAREHED.WARETYP.WTWTYP
     C                   MOVE      *BLANKS       T15(Y1)
     C                   MOVE      WK0030        T15(Y1)
     C* T16(C17) = WAREHED.WARETYP.WTWDESC
     C                   MOVE      *BLANKS       T16(Y1)
     C                   MOVE      WK0029        T16(Y1)
     C* ** Save first record on screen.
     C* IF C17=1
     C     Y1            IFEQ      1
     C* FST17 = B05(C17)
     C                   MOVE      B05(Y1)       FST17
     C* END                                                           *
     C                   END
     C* IF C17<S17CNT
     C     Y1            IFLT      S17CNT
     C* GETREC D.WAREHED,F.WARETYP,*NE,SVK030
     C*
     C                   EXSR      S151
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Y1            IFLT      S17CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS09         IFEQ      *ZERO
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     RN0052        IFEQ      XYES
     C                   Z-ADD     1             RN0052
     C                   ELSE
     C                   Z-ADD     0             RN0052
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0052        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C17>0
     C     Y1            IFGT      *ZERO
     C* LST17 = B05(C17)
     C                   MOVE      B05(Y1)       LST17
     C* END                                                           *
     C                   END
     C*
     C     $S17AL        ENDSR
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
     C                   MOVEL     *BLANKS       RN0004
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0006        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0006
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0003        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0003        SYMMDD
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
     C                   MOVE      *BLANK        RN0002
     C                   MOVEL     SYCCYY        RN0002
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0007
     C                   MOVEL     SYMMDD        RN0007
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
     C     RN0005        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0005        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0004        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0004        CAT(P)    RN0002:0      ARSLT0
     C                   MOVE      *BLANKS       RN0004
     C                   MOVEL     ARSLT0        RN0004
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0003        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0004
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0003        RN0003
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0006        RN0006
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0005        RN0005
     C*
     C     $SY001        ENDSR
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
     C* S022   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,WK10A1
     C**************************************************************************
     C     S022          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     WK10A1        KSUS02
     C     K0001         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.SECURTY,F.SECIMS,*EQ,PRCOYNO,usugrp
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KSCO01
     C                   MOVEL     PRM001        KSCO01
     C                   MOVEL     *BLANK        KSUS02
     C                   MOVEL     WSUGRP        KSUS02
     C     K0001         CHAIN     SECIMS                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.SECIMS    WARE
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.SECIMS    WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - GETREC d.company,f.company,*eq,prcoyno
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     PRM001        KYCO01
     C     K0002         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.COMPANY   IMSC
     C                   Z-ADD     *ZERO         HRC08                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - SETLL D.WAREHED,F.WAREHED,SVK001,SVK002
     C**************************************************************************
     C     S025          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   MOVE      'N'           SWRD09                         RD.SW.WARETYP   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HD0020                         Company number
     C                   MOVEL     *LOVAL        HHWHSE                         Warehouse Number
     C*
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     SVK001        HD0020                         Company number
     C                   MOVEL     SVK001        RN0044                         Company number
     C                   MOVEL     SVK002        KHWH02
     C                   MOVEL     SVK002        HHWHSE                         Warehouse Number
     C                   MOVEL     SVK002        WHWHSE                         Warehouse Number
     C*
     C     K0003         SETLL     WAREHED                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - GETREC D.WAREHED,F.WAREHED,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK002        KHWH02
     C     K0003         CHAIN     WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - GETREC D.WAREHED,F.WARETYP,*eq,WHCOYNO,WHWTYP
     C**************************************************************************
     C     S027          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0020        KHCO01
     C                   MOVEL     *BLANK        KHWT02
     C                   MOVEL     XHWTYP        KHWT02
     C     K0005         CHAIN     WARETYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WARETYP   WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - GETREC D.WAREHED,F.WAREHED,*eq,SVK001,SVK002
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK002        KHWH02
     C     K0003         CHAIN(N)  WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - SETLL D.WAREHED,F.WAREDET,PRCOYNO,WHWHSE
     C**************************************************************************
     C     S029          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     PRM001        HD0019                         Company number
     C                   MOVEL     PRM001        RN0042                         Company number
     C                   MOVEL     XHWHSE        KHWH02
     C                   MOVEL     XHWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     XHWHSE        WDWHSE                         Warehouse Number
     C*
     C     K0003         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS10                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - GETREC D.WAREHED,F.WAREDET,*NE,PRCOYNO,WHWHSE
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     XHWHSE        KHWH02
     C     K0003         READE(N)  WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S031                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - Process To Reset File Pointer(EOF) - WAREDET
     C**************************************************************************
     C     S031          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0042        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KHWH02
     C     K0003         SETGT     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - DELETE D.WAREHED,F.WAREHED
     C**************************************************************************
     C     S032          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS06
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0020        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     XHWHSE        KHWH02
     C     K0003         SETLL     WAREHED                                      SETLL  WAREHED
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WAREHED
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0003         READE     WAREHED                              9190    READE  WAREHED
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    WAREHED                              91      DELETE WAREHED
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
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
     C                   END                                                    END-READ KEY FILE
     C                   END                                                    EMD-DOUNE LOOP
     C                   MOVEA     '00'          *IN(90)
     C*
     C     K0003         SETLL     WAREHED                                      RESUME FILE POINTER
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - UPDATE D.WAREHED,F.WAREHED
     C**************************************************************************
     C     S033          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0020        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HHWHSE        KHWH02
     C     K0003         CHAIN     WAREHED                            9091      CHAIN  WAREHED
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0044        IFEQ      WK0020
     C     WHCRBY        ANDEQ     XHCRBY
     C     WHCRDT        ANDEQ     WK0021
     C     WHCTYP        ANDEQ     XHCTYP
     C     WHDTLM        ANDEQ     WK0022
     C     WHLMBY        ANDEQ     XHLMBY
     C     WHREPC        ANDEQ     XHREPC
     C     RN0045        ANDEQ     WK0023
     C     WHWHSE        ANDEQ     XHWHSE
     C     WHWTYP        ANDEQ     XHWTYP
     C                   UNLOCK    WAREHED                              91      RLS LCK WAREHED
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WAREHEDF                             90      UPDATE WAREHED
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(5)         MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(6)         MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - WRITE D.WAREHED,F.WAREHED
     C**************************************************************************
     C     S034          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         WHDTLC                         Date of last count
     C                   Z-ADD     *ZERO         WHDTLR                         Date last replenishm
     C                   Z-ADD     *ZERO         WHDTNR                         Date next replenishm
     C                   Z-ADD     *ZERO         WHVALU                         W/H Value last count
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WAREHEDF                             90      ADD REC TO WAREHED
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(7)         MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(8)         MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S035   - SETLL D.WAREHED,F.WAREDET,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S035          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     SVK003        KHCO01
     C                   MOVEL     SVK003        HD0019                         Company number
     C                   MOVEL     SVK003        RN0042                         Company number
     C                   MOVEL     SVK004        KHWH02
     C                   MOVEL     SVK004        HDWHSE                         Warehouse Number
     C                   MOVEL     SVK004        WDWHSE                         Warehouse Number
     C                   MOVEL     SVK005        KDIT03
     C                   MOVEL     SVK005        HDITEM                         Item Number
     C                   MOVEL     SVK005        WDITEM                         Item Number
     C*
     C     K0006         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS10                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S036   - GETREC D.WAREHED,F.WAREDET,*lock,*eq,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK003        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK004        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK005        KDIT03
     C     K0006         CHAIN     WAREDET                            9091
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
     C* S037   - GETREC D.WAREHED,F.WAREDET,*eq,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK003        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK004        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK005        KDIT03
     C     K0006         CHAIN(N)  WAREDET                            9091
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
     C* S038   - GETREC D.WAREHED,F.ITMMAST,*eq,WDCOYNO,WDITEM
     C**************************************************************************
     C     S038          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     XDITEM        KDIT02
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - GETREC D.WAREHED,F.STOVGP,*eq,WDCOYNO,WDSTOG
     C**************************************************************************
     C     S039          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KDST02
     C                   MOVEL     XDSTOG        KDST02
     C     K0012         CHAIN     STOVGP                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S040   - GETREC D.WAREHED,F.SUPLIER,*eq,WDCOYNO,WDSUPPN
     C**************************************************************************
     C     S040          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KDSU02
     C                   MOVEL     WK0018        KDSU02
     C     K0013         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - GETREC D.WAREHED,F.UOM,*eq,WDCOYNO,WDUOM
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KDUO02
     C                   MOVEL     XDUOM         KDUO02
     C     K0014         CHAIN     UOM                                9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S042   - GETREC D.WAREHED,F.SUPLIER,*EQ,WDCOYNO,WDSUPPN,WDSBRN
     C**************************************************************************
     C     S042          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KDSU02
     C                   MOVEL     WK0018        KDSU02
     C                   MOVEL     *BLANK        KUBR03
     C                   MOVEL     XDSBRN        KUBR03
     C     K0015         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S043   - DELETE D.WAREHED,F.WAREDET
     C**************************************************************************
     C     S043          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS10
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0015        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0019        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     XDITEM        KDIT03
     C     K0006         SETLL     WAREDET                                      SETLL  WAREDET
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WAREDET
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C     K0006         READE     WAREDET                              9190    READE  WAREDET
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C*
     C                   EXSR      S044                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   DELETE    WAREDET                              91      DELETE WAREDET
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RELEASE WAREDET
     C                   MOVE      '1'           *IN91
     C                   MOVE      *HIVAL        SVS10
     C                   END
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(10)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(11)        MSGDTA                         No record found to d
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
     C     K0006         SETLL     WAREDET                                      RESUME FILE POINTER
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - Referential Integrity Check (Delete) For File WAREDET
     C**************************************************************************
     C     S044          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C                   MOVEL     RN0042        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0016         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(9)         MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $044
     C                   END                                                    END-*IN90
     C     $044          ENDSR
     C/EJECT
     C**************************************************************************
     C* S045   - UPDATE D.WAREHED,F.WAREDET
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0019        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HDWHSE        KHWH02
     C                   MOVEL     *BLANK        KDIT03                         Item Number
     C                   MOVEL     HDITEM        KDIT03
     C     K0006         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0042        IFEQ      WK0015
     C     WDCRBY        ANDEQ     XDCRBY
     C     WDCRDT        ANDEQ     WK0016
     C     WDEOQ         ANDEQ     XDEOQ
     C     WDFIXQ        ANDEQ     XDFIXQ
     C     WDITEM        ANDEQ     XDITEM
     C     WDLCST        ANDEQ     XDLCST
     C     WDLMBY        ANDEQ     XDLMBY
     C     WDLMDT        ANDEQ     WK0017
     C     WDLTIM        ANDEQ     XDLTIM
     C     WDMAXB        ANDEQ     XDMAXB
     C     WDMINB        ANDEQ     XDMINB
     C     WDOBAL        ANDEQ     XDOBAL
     C     WDQAL         ANDEQ     XDQAL
     C     WDQBQ         ANDEQ     XDQBQ
     C     WDQOH         ANDEQ     XDQOH
     C     WDQOO         ANDEQ     XDQOO
     C     WDQOR         ANDEQ     XDQOR
     C     WDSAFE        ANDEQ     XDSAFE
     C     WDSBRN        ANDEQ     XDSBRN
     C     WDSTOG        ANDEQ     XDSTOG
     C     RN0043        ANDEQ     WK0018
     C     WDUCST        ANDEQ     XDUCST
     C     WDUOM         ANDEQ     XDUOM
     C     WDWHSE        ANDEQ     WK0019
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S046                                         Refer.Integrity chk.
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
     C                   MOVEL     A1(13)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(14)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S046   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S046          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0042        IFNE      WK0015
     C     WDWHSE        ORNE      WK0019
     C     WDITEM        ORNE      XDITEM
     C                   MOVEL     RN0042        KDCO01                         Company number
     C                   MOVEL     WDWHSE        KDWH02                         Warehouse Number
     C                   MOVEL     WDITEM        KDIT03                         Item Number
     C     K0016         SETLL     WLOCITM1                               90    IMS Loc Item In item
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(9)         MSGDTA                         WAREDET   WLOCITM1
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $046
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     RN0042        IFNE      WK0015
     C     WDITEM        ORNE      XDITEM
     C*
     C                   MOVEL     WK0015        KDCO01                         Company number
     C                   MOVEL     XDITEM        KDIT02                         Item Number
     C     K0017         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(12)        MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $046
     C                   END
     C                   END                                                    END-Compare fld.
     C     $046          ENDSR
     C/EJECT
     C**************************************************************************
     C* S047   - WRITE D.WAREHED,F.WAREDET
     C**************************************************************************
     C     S047          BEGSR
     C*
     C                   EXSR      S048                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         WDLPDT                         Date of last purchas
     C                   Z-ADD     *ZERO         WDLRDT                         Date of last receipt
     C                   Z-ADD     *ZERO         WDNORP                         No. of Orders Receiv
     C                   Z-ADD     *ZERO         WDNORY                         No. of Orders Receiv
     C                   Z-ADD     *ZERO         WDNOSP                         No. of Orders Shippe
     C                   Z-ADD     *ZERO         WDNOSY                         No. of Orders Shippe
     C                   Z-ADD     *ZERO         WDNRDT                         Date of next receipt
     C                   Z-ADD     *ZERO         WDNSOP                         Number of Stockouts
     C                   Z-ADD     *ZERO         WDNSOY                         Number of Stockouts
     C                   Z-ADD     *ZERO         WDPHYC                         Physical Count
     C                   Z-ADD     *ZERO         WDPHYR                         Physical count on re
     C                   Z-ADD     *ZERO         WDTPEB                         Total of Period End
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WDETAILF                             90      ADD REC TO WAREDET
     C                   ELSE
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS10
     C                   END
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(15)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(16)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - Referential Integrity Check (Add) For File WAREDET
     C**************************************************************************
     C     S048          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C                   MOVEL     WK0015        KDCO01                         Company number
     C                   MOVEL     XDITEM        KDIT02                         Item Number
     C     K0017         SETLL     ITMMAST                                90    IMS Item master
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(12)        MSGDTA                         WAREDET   ITMMAST
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $048
     C                   END
     C     $048          ENDSR
     C/EJECT
     C**************************************************************************
     C* S049   - GETREC d.warehed,f.itmmast,*eq,prcoyno,wditem
     C**************************************************************************
     C     S049          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     XDITEM        KDIT02
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - SETLL D.WAREHED,F.WLOCITM1,SVK006,SVK007,SVK008,SVK009
     C**************************************************************************
     C     S050          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C*
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     SVK006        HD0024                         Company number
     C                   MOVEL     SVK006        RN0050                         Company number
     C                   MOVEL     SVK007        KHWH02
     C                   MOVEL     SVK007        HD0027                         Warehouse Number
     C                   MOVEL     SVK007        WIWHSE                         Warehouse Number
     C                   MOVEL     SVK008        KDIT03
     C                   MOVEL     SVK008        HD0025                         Item Number
     C                   MOVEL     SVK008        WIITEM                         Item Number
     C                   MOVEL     SVK009        KLLO04
     C                   MOVEL     SVK009        HD0026                         Location
     C                   MOVEL     SVK009        WILOCN                         Location
     C*
     C     K0018         SETLL     WLOCITM1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS14                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - GETREC D.WAREHED,F.WLOCITM1,*lock,*eq,SVK006,SVK007,SVK008,SVK0
     C**************************************************************************
     C     S051          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK007        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK008        KDIT03
     C                   MOVEL     *BLANK        KLLO04
     C                   MOVEL     SVK009        KLLO04
     C     K0018         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   Z-ADD     REC14         HRC14
     C     HRC14         CHAIN     FILE0001                           9091      WLOCITM1
     C                   Z-ADD     STS18         STS14                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   ELSE
     C                   Z-ADD     *HIVAL        STS18                          REC LOCKED
     C                   Z-ADD     14            WFILE#                         SET FILE#
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
     C* S052   - GETREC D.WAREHED,F.WLOCITM1,*eq,SVK006,SVK007,SVK008,SVK009
     C**************************************************************************
     C     S052          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK007        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     SVK008        KDIT03
     C                   MOVEL     *BLANK        KLLO04
     C                   MOVEL     SVK009        KLLO04
     C     K0018         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - GETREC D.WAREHED,F.WARELOC,*EQ,:131,:132,:315
     C**************************************************************************
     C     S053          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0036        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0045        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     XILOCN        KLLO03
     C     K0019         CHAIN(N)  WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S054   - GETREC D.WAREHED,F.WARELOC,*EQ,PRCOYNO,:0315
     C**************************************************************************
     C     S054          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     XILOCN        KHWH02
     C     K0003         CHAIN(N)  WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S055   - DELETE D.WAREHED,F.WLOCITM1
     C**************************************************************************
     C     S055          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS14
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0036        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0045        KHWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     WK0039        KDIT03
     C                   MOVEL     *BLANK        KLLO04
     C                   MOVEL     XILOCN        KLLO04
     C     K0018         SETLL     WLOCITM1                                     SETLL  WLOCITM1
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WLOCITM1
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C     K0018         READE     WLOCITM1                             9190    READE  WLOCITM1
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C     REC14         CHAIN     FILE0001                           9091
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     REC14         DELETE    FILE0001                           9191      DELETE WLOCITM1
     C                   Z-ADD     STS18         SVS14                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(17)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(18)        MSGDTA                         No record found to d
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
     C     K0018         SETLL     WLOCITM1                                     RESUME FILE POINTER
     C                   Z-ADD     SVS14         STS14                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S056   - UPDATE D.WAREHED,F.WLOCITM1
     C**************************************************************************
     C     S056          BEGSR
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   Z-ADD     HRC14         REC14
     C     HRC14         CHAIN     FILE0001                           9091
     C                   Z-ADD     STS18         STS14                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0050        IFEQ      WK0036
     C     WICRBY        ANDEQ     WK0037
     C     WICRDT        ANDEQ     WK0038
     C     WIITEM        ANDEQ     WK0039
     C     WILMBY        ANDEQ     WK0040
     C     WILMDT        ANDEQ     WK0041
     C     WILOCN        ANDEQ     XILOCN
     C     WIMINB        ANDEQ     WK0042
     C     WIQAL         ANDEQ     WK0043
     C     WIQOH         ANDEQ     WK0044
     C     WIWHSE        ANDEQ     WK0045
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   ELSE
     C*
     C                   EXSR      S057                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    FMT004                               90      UPDATE WLOCITM1
     C                   Z-ADD     STS18         STS14                          SYNC STATUS
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   ELSE
     C                   UNLOCK    FILE0001                             91      RLS LCK FILE0001
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS14
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(21)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(22)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S057   - Referential Integrity Check (Update) For File WLOCITM1
     C**************************************************************************
     C     S057          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0050        IFNE      WK0036
     C     WIWHSE        ORNE      WK0045
     C     WIITEM        ORNE      WK0039
     C*
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0045        KIWH02                         Warehouse Number
     C                   MOVEL     WK0039        KIIT03                         Item Number
     C     K0020         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(19)        MSGDTA                         WLOCITM1  WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $057
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0050        IFNE      WK0036
     C     WIWHSE        ORNE      WK0045
     C     WILOCN        ORNE      XILOCN
     C*
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0045        KIWH02                         Warehouse Number
     C                   MOVEL     XILOCN        KILO03                         Location
     C     K0021         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(20)        MSGDTA                         WLOCITM1  WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $057
     C                   END
     C                   END                                                    END-Compare fld.
     C     $057          ENDSR
     C/EJECT
     C**************************************************************************
     C* S058   - WRITE D.WAREHED,F.WLOCITM1
     C**************************************************************************
     C     S058          BEGSR
     C*
     C                   EXSR      S059                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         WIPHYC                         Physical Count
     C                   Z-ADD     *ZERO         WIPHYR                         Physical count on re
     C                   Z-ADD     *ZERO         WIQOR                          Quantity on reserve
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   WRITE     FMT004                               90      ADD REC TO WLOCITM1
     C                   Z-ADD     STS18         STS14                          SYNC STATUS
     C                   ELSE
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS14
     C                   END
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC18         REC14
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(23)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(24)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S059   - Referential Integrity Check (Add) For File WLOCITM1
     C**************************************************************************
     C     S059          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0045        KIWH02                         Warehouse Number
     C                   MOVEL     WK0039        KIIT03                         Item Number
     C     K0020         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(19)        MSGDTA                         WLOCITM1  WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $059
     C                   END
     C                   MOVEL     WK0036        KICO01                         Company number
     C                   MOVEL     WK0045        KIWH02                         Warehouse Number
     C                   MOVEL     XILOCN        KILO03                         Location
     C     K0021         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(20)        MSGDTA                         WLOCITM1  WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $059
     C                   END
     C     $059          ENDSR
     C/EJECT
     C**************************************************************************
     C* S060   - SETLL D.WAREHED,F.WRITTYP,SVK010,SVK011,SVK012,SVK013
     C**************************************************************************
     C     S060          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HD0030                         Transaction Type
     C*
     C                   MOVEL     SVK010        KHCO01
     C                   MOVEL     SVK010        HD0028                         Company number
     C                   MOVEL     SVK010        RN0051                         Company number
     C                   MOVEL     SVK011        KHWH02
     C                   MOVEL     SVK011        HD0031                         Warehouse Number
     C                   MOVEL     SVK011        WTWHSE                         Warehouse Number
     C                   MOVEL     SVK012        KDIT03
     C                   MOVEL     SVK012        HD0029                         Item Number
     C                   MOVEL     SVK012        WTITEM                         Item Number
     C                   MOVEL     SVK013        KTTR04
     C                   MOVEL     SVK013        HD0030                         Transaction Type
     C                   MOVEL     SVK013        WTTRNC                         Transaction Type
     C*
     C     K0022         SETLL     WRITTYP                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS16                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S061   - SETLL D.STOKMOV1,F.STOKMOV1,SVK010,SVK011,SVK012
     C**************************************************************************
     C     S061          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKMOV1
     C                   MOVEL     *LOVAL        HD0008                         Company number
     C                   MOVEL     *LOVAL        HTWHSE                         Warehouse Number
     C                   MOVEL     *LOVAL        HD0009                         Item Number
     C                   Z-ADD     *LOVAL        HTDTTR                         Transaction Date
     C*
     C                   MOVEL     SVK010        KTCO01
     C                   MOVEL     SVK010        HD0008                         Company number
     C                   MOVEL     SVK010        RN0023                         Company number
     C                   MOVEL     SVK011        KTWH02
     C                   MOVEL     SVK011        HTWHSE                         Warehouse Number
     C                   MOVEL     SVK011        STWHSE                         Warehouse Number
     C                   MOVEL     SVK012        KTIT03
     C                   MOVEL     SVK012        HD0009                         Item Number
     C                   MOVEL     SVK012        RN0024                         Item Number
     C*
     C     K0023         SETLL     STOKMOV1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S062   - SETLL D.WAREHED,F.WARELOC,SVK014,SVK015,SVK016
     C**************************************************************************
     C     S062          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HLLOCN                         Location
     C*
     C                   MOVEL     SVK014        KHCO01
     C                   MOVEL     SVK014        HD0021                         Company number
     C                   MOVEL     SVK014        RN0046                         Company number
     C                   MOVEL     SVK015        KHWH02
     C                   MOVEL     SVK015        HLWHSE                         Warehouse Number
     C                   MOVEL     SVK015        WLWHSE                         Warehouse Number
     C                   MOVEL     SVK016        KLLO03
     C                   MOVEL     SVK016        HLLOCN                         Location
     C                   MOVEL     SVK016        WLLOCN                         Location
     C*
     C     K0019         SETLL     WARELOC                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS15                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S063   - GETREC D.WAREHED,F.WARELOC,*lock,*eq,SVK014,SVK015,SVK016
     C**************************************************************************
     C     S063          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK014        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK015        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     SVK016        KLLO03
     C     K0019         CHAIN     WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S064   - GETREC D.WAREHED,F.WARELOC,*eq,SVK014,SVK015,SVK016
     C**************************************************************************
     C     S064          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK014        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK015        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     SVK016        KLLO03
     C     K0019         CHAIN(N)  WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S065   - DELETE D.WAREHED,F.WARELOC
     C**************************************************************************
     C     S065          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS15
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0024        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0027        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     XLLOCN        KLLO03
     C     K0019         SETLL     WARELOC                                      SETLL  WARELOC
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WARELOC
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C     K0019         READE     WARELOC                              9190    READE  WARELOC
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C*
     C                   EXSR      S066                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   DELETE    WARELOC                              91      DELETE WARELOC
     C                   Z-ADD     STS15         SVS15                          SAVE FILE STS
     C                   ELSE
     C                   UNLOCK    WARELOC                              91      RELEASE WARELOC
     C                   MOVE      '1'           *IN91
     C                   MOVE      *HIVAL        SVS15
     C                   END
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(28)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(29)        MSGDTA                         No record found to d
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
     C     K0019         SETLL     WARELOC                                      RESUME FILE POINTER
     C                   Z-ADD     SVS15         STS15                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S066   - Referential Integrity Check (Delete) For File WARELOC
     C**************************************************************************
     C     S066          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C                   MOVEL     RN0046        KLCO01                         Company number
     C                   MOVEL     WLWHSE        KLWH02                         Warehouse Number
     C                   MOVEL     WLLOCN        KLLO03                         Location
     C     K0024         SETLL     WLOCITM                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(27)        MSGDTA                         WARELOC   WLOCITM
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $066
     C                   END                                                    END-*IN90
     C     $066          ENDSR
     C/EJECT
     C**************************************************************************
     C* S067   - UPDATE D.WAREHED,F.WARELOC
     C**************************************************************************
     C     S067          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0021        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HLWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03                         Location
     C                   MOVEL     HLLOCN        KLLO03
     C     K0019         CHAIN     WARELOC                            9091      CHAIN  WARELOC
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0046        IFEQ      WK0024
     C     WLCRBY        ANDEQ     XLCRBY
     C     WLCRDT        ANDEQ     WK0025
     C     WLDESC        ANDEQ     XLDESC
     C     WLHITE        ANDEQ     XLHITE
     C     WLLMBY        ANDEQ     XLLMBY
     C     WLLMDT        ANDEQ     WK0026
     C     WLLOCN        ANDEQ     XLLOCN
     C     WLPCKA        ANDEQ     XLPCKA
     C     WLPCKF        ANDEQ     XLPCKF
     C     WLPCKR        ANDEQ     XLPCKR
     C     WLRSTN        ANDEQ     XLRSTN
     C     WLSIZE        ANDEQ     XLSIZE
     C     WLWEIG        ANDEQ     XLWEIG
     C     WLWHSE        ANDEQ     WK0027
     C                   UNLOCK    WARELOC                              91      RLS LCK WARELOC
     C                   ELSE
     C*
     C                   EXSR      S068                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WARELOCF                             90      UPDATE WARELOC
     C                   ELSE
     C                   UNLOCK    WARELOC                              91      RLS LCK WARELOC
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS15
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(30)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(31)        MSGDTA                         Unable to update rec
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S068   - Referential Integrity Check (Update) For File WARELOC
     C**************************************************************************
     C     S068          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     RN0046        IFNE      WK0024
     C     WLWHSE        ORNE      WK0027
     C     WLLOCN        ORNE      XLLOCN
     C                   MOVEL     RN0046        KLCO01                         Company number
     C                   MOVEL     WLWHSE        KLWH02                         Warehouse Number
     C                   MOVEL     WLLOCN        KLLO03                         Location
     C     K0024         SETLL     WLOCITM                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '1'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(27)        MSGDTA                         WARELOC   WLOCITM
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $068
     C                   END                                                    END-*IN90
     C*
     C                   END                                                    END-Compare fld.
     C     $068          ENDSR
     C/EJECT
     C**************************************************************************
     C* S069   - WRITE D.WAREHED,F.WARELOC
     C**************************************************************************
     C     S069          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WARELOCF                             90      ADD REC TO WARELOC
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(32)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(33)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S070   - SETLL D.WAREHED,F.WLOCITM,SVK017,SVK018,SVK019,SVK020
     C**************************************************************************
     C     S070          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HIITEM                         Item Number
     C*
     C                   MOVEL     SVK017        KHCO01
     C                   MOVEL     SVK017        HD0023                         Company number
     C                   MOVEL     SVK017        RN0049                         Company number
     C                   MOVEL     SVK018        KHWH02
     C                   MOVEL     SVK018        HIWHSE                         Warehouse Number
     C                   MOVEL     SVK018        WIWHSE                         Warehouse Number
     C                   MOVEL     SVK019        KLLO03
     C                   MOVEL     SVK019        HILOCN                         Location
     C                   MOVEL     SVK019        WILOCN                         Location
     C                   MOVEL     SVK020        KDIT04
     C                   MOVEL     SVK020        HIITEM                         Item Number
     C                   MOVEL     SVK020        WIITEM                         Item Number
     C*
     C     K0025         SETLL     WLOCITM                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS17                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S071   - GETREC D.WAREHED,F.WLOCITM,*lock,*eq,SVK017,SVK018,SVK019,SVK02
     C**************************************************************************
     C     S071          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK017        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK018        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     SVK019        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     SVK020        KDIT04
     C     K0025         CHAIN     WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S072   - GETREC D.WAREHED,F.WLOCITM,*eq,SVK017,SVK018,SVK019,SVK020
     C**************************************************************************
     C     S072          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK017        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     SVK018        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     SVK019        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     SVK020        KDIT04
     C     K0025         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S073   - GETREC d.warehed,f.itmmast,*eq,prcoyno,:66
     C**************************************************************************
     C     S073          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KDIT02
     C                   MOVEL     XIITEM        KDIT02
     C     K0011         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S074   - DELETE D.WAREHED,F.WLOCITM
     C**************************************************************************
     C     S074          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS17
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0031        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WK0035        KHWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     WK0034        KLLO03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     XIITEM        KDIT04
     C     K0025         SETLL     WLOCITM                                      SETLL  WLOCITM
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - WLOCITM
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0025         READE     WLOCITM                              9190    READE  WLOCITM
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    WLOCITM                              91      DELETE WLOCITM
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
     C*          ---------------------------------------------------------------
     C*          | Send Message To Indicate Delete Status
     C*          ---------------------------------------------------------------
     C     *IN91         IFEQ      '0'
     C                   MOVEL     A1(34)        MSGDTA                         Record deleted from
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-DEL STATUS
     C*
     C                   ELSE                                                   ELSE-READ-FILE
     C     *IN90         IFEQ      '1'                                          NO RCD FOUND
     C                   MOVEL     A1(35)        MSGDTA                         No record found to d
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
     C     K0025         SETLL     WLOCITM                                      RESUME FILE POINTER
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S075   - UPDATE D.WAREHED,F.WLOCITM
     C**************************************************************************
     C     S075          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0023        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     HIWHSE        KHWH02
     C                   MOVEL     *BLANK        KLLO03                         Location
     C                   MOVEL     HILOCN        KLLO03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HIITEM        KDIT04
     C     K0025         CHAIN     WLOCITM                            9091      CHAIN  WLOCITM
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0049        IFEQ      WK0031
     C     WICRBY        ANDEQ     XICRBY
     C     WICRDT        ANDEQ     WK0032
     C     WIITEM        ANDEQ     XIITEM
     C     WILMBY        ANDEQ     XILMBY
     C     WILMDT        ANDEQ     WK0033
     C     WILOCN        ANDEQ     WK0034
     C     WIMINB        ANDEQ     XIMINB
     C     WIQAL         ANDEQ     XIQAL
     C     WIQOH         ANDEQ     XIQOH
     C     WIWHSE        ANDEQ     WK0035
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
     C                   MOVE      *HIVAL        STS17
     C                   END
     C     *IN90         IFEQ      '0'                                          REC UPDATED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(38)        MSGDTA                         Record update for fi
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-UPDATE STATUS
     C                   END                                                    END-FLD COMPARE
     C*
     C*
     C                   ELSE
     C                   MOVEL     A1(39)        MSGDTA                         Unable to update rec
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
     C     RN0049        IFNE      WK0031
     C     WIWHSE        ORNE      WK0035
     C     WIITEM        ORNE      XIITEM
     C*
     C                   MOVEL     WK0031        KICO01                         Company number
     C                   MOVEL     WK0035        KIWH02                         Warehouse Number
     C                   MOVEL     XIITEM        KIIT03                         Item Number
     C     K0020         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(36)        MSGDTA                         WLOCITM   WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $076
     C                   END
     C                   END                                                    END-Compare fld.
     C     RN0049        IFNE      WK0031
     C     WIWHSE        ORNE      WK0035
     C     WILOCN        ORNE      WK0034
     C*
     C                   MOVEL     WK0031        KICO01                         Company number
     C                   MOVEL     WK0035        KIWH02                         Warehouse Number
     C                   MOVEL     WK0034        KILO03                         Location
     C     K0021         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(37)        MSGDTA                         WLOCITM   WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $076
     C                   END
     C                   END                                                    END-Compare fld.
     C     $076          ENDSR
     C/EJECT
     C**************************************************************************
     C* S077   - WRITE D.WAREHED,F.WLOCITM
     C**************************************************************************
     C     S077          BEGSR
     C*
     C                   EXSR      S078                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         WIPHYC                         Physical Count
     C                   Z-ADD     *ZERO         WIPHYR                         Physical count on re
     C                   Z-ADD     *ZERO         WIQOR                          Quantity on reserve
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WLOCITMF                             90      ADD REC TO WLOCITM
     C                   ELSE
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS17
     C                   END
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   MOVEL     A1(40)        MSGDTA                         Record added to file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   MOVEL     A1(41)        MSGDTA                         Unable to add record
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S078   - Referential Integrity Check (Add) For File WLOCITM
     C**************************************************************************
     C     S078          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C                   MOVEL     WK0031        KICO01                         Company number
     C                   MOVEL     WK0035        KIWH02                         Warehouse Number
     C                   MOVEL     XIITEM        KIIT03                         Item Number
     C     K0020         SETLL     WAREDET                                90    IMS Warehouse Item D
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(36)        MSGDTA                         WLOCITM   WAREDET
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $078
     C                   END
     C                   MOVEL     WK0031        KICO01                         Company number
     C                   MOVEL     WK0035        KIWH02                         Warehouse Number
     C                   MOVEL     WK0034        KILO03                         Location
     C     K0021         SETLL     WARELOC                                90    IMS Warehouse Locati
     C     *IN90         IFEQ      '0'
     C                   MOVE      'Y'           RIERR
     C                   MOVEL     A1(37)        MSGDTA                         WLOCITM   WARELOC
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   GOTO      $078
     C                   END
     C     $078          ENDSR
     C/EJECT
     C**************************************************************************
     C* S079   - GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno
     C**************************************************************************
     C     S079          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0027         READPE(N) WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S080                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S080   - Process To Reset File Pointer(BOF) - WAREHED
     C**************************************************************************
     C     S080          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0044        KHCO01
     C     K0027         SETLL     WAREHED
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S081   - Process To Reset File Pointer(EOF) - WAREHED
     C**************************************************************************
     C     S081          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0044        KHCO01
     C     K0027         SETGT     WAREHED
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S082   - GETBLK D.WAREHED,F.WAREHED,*PV,prcoyno,uswhse
     C**************************************************************************
     C     S082          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     PRM001        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     WSWHSE        KHWH02
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
     C     SWRD06        DOUNE     'Y'                                          RD.SW.WAREHED   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C     K0003         READPE(N) WAREHED                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0020                         Company number
     C                   MOVEL     *BLANK        HHWHSE                         Warehouse Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   END
     C*
     C     SWRD06        IFEQ      'Y'                                          RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S083                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S083   - Process To Reset File Pointer(BOF) - WAREHED
     C**************************************************************************
     C     S083          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0044        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WHWHSE        KHWH02
     C     K0003         SETLL     WAREHED
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S084   - Process To Reset File Pointer(EOF) - WAREHED
     C**************************************************************************
     C     S084          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.WAREHED   WARE
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0044        KHCO01
     C                   MOVEL     *BLANK        KHWH02                         Warehouse Number
     C                   MOVEL     WHWHSE        KHWH02
     C     K0003         SETGT     WAREHED
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S085   - GETREC D.WAREHED,F.WAREHED,*EQ,WHCOYNO,WHWHSE
     C**************************************************************************
     C     S085          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0020        KHCO01
     C                   MOVEL     *BLANK        KHWH02
     C                   MOVEL     XHWHSE        KHWH02
     C     K0003         CHAIN(N)  WAREHED                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.WAREHED   WARE
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.WAREHED   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S086   - GETBLK D.WAREHED,F.WAREDET,F.ITMMAST,*PV,SVK003,SVK004
     C**************************************************************************
     C     S086          BEGSR
     C*
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK003        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     SVK004        KDWH02
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
     C     SWRD10        DOUNE     'Y'                                          RD.SW.WAREDET   WARE
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C     K0028         READPE(N) WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0019                         Company number
     C                   MOVEL     *BLANK        HDWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HDITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   END
     C*
     C     SWRD10        IFEQ      'Y'                                          RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0042        KTCO02
     C                   MOVEL     *BLANK        KTIT04
     C                   MOVEL     WDITEM        KTIT04
     C     K0029         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S087                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S087   - Process To Reset File Pointer(BOF) - WAREDET   ITMMAST
     C**************************************************************************
     C     S087          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0042        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0028         SETLL     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0016        KTCO02
     C                   MOVEL     *BLANK        KTIT04                         Item Number
     C                   MOVEL     ITITEM        KTIT04
     C     K0029         SETLL     ITMMAST
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S088   - Process To Reset File Pointer(EOF) - WAREDET   ITMMAST
     C**************************************************************************
     C     S088          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0042        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0028         SETGT     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0016        KTCO02
     C                   MOVEL     *BLANK        KTIT04                         Item Number
     C                   MOVEL     ITITEM        KTIT04
     C     K0029         SETGT     ITMMAST
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       10            WADJ02
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S089   - GETREC D.WAREHED,F.WAREDET,*EQ,WDCOYNO,WDWHSE,WDITEM
     C**************************************************************************
     C     S089          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     WK0015        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     WK0019        KDWH02
     C                   MOVEL     *BLANK        KDIT03
     C                   MOVEL     XDITEM        KDIT03
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
     C* S090   - GETBLK D.WAREHED,F.WLOCITM1,*PV,SVK006,SVK007,SVK008
     C**************************************************************************
     C     S090          BEGSR
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK006        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK007        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     SVK008        KIIT03
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
     C     SWRD14        DOUNE     'Y'                                          RD.SW.WLOCITM1  WRIT
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C     K0020         READPE    WLOCITM1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0024                         Company number
     C                   MOVEL     *BLANK        HD0027                         Warehouse Number
     C                   MOVEL     *BLANK        HD0025                         Item Number
     C                   MOVEL     *BLANK        HD0026                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   END
     C*
     C     SWRD14        IFEQ      'Y'                                          RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S091                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S091   - Process To Reset File Pointer(BOF) - WLOCITM1
     C**************************************************************************
     C     S091          BEGSR
     C*
     C     SWRD14        IFNE      'Y'                                          RD.SW.WLOCITM1  WRIT
     C     STS14         ANDNE     1122                                         RCD LOCK
     C     STS14         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     STS14         SVS14                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0050        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0020         SETLL     WLOCITM1
     C                   Z-ADD     SVS14         STS14                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S092   - Process To Reset File Pointer(EOF) - WLOCITM1
     C**************************************************************************
     C     S092          BEGSR
     C*
     C     SWRD14        IFNE      'Y'                                          RD.SW.WLOCITM1  WRIT
     C     STS14         ANDNE     1122                                         RCD LOCK
     C     STS14         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     STS14         SVS14                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0050        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KIIT03                         Item Number
     C                   MOVEL     WIITEM        KIIT03
     C     K0020         SETGT     WLOCITM1
     C                   Z-ADD     SVS14         STS14                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ03
     C     WCNTR         IFNE      *ZERO
     C                   ADD       9             WADJ03
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN03        WADJ03
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S093   - GETREC D.WAREHED,F.WLOCITM1,*EQ,:0131,:0132,:0133,:0315
     C**************************************************************************
     C     S093          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0036        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WK0045        KIWH02
     C                   MOVEL     *BLANK        KIIT03
     C                   MOVEL     WK0039        KIIT03
     C                   MOVEL     *BLANK        KILO04
     C                   MOVEL     XILOCN        KILO04
     C     K0030         CHAIN     WLOCITM1                           9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S094   - GETBLK D.WAREHED,F.WRITTYP,*PV,SVK010,SVK011,SVK012
     C**************************************************************************
     C     S094          BEGSR
     C*
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     SVK010        KTCO03
     C                   MOVEL     *BLANK        KTWH04
     C                   MOVEL     SVK011        KTWH04
     C                   MOVEL     *BLANK        KTIT05
     C                   MOVEL     SVK012        KTIT05
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
     C     SWRD16        DOUNE     'Y'                                          RD.SW.WRITTYP   WLOC
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C     K0031         READPE    WRITTYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC16                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0028                         Company number
     C                   MOVEL     *BLANK        HD0031                         Warehouse Number
     C                   MOVEL     *BLANK        HD0029                         Item Number
     C                   MOVEL     *BLANK        HD0030                         Transaction Type
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   END
     C*
     C     SWRD16        IFEQ      'Y'                                          RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S095                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S095   - Process To Reset File Pointer(BOF) - WRITTYP
     C**************************************************************************
     C     S095          BEGSR
     C*
     C     SWRD16        IFNE      'Y'                                          RD.SW.WRITTYP   WLOC
     C     STS16         ANDNE     1122                                         RCD LOCK
     C     STS16         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     STS16         SVS16                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0051        KTCO03
     C                   MOVEL     *BLANK        KTWH04                         Warehouse Number
     C                   MOVEL     WTWHSE        KTWH04
     C                   MOVEL     *BLANK        KTIT05                         Item Number
     C                   MOVEL     WTITEM        KTIT05
     C     K0031         SETLL     WRITTYP
     C                   Z-ADD     SVS16         STS16                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S096   - Process To Reset File Pointer(EOF) - WRITTYP
     C**************************************************************************
     C     S096          BEGSR
     C*
     C     SWRD16        IFNE      'Y'                                          RD.SW.WRITTYP   WLOC
     C     STS16         ANDNE     1122                                         RCD LOCK
     C     STS16         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     STS16         SVS16                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0051        KTCO03
     C                   MOVEL     *BLANK        KTWH04                         Warehouse Number
     C                   MOVEL     WTWHSE        KTWH04
     C                   MOVEL     *BLANK        KTIT05                         Item Number
     C                   MOVEL     WTITEM        KTIT05
     C     K0031         SETGT     WRITTYP
     C                   Z-ADD     SVS16         STS16                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ04
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ04
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN04        WADJ04
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S097   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,wttrnc
     C**************************************************************************
     C     S097          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO04
     C                   MOVEL     PRM001        KTCO04
     C                   MOVEL     *BLANK        KTTR05
     C                   MOVEL     XTTRNC        KTTR05
     C     K0032         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S098   - Process To Reset File Pointer(EOF) - STOKMOV1
     C**************************************************************************
     C     S098          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.STOKMOV1
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.STOKMOV1
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company number
     C                   MOVEL     RN0023        KTCO01
     C                   MOVEL     *BLANK        KTWH02                         Warehouse Number
     C                   MOVEL     STWHSE        KTWH02
     C                   MOVEL     *BLANK        KTIT03                         Item Number
     C                   MOVEL     RN0024        KTIT03
     C     K0023         SETGT     STOKMOV1
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ05
     C     WCNTR         IFNE      *ZERO
     C                   ADD       13            WADJ05
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN05        WADJ05
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S099   - GETREC d.imstrn,f.imstrn,*eq,prcoyno,stttyp
     C**************************************************************************
     C     S099          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO05
     C                   MOVEL     PRM001        KTCO05
     C                   MOVEL     *BLANK        KTTR06
     C                   MOVEL     WTTTYP        KTTR06
     C     K0033         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.IMSTRN
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S100   - GETBLK D.WAREHED,F.WARELOC,*PV,SVK014,SVK015
     C**************************************************************************
     C     S100          BEGSR
     C*
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK014        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     SVK015        KLWH02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN06        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ06        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD15        DOUNE     'Y'                                          RD.SW.WARELOC   ITMM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C     K0034         READPE(N) WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0021                         Company number
     C                   MOVEL     *BLANK        HLWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HLLOCN                         Location
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   END
     C*
     C     SWRD15        IFEQ      'Y'                                          RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S101                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S101   - Process To Reset File Pointer(BOF) - WARELOC
     C**************************************************************************
     C     S101          BEGSR
     C*
     C     SWRD15        IFNE      'Y'                                          RD.SW.WARELOC   ITMM
     C     STS15         ANDNE     1122                                         RCD LOCK
     C     STS15         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     STS15         SVS15                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0046        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0034         SETLL     WARELOC
     C                   Z-ADD     SVS15         STS15                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S102   - Process To Reset File Pointer(EOF) - WARELOC
     C**************************************************************************
     C     S102          BEGSR
     C*
     C     SWRD15        IFNE      'Y'                                          RD.SW.WARELOC   ITMM
     C     STS15         ANDNE     1122                                         RCD LOCK
     C     STS15         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     STS15         SVS15                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0046        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0034         SETGT     WARELOC
     C                   Z-ADD     SVS15         STS15                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ06
     C     WCNTR         IFNE      *ZERO
     C                   ADD       10            WADJ06
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN06        WADJ06
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S103   - GETREC D.WAREHED,F.WARELOC,*EQ,WLCOYNO,WLWHSE,WLLOCN
     C**************************************************************************
     C     S103          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     WK0024        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     WK0027        KLWH02
     C                   MOVEL     *BLANK        KLLO03
     C                   MOVEL     XLLOCN        KLLO03
     C     K0024         CHAIN(N)  WARELOC                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S104   - GETBLK D.WAREHED,F.WLOCITM,*PV,SVK017,SVK018,SVK019
     C**************************************************************************
     C     S104          BEGSR
     C*
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     SVK017        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     SVK018        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     SVK019        KILO03
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN07        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ07        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD17        DOUNE     'Y'                                          RD.SW.WLOCITM
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0021         READPE(N) WLOCITM                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0023                         Company number
     C                   MOVEL     *BLANK        HIWHSE                         Warehouse Number
     C                   MOVEL     *BLANK        HILOCN                         Location
     C                   MOVEL     *BLANK        HIITEM                         Item Number
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S105                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S105   - Process To Reset File Pointer(BOF) - WLOCITM
     C**************************************************************************
     C     S105          BEGSR
     C*
     C     SWRD17        IFNE      'Y'                                          RD.SW.WLOCITM
     C     STS17         ANDNE     1122                                         RCD LOCK
     C     STS17         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0049        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KILO03                         Location
     C                   MOVEL     WILOCN        KILO03
     C     K0021         SETLL     WLOCITM
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S106   - Process To Reset File Pointer(EOF) - WLOCITM
     C**************************************************************************
     C     S106          BEGSR
     C*
     C     SWRD17        IFNE      'Y'                                          RD.SW.WLOCITM
     C     STS17         ANDNE     1122                                         RCD LOCK
     C     STS17         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
     C                   MOVEL     *BLANK        KICO01                         Company number
     C                   MOVEL     RN0049        KICO01
     C                   MOVEL     *BLANK        KIWH02                         Warehouse Number
     C                   MOVEL     WIWHSE        KIWH02
     C                   MOVEL     *BLANK        KILO03                         Location
     C                   MOVEL     WILOCN        KILO03
     C     K0021         SETGT     WLOCITM
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ07
     C     WCNTR         IFNE      *ZERO
     C                   ADD       9             WADJ07
     C                   END
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   ELSE
     C                   Z-ADD     WRRN07        WADJ07
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S107   - GETREC D.WAREHED,F.WLOCITM,*EQ,:0128,:0129,:0316,:0066
     C**************************************************************************
     C     S107          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     WK0031        KICO01
     C                   MOVEL     *BLANK        KIWH02
     C                   MOVEL     WK0035        KIWH02
     C                   MOVEL     *BLANK        KILO03
     C                   MOVEL     WK0034        KILO03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     XIITEM        KIIT04
     C     K0035         CHAIN(N)  WLOCITM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   Z-ADD     *ZERO         HRC17                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.WLOCITM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S108   - SETLL D.WAREHED,F.ITMMAST,SVK021,SVK13
     C**************************************************************************
     C     S108          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C*
     C                   MOVEL     SVK021        KTCO02
     C                   MOVEL     SVK021        HD0003                         Company number
     C                   MOVEL     SVK021        RN0016                         Company number
     C                   MOVEL     SVK13         KTIT04
     C                   MOVEL     SVK13         HTITEM                         Item Number
     C                   MOVEL     SVK13         ITITEM                         Item Number
     C*
     C     K0029         SETLL     ITMMAST                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S109   - GETREC D.WAREHED,F.ITMMAST,*PV,SVK021
     C**************************************************************************
     C     S109          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK021        KTCO02
     C     K0036         READPE    ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S110                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S110   - Process To Reset File Pointer(BOF) - ITMMAST
     C**************************************************************************
     C     S110          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.ITMMAST   STOV
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0016        KTCO02
     C     K0036         SETLL     ITMMAST
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S111   - SETLL D.WAREHED,F.wareloc,SVK021,whwhse,SVKloc
     C**************************************************************************
     C     S111          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HLLOCN                         Location
     C*
     C                   MOVEL     SVK021        KLCO01
     C                   MOVEL     SVK021        HD0021                         Company number
     C                   MOVEL     SVK021        RN0046                         Company number
     C                   MOVEL     XHWHSE        KLWH02
     C                   MOVEL     XHWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     XHWHSE        WLWHSE                         Warehouse Number
     C                   MOVEL     SVKLOC        KLLO03
     C                   MOVEL     SVKLOC        HLLOCN                         Location
     C                   MOVEL     SVKLOC        WLLOCN                         Location
     C*
     C     K0024         SETLL     WARELOC                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS15                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S112   - GETREC D.WAREHED,F.wareloc,*PV,SVK021,whwhse
     C**************************************************************************
     C     S112          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK021        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     XHWHSE        KLWH02
     C     K0034         READPE(N) WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S113                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S113   - Process To Reset File Pointer(BOF) - WARELOC
     C**************************************************************************
     C     S113          BEGSR
     C*
     C     SWRD15        IFNE      'Y'                                          RD.SW.WARELOC   ITMM
     C     STS15         ANDNE     1122                                         RCD LOCK
     C     STS15         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     STS15         SVS15                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0046        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0034         SETLL     WARELOC
     C                   Z-ADD     SVS15         STS15                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S114   - SETLL D.WAREHED,F.waredet,SVK021,whwhse,SVK13
     C**************************************************************************
     C     S114          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HDITEM                         Item Number
     C*
     C                   MOVEL     SVK021        KDCO01
     C                   MOVEL     SVK021        HD0019                         Company number
     C                   MOVEL     SVK021        RN0042                         Company number
     C                   MOVEL     XHWHSE        KDWH02
     C                   MOVEL     XHWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     XHWHSE        WDWHSE                         Warehouse Number
     C                   MOVEL     SVK13         KDIT03
     C                   MOVEL     SVK13         HDITEM                         Item Number
     C                   MOVEL     SVK13         WDITEM                         Item Number
     C*
     C     K0016         SETLL     WAREDET                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS10                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S115   - GETREC D.WAREHED,F.waredet,*PV,SVK021,whwhse
     C**************************************************************************
     C     S115          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK021        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     XHWHSE        KDWH02
     C     K0028         READPE(N) WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S116                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S116   - Process To Reset File Pointer(BOF) - WAREDET
     C**************************************************************************
     C     S116          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0042        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0028         SETLL     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S117   - SETLL D.ITMMAST1,F.ITMMAST1,SVK021,svkial,SVK13
     C**************************************************************************
     C     S117          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST1
     C                   MOVEL     *LOVAL        HD0005                         Company number
     C                   MOVEL     *LOVAL        HD0004                         Alpha Search
     C                   MOVEL     *LOVAL        HD0006                         Item Number
     C*
     C                   MOVEL     SVK021        KTCO02
     C                   MOVEL     SVK021        HD0005                         Company number
     C                   MOVEL     SVK021        RN0019                         Company number
     C                   MOVEL     SVKIAL        KTAL03
     C                   MOVEL     SVKIAL        HD0004                         Alpha Search
     C                   MOVEL     SVKIAL        RN0018                         Alpha Search
     C                   MOVEL     SVK13         KTIT04
     C                   MOVEL     SVK13         HD0006                         Item Number
     C                   MOVEL     SVK13         ITITEM                         Item Number
     C*
     C     K0037         SETLL     ITMMAST1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS01                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S118   - GETREC D.ITMMAST1,F.ITMMAST1,*PV,SVK021
     C**************************************************************************
     C     S118          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK021        KTCO02
     C     K0036         READPE    ITMMAST1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.ITMMAST1
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S119                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S119   - Process To Reset File Pointer(BOF) - ITMMAST1
     C**************************************************************************
     C     S119          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.ITMMAST1
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST1
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0019        KTCO02
     C     K0036         SETLL     ITMMAST1
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S120   - GETREC D.WAREHED,F.ITMMAST,*NE,SVK021
     C**************************************************************************
     C     S120          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK021        KTCO02
     C     K0036         READE     ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S121                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S121   - Process To Reset File Pointer(EOF) - ITMMAST
     C**************************************************************************
     C     S121          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.ITMMAST   STOV
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0016        KTCO02
     C     K0036         SETGT     ITMMAST
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S122   - GETREC D.WAREHED,F.wareloc,*NE,SVK021,whwhse
     C**************************************************************************
     C     S122          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KLCO01
     C                   MOVEL     SVK021        KLCO01
     C                   MOVEL     *BLANK        KLWH02
     C                   MOVEL     XHWHSE        KLWH02
     C     K0034         READE(N)  WARELOC                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     *ZERO         HRC15                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S123                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S123   - Process To Reset File Pointer(EOF) - WARELOC
     C**************************************************************************
     C     S123          BEGSR
     C*
     C     SWRD15        IFNE      'Y'                                          RD.SW.WARELOC   ITMM
     C     STS15         ANDNE     1122                                         RCD LOCK
     C     STS15         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   Z-ADD     STS15         SVS15                          SAVE FILE STS
     C                   MOVEL     *BLANK        KLCO01                         Company number
     C                   MOVEL     RN0046        KLCO01
     C                   MOVEL     *BLANK        KLWH02                         Warehouse Number
     C                   MOVEL     WLWHSE        KLWH02
     C     K0034         SETGT     WARELOC
     C                   Z-ADD     SVS15         STS15                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S124   - GETREC D.WAREHED,F.waredet,*NE,SVK021,whwhse
     C**************************************************************************
     C     S124          BEGSR
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     SVK021        KDCO01
     C                   MOVEL     *BLANK        KDWH02
     C                   MOVEL     XHWHSE        KDWH02
     C     K0028         READE(N)  WAREDET                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     *ZERO         HRC10                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S125                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S125   - Process To Reset File Pointer(EOF) - WAREDET
     C**************************************************************************
     C     S125          BEGSR
     C*
     C     SWRD10        IFNE      'Y'                                          RD.SW.WAREDET   WARE
     C     STS10         ANDNE     1122                                         RCD LOCK
     C     STS10         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD10                         RD.SW.WAREDET   WARE
     C                   Z-ADD     STS10         SVS10                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     RN0042        KDCO01
     C                   MOVEL     *BLANK        KDWH02                         Warehouse Number
     C                   MOVEL     WDWHSE        KDWH02
     C     K0028         SETGT     WAREDET
     C                   Z-ADD     SVS10         STS10                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S126   - GETREC D.ITMMAST1,F.ITMMAST1,*NE,SVK021
     C**************************************************************************
     C     S126          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO02
     C                   MOVEL     SVK021        KTCO02
     C     K0036         READE     ITMMAST1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.ITMMAST1
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S127                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S127   - Process To Reset File Pointer(EOF) - ITMMAST1
     C**************************************************************************
     C     S127          BEGSR
     C*
     C     SWRD01        IFNE      'Y'                                          RD.SW.ITMMAST1
     C     STS01         ANDNE     1122                                         RCD LOCK
     C     STS01         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD01                         RD.SW.ITMMAST1
     C                   Z-ADD     STS01         SVS01                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO02                         Company number
     C                   MOVEL     RN0019        KTCO02
     C     K0036         SETGT     ITMMAST1
     C                   Z-ADD     SVS01         STS01                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S128   - SETLL D.WAREHED,F.STOVGP,SVK023,SVK14
     C**************************************************************************
     C     S128          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C*
     C                   MOVEL     SVK023        KGCO01
     C                   MOVEL     SVK023        HD0010                         Company number
     C                   MOVEL     SVK023        RN0026                         Company number
     C                   MOVEL     SVK14         KGST02
     C                   MOVEL     SVK14         HGSTOG                         Stock Turnover Group
     C                   MOVEL     SVK14         TGSTOG                         Stock Turnover Group
     C*
     C     K0038         SETLL     STOVGP                                 90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS11                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S129   - GETREC D.WAREHED,F.STOVGP,*PV,SVK023
     C**************************************************************************
     C     S129          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KGCO01
     C                   MOVEL     SVK023        KGCO01
     C     K0039         READPE    STOVGP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S130                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S130   - Process To Reset File Pointer(BOF) - STOVGP
     C**************************************************************************
     C     S130          BEGSR
     C*
     C     SWRD11        IFNE      'Y'                                          RD.SW.STOVGP    SUPL
     C     STS11         ANDNE     1122                                         RCD LOCK
     C     STS11         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   Z-ADD     STS11         SVS11                          SAVE FILE STS
     C                   MOVEL     *BLANK        KGCO01                         Company number
     C                   MOVEL     RN0026        KGCO01
     C     K0039         SETLL     STOVGP
     C                   Z-ADD     SVS11         STS11                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S131   - GETREC D.WAREHED,F.STOVGP,*NE,SVK023
     C**************************************************************************
     C     S131          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KGCO01
     C                   MOVEL     SVK023        KGCO01
     C     K0039         READE     STOVGP                               9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   Z-ADD     *ZERO         HRC11                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S132                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S132   - Process To Reset File Pointer(EOF) - STOVGP
     C**************************************************************************
     C     S132          BEGSR
     C*
     C     SWRD11        IFNE      'Y'                                          RD.SW.STOVGP    SUPL
     C     STS11         ANDNE     1122                                         RCD LOCK
     C     STS11         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   Z-ADD     STS11         SVS11                          SAVE FILE STS
     C                   MOVEL     *BLANK        KGCO01                         Company number
     C                   MOVEL     RN0026        KGCO01
     C     K0039         SETGT     STOVGP
     C                   Z-ADD     SVS11         STS11                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S133   - SETLL D.WAREHED,F.SUPLIER,SVK025,SVK026,SVK15
     C**************************************************************************
     C     S133          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C                   MOVEL     *LOVAL        HD0011                         Branch Number
     C*
     C                   MOVEL     SVK025        KUCO01
     C                   MOVEL     SVK025        HD0012                         Company number
     C                   MOVEL     SVK025        RN0030                         Company number
     C                   MOVEL     SVK026        KUSU02
     C                   MOVEL     SVK026        HD0013                         Supplier Number
     C                   MOVEL     SVK026        RN0032                         Supplier Number
     C                   MOVEL     SVK15         KUBR03
     C                   MOVEL     SVK15         HD0011                         Branch Number
     C                   MOVEL     SVK15         RN0028                         Branch Number
     C*
     C     K0040         SETLL     SUPLIER                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS12                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S134   - GETREC D.WAREHED,F.SUPLIER,*PV,SVK025
     C**************************************************************************
     C     S134          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0041         READPE    SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S135                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S135   - Process To Reset File Pointer(BOF) - SUPLIER
     C**************************************************************************
     C     S135          BEGSR
     C*
     C     SWRD12        IFNE      'Y'                                          RD.SW.SUPLIER   UOM
     C     STS12         ANDNE     1122                                         RCD LOCK
     C     STS12         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     STS12         SVS12                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0030        KUCO01
     C     K0041         SETLL     SUPLIER
     C                   Z-ADD     SVS12         STS12                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S136   - SETLL D.SUPLIER1,F.SUPLIER1,SVK025,svkial,SVK026,SVK15
     C**************************************************************************
     C     S136          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.SUPLIER1
     C                   MOVEL     *LOVAL        HD0016                         Company number
     C                   MOVEL     *LOVAL        HD0014                         Alpha Search
     C                   MOVEL     *LOVAL        HD0017                         Supplier Number
     C                   MOVEL     *LOVAL        HD0015                         Branch Number
     C*
     C                   MOVEL     SVK025        KUCO01
     C                   MOVEL     SVK025        HD0016                         Company number
     C                   MOVEL     SVK025        RN0037                         Company number
     C                   MOVEL     SVKIAL        KUAL02
     C                   MOVEL     SVKIAL        HD0014                         Alpha Search
     C                   MOVEL     SVKIAL        RN0034                         Alpha Search
     C                   MOVEL     SVK026        KUSU03
     C                   MOVEL     SVK026        HD0017                         Supplier Number
     C                   MOVEL     SVK026        RN0039                         Supplier Number
     C                   MOVEL     SVK15         KUBR04
     C                   MOVEL     SVK15         HD0015                         Branch Number
     C                   MOVEL     SVK15         RN0035                         Branch Number
     C*
     C     K0042         SETLL     SUPLIER1                               90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S137   - GETREC D.SUPLIER1,F.SUPLIER1,*PV,SVK025
     C**************************************************************************
     C     S137          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0041         READPE    SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S138                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S138   - Process To Reset File Pointer(BOF) - SUPLIER1
     C**************************************************************************
     C     S138          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.SUPLIER1
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0037        KUCO01
     C     K0041         SETLL     SUPLIER1
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S139   - GETREC D.WAREHED,F.SUPLIER,*NE,SVK025
     C**************************************************************************
     C     S139          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0041         READE     SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S140                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S140   - Process To Reset File Pointer(EOF) - SUPLIER
     C**************************************************************************
     C     S140          BEGSR
     C*
     C     SWRD12        IFNE      'Y'                                          RD.SW.SUPLIER   UOM
     C     STS12         ANDNE     1122                                         RCD LOCK
     C     STS12         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   Z-ADD     STS12         SVS12                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0030        KUCO01
     C     K0041         SETGT     SUPLIER
     C                   Z-ADD     SVS12         STS12                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S141   - GETREC D.SUPLIER1,F.SUPLIER1,*NE,SVK025
     C**************************************************************************
     C     S141          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK025        KUCO01
     C     K0041         READE     SUPLIER1                             9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.SUPLIER1
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.SUPLIER1
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S142                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S142   - Process To Reset File Pointer(EOF) - SUPLIER1
     C**************************************************************************
     C     S142          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.SUPLIER1
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.SUPLIER1
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0037        KUCO01
     C     K0041         SETGT     SUPLIER1
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S143   - SETLL D.WAREHED,F.UOM,SVK028,SVK16
     C**************************************************************************
     C     S143          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C*
     C                   MOVEL     SVK028        KMCO01
     C                   MOVEL     SVK028        HD0018                         Company number
     C                   MOVEL     SVK028        RN0041                         Company number
     C                   MOVEL     SVK16         KMUO02
     C                   MOVEL     SVK16         HMUOM                          Unit of Measure
     C                   MOVEL     SVK16         UMUOM                          Unit of Measure
     C*
     C     K0043         SETLL     UOM                                    90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS13                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S144   - GETREC D.WAREHED,F.UOM,*PV,SVK028
     C**************************************************************************
     C     S144          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KMCO01
     C                   MOVEL     SVK028        KMCO01
     C     K0044         READPE    UOM                                  9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S145                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S145   - Process To Reset File Pointer(BOF) - UOM
     C**************************************************************************
     C     S145          BEGSR
     C*
     C     SWRD13        IFNE      'Y'                                          RD.SW.UOM       WLOC
     C     STS13         ANDNE     1122                                         RCD LOCK
     C     STS13         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   Z-ADD     STS13         SVS13                          SAVE FILE STS
     C                   MOVEL     *BLANK        KMCO01                         Company number
     C                   MOVEL     RN0041        KMCO01
     C     K0044         SETLL     UOM
     C                   Z-ADD     SVS13         STS13                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S146   - GETREC D.WAREHED,F.UOM,*NE,SVK028
     C**************************************************************************
     C     S146          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KMCO01
     C                   MOVEL     SVK028        KMCO01
     C     K0044         READE     UOM                                  9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S147                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S147   - Process To Reset File Pointer(EOF) - UOM
     C**************************************************************************
     C     S147          BEGSR
     C*
     C     SWRD13        IFNE      'Y'                                          RD.SW.UOM       WLOC
     C     STS13         ANDNE     1122                                         RCD LOCK
     C     STS13         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD13                         RD.SW.UOM       WLOC
     C                   Z-ADD     STS13         SVS13                          SAVE FILE STS
     C                   MOVEL     *BLANK        KMCO01                         Company number
     C                   MOVEL     RN0041        KMCO01
     C     K0044         SETGT     UOM
     C                   Z-ADD     SVS13         STS13                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S148   - SETLL D.WAREHED,F.WARETYP,SVK030,SVK17
     C**************************************************************************
     C     S148          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   MOVE      'N'           SWRD10                         RD.SW.WAREDET   WARE
     C                   MOVE      'N'           SWRD15                         RD.SW.WARELOC   ITMM
     C                   MOVE      'N'           SWRD02                         RD.SW.ITMMAST   STOV
     C                   MOVE      'N'           SWRD11                         RD.SW.STOVGP    SUPL
     C                   MOVE      'N'           SWRD12                         RD.SW.SUPLIER   UOM
     C                   MOVE      'N'           SWRD13                         RD.SW.UOM       WLOC
     C                   MOVE      'N'           SWRD14                         RD.SW.WLOCITM1  WRIT
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   MOVE      'N'           SWRD17                         RD.SW.WLOCITM
     C*
     C                   MOVEL     SVK030        KTCO03
     C                   MOVEL     SVK030        HD0022                         Company number
     C                   MOVEL     SVK030        RN0047                         Company number
     C                   MOVEL     SVK17         KTWT04
     C                   MOVEL     SVK17         HTWTYP                         Warehouse Type
     C                   MOVEL     SVK17         WTWTYP                         Warehouse Type
     C*
     C     K0045         SETLL     WARETYP                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS09                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S149   - GETREC D.WAREHED,F.WARETYP,*PV,SVK030
     C**************************************************************************
     C     S149          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     SVK030        KTCO03
     C     K0046         READPE    WARETYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WARETYP   WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S150                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S150   - Process To Reset File Pointer(BOF) - WARETYP
     C**************************************************************************
     C     S150          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WARETYP   WARE
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0047        KTCO03
     C     K0046         SETLL     WARETYP
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(42)        MSGDTA                         The beginning of the
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S151   - GETREC D.WAREHED,F.WARETYP,*NE,SVK030
     C**************************************************************************
     C     S151          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO03
     C                   MOVEL     SVK030        KTCO03
     C     K0046         READE     WARETYP                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.WARETYP   WARE
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S152                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S152   - Process To Reset File Pointer(EOF) - WARETYP
     C**************************************************************************
     C     S152          BEGSR
     C*
     C     SWRD09        IFNE      'Y'                                          RD.SW.WARETYP   WARE
     C     STS09         ANDNE     1122                                         RCD LOCK
     C     STS09         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD09                         RD.SW.WARETYP   WARE
     C                   Z-ADD     STS09         SVS09                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO03                         Company number
     C                   MOVEL     RN0047        KTCO03
     C     K0046         SETGT     WARETYP
     C                   Z-ADD     SVS09         STS09                          RESTORE FILE STS
     C*
     C                   MOVEL     A1(2)         MSGDTA                         The end of the file
     C                   MOVE      'A'           MSGACT                         SET ON ADD FLAG
     C                   EXSR      SMSG                                         GET THE MESSAGE
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for WAREHED
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XHWHSE        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XHWHSE'      FLDNAM
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
     C                   MOVEL     'FLD0068'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0023        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0023'      FLDNAM
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
     C                   MOVEL     'FLD0066'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0004         CHAIN     WARETYP                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XHWTYP'      FLDNAM
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
     C                   MOVEL     'FIL0069'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XHCTYP        IFEQ      N1(1)                                        Lst Valid/Invalid va
     C     XHCTYP        OREQ      N1(2)                                        Valid value
     C     XHCTYP        OREQ      N1(3)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XHCTYP'      FLDNAM
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
     C                   MOVEL     'FLD0008'     MSGID                          Message id.
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
     C* S004V - Detail Screen for WAREDET
     C* Validation subroutine for -- SC0004
     C**************************************************************************
     C     S004V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     K0007         CHAIN     ITMMAST                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDITEM'      FLDNAM
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
     C                   MOVEL     'FIL0019'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0008         CHAIN     UOM                                90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XDUOM         IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDUOM'       FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FIL0061'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     K0009         CHAIN     SUPLIER                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     WK0018        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0018'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C     K0010         CHAIN     STOVGP                             90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C     XDSTOG        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDSTOG'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FIL0051'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDMINB        IFLE      N1(4)                                        High value
     C     XDMINB        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDMINB'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0027'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDMAXB        IFLE      N1(4)                                        High value
     C     XDMAXB        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDMAXB'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0026'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDFIXQ        IFLE      N1(4)                                        High value
     C     XDFIXQ        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDFIXQ'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0015'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDSAFE        IFLE      N1(4)                                        High value
     C     XDSAFE        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDSAFE'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0045'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDEOQ         IFLE      N1(4)                                        High value
     C     XDEOQ         ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDEOQ'       FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0014'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDLTIM        IFLE      N1(6)                                        High value
     C     XDLTIM        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDLTIM'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0024'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDUCST        IFLE      N1(7)                                        High value
     C     XDUCST        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDUCST'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C     XDLCST        IFLE      N1(7)                                        High value
     C     XDLCST        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDLCST'      FLDNAM
     C                   MOVEL     'SC0004'      FLDSCR
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
     C                   MOVEL     'FLD0075'     MSGID                          Message id.
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
     C* S006V - Detail Screen for WLOCITM1
     C* Validation subroutine for -- SC0006
     C**************************************************************************
     C     S006V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XILOCN        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XILOCN'      FLDNAM
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
     C                   MOVEL     'FLD0022'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0042        IFLE      N1(4)                                        High value
     C     WK0042        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0042'      FLDNAM
     C                   MOVEL     'SC0006'      FLDSCR
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
     C                   MOVEL     'FLD0027'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S010V - Detail Screen for WARELOC
     C* Validation subroutine for -- SC0010
     C**************************************************************************
     C     S010V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XLLOCN        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLLOCN'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0022'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLDESC        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLDESC'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0010'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLPCKA        IFEQ      A1(25)                                       Lst Valid/Invalid va
     C     XLPCKA        OREQ      A1(26)                                       Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLPCKA'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0037'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLPCKF        IFEQ      A1(26)                                       Lst Valid/Invalid va
     C     XLPCKF        OREQ      A1(25)                                       Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLPCKF'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0038'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLSIZE        IFLE      N1(8)                                        High value
     C     XLSIZE        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLSIZE'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0048'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLHITE        IFLE      N1(8)                                        High value
     C     XLHITE        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLHITE'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   MOVEL     'FLD0016'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XLWEIG        IFLE      N1(9)                                        High value
     C     XLWEIG        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XLWEIG'      FLDNAM
     C                   MOVEL     'SC0010'      FLDSCR
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
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S012V - Detail Screen for WLOCITM
     C* Validation subroutine for -- SC0012
     C**************************************************************************
     C     S012V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     K0026         CHAIN     WAREDET                            90        Field existence chec
     C*
     C     *IN90         IFEQ      '1'                                          Chain failed
     C                   Z-ADD     0             EXISTF                         Field does not exist
     C                   ELSE                                                   Chain sucessful
     C                   Z-ADD     1             EXISTF                         Field exists
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XIITEM'      FLDNAM
     C                   MOVEL     'SC0012'      FLDSCR
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
     C                   MOVEL     'USR0002'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XIMINB        IFLE      N1(4)                                        High value
     C     XIMINB        ANDGE     N1(5)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XIMINB'      FLDNAM
     C                   MOVEL     'SC0012'      FLDSCR
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
     C                   MOVEL     'FLD0027'     MSGID                          Message id.
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
     C     STS06         IFEQ      1218                                         LOCK(SYS)-WAREHED
     C     STS06         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK06                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK06                          SET ON LOCK FLAG
     C                   END
     C     STS10         IFEQ      1218                                         LOCK(SYS)-WAREDET
     C     STS10         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK10                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK10                          SET ON LOCK FLAG
     C                   END
     C     STS14         IFEQ      1218                                         LOCK(SYS)-WLOCITM1
     C     STS14         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK14                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK14                          SET ON LOCK FLAG
     C                   END
     C     STS15         IFEQ      1218                                         LOCK(SYS)-WARELOC
     C     STS15         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK15                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK15                          SET ON LOCK FLAG
     C                   END
     C     STS17         IFEQ      1218                                         LOCK(SYS)-WLOCITM
     C     STS17         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK17                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK17                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    FILE0001                             91      FILE0001  MWAREHEDD
     C                   READ      FILE0001                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            ITMMAST1
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
     C     WFILE#        IFEQ      2                                            ITMMAST
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
     C     WFILE#        IFEQ      3                                            STOKMOV1
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
     C     WFILE#        IFEQ      4                                            IMSTRN
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
     C     WFILE#        IFEQ      5                                            SUPLIER1
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
     C     WFILE#        IFEQ      6                                            WAREHED
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
     C     WFILE#        IFEQ      7                                            SECIMS
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
     C     WFILE#        IFEQ      8                                            COMPANY
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
     C     WFILE#        IFEQ      9                                            WARETYP
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
     C     WFILE#        IFEQ      11                                           STOVGP
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
     C     WFILE#        IFEQ      12                                           SUPLIER
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
     C     WFILE#        IFEQ      13                                           UOM
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
     C     WFILE#        IFEQ      14                                           WLOCITM1
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
     C     WFILE#        IFEQ      15                                           WARELOC
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
     C     WFILE#        IFEQ      16                                           WRITTYP
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
     C     WFILE#        IFEQ      17                                           WLOCITM
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
     C     WFILE#        IFEQ      18                                           FILE0001
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
     C*          | Move Fields From Work Area To File - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     WK0020        RN0044                         Company number
     C                   MOVEL     XHCRBY        WHCRBY                         Created by
     C                   Z-ADD     WK0021        WHCRDT                         Created Date
     C                   Z-ADD     XHCTYP        WHCTYP                         Costing Type
     C                   Z-ADD     WK0022        WHDTLM                         Amended date
     C                   MOVEL     XHLMBY        WHLMBY                         Amended By
     C                   MOVEL     XHREPC        WHREPC                         Replenishment Cycle
     C                   MOVEL     WK0023        RN0045                         Warehouse Descriptio
     C                   MOVEL     XHWHSE        WHWHSE                         Warehouse Number
     C                   MOVEL     XHWTYP        WHWTYP                         Warehouse Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     WK0015        RN0042                         Company number
     C                   MOVEL     XDCRBY        WDCRBY                         Created By
     C                   Z-ADD     WK0016        WDCRDT                         Created Date
     C                   Z-ADD     XDEOQ         WDEOQ                          Economic order quant
     C                   Z-ADD     XDFIXQ        WDFIXQ                         Fixed Order Quantity
     C                   MOVEL     XDITEM        WDITEM                         Item Number
     C                   Z-ADD     XDLCST        WDLCST                         Cost at last receipt
     C                   MOVEL     XDLMBY        WDLMBY                         Amended By
     C                   Z-ADD     WK0017        WDLMDT                         Amended date
     C                   Z-ADD     XDLTIM        WDLTIM                         Lead Time in days
     C                   Z-ADD     XDMAXB        WDMAXB                         Maximum Balance
     C                   Z-ADD     XDMINB        WDMINB                         Minimum Balance
     C                   Z-ADD     XDOBAL        WDOBAL                         Opening balance
     C                   Z-ADD     XDQAL         WDQAL                          Quantity Allocated
     C                   Z-ADD     XDQBQ         WDQBQ                          Quantity on backorde
     C                   Z-ADD     XDQOH         WDQOH                          Quantity on hand
     C                   Z-ADD     XDQOO         WDQOO                          Quantity on Order
     C                   Z-ADD     XDQOR         WDQOR                          Quantity on reserve
     C                   Z-ADD     XDSAFE        WDSAFE                         Safety Stock Quantit
     C                   MOVEL     XDSBRN        WDSBRN                         Branch Number
     C                   MOVEL     XDSTOG        WDSTOG                         Stock Turnover Group
     C                   MOVEL     WK0018        RN0043                         Supplier Number
     C                   Z-ADD     XDUCST        WDUCST                         Unit Cost
     C                   MOVEL     XDUOM         WDUOM                          Unit of Measure
     C                   MOVEL     WK0019        WDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      14
     C                   MOVEL     WK0036        RN0050                         Company number
     C                   MOVEL     WK0037        WICRBY                         Created By
     C                   Z-ADD     WK0038        WICRDT                         Created Date
     C                   MOVEL     WK0039        WIITEM                         Item Number
     C                   MOVEL     WK0040        WILMBY                         Amended By
     C                   Z-ADD     WK0041        WILMDT                         Amended date
     C                   MOVEL     XILOCN        WILOCN                         Location
     C                   Z-ADD     WK0042        WIMINB                         Minimum Balance
     C                   Z-ADD     WK0043        WIQAL                          Quantity Allocated
     C                   Z-ADD     WK0044        WIQOH                          Quantity on hand
     C                   MOVEL     WK0045        WIWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     WK0024        RN0046                         Company number
     C                   MOVEL     XLCRBY        WLCRBY                         Created By
     C                   Z-ADD     WK0025        WLCRDT                         Created Date
     C                   MOVEL     XLDESC        WLDESC                         Location Description
     C                   Z-ADD     XLHITE        WLHITE                         Height
     C                   MOVEL     XLLMBY        WLLMBY                         Last Maint User
     C                   Z-ADD     WK0026        WLLMDT                         Date last maintained
     C                   MOVEL     XLLOCN        WLLOCN                         Location
     C                   MOVEL     XLPCKA        WLPCKA                         Picking Allowed Y/N
     C                   MOVEL     XLPCKF        WLPCKF                         Pick Face Y/N
     C                   MOVEL     XLPCKR        WLPCKR                         Picking Route
     C                   MOVEL     XLRSTN        WLRSTN                         Restrictions
     C                   Z-ADD     XLSIZE        WLSIZE                         Size
     C                   Z-ADD     XLWEIG        WLWEIG                         Maximum weight
     C                   MOVEL     WK0027        WLWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      17
     C                   MOVEL     WK0031        RN0049                         Company number
     C                   MOVEL     XICRBY        WICRBY                         Created By
     C                   Z-ADD     WK0032        WICRDT                         Created Date
     C                   MOVEL     XIITEM        WIITEM                         Item Number
     C                   MOVEL     XILMBY        WILMBY                         Amended By
     C                   Z-ADD     WK0033        WILMDT                         Amended date
     C                   MOVEL     WK0034        WILOCN                         Location
     C                   Z-ADD     XIMINB        WIMINB                         Minimum Balance
     C                   Z-ADD     XIQAL         WIQAL                          Quantity Allocated
     C                   Z-ADD     XIQOH         WIQOH                          Quantity on hand
     C                   MOVEL     WK0035        WIWHSE                         Warehouse Number
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
     C*          | Move Fields From File To Work Area - ITMMAST1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   MOVEL     RN0018        WK0004                         Alpha Search
     C                   MOVEL     RN0020        WK0005                         Item Description
     C                   MOVEL     ITITEM        WK0006                         Item Number
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0019        HD0005                         Company number
     C                   MOVEL     RN0018        HD0004                         Alpha Search
     C                   MOVEL     ITITEM        HD0006                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0016        WK0001                         Company number
     C                   MOVEL     RN0017        WK0002                         Item Description
     C                   MOVEL     ITITEM        WK0003                         Item Number
     C                   Z-ADD     ITSTUC        WTSTUC                         Standard unit cost
     C                   MOVEL     ITUOM         WTUOM                          Unit of Measure
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0016        HD0003                         Company number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOKMOV1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   Z-ADD     STDTTR        WTDTTR                         Transaction Date
     C                   MOVEL     STLOCN        XTLOCN                         Location
     C                   MOVEL     STLOCT        WTLOCT                         Other Location
     C                   Z-ADD     STTIME        WTTIME                         Expected Time
     C                   Z-ADD     STTQTY        XTTQTY                         Transaction Quantity
     C                   MOVEL     STTREF        XTTREF                         Transaction Referenc
     C                   MOVEL     STTTYP        WTTTYP                         Transaction Type
     C                   MOVEL     STWHST        WTWHST                         Other Warehouse
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0023        HD0008                         Company number
     C                   MOVEL     STWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     RN0024        HD0009                         Item Number
     C                   Z-ADD     STDTTR        HTDTTR                         Transaction Date
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   MOVEL     TTDESC        WTDESC                         Description
     C                   MOVEL     TTONHC        WTONHC                         On Hand Calculation
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0014        HD0002                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0034        WK0011                         Alpha Search
     C                   MOVEL     RN0035        WK0012                         Branch Number
     C                   MOVEL     SUNAME        WUNAME                         Customer name
     C                   MOVEL     RN0039        WK0013                         Supplier Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0037        HD0016                         Company number
     C                   MOVEL     RN0034        HD0014                         Alpha Search
     C                   MOVEL     RN0039        HD0017                         Supplier Number
     C                   MOVEL     RN0035        HD0015                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREHED
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0044        WK0020                         Company number
     C                   MOVEL     WHCRBY        XHCRBY                         Created by
     C                   Z-ADD     WHCRDT        WK0021                         Created Date
     C                   Z-ADD     WHCTYP        XHCTYP                         Costing Type
     C                   Z-ADD     WHDTLM        WK0022                         Amended date
     C                   MOVEL     WHLMBY        XHLMBY                         Amended By
     C                   MOVEL     WHREPC        XHREPC                         Replenishment Cycle
     C                   MOVEL     RN0045        WK0023                         Warehouse Descriptio
     C                   MOVEL     WHWHSE        XHWHSE                         Warehouse Number
     C                   MOVEL     WHWTYP        XHWTYP                         Warehouse Type
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0044        HD0020                         Company number
     C                   MOVEL     WHWHSE        HHWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SECIMS
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     USUGRP        WSUGRP                         Group User
     C                   MOVEL     USWHSE        WSWHSE                         Allowed Warehouse
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0021        HD0007                         Company number
     C                   MOVEL     USUSER        HSUSER                         User
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0008        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARETYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     RN0047        WK0028                         Company number
     C                   MOVEL     RN0048        WK0029                         Warehouse Descriptio
     C                   MOVEL     WTWTYP        WK0030                         Warehouse Type
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0047        HD0022                         Company number
     C                   MOVEL     WTWTYP        HTWTYP                         Warehouse Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   MOVEL     RN0042        WK0015                         Company number
     C                   MOVEL     WDCRBY        XDCRBY                         Created By
     C                   Z-ADD     WDCRDT        WK0016                         Created Date
     C                   Z-ADD     WDEOQ         XDEOQ                          Economic order quant
     C                   Z-ADD     WDFIXQ        XDFIXQ                         Fixed Order Quantity
     C                   MOVEL     WDITEM        XDITEM                         Item Number
     C                   Z-ADD     WDLCST        XDLCST                         Cost at last receipt
     C                   MOVEL     WDLMBY        XDLMBY                         Amended By
     C                   Z-ADD     WDLMDT        WK0017                         Amended date
     C                   Z-ADD     WDLTIM        XDLTIM                         Lead Time in days
     C                   Z-ADD     WDMAXB        XDMAXB                         Maximum Balance
     C                   Z-ADD     WDMINB        XDMINB                         Minimum Balance
     C                   Z-ADD     WDOBAL        XDOBAL                         Opening balance
     C                   Z-ADD     WDQAL         XDQAL                          Quantity Allocated
     C                   Z-ADD     WDQBQ         XDQBQ                          Quantity on backorde
     C                   Z-ADD     WDQOH         XDQOH                          Quantity on hand
     C                   Z-ADD     WDQOO         XDQOO                          Quantity on Order
     C                   Z-ADD     WDQOR         XDQOR                          Quantity on reserve
     C                   Z-ADD     WDSAFE        XDSAFE                         Safety Stock Quantit
     C                   MOVEL     WDSBRN        XDSBRN                         Branch Number
     C                   MOVEL     WDSTOG        XDSTOG                         Stock Turnover Group
     C                   MOVEL     RN0043        WK0018                         Supplier Number
     C                   Z-ADD     WDUCST        XDUCST                         Unit Cost
     C                   MOVEL     WDUOM         XDUOM                          Unit of Measure
     C                   MOVEL     WDWHSE        WK0019                         Warehouse Number
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0042        HD0019                         Company number
     C                   MOVEL     WDWHSE        HDWHSE                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - STOVGP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     RN0026        WK0007                         Company number
     C                   MOVEL     TGDESC        XGDESC                         S.T.G. Description
     C                   MOVEL     TGSTOG        WGSTOG                         Stock Turnover Group
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0026        HD0010                         Company number
     C                   MOVEL     TGSTOG        HGSTOG                         Stock Turnover Group
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   MOVEL     RN0028        WK0008                         Branch Number
     C                   MOVEL     RN0030        WK0009                         Company number
     C                   MOVEL     SUNAME        XUNAME                         Customer name
     C                   MOVEL     RN0032        WK0010                         Supplier Number
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     RN0030        HD0012                         Company number
     C                   MOVEL     RN0032        HD0013                         Supplier Number
     C                   MOVEL     RN0028        HD0011                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - UOM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      13
     C                   MOVEL     RN0041        WK0014                         Company number
     C                   Z-ADD     UMQTYO        WMQTYO                         Quantity per unit
     C                   MOVEL     UMUOM         WMUOM                          Unit of Measure
     C                   Z-ADD     REC13         HRC13
     C                   MOVEL     RN0041        HD0018                         Company number
     C                   MOVEL     UMUOM         HMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM1
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      14
     C                   MOVEL     RN0050        WK0036                         Company number
     C                   MOVEL     WICRBY        WK0037                         Created By
     C                   Z-ADD     WICRDT        WK0038                         Created Date
     C                   MOVEL     WIITEM        WK0039                         Item Number
     C                   MOVEL     WILMBY        WK0040                         Amended By
     C                   Z-ADD     WILMDT        WK0041                         Amended date
     C                   MOVEL     WILOCN        XILOCN                         Location
     C                   Z-ADD     WIMINB        WK0042                         Minimum Balance
     C                   Z-ADD     WIQAL         WK0043                         Quantity Allocated
     C                   Z-ADD     WIQOH         WK0044                         Quantity on hand
     C                   MOVEL     WIWHSE        WK0045                         Warehouse Number
     C                   Z-ADD     REC14         HRC14
     C                   MOVEL     RN0050        HD0024                         Company number
     C                   MOVEL     WIWHSE        HD0027                         Warehouse Number
     C                   MOVEL     WIITEM        HD0025                         Item Number
     C                   MOVEL     WILOCN        HD0026                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WARELOC
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     RN0046        WK0024                         Company number
     C                   MOVEL     WLCRBY        XLCRBY                         Created By
     C                   Z-ADD     WLCRDT        WK0025                         Created Date
     C                   MOVEL     WLDESC        XLDESC                         Location Description
     C                   Z-ADD     WLHITE        XLHITE                         Height
     C                   MOVEL     WLLMBY        XLLMBY                         Last Maint User
     C                   Z-ADD     WLLMDT        WK0026                         Date last maintained
     C                   MOVEL     WLLOCN        XLLOCN                         Location
     C                   MOVEL     WLPCKA        XLPCKA                         Picking Allowed Y/N
     C                   MOVEL     WLPCKF        XLPCKF                         Pick Face Y/N
     C                   MOVEL     WLPCKR        XLPCKR                         Picking Route
     C                   MOVEL     WLRSTN        XLRSTN                         Restrictions
     C                   Z-ADD     WLSIZE        XLSIZE                         Size
     C                   Z-ADD     WLWEIG        XLWEIG                         Maximum weight
     C                   MOVEL     WLWHSE        WK0027                         Warehouse Number
     C                   Z-ADD     REC15         HRC15
     C                   MOVEL     RN0046        HD0021                         Company number
     C                   MOVEL     WLWHSE        HLWHSE                         Warehouse Number
     C                   MOVEL     WLLOCN        HLLOCN                         Location
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      16
     C                   MOVEL     RN0051        WK0046                         Company number
     C                   MOVEL     WTITEM        WK0047                         Item Number
     C                   MOVEL     WTTRNC        XTTRNC                         Transaction Type
     C                   Z-ADD     WTTRPQ        XTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        XTTRPV                         Trans Period Value
     C                   Z-ADD     WTTRYQ        XTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        XTTRYV                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0048                         Warehouse Number
     C                   Z-ADD     REC16         HRC16
     C                   MOVEL     RN0051        HD0028                         Company number
     C                   MOVEL     WTWHSE        HD0031                         Warehouse Number
     C                   MOVEL     WTITEM        HD0029                         Item Number
     C                   MOVEL     WTTRNC        HD0030                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WLOCITM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      17
     C                   MOVEL     RN0049        WK0031                         Company number
     C                   MOVEL     WICRBY        XICRBY                         Created By
     C                   Z-ADD     WICRDT        WK0032                         Created Date
     C                   MOVEL     WIITEM        XIITEM                         Item Number
     C                   MOVEL     WILMBY        XILMBY                         Amended By
     C                   Z-ADD     WILMDT        WK0033                         Amended date
     C                   MOVEL     WILOCN        WK0034                         Location
     C                   Z-ADD     WIMINB        XIMINB                         Minimum Balance
     C                   Z-ADD     WIQAL         XIQAL                          Quantity Allocated
     C                   Z-ADD     WIQOH         XIQOH                          Quantity on hand
     C                   MOVEL     WIWHSE        WK0035                         Warehouse Number
     C                   Z-ADD     REC17         HRC17
     C                   MOVEL     RN0049        HD0023                         Company number
     C                   MOVEL     WIWHSE        HIWHSE                         Warehouse Number
     C                   MOVEL     WILOCN        HILOCN                         Location
     C                   MOVEL     WIITEM        HIITEM                         Item Number
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
     C                   END
     C                   ENDSR
     C/EJECT
     C********************************************************************
     C*            C o m p i l e   T i m e   A r r a y
     C*               I n i t i a l i z a t i o n
     C********************************************************************
**   Alpha Constant Array - A1

The end of the file was reached
Record deleted from file IMS Warehouse Header        WH
No record found to delete from file IMS Warehouse Header        WH
Record update for file IMS Warehouse Header        WH
Unable to update record for file IMS Warehouse Header        WH
Record added to file IMS Warehouse Header        WH
Unable to add record to file IMS Warehouse Header        WH
WAREDET   WLOCITM1
Record deleted from file IMS Warehouse Item Details  WD
No record found to delete from file IMS Warehouse Item Details  WD
WAREDET   ITMMAST
Record update for file IMS Warehouse Item Details  WD
Unable to update record for file IMS Warehouse Item Details  WD
Record added to file IMS Warehouse Item Details  WD
Unable to add record to file IMS Warehouse Item Details  WD
Record deleted from file IMS Loc Item In item loc
No record found to delete from file IMS Loc Item In item loc
WLOCITM1  WAREDET
WLOCITM1  WARELOC
Record update for file IMS Loc Item In item loc
Unable to update record for file IMS Loc Item In item loc
Record added to file IMS Loc Item In item loc
Unable to add record to file IMS Loc Item In item loc
N
Y
WARELOC   WLOCITM
Record deleted from file IMS Warehouse Locations     WL
No record found to delete from file IMS Warehouse Locations     WL
Record update for file IMS Warehouse Locations     WL
Unable to update record for file IMS Warehouse Locations     WL
Record added to file IMS Warehouse Locations     WL
Unable to add record to file IMS Warehouse Locations     WL
Record deleted from file IMS Warehouse Location Item WI
No record found to delete from file IMS Warehouse Location Item WI
WLOCITM   WAREDET
WLOCITM   WARELOC
Record update for file IMS Warehouse Location Item WI
Unable to update record for file IMS Warehouse Location Item WI
Record added to file IMS Warehouse Location Item WI
Unable to add record to file IMS Warehouse Location Item WI
The beginning of the file was reached
**   Numeric Constant Array - N1
000000000000000000001000000000
000000000000000000002000000000
000000000000000000003000000000
000000000000999999999000000000
000000000000000000000000000000
000000000000000000999000000000
000000000000009999999999900000
000000000000000099999000000000
000000000099999999999990000000
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SC0002    XHWTYP    000005940595
SC0004    XDITEM    000004230442
SC0004    XDSTOG    000007430743
SC0004    WK0018    000006630668
SC0004    XDUOM     000005830587
SC0006    XILOCN    000007450754
SC0012    XIITEM    000006650684
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SCMOVE    XYDESC    0000  06      06
SCMOVE    XTLOCN    0000  03      03
SCMOVE    XTTQTY    0000  04      04
SCMOVE    XTTREF    0000  05      05
SCMOVE    XDITEM    0000  02      02
SC0001    XYDESC    0000  06      06
SC0002    XYDESC    0000  09      09
SC0002    XHCTYP    0000  04      04
SC0002    WK0023    0000  03      03
SC0002    XHWHSE    0000  0507    05  06
SC0002    XHWTYP    0000  08      08
SC0003    XYDESC    0000  06      06
SC0003    XDITEM    0000  05      05
SC0004    XYDESC    0000  17      17
SC0004    XDEOQ     0000  04      04
SC0004    XDFIXQ    0000  05      05
SC0004    XDITEM    0000  0608    06  07
SC0004    XDLCST    0000  09      09
SC0004    XDLTIM    0000  10      10
SC0004    XDMAXB    0000  11      11
SC0004    XDMINB    0000  12      12
SC0004    XDSAFE    0000  13      13
SC0004    XDSTOG    0000  14      14
SC0004    WK0018    0000  03      03
SC0004    XDUCST    0000  15      15
SC0004    XDUOM     0000  16      16
SC0005    XYDESC    0000  06      06
SC0005    XILOCN    0000  05      05
SC0006    XYDESC    0000  08      08
SC0006    XLDESC    0000  07      07
SC0006    XILOCN    0000  0406    04  05
SC0006    WK0042    0000  0103    01  02
SC0007    XYDESC    0000  01      01
SC0009    XYDESC    0000  05      05
SC0010    XYDESC    0000  12      12
SC0010    XLDESC    0000  03      03
SC0010    XLHITE    0000  04      04
SC0010    XLLOCN    0000  0507    05  06
SC0010    XLPCKA    0000  08      08
SC0010    XLPCKF    0000  09      09
SC0010    XLSIZE    0000  10      10
SC0010    XLWEIG    0000  11      11
SC0011    XYDESC    0000  06      06
SC0011    XIITEM    0000  05      05
SC0012    XYDESC    0000  08      08
SC0012    WK0002    0000  01      01
SC0012    XIITEM    0000  0204    02  03
SC0012    XIMINB    0000  0507    05  06
SC0018    WK0023    0000  11      11
SC0018    XHWHSE    0000  12      12
SC0019    WK0023    0000  11      11
SC0019    XHWHSE    0000  12      12
SCIALP    T01       0001            0201
SCIALP    T01       0002            0403
SCIALP    T01       0003            0605
SCIALP    T01       0004            0807
SCIALP    T01       0005            1009
SCMOVE    FL0023    0000            01
SCSALP    T07       0001            0201
SCSALP    T07       0002            0403
SCSALP    T07       0003            0605
SCSALP    T07       0004            0807
SCSALP    T07       0005            1009
SC0001    PS0102    0000              05
SC0001    FL0001    0000  0103    010402               Y
SC0002    INPUT     0000    02        01
SC0003    FL0002    0000  0103    010402               Y
SC0004    GROUP001  0000    02        01
SC0005    FL0004    0000  0103    010402               Y
SC0009    FL0006    0000  0103    010402               Y
SC0010    GROUP002  0000    02        01
SC0011    FL0007    0000  0103    010402               Y
SC0013    T01       0001            0201
SC0013    T01       0002            0403
SC0013    T01       0003            0605
SC0013    T01       0004            0807
SC0013    T01       0005            1009
SC0014    T04       0001            0201
SC0014    T04       0002            0403
SC0014    T04       0003            0605
SC0014    T04       0004            0807
SC0014    T04       0005            1009
SC0015    T07       0001            0201
SC0015    T07       0002            0403
SC0015    T07       0003            0605
SC0015    T07       0004            0807
SC0015    T07       0005            1009
SC0016    T11       0001            0201
SC0016    T11       0002            0403
SC0016    T11       0003            0605
SC0016    T11       0004            0807
SC0016    T11       0005            1009
SC0017    T14       0001            0201
SC0017    T14       0002            0403
SC0017    T14       0003            0605
SC0017    T14       0004            0807
SC0017    T14       0005            1009
SC0018    T01       0001            0201
SC0018    T01       0002            0403
SC0018    T01       0003            0605
SC0018    T01       0004            0807
SC0018    T01       0005            1009
SC0019    T01       0001            0201
SC0019    T01       0002            0403
SC0019    T01       0003            0605
SC0019    T01       0004            0807
SC0019    T01       0005            1009
