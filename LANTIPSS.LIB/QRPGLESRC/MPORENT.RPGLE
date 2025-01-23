     F/TITLE MPORENT     Purchase Order Entry
     F********************************************************************
     F* Copyright 2012    ** KDP Software Ltd **      All Rights Reserved
     F********************************************************************
     F*
     F*  Program ID          -    MPORENT
     F*  Application ID      -    MPORENT
     F*  Application Name    -        Purchase Order Entry
     F*  Date Generated      -    Jan 12, 2012
     F*
     F********************************************************************
     F*  Program Narrative
     F*
     F*  Modified By KP 01/03/02 - add deliver via use PHWNAME
     F*  Modified By KP 12/12/03 - Use Supplier Item file first the look at
     F*                          - the IMS Item File
     F*
     F********************************************************************
     F*  Files Usage
     F*
     F*  IPSCPYD     - (U/DISK   ) IPS Company Details         CD
     F*  PORDH       - (U/DISK   ) Purchase Order header       PH
     F*  PORDD       - (U/DISK   ) Purchase Order Detail       PO
     F*  WAREDET     - (U/DISK   ) Warehouse - Item Details
     F*  IPSWADD     - (I/DISK   ) IPS Wharehouse address
     F*  SUPLIER     - (I/DISK   ) Supplier Name and Address
     F*  USERDEF     - (I/DISK   ) User Defaults               UD
     F*  COMPANY     - (I/DISK   ) Company screen headings     CY
     F*  IMSCPYD     - (I/DISK   ) IMS Company Details         CD
     F*  IMSTRN      - (I/DISK   ) IMS Transaction Types       TT
     F*  IPSTXTH     - (U/DISK   ) Purchase Order Text header  TH
     F*  IPSITEM     - (I/DISK   ) IPS Supplied Items
     F*  ITMMAST     - (I/DISK   ) Item Master
     F*  UOM         - (I/DISK   ) Unit of measure             UM
     F*  PODTALT     - (I/DISK   ) Purchase Order Altered Details
     F*  WRITTYP     - (U/DISK   ) IMS Warehouse Item Types    WT
     F*  IPSTXTD     - (U/DISK   ) Purchase Order Detail Text  TD
     F*  PODTALTX    - (U/DISK   ) Purchase Order Altered Details
     F*  MPORENTD    - (C/WORKSTN) Generated display file
     F*
     F********************************************************************
     F*  Function Of Indicators
     F*
     F*  SCDELD     - Display Details before Delete
     F*
     F*  01     - SCR014S1 / POQORD : DSPATR(ND)
     F*  63     - SCR014C1 SFLDSPCTL
     F*  64     - SCR014C1 SFLDSP
     F*  65     - SCR014S1 SFLNXTCHG
     F*  66     - SCR014C1 SFLINZ
     F*  99     - SCR014 OVERLAY
     F* N63     - SCR014C1 SFLCLR
     F* N64     - SCR014C1 ERASE(SCR014S1)
     F* N67     - SCR014C1 SFLEND
     F* N79     - SCR014 PUTOVR
     F* N79     - SCR014C1 PUTOVR
     F*
     F*  SCRADD     - Screen for additions
     F*
     F*  01     - SCR010 / RN0105 : DSPATR(PC)
     F*  01     - SCR010 / RN0105 : DSPATR(RI)
     F*  02     - SCR010 / RN0105 : DSPATR(UL)
     F*  03     - SCR010 / PHWHSE : DSPATR(PC)
     F*  03     - SCR010 / PHWHSE : DSPATR(RI)
     F*  04     - SCR010 / PHWHSE : DSPATR(UL)
     F*  99     - SCR010 OVERLAY
     F* N79     - SCR010 PUTOVR
     F*
     F*  SC0001     - List Screen for PORDH
     F*
     F*  01     - SCR001S1 / FL0001 : DSPATR(PC)
     F*  01     - SCR001S1 / FL0001 : DSPATR(RI)
     F*  02     - SCR001S1 / FL0001 : DSPATR(PR)
     F*  03     - SCR001S1 / FL0001 : DSPATR(UL)
     F*  04     - SCR001S1 / FL0001 : DSPATR(ND)
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
     F*  SC0002     - Detail Screen for PORDH
     F*
     F*  01     - SCR002 / RN0024 : DSPATR(PR)
     F*  02     - SCR002 / RN0025 : DSPATR(PR)
     F*  03     - SCR002 / RN0026 : DSPATR(PC)
     F*  03     - SCR002 / RN0026 : DSPATR(RI)
     F*  04     - SCR002 / RN0026 : DSPATR(PR)
     F*  05     - SCR002 / RN0026 : DSPATR(UL)
     F*  06     - SCR002 / RN0084 : DSPATR(PR)
     F*  07     - SCR002 / RN0085 : DSPATR(PR)
     F*  08     - SCR002 / RN0087 : DSPATR(PR)
     F*  09     - SCR002 / RN0089 : DSPATR(PR)
     F*  10     - SCR002 / RN0093 : DSPATR(PR)
     F*  11     - SCR002 / RN0097 : DSPATR(PC)
     F*  11     - SCR002 / RN0097 : DSPATR(RI)
     F*  12     - SCR002 / RN0097 : DSPATR(PR)
     F*  13     - SCR002 / RN0097 : DSPATR(UL)
     F*  14     - SCR002 / RN0098 : DSPATR(PR)
     F*  15     - SCR002 / RN0099 : DSPATR(PR)
     F*  16     - SCR002 / RN0100 : DSPATR(PR)
     F*  17     - SCR002 / RN0101 : DSPATR(PR)
     F*  18     - SCR002 / RN0102 : DSPATR(PR)
     F*  19     - SCR002 / RN0103 : DSPATR(PC)
     F*  19     - SCR002 / RN0103 : DSPATR(RI)
     F*  20     - SCR002 / RN0103 : DSPATR(PR)
     F*  21     - SCR002 / RN0103 : DSPATR(UL)
     F*  22     - SCR002 / RN0104 : DSPATR(PC)
     F*  22     - SCR002 / RN0104 : DSPATR(RI)
     F*  23     - SCR002 / RN0104 : DSPATR(PR)
     F*  24     - SCR002 / RN0104 : DSPATR(UL)
     F*  25     - SCR002 / RN0105 : DSPATR(PC)
     F*  25     - SCR002 / RN0105 : DSPATR(RI)
     F*  26     - SCR002 / RN0105 : DSPATR(PR)
     F*  27     - SCR002 / RN0105 : DSPATR(UL)
     F*  28     - SCR002 / RN0106 : DSPATR(PC)
     F*  28     - SCR002 / RN0106 : DSPATR(RI)
     F*  29     - SCR002 / RN0106 : DSPATR(PR)
     F*  30     - SCR002 / RN0106 : DSPATR(UL)
     F*  31     - SCR002 / RN0107 : DSPATR(PR)
     F*  32     - SCR002 / RN0108 : DSPATR(PR)
     F*  33     - SCR002 / RN0109 : DSPATR(PR)
     F*  34     - SCR002 / RN0110 : DSPATR(PR)
     F*  35     - SCR002 / RN0112 : DSPATR(PC)
     F*  35     - SCR002 / RN0112 : DSPATR(RI)
     F*  36     - SCR002 / RN0112 : DSPATR(PR)
     F*  37     - SCR002 / RN0112 : DSPATR(UL)
     F*  38     - SCR002 / RN0113 : DSPATR(PC)
     F*  38     - SCR002 / RN0113 : DSPATR(RI)
     F*  39     - SCR002 / RN0113 : DSPATR(PR)
     F*  40     - SCR002 / RN0113 : DSPATR(UL)
     F*  99     - SCR002 OVERLAY
     F* N79     - SCR002 PUTOVR
     F*
     F*  SC0003     - List Screen for IPSTXTH
     F*
     F*  01     - SCR003S1 / FL0002 : DSPATR(PC)
     F*  01     - SCR003S1 / FL0002 : DSPATR(RI)
     F*  02     - SCR003S1 / FL0002 : DSPATR(UL)
     F*  03     - SCR003S1 / THTCDE : DSPATR(PC)
     F*  03     - SCR003S1 / THTCDE : DSPATR(RI)
     F*  04     - SCR003S1 / THTCDE : DSPATR(UL)
     F*  05     - SCR003S1 / THTEXT : DSPATR(PC)
     F*  05     - SCR003S1 / THTEXT : DSPATR(RI)
     F*  06     - SCR003S1 / THTEXT : DSPATR(UL)
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
     F*  SC0005     - List Screen for PORDD
     F*
     F*  01     - SCR004S1 / FL0003 : DSPATR(PC)
     F*  01     - SCR004S1 / FL0003 : DSPATR(RI)
     F*  02     - SCR004S1 / FL0003 : DSPATR(PR)
     F*  03     - SCR004S1 / FL0003 : DSPATR(UL)
     F*  04     - SCR004S1 / FL0003 : DSPATR(ND)
     F*  05     - SCR004S1 / POQORD : DSPATR(ND)
     F*  63     - SCR004C1 SFLDSPCTL
     F*  64     - SCR004C1 SFLDSP
     F*  65     - SCR004S1 SFLNXTCHG
     F*  66     - SCR004C1 SFLINZ
     F*  99     - SCR004 OVERLAY
     F* N63     - SCR004C1 SFLCLR
     F* N64     - SCR004C1 ERASE(SCR004S1)
     F* N67     - SCR004C1 SFLEND
     F* N79     - SCR004 PUTOVR
     F* N79     - SCR004C1 PUTOVR
     F*
     F*  SC0006     - Detail Screen for PORDD
     F*
     F*  01     - SCR005 / RN0026 : DSPATR(PC)
     F*  01     - SCR005 / RN0026 : DSPATR(RI)
     F*  02     - SCR005 / RN0026 : DSPATR(PR)
     F*  03     - SCR005 / RN0026 : DSPATR(UL)
     F*  04     - SCR005 / RN0079 : DSPATR(PC)
     F*  04     - SCR005 / RN0079 : DSPATR(RI)
     F*  05     - SCR005 / RN0079 : DSPATR(PR)
     F*  06     - SCR005 / RN0079 : DSPATR(UL)
     F*  07     - SCR005 / RN0080 : DSPATR(PC)
     F*  07     - SCR005 / RN0080 : DSPATR(RI)
     F*  08     - SCR005 / RN0080 : DSPATR(PR)
     F*  09     - SCR005 / RN0080 : DSPATR(UL)
     F*  10     - SCR005 / RN0081 : DSPATR(PC)
     F*  10     - SCR005 / RN0081 : DSPATR(RI)
     F*  11     - SCR005 / RN0081 : DSPATR(PR)
     F*  12     - SCR005 / RN0081 : DSPATR(UL)
     F*  13     - SCR005 / WSFOC : DSPATR(PR)
     F*  14     - SCR005 / POITEM : DSPATR(PC)
     F*  14     - SCR005 / POITEM : DSPATR(RI)
     F*  15     - SCR005 / POITEM : DSPATR(PR)
     F*  16     - SCR005 / POITEM : DSPATR(UL)
     F*  17     - SCR005 / POQORD : DSPATR(PC)
     F*  17     - SCR005 / POQORD : DSPATR(RI)
     F*  18     - SCR005 / POQORD : DSPATR(PR)
     F*  19     - SCR005 / POQORD : DSPATR(UL)
     F*  20     - SCR005 / POUOM : DSPATR(PC)
     F*  20     - SCR005 / POUOM : DSPATR(RI)
     F*  21     - SCR005 / POUOM : DSPATR(PR)
     F*  22     - SCR005 / POUOM : DSPATR(UL)
     F*  23     - SCR005 / POWHSE : DSPATR(PC)
     F*  23     - SCR005 / POWHSE : DSPATR(RI)
     F*  24     - SCR005 / POWHSE : DSPATR(PR)
     F*  25     - SCR005 / POWHSE : DSPATR(UL)
     F*  99     - SCR005 OVERLAY
     F* N79     - SCR005 PUTOVR
     F*
     F*  SC0007     - List Screen for IPSTXTD
     F*
     F*  01     - SCR006S1 / FL0005 : DSPATR(PC)
     F*  01     - SCR006S1 / FL0005 : DSPATR(RI)
     F*  02     - SCR006S1 / FL0005 : DSPATR(UL)
     F*  03     - SCR006S1 / TDTCDE : DSPATR(PC)
     F*  03     - SCR006S1 / TDTCDE : DSPATR(RI)
     F*  04     - SCR006S1 / TDTCDE : DSPATR(UL)
     F*  05     - SCR006S1 / TDTEXT : DSPATR(PC)
     F*  05     - SCR006S1 / TDTEXT : DSPATR(RI)
     F*  06     - SCR006S1 / TDTEXT : DSPATR(UL)
     F*  63     - SCR006C1 SFLDSPCTL
     F*  64     - SCR006C1 SFLDSP
     F*  65     - SCR006S1 SFLNXTCHG
     F*  66     - SCR006C1 SFLINZ
     F*  99     - SCR006 OVERLAY
     F* N63     - SCR006C1 SFLCLR
     F* N64     - SCR006C1 ERASE(SCR006S1)
     F* N67     - SCR006C1 SFLEND
     F* N79     - SCR006 PUTOVR
     F* N79     - SCR006C1 PUTOVR
     F*
     F*  SC0008     - Valid Warehouse Numbers
     F*
     F*  01     - SCR007 / T01 : DSPATR(PR)
     F*  02     - SCR007 / T01 : DSPATR(ND)
     F*  03     - SCR007 / T01 : DSPATR(PR)
     F*  04     - SCR007 / T01 : DSPATR(ND)
     F*  05     - SCR007 / T01 : DSPATR(PR)
     F*  06     - SCR007 / T01 : DSPATR(ND)
     F*  07     - SCR007 / T01 : DSPATR(PR)
     F*  08     - SCR007 / T01 : DSPATR(ND)
     F*  09     - SCR007 / T01 : DSPATR(PR)
     F*  10     - SCR007 / T01 : DSPATR(ND)
     F* N79     - SCR007 PUTOVR
     F*
     F*  SC0009     - Valid Item Numbers
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
     F* N79     - SCR008 PUTOVR
     F*
     F*  SC0010     - Valid Units of Measure
     F*
     F*  01     - SCR009 / T07 : DSPATR(PR)
     F*  02     - SCR009 / T07 : DSPATR(ND)
     F*  03     - SCR009 / T07 : DSPATR(PR)
     F*  04     - SCR009 / T07 : DSPATR(ND)
     F*  05     - SCR009 / T07 : DSPATR(PR)
     F*  06     - SCR009 / T07 : DSPATR(ND)
     F*  07     - SCR009 / T07 : DSPATR(PR)
     F*  08     - SCR009 / T07 : DSPATR(ND)
     F*  09     - SCR009 / T07 : DSPATR(PR)
     F*  10     - SCR009 / T07 : DSPATR(ND)
     F* N79     - SCR009 PUTOVR
     F*
     F*  SC0012     - Valid Suppliers
     F*
     F*  01     - SCR011 / T12 : DSPATR(PR)
     F*  02     - SCR011 / T12 : DSPATR(ND)
     F*  03     - SCR011 / T12 : DSPATR(PR)
     F*  04     - SCR011 / T12 : DSPATR(ND)
     F*  05     - SCR011 / T12 : DSPATR(PR)
     F*  06     - SCR011 / T12 : DSPATR(ND)
     F*  07     - SCR011 / T12 : DSPATR(PR)
     F*  08     - SCR011 / T12 : DSPATR(ND)
     F*  09     - SCR011 / T12 : DSPATR(PR)
     F*  10     - SCR011 / T12 : DSPATR(ND)
     F* N79     - SCR011 PUTOVR
     F*
     F*  SDET       - Supplier Details changed
     F*
     F* N79     - SCR015 PUTOVR
     F*
     F*  SETSPEC    - Set Special Details
     F*
     F*  01     - SCR012 / PHOS04 : DSPATR(PC)
     F*  01     - SCR012 / PHOS04 : DSPATR(RI)
     F*  02     - SCR012 / PHOS04 : DSPATR(UL)
     F* N79     - SCR012 PUTOVR
     F*
     F*  SUPP       - Supplier Changed
     F*
     F* N79     - SCR013 PUTOVR
     F*
     F********************************************************************
     F*  Function Of Subroutines
     F*
     F* SMAIN - Main flow of the program.
     F* SEND - END of program.
     F* S001 - List Screen for PORDH
     F* S002 - Detail Screen for PORDH
     F* S003 - List Screen for IPSTXTH
     F* S004 - List Screen for PORDD
     F* S005 - Detail Screen for PORDD
     F* S006 - List Screen for IPSTXTD
     F* S007 - Valid Warehouse Numbers
     F* S008 - Valid Item Numbers
     F* S009 - Valid Units of Measure
     F* S010 - Screen for additions
     F* S011 - Valid Suppliers
     F* S012 - Set Special Details
     F* S013 - Supplier Changed
     F* S014 - Display Details before Delete
     F* S015 - Supplier Details changed
     F* SREDSP -  Redisplay Windows within stack.
     F* CMPSAV - Compare supplier details
     F* S500 - Save Supp. details for compare
     F* SRNUMB - Update
     F* SRUPD - Update
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
     F* S07EDT - SCRN SUB
     F* S07FWD - SCRN SUB
     F* S08ABR - SCRN SUB
     F* S08AFR - SCRN SUB
     F* S08ALD - SCRN SUB
     F* S09ABR - SCRN SUB
     F* S09AFR - SCRN SUB
     F* S09ALD - SCRN SUB
     F* S10ABR - SCRN SUB
     F* S10AFR - SCRN SUB
     F* S10ALD - SCRN SUB
     F* S12ABR - SCRN SUB
     F* S12AFR - SCRN SUB
     F* S12ALD - SCRN SUB
     F* S75BKW - Roll Back
     F* S75FWD - Roll Forward
     F* SY0010 - Format Date
     F* SY0020 - Alpha date to numeric
     F* SY0030 - Validate a Date
     F* SREM - Calculates the remainder of a division.
     F* SNOD - Convert date to number of days since Jan 1, 1900 B.C.
     F* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     F* SCTD - Convert number of days into date .
     F* SMSG - calls message handling program to either clear, add, or
     F* S016   - GETREC D.COMPANY,*EQ,COYNO#
     F* S017   - GETREC D.imscpyd,f.imscpyd,*EQ,COYNO#
     F* S018   - SETLL D.PORENT,F.PORDH,SVK001
     F* S019   - SETLL D.PORENT,F.PORDH,SVK001,SVK002
     F* S020   - GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     F* S021   - GETREC D.PORENT,F.PORDH,*eq,SVK001,SVK002
     F* S022   - CLRSCR SETSPEC
     F* S023   - GETREC D.PORENT,F.ipswadd,*eq,COYNO#,phwhse
     F* S024   - GETREC D.PORENT,F.suplier,*eq,COYNO#,phsuppn,phbrnbr
     F* S025   - DELETE D.PORENT,F.PORDH
     F* S026   - SETLL D.PORENT,F.IPSTXTH,SVK003,SVK004,SVK005
     F* S027   - SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     F* S028   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     F* S029   - GETREC D.PORENT,F.PORDh,*eq,pocoyno,popord
     F* S030   - GETREC D.PORENT,F.PORDD,*lock,*eq,SVK006,SVK007,SVK008
     F* S031   - GETREC D.PORENT,F.PORDD,*eq,SVK006,SVK007,SVK008
     F* S032   - DELETE D.PORENT,F.PORDD
     F* S033   - GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     F* S034   - UPDATE D.PORENT,f.waredet
     F* S035   - Referential Integrity Check (Update) For File WAREDET
     F* S036   - GETREC D.IPSITEM,F.IPSITEM,*EQ,COYNO#,PHSUPPN,PHBRNBR,POITEM
     F* S037   - GETREC D.PORENT,F.IPSWADD,*EQ,COYNO#,POWHSE
     F* S038   - WRITE d.poDTALT,f.podtalt
     F* S039   - UPDATE D.PORENT,F.PORDD
     F* S040   - WRITE D.PORENT,F.PORDD
     F* S041   - GETREC d.PORENT,f.itmmast,*eq,COYNO#,poitem
     F* S042   - GETREC D.PORENT,F.UOM,*eq,COYNO#,POUOM
     F* S043   - GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNP
     F* S044   - UPDATE D.WAREHED,F.WRITTYP
     F* S045   - WRITE D.WAREHED,F.WRITTYP
     F* S046   - SETLL D.PORENT,F.IPSTXTD,SVK009,SVK010,SVK011,SVK012
     F* S047   - CLRSCR SCRADD
     F* S048   - GETREC d.userdef,f.userdef,*eq,COYNO#,user
     F* S049   - GETREC d.porent,f.pordh,*eq,COYNO#,phpord
     F* S050   - SETLL d.PORENT,f.pordd,COYNO#,phpord
     F* S051   - GETREC D.PORENT,F.pordd,*ne,COYNO#,phpord
     F* S052   - Process To Reset File Pointer(EOF) - PORDD
     F* S053   - UPDATE d.PORENT,f.pordh
     F* S054   - GETREC d.PORENT,F.PORDD,*EQ,COYNO#,phpord
     F* S055   - GETREC d.IPSITEM,*eq,COYNO#,poitem,phsuppn,phbrnbr
     F* S056   - SETLL D.PORENT,F.PORDD,SVK006,SVK007
     F* S057   - GETREC D.PORENT,F.PORDD,*NE,SVK006,SVK007
     F* S058   - Process To Reset File Pointer(EOF) - PORDD
     F* S059   - GETREC D.PORENT,F.WAREDET,*EQ,SVK006,POWHSE,POITEM
     F* S060   - GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,COYNO#
     F* S061   - UPDATE d.ipscpyd,f.ipscpyd
     F* S062   - WRITE D.PORENT,F.PORDH
     F* S063   - GETBLK D.PORENT,F.PORDH,*PV,SVK001
     F* S064   - Process To Reset File Pointer(BOF) - PORDH
     F* S065   - Process To Reset File Pointer(EOF) - PORDH
     F* S066   - GETBLK D.PORENT,F.IPSTXTH,*PV,SVK003,SVK004
     F* S067   - Process To Reset File Pointer(BOF) - IPSTXTH
     F* S068   - Process To Reset File Pointer(EOF) - IPSTXTH
     F* S069   - WRITE D.PORENT,F.IPSTXTH
     F* S070   - UPDATE D.PORENT,F.IPSTXTH
     F* S071   - DELETE D.PORENT,F.IPSTXTH
     F* S072   - GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     F* S073   - Process To Reset File Pointer(BOF) - PORDD
     F* S074   - Process To Reset File Pointer(EOF) - PORDD
     F* S075   - GETREC D.IPSITEM,F.IPSITEM,*EQ,SVK006,PHSUPPN,PHBRNBR,POITEM
     F* S076   - GETREC D.PORENT,F.PORDD,*EQ,POCOYNO,POPORD,POSEQ
     F* S077   - GETBLK D.PORENT,F.IPSTXTD,*PV,SVK009,SVK010,SVK011
     F* S078   - Process To Reset File Pointer(BOF) - IPSTXTD
     F* S079   - Process To Reset File Pointer(EOF) - IPSTXTD
     F* S080   - WRITE D.PORENT,F.IPSTXTD
     F* S081   - UPDATE D.PORENT,F.IPSTXTD
     F* S082   - DELETE D.PORENT,F.IPSTXTD
     F* S083   - SETLL D.PORENT,F.IPSWADD,SVK013,SVK08
     F* S084   - GETREC D.PORENT,F.IPSWADD,*PV,SVK013
     F* S085   - Process To Reset File Pointer(BOF) - IPSWADD
     F* S086   - GETREC D.PORENT,F.IPSWADD,*NE,SVK013
     F* S087   - Process To Reset File Pointer(EOF) - IPSWADD
     F* S088   - SETLL D.PORENT,F.ITMMAST,SVK015,SVK09
     F* S089   - GETREC D.PORENT,F.ITMMAST,*PV,SVK015
     F* S090   - Process To Reset File Pointer(BOF) - ITMMAST
     F* S091   - GETREC D.PORENT,F.ITMMAST,*NE,SVK015
     F* S092   - Process To Reset File Pointer(EOF) - ITMMAST
     F* S093   - SETLL D.PORENT,F.UOM,SVK017,SVK10
     F* S094   - GETREC D.PORENT,F.UOM,*PV,SVK017
     F* S095   - Process To Reset File Pointer(BOF) - UOM
     F* S096   - GETREC D.PORENT,F.UOM,*NE,SVK017
     F* S097   - Process To Reset File Pointer(EOF) - UOM
     F* S098   - SETLL D.PORENT,F.SUPLIER,SVK022,svk023,svk12
     F* S099   - GETREC D.PORENT,F.SUPLIER,*PV,SVK022
     F* S100   - Process To Reset File Pointer(BOF) - SUPLIER
     F* S101   - GETREC D.PORENT,F.SUPLIER,*NE,SVK022
     F* S102   - Process To Reset File Pointer(EOF) - SUPLIER
     F* S103   - GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     F* S104   - Process To Reset File Pointer(BOF) - PORDD
     F* S105   - Process To Reset File Pointer(EOF) - PORDD
     F* S002V - Detail Screen for PORDH
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
     FMPORENTD  CF   E             WORKSTN
     F                                     SFILE(SCR014S1:RRN05)
     F                                     SFILE(SCR001S1:RRN01)
     F                                     SFILE(SCR003S1:RRN02)
     F                                     SFILE(SCR004S1:RRN03)
     F                                     SFILE(SCR006S1:RRN04)
     F                                     INFDS(DSPFDS)
     FIPSWADD   IF   E           K DISK
     F                                     INFDS(FIDS05)
     F                                     INFSR(SFERR)
     FSUPLIER   IF   E           K DISK
     F                                     INFDS(FIDS06)
     F                                     INFSR(SFERR)
     FUSERDEF   IF   E           K DISK
     F                                     INFDS(FIDS07)
     F                                     INFSR(SFERR)
     FCOMPANY   IF   E           K DISK
     F                                     INFDS(FIDS08)
     F                                     INFSR(SFERR)
     FIMSCPYD   IF   E           K DISK
     F                                     INFDS(FIDS09)
     F                                     INFSR(SFERR)
     FIMSTRN    IF   E           K DISK
     F                                     INFDS(FIDS10)
     F                                     INFSR(SFERR)
     FIPSITEM   IF   E           K DISK
     F                                     INFDS(FIDS12)
     F                                     INFSR(SFERR)
     FITMMAST   IF   E           K DISK
     F                                     INFDS(FIDS13)
     F                                     INFSR(SFERR)
     FUOM       IF   E           K DISK
     F                                     INFDS(FIDS14)
     F                                     INFSR(SFERR)
     FPODTALT   IF   E           K DISK
     F                                     INFDS(FIDS15)
     F                                     INFSR(SFERR)
     FIPSCPYD   UF   E           K DISK
     F                                     INFDS(FIDS01)
     F                                     INFSR(SFERR)
     FWAREDET   UF   E           K DISK
     F                                     INFDS(FIDS04)
     F                                     INFSR(SFERR)
     FPORDH     UF A E           K DISK
     F                                     INFDS(FIDS02)
     F                                     INFSR(SFERR)
     FPORDD     UF A E           K DISK
     F                                     INFDS(FIDS03)
     F                                     INFSR(SFERR)
     FIPSTXTH   UF A E           K DISK
     F                                     INFDS(FIDS11)
     F                                     INFSR(SFERR)
     FWRITTYP   UF A E           K DISK
     F                                     INFDS(FIDS16)
     F                                     INFSR(SFERR)
     FIPSTXTD   UF A E           K DISK
     F                                     INFDS(FIDS17)
     F                                     INFSR(SFERR)
     FPODTALTX  UF A E             DISK
     F                                     INFDS(FIDS18)
     F                                     RENAME(PODTALTF:FMT001)
     F                                     INFSR(SFERR)
     F*
     D********************************************************************
     D*   D a t a   D e f i n i t i o n    S p e c i f i c a t i o n
     D********************************************************************
     D WK2             S              1    DIM(256)                             Alpha wrk array
     D WKA             S              1    DIM(256)                             Alpha wrk array
     D A01             S              3    DIM(12)
     D A02             S             10    DIM(12)
     D A03             S              3    DIM(12)
     D A04             S             10    DIM(12)
     D A05             S              5  0 DIM(12)
     D A06             S              3    DIM(6)
     D A07             S             10    DIM(6)
     D A08             S              5  0 DIM(6)
     D A09             S              3    DIM(12)
     D A10             S             10    DIM(12)
     D A11             S              5  0 DIM(12)
     D A12             S              5  0 DIM(12)
     D B01             S              3    DIM(5)
     D B02             S             15    DIM(5)
     D B03             S              5    DIM(5)
     D B05             S              3    DIM(5)
     D A13             S              1    DIM(10)
     D A14             S              1    DIM(8)
     D SID             S              8    DIM(99)                              Scrn stk
     D STY             S              1    DIM(99)                              Scr type
     D A1              S             80    DIM(4) CTDATA PERRCD(1)              Alpha constants i
     D N1              S             30  9 DIM(4) CTDATA PERRCD(1)              Numeric constants
     D DA4             S             24    DIM(9) CTDATA PERRCD(1)              CLF : Cursor Loca
     D DA5             S              8    DIM(9) ALT(DA4)
     D DA3             S              2    DIM(17)                              Fld Attr. Wrk Ary
     D DA1             S             24    DIM(69) CTDATA PERRCD(1)             Fld Attr. Indic t
     D DA2             S             34    DIM(69) ALT(DA1)
     D FIDS08          DS
     D  STS08            *STATUS
     D  REC08                397    400B 0
     D FIDS09          DS
     D  STS09            *STATUS
     D  REC09                397    400B 0
     D FIDS10          DS
     D  STS10            *STATUS
     D  REC10                397    400B 0
     D FIDS01          DS
     D  STS01            *STATUS
     D  REC01                397    400B 0
     D FIDS12          DS
     D  STS12            *STATUS
     D  REC12                397    400B 0
     D FIDS17          DS
     D  STS17            *STATUS
     D  REC17                397    400B 0
     D FIDS11          DS
     D  STS11            *STATUS
     D  REC11                397    400B 0
     D FIDS05          DS
     D  STS05            *STATUS
     D  REC05                397    400B 0
     D FIDS13          DS
     D  STS13            *STATUS
     D  REC13                397    400B 0
     D FIDS15          DS
     D  STS15            *STATUS
     D  REC15                397    400B 0
     D FIDS03          DS
     D  STS03            *STATUS
     D  REC03                397    400B 0
     D FIDS02          DS
     D  STS02            *STATUS
     D  REC02                397    400B 0
     D FIDS06          DS
     D  STS06            *STATUS
     D  REC06                397    400B 0
     D FIDS14          DS
     D  STS14            *STATUS
     D  REC14                397    400B 0
     D FIDS07          DS
     D  STS07            *STATUS
     D  REC07                397    400B 0
     D FIDS04          DS
     D  STS04            *STATUS
     D  REC04                397    400B 0
     D FIDS16          DS
     D  STS16            *STATUS
     D  REC16                397    400B 0
     D FIDS18          DS
     D  STS18            *STATUS
     D  REC18                397    400B 0
     D*
     D* Company Number
     D*
     D @DS001          DS             3
     D  COYNO#                 1      3
     D*
     D* Landmark Key
     D*
     D @DS002          DS            27
     D  KDPKEY                 1     27
     D*
     D* Purchase Order Number
     D*
     D @DS003          DS
     D  ORD                    1     10    DIM(10)
     D  XHPORD                 1     10
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
     D @DS004          DS
     D  HALFWD                 1      2B 0
     D  BYTE2                  2      2
     D*
     D* Display Attribute Structure
     D*
     D @DS005          DS
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
     D C0002           C                   CONST('A999999999')
     D*
     D* Named constants
     D*
     D C0003           C                   CONST('Invalid action choic-
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
     D @DS006          DS
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
     D @DS007          DS
     D  T01                    1      5P 0 DIM(5)
     D  T01001                 1      1P 0
     D  T01002                 2      2P 0
     D  T01003                 3      3P 0
     D  T01004                 4      4P 0
     D  T01005                 5      5P 0
     D @DS008          DS
     D  T02                    1     15    DIM(5)
     D  T02001                 1      3
     D  T02002                 4      6
     D  T02003                 7      9
     D  T02004                10     12
     D  T02005                13     15
     D @DS009          DS
     D  T03                    1    200    DIM(5)
     D  T03001                 1     40
     D  T03002                41     80
     D  T03003                81    120
     D  T03004               121    160
     D  T03005               161    200
     D @DS010          DS
     D  T04                    1      5P 0 DIM(5)
     D  T04001                 1      1P 0
     D  T04002                 2      2P 0
     D  T04003                 3      3P 0
     D  T04004                 4      4P 0
     D  T04005                 5      5P 0
     D @DS011          DS
     D  T05                    1    100    DIM(5)
     D  T05001                 1     20
     D  T05002                21     40
     D  T05003                41     60
     D  T05004                61     80
     D  T05005                81    100
     D @DS012          DS
     D  T06                    1    200    DIM(5)
     D  T06001                 1     40
     D  T06002                41     80
     D  T06003                81    120
     D  T06004               121    160
     D  T06005               161    200
     D @DS013          DS
     D  T07                    1      5P 0 DIM(5)
     D  T07001                 1      1P 0
     D  T07002                 2      2P 0
     D  T07003                 3      3P 0
     D  T07004                 4      4P 0
     D  T07005                 5      5P 0
     D @DS014          DS
     D  T08                    1     25    DIM(5)
     D  T08001                 1      5
     D  T08002                 6     10
     D  T08003                11     15
     D  T08004                16     20
     D  T08005                21     25
     D @DS015          DS
     D  T12                    1      5P 0 DIM(5)
     D  T12001                 1      1P 0
     D  T12002                 2      2P 0
     D  T12003                 3      3P 0
     D  T12004                 4      4P 0
     D  T12005                 5      5P 0
     D @DS016          DS
     D  T13                    1     30    DIM(5)
     D  T13001                 1      6
     D  T13002                 7     12
     D  T13003                13     18
     D  T13004                19     24
     D  T13005                25     30
     D @DS017          DS
     D  T14                    1     15    DIM(5)
     D  T14001                 1      3
     D  T14002                 4      6
     D  T14003                 7      9
     D  T14004                10     12
     D  T14005                13     15
     D @DS018          DS
     D  T15                    1    200    DIM(5)
     D  T15001                 1     40
     D  T15002                41     80
     D  T15003                81    120
     D  T15004               121    160
     D  T15005               161    200
     ICOMPANYF
     I              CYCOYNO                     RN0029
     I              CYEMPCOL                    RN0030
     I              CYEMPHEAD                   RN0031
     I              CYPRDHEAD                   RN0032
     I              CYREFHEAD                   RN0033
     I              CYSDESC                     RN0034
     IIMSCPYDF
     I              CDCOYNO                     RN0035
     I              CDHEAD1                     RN0036
     I              CDHEAD2                     RN0037
     I              CDHEAD3                     RN0038
     IIMSTRMF
     I              TTCOYNO                     RN0039
     IIPSCPYDF
     I              CDAUDAM                     RN0040
     I              CDAUDGR                     RN0041
     I              CDAUDOR                     RN0042
     I              CDAUDPR                     RN0043
     I              CDAUDRE                     RN0044
     I              CDCOYNO                     RN0045
     IIPSITEMF
     I              PIBRNBR                     RN0046
     I              PICNVCDE                    RN0047
     I              PICOYNO                     RN0048
     I              PIPBRK1                     RN0049
     I              PIPBRK2                     RN0050
     I              PIPBRK3                     RN0051
     I              PIPBRK4                     RN0052
     I              PIPRCOD                     RN0053
     I              PIQBRK1                     RN0054
     I              PIQBRK2                     RN0055
     I              PIQBRK3                     RN0056
     I              PIQBRK4                     RN0057
     I              PISDESC                     RN0058
     I              PISPITM                     RN0059
     I              PISUPPN                     RN0060
     IIPSTXTDF
     I              TDCOYNO                     RN0061
     I              TDPOSEQ                     RN0062
     IIPSTXTHF
     I              THCOYNO                     RN0063
     IIPSWADDF
     I              PDCONNAM                    RN0064
     I              PDCOYNO                     RN0065
     I              PDPSTCD                     RN0066
     I              PDTELEPH                    RN0067
     IITMSTRF
     I              ITALPHA                     RN0068
     I              ITCOYNO                     RN0069
     I              ITIDESC                     RN0070
     IPODTALTF
     I              PACOYNO                     RN0071
     I              PADLVDT                     RN0072
     I              PAIDESC                     RN0073
     I              PANLALL                     RN0074
     I              PAPRICE                     RN0075
     I              PAQRCVD                     RN0076
     IPORDDF
     I              POCOYNO                     RN0077
     I              PODLVDT                     RN0078
     I              POIDESC                     RN0079
     I              PONLALL                     RN0080
     I              POPRICE                     RN0081
     I              POQRCVD                     RN0082
     I              POQRCYC                     RN0083
     IPORDHF
     I              PHBRNBR                     RN0084
     I              PHBUYER                     RN0085
     I              PHCMPDT                     RN0086
     I              PHCONNAM                    RN0087
     I              PHCOYNO                     RN0088
     I              PHCUSORD                    RN0089
     I              PHDLVDT                     RN0090
     I              PHENTDT                     RN0091
     I              PHLRCVDT                    RN0092
     I              PHNLALL                     RN0093
     I              PHNOPOS                     RN0094
     I              PHRLAUD                     RN0095
     I              PHSHIPV                     RN0096
     I              PHSLIN1                     RN0097
     I              PHSLIN2                     RN0098
     I              PHSLIN3                     RN0099
     I              PHSLIN4                     RN0100
     I              PHSLIN5                     RN0101
     I              PHSLIN6                     RN0102
     I              PHSNAME                     RN0103
     I              PHSPSTCD                    RN0104
     I              PHSUPPN                     RN0105
     I              PHWLIN1                     RN0106
     I              PHWLIN2                     RN0107
     I              PHWLIN3                     RN0108
     I              PHWLIN4                     RN0109
     I              PHWLIN5                     RN0110
     I              PHWLIN6                     RN0111
     I              PHWNAME                     RN0112
     I              PHWPSTCD                    RN0113
     ISUPLIERF
     I              SUALPHA                     RN0114
     I              SUBRNBR                     RN0115
     I              SUCONNAM                    RN0116
     I              SUCOYNO                     RN0117
     I              SUPSTCD                     RN0118
     I              SUSUPPN                     RN0119
     I              SUTELEPH                    RN0120
     IUOMF
     I              UMCOYNO                     RN0121
     IUSERDEFF
     I              UDCOYNO                     RN0122
     IWDETAILF
     I              WDCOYNO                     RN0123
     I              WDSUPPN                     RN0124
     IWRITTYPF
     I              WTCOYNO                     RN0125
     IFMT001
     I              PACOYNO                     RN0071
     I              PADLVDT                     RN0072
     I              PAIDESC                     RN0073
     I              PANLALL                     RN0074
     I              PAPRICE                     RN0075
     I              PAQRCVD                     RN0076
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
     C                   PARM                    INT
     C                   PARM                    COYNO#            3
     C                   PARM                    WK0052            6
     C                   PARM                    WK0035            3
     C                   PARM                    XOWHSE            3
     C                   PARM                    XOITEM           20
     C                   PARM                    DTQORD
     C                   PARM                    RN0001
     C*
     C     *ENTRY        PLIST
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
     C                   KFLD                    KYCO01
     C                   KFLD                    KDTR02
     C*
     C     K0003         KLIST
     C                   KFLD                    KDCO01
     C*
     C     K0004         KLIST
     C                   KFLD                    KHCO01
     C*
     C     K0005         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C*
     C     K0006         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KOWH02
     C*
     C     K0007         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHSU02
     C                   KFLD                    KHBR03
     C*
     C     K0008         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C                   KFLD                    KHSE03
     C*
     C     K0009         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C                   KFLD                    KOSE03
     C*
     C     K0010         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KOWH02
     C                   KFLD                    KOIT03
     C*
     C     K0011         KLIST
     C                   KFLD                    KICO01
     C                   KFLD                    KISU02
     C                   KFLD                    KIBR03
     C                   KFLD                    KIIT04
     C*
     C     K0012         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KOIT02
     C*
     C     K0013         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KOUO02
     C*
     C     K0014         KLIST
     C                   KFLD                    KHCO02
     C                   KFLD                    KHWH03
     C                   KFLD                    KDIT04
     C                   KFLD                    KTTR05
     C*
     C     K0015         KLIST
     C                   KFLD                    KHCO01
     C                   KFLD                    KHPO02
     C                   KFLD                    KOSE03
     C                   KFLD                    KDSE04
     C*
     C     K0016         KLIST
     C                   KFLD                    KDCO02
     C                   KFLD                    KDUS03
     C*
     C     K0017         KLIST
     C                   KFLD                    KHCO03
     C                   KFLD                    KHPO04
     C*
     C     K0018         KLIST
     C                   KFLD                    KHCO03
     C                   KFLD                    KHPO04
     C                   KFLD                    KHSE05
     C*
     C     K0019         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C*
     C     K0020         KLIST
     C                   KFLD                    KICO02
     C                   KFLD                    KISU03
     C                   KFLD                    KIBR04
     C                   KFLD                    KIIT05
     C*
     C     K0021         KLIST
     C                   KFLD                    KOCO01
     C                   KFLD                    KOPO02
     C                   KFLD                    KOSE03
     C*
     C     K0022         KLIST
     C                   KFLD                    KDCO03
     C                   KFLD                    KDPO04
     C                   KFLD                    KDPO05
     C*
     C     K0023         KLIST
     C                   KFLD                    KDCO03
     C                   KFLD                    KDPO04
     C                   KFLD                    KDPO05
     C                   KFLD                    KDSE06
     C*
     C     K0024         KLIST
     C                   KFLD                    KDCO04
     C                   KFLD                    KDWH05
     C*
     C     K0025         KLIST
     C                   KFLD                    KDCO04
     C*
     C     K0026         KLIST
     C                   KFLD                    KTCO01
     C                   KFLD                    KTIT02
     C*
     C     K0027         KLIST
     C                   KFLD                    KTCO01
     C*
     C     K0028         KLIST
     C                   KFLD                    KMCO01
     C                   KFLD                    KMUO02
     C*
     C     K0029         KLIST
     C                   KFLD                    KMCO01
     C*
     C     K0030         KLIST
     C                   KFLD                    KUCO01
     C                   KFLD                    KUSU02
     C                   KFLD                    KUBR03
     C*
     C     K0031         KLIST
     C                   KFLD                    KUCO01
     C*
     C********************************************************************
     C*        V a r i a b l e s     D e c l a r a t i o n
     C********************************************************************
     C     LRFLAG        IFNE      'N'
     C     *LIKE         DEFINE    RN0029        WK0001                         Company number
     C     *LIKE         DEFINE    CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C     *LIKE         DEFINE    CYDSEP        WYDSEP                         Date Seperator
     C     *LIKE         DEFINE    CDTRNP        WDTRNP                         Purchasing Trans
     C     *LIKE         DEFINE    CDTRNR        WDTRNR                         Receiving Trans
     C     *LIKE         DEFINE    RN0040        WK0002                         Amendments Report Au
     C     *LIKE         DEFINE    RN0041        WK0003                         Goods Received Audit
     C     *LIKE         DEFINE    RN0042        WK0004                         Ordered Report Audit
     C     *LIKE         DEFINE    RN0043        WK0005                         Payments Report Audi
     C     *LIKE         DEFINE    RN0044        WK0006                         Reconciliation Audit
     C     *LIKE         DEFINE    CDCGAS        WDCGAS                         CGAS to be used
     C     *LIKE         DEFINE    RN0045        WK0007                         Company number
     C     *LIKE         DEFINE    CDIMS         WDIMS                          IMS to be used
     C     *LIKE         DEFINE    CDPORD        WDPORD                         Last P.O. Number
     C     *LIKE         DEFINE    CDPURL        WDPURL                         Purge fully rcd line
     C     *LIKE         DEFINE    CDPURO        WDPURO                         Purge rcd orders
     C     *LIKE         DEFINE    PICNV         WICNV                          Conversion Qty
     C     *LIKE         DEFINE    RN0047        WK0008                         Conversion Code
     C     *LIKE         DEFINE    PICOST        WICOST                         Cost Price
     C     *LIKE         DEFINE    PIDESC        WIDESC                         Description
     C     *LIKE         DEFINE    PIITEM        WIITEM                         Item Number
     C     *LIKE         DEFINE    PILTIM        WILTIM                         Lead Time
     C     *LIKE         DEFINE    RN0053        WK0009                         Pricing Code
     C     *LIKE         DEFINE    RN0058        WK0010                         Description
     C     *LIKE         DEFINE    RN0059        WK0011                         Item Number
     C     *LIKE         DEFINE    PIUOM         WIUOM                          Unit of Measure
     C     *LIKE         DEFINE    RN0061        WK0012                         Company number
     C     *LIKE         DEFINE    TDPORD        WK0013                         P.O. Number
     C     *LIKE         DEFINE    RN0062        WK0014                         Purchase order line
     C     *LIKE         DEFINE    RN0063        WK0015                         Company number
     C     *LIKE         DEFINE    THPORD        WHPORD                         P.O. Number
     C     *LIKE         DEFINE    RN0064        WK0016                         Contact name
     C     *LIKE         DEFINE    RN0065        WK0017                         Company number
     C     *LIKE         DEFINE    PDLIN1        WDLIN1                         Address
     C     *LIKE         DEFINE    PDLIN2        WDLIN2                         Address Line 2
     C     *LIKE         DEFINE    PDLIN3        WDLIN3                         Address Line 3
     C     *LIKE         DEFINE    PDLIN4        WDLIN4                         Address Line 4
     C     *LIKE         DEFINE    PDLIN5        WDLIN5                         Address Line 5
     C     *LIKE         DEFINE    PDLIN6        WDLIN6                         Address Line 6
     C     *LIKE         DEFINE    RN0066        WK0018                         Post code
     C     *LIKE         DEFINE    RN0067        WK0019                         Telephone number
     C     *LIKE         DEFINE    PDWHSE        WK0020                         Warehouse Number
     C     *LIKE         DEFINE    RN0070        WK0021                         Item Description
     C     *LIKE         DEFINE    ITITEM        WK0022                         Item Number
     C     *LIKE         DEFINE    ITNLST        WTNLST                         N/L Stock Account
     C     *LIKE         DEFINE    ITUOM         WTUOM                          Unit of Measure
     C     *LIKE         DEFINE    PACCDE        WACCDE                         Conversion Code
     C     *LIKE         DEFINE    PACONV        WACONV                         Packing Multiplier
     C     *LIKE         DEFINE    RN0071        WK0023                         Company number
     C     *LIKE         DEFINE    PADATE        WADATE                         Amend Date
     C     *LIKE         DEFINE    RN0072        WK0024                         Delivery Date
     C     *LIKE         DEFINE    RN0073        WK0025                         Description
     C     *LIKE         DEFINE    PAITEM        WAITEM                         Item Number
     C     *LIKE         DEFINE    RN0074        WK0026                         N/L Stock Account
     C     *LIKE         DEFINE    PAPCDE        WAPCDE                         Priceing Code
     C     *LIKE         DEFINE    PAPORD        WAPORD                         Purchase Order Numbe
     C     *LIKE         DEFINE    RN0075        WK0027                         Price
     C     *LIKE         DEFINE    PAQORD        WAQORD                         Quantity ordered
     C     *LIKE         DEFINE    RN0076        WK0028                         Quantity received
     C     *LIKE         DEFINE    PASEQ         WASEQ                          Sequence
     C     *LIKE         DEFINE    PATYPE        WATYPE                         a=add B=bef c=aft d=
     C     *LIKE         DEFINE    PAUOM         WAUOM                          Unit of Measure
     C     *LIKE         DEFINE    PAWHSE        WAWHSE                         Warehouse Number
     C     *LIKE         DEFINE    POCCDE        WOCCDE                         Conversion Code
     C     *LIKE         DEFINE    POCONV        WOCONV                         Conversion Qty
     C     *LIKE         DEFINE    RN0077        WK0029                         Company number
     C     *LIKE         DEFINE    RN0078        WK0030                         Delivery Date
     C     *LIKE         DEFINE    POPCDE        WOPCDE                         Pricing code
     C     *LIKE         DEFINE    RN0082        WK0034                         Quantity received
     C     *LIKE         DEFINE    RN0088        WK0038                         Company number
     C     *LIKE         DEFINE    RN0090        WK0040                         Delivery Date
     C     *LIKE         DEFINE    RN0091        WK0041                         Entered Date
     C     *LIKE         DEFINE    PHOS01        WHOS01                         New Order
     C     *LIKE         DEFINE    PHOS02        WHOS02                         Updated Order/Line s
     C     *LIKE         DEFINE    PHOS03        WHOS03                         No action since last
     C     *LIKE         DEFINE    PHOS05        WHOS05                         Some receiving since
     C     *LIKE         DEFINE    PHOS08        WHOS08                         Order fully recd
     C     *LIKE         DEFINE    PHOS10        WHOS10                         P.O. has been printe
     C     *LIKE         DEFINE    PHOS11        WHOS11                         P.O. has been adjust
     C     *LIKE         DEFINE    RN0096        WK0043                         Ship Via
     C     *LIKE         DEFINE    RN0111        WK0058                         Line 6
     C     *LIKE         DEFINE    RN0115        WK0061                         Branch Number
     C     *LIKE         DEFINE    RN0116        WK0062                         Contact name
     C     *LIKE         DEFINE    SULIN1        WULIN1                         Address
     C     *LIKE         DEFINE    SULIN2        WULIN2                         Line 2
     C     *LIKE         DEFINE    SULIN3        WULIN3                         Line 3
     C     *LIKE         DEFINE    SULIN4        WULIN4                         Line 4
     C     *LIKE         DEFINE    SULIN5        WULIN5                         Line 5
     C     *LIKE         DEFINE    SULIN6        WULIN6                         Line 6
     C     *LIKE         DEFINE    SUNAME        WUNAME                         Supplier name
     C     *LIKE         DEFINE    RN0118        WK0063                         Post code
     C     *LIKE         DEFINE    RN0119        WK0064                         Supplier Number
     C     *LIKE         DEFINE    RN0121        WK0065                         Company number
     C     *LIKE         DEFINE    UMUOM         WMUOM                          Unit of Measure
     C     *LIKE         DEFINE    UDWHSE        WK0066                         Warehouse
     C     *LIKE         DEFINE    WDLPDT        WK0067                         Date Of Last Purchas
     C     *LIKE         DEFINE    WDLTIM        WK0068                         Lead Time in days
     C     *LIKE         DEFINE    WDNRDT        WK0069                         Date Of Next Receipt
     C     *LIKE         DEFINE    WDQOO         WK0070                         Quantity On Order
     C     *LIKE         DEFINE    RN0125        WK0071                         Company number
     C     *LIKE         DEFINE    WTITEM        WK0072                         Item Number
     C     *LIKE         DEFINE    WTTRNC        WK0073                         Transaction Type
     C     *LIKE         DEFINE    WTTRPQ        WK0074                         Trans Period Quantit
     C     *LIKE         DEFINE    WTTRPV        WK0075                         Trans Period Value
     C     *LIKE         DEFINE    WTTRYQ        WK0076                         Trans YTD Quantity
     C     *LIKE         DEFINE    WTTRYV        WK0077                         Trans YTD Value
     C     *LIKE         DEFINE    WTWHSE        WK0078                         Warehouse Number
     C     *LIKE         DEFINE    REC08         HRC08
     C     *LIKE         DEFINE    RN0029        HD0001
     C     *LIKE         DEFINE    REC09         HRC09
     C     *LIKE         DEFINE    RN0035        HD0002
     C     *LIKE         DEFINE    REC10         HRC10
     C     *LIKE         DEFINE    RN0039        HD0003
     C     *LIKE         DEFINE    TTTRNC        HTTRNC
     C     *LIKE         DEFINE    REC01         HRC01
     C     *LIKE         DEFINE    RN0045        HD0004
     C     *LIKE         DEFINE    REC12         HRC12
     C     *LIKE         DEFINE    RN0048        HD0006
     C     *LIKE         DEFINE    RN0060        HD0007
     C     *LIKE         DEFINE    RN0046        HD0005
     C     *LIKE         DEFINE    PIITEM        HIITEM
     C     *LIKE         DEFINE    REC05         HRC05
     C     *LIKE         DEFINE    RN0065        HD0011
     C     *LIKE         DEFINE    PDWHSE        HDWHSE
     C     *LIKE         DEFINE    REC13         HRC13
     C     *LIKE         DEFINE    RN0069        HD0012
     C     *LIKE         DEFINE    ITITEM        HTITEM
     C     *LIKE         DEFINE    REC15         HRC15
     C     *LIKE         DEFINE    RN0071        HD0013
     C     *LIKE         DEFINE    PAWHSE        HAWHSE
     C     *LIKE         DEFINE    PAPORD        HAPORD
     C     *LIKE         DEFINE    PASEQ         HASEQ
     C     *LIKE         DEFINE    REC06         HRC06
     C     *LIKE         DEFINE    RN0117        HD0018
     C     *LIKE         DEFINE    RN0119        HD0019
     C     *LIKE         DEFINE    RN0115        HD0017
     C     *LIKE         DEFINE    REC14         HRC14
     C     *LIKE         DEFINE    RN0121        HD0020
     C     *LIKE         DEFINE    UMUOM         HMUOM
     C     *LIKE         DEFINE    REC07         HRC07
     C     *LIKE         DEFINE    RN0122        HD0021
     C     *LIKE         DEFINE    UDUSER        HDUSER
     C     *LIKE         DEFINE    REC04         HRC04
     C     *LIKE         DEFINE    RN0123        HD0022
     C     *LIKE         DEFINE    WDWHSE        HD0023
     C     *LIKE         DEFINE    WDITEM        HDITEM
     C     *LIKE         DEFINE    REC16         HRC16
     C     *LIKE         DEFINE    RN0125        HD0024
     C     *LIKE         DEFINE    WTWHSE        HTWHSE
     C     *LIKE         DEFINE    WTITEM        HD0025
     C     *LIKE         DEFINE    WTTRNC        HD0026
     C                   MOVE      *ZEROS        NARG2            30 9          Numer argument2
     C                   MOVE      *ZEROS        NARG3            30 9          Numer argument3
     C                   MOVE      *BLANKS       ARSLT           256            Alpha result
     C                   MOVE      *BLANKS       AARG1           256            Alpha argument1
     C                   MOVE      *ZEROS        C1                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        C2                3 0          Numeric wrk fld
     C                   MOVE      *ZEROS        YRCORR            2 2          Work-Yr Corrctn
     C                   MOVE      *ZEROS        WKYR             30 0          Work-Variable
     C                   MOVE      *ZEROS        WKMT             30 0          Work-Variable
     C                   MOVE      *ZEROS        WKSUM            30 9          Work-Variable
     C                   MOVE      *ZEROS        NARGX            10 0          Work-Variable
     C                   MOVE      *ZEROS        ADIV4            30 0          Work-Variable
     C                   MOVE      *ZEROS        ADIV             30 9          Work-Variable
     C                   MOVE      *ZEROS        NARGY            21 0          Work-Variable
     C                   MOVE      *ZEROS        NRSLT            30 9          Result-Nbr Days
     C                   MOVE      *ZEROS        NARG1            30 9          Input-Date
     C                   MOVE      *ZEROS        SVCY              4 0          Work-Save Year
     C                   MOVE      *ZEROS        SVMM              2 0          Save-Month
     C                   MOVE      *ZEROS        SVDD              2 0          Save-Day
     C                   MOVE      *BLANKS       DATFMT            3            Work-Date Formt
     C                   MOVE      *ZEROS        SVCC              2 0          Work Variable
     C                   MOVE      *ZEROS        SVYY              2 0          Work variable
     C                   MOVE      *ZEROS        SVLEAP            1 0          Work variable
     C                   MOVE      *ZEROS        FEB               2 0          Work Variable
     C                   MOVE      *ZEROS        SVDAYS            3 0          Work variable
     C                   MOVE      *ZEROS        NARGZ            30 0          Work-Avraible
     C                   MOVE      *ZEROS        NARGA            30 0          Work-Variable
     C                   MOVE      *ZEROS        CONST1           30 9          Work-Variable
     C                   MOVE      *ZEROS        CONST2           30 9          Work-Variable
     C                   MOVE      *ZEROS        ALPHA            30 0          Work-Variable
     C                   MOVE      *ZEROS        NARGB            30 0          Work-Variable
     C                   MOVE      *ZEROS        NARGW            30 9          Work-Variable
     C                   MOVE      *ZEROS        NARGC            30 0          Work-Variable
     C                   MOVE      *ZEROS        NARGD            30 0          Work-Variable
     C                   MOVE      *ZEROS        NARGV            30 9          Work-Variable
     C                   MOVE      *ZEROS        NARGE            30 0          Work-Variable
     C                   MOVE      *ZEROS        WK3              30 0          Work-Variable
     C                   MOVE      *ZEROS        NARGQ            30 0          Work Variable
     C                   MOVE      *BLANKS       AARG2           256            Alpha argument2
     C                   MOVE      *ZEROS        NWK300           30 0          Numeric wrk fld
     C                   MOVE      *ZEROS        SVDAT             6 0          Save date
     C                   MOVE      1             CHKVAR            1 0          Perform Valid.
     C                   MOVE      *ZEROS        ##DATE            8 0
     C                   MOVE      *ZEROS        ##YEAR            2 0
     C                   MOVE      *ZEROS        Z1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z6                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z7                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Z8                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        C75               3 0
     C                   MOVE      *BLANKS       DETCHG            1
     C                   MOVE      *ZEROS        RN0001           15 5          DTPRICE
     C                   MOVE      *ZEROS        DTQORD           15 5
     C                   MOVE      *ZEROS        DTSEQ            15 5
     C                   MOVE      *ZEROS        DT1551           15 5
     C                   MOVE      *BLANKS       ERROR             1
     C                   MOVE      *ZEROS        EXTSCR            1 0
     C                   MOVE      *ZEROS        FL0001            1 0
     C                   MOVE      *ZEROS        FL0002            1 0
     C                   MOVE      *ZEROS        FL0003            1 0
     C                   MOVE      *ZEROS        FL0005            1 0
     C                   MOVE      *BLANKS       FST08             3
     C                   MOVE      *BLANKS       FST09            15
     C                   MOVE      *BLANKS       FST10             5
     C                   MOVE      *BLANKS       FST11             6
     C                   MOVE      *BLANKS       FST12             3
     C                   MOVE      *BLANKS       F02001            6
     C                   MOVE      *BLANKS       F02002            3
     C                   MOVE      *BLANKS       F06001            3
     C                   MOVE      *BLANKS       F06002           15
     C                   MOVE      *BLANKS       F06003            5
     C                   MOVE      *ZEROS        F12FLG            1 0
     C                   MOVE      *BLANKS       HEADER            1
     C                   MOVE      *BLANKS       INT               1
     C                   MOVE      *BLANKS       ITEMDO           30
     C                   MOVE      *ZEROS        Z9                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        I03               3 0
     C                   MOVE      *ZEROS        Y1                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        I07               3 0
     C                   MOVE      *ZEROS        Y2                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y3                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y4                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        Y5                3 0          Loop Counter . . . .
     C                   MOVE      *ZEROS        LOOPCT            3 0
     C                   MOVE      *BLANKS       LST08             3
     C                   MOVE      *BLANKS       LST09            15
     C                   MOVE      *BLANKS       LST10             5
     C                   MOVE      *BLANKS       LST11            20
     C                   MOVE      *BLANKS       LST12             3
     C                   MOVE      *ZEROS        MNTFLG            1 0
     C                   MOVE      *BLANKS       MODDSC            8
     C                   MOVE      *ZEROS        MODE              1 0
     C                   MOVE      *ZEROS        OUTSQY            9 0
     C                   MOVE      *BLANKS       PGO               3
     C                   MOVE      *ZEROS        PODLVD           15 6
     C                   MOVE      *BLANKS       RN0002            5            Unit of Measure
     C                   MOVE      *ZEROS        POSFLG            1 0
     C                   MOVE      *BLANKS       PRM001            3
     C                   MOVE      *BLANKS       PRM002           10
     C                   MOVE      *BLANKS       PS0102           10
     C                   MOVE      *ZEROS        PS0301            5 0
     C                   MOVE      *ZEROS        PS0501            5 0
     C                   MOVE      *ZEROS        PS0701            5 0
     C                   MOVE      *ZEROS        PS7501            5 0
     C                   MOVE      *BLANKS       RN0003           20            SADATAI
     C                   MOVE      *ZEROS        SAVMOD            1 0
     C                   MOVE      *BLANKS       SAVNAM           40
     C                   MOVE      *BLANKS       SAVPC             9
     C                   MOVE      *BLANKS       SAVS1            40
     C                   MOVE      *BLANKS       SAVS2            40
     C                   MOVE      *BLANKS       SAVS3            40
     C                   MOVE      *BLANKS       SAVS4            40
     C                   MOVE      *BLANKS       SAVS5            40
     C                   MOVE      *BLANKS       SAVS6            40
     C                   MOVE      *BLANKS       RN0004            3            SVBRNBR
     C                   MOVE      *ZEROS        SVDATI           15 6
     C                   MOVE      *BLANKS       SVDESC           40
     C                   MOVE      *BLANKS       SVK001            3
     C                   MOVE      *BLANKS       SVK002           10
     C                   MOVE      *BLANKS       SVK003            3
     C                   MOVE      *BLANKS       SVK004           10
     C                   MOVE      *ZEROS        SVK005            5 0
     C                   MOVE      *BLANKS       SVK006            3
     C                   MOVE      *BLANKS       SVK007           10
     C                   MOVE      *ZEROS        SVK008            5 0
     C                   MOVE      *BLANKS       SVK009            3
     C                   MOVE      *BLANKS       SVK010           10
     C                   MOVE      *ZEROS        SVK011            5 0
     C                   MOVE      *ZEROS        SVK012            5 0
     C                   MOVE      *BLANKS       SVK013            3
     C                   MOVE      *BLANKS       SVK014            3
     C                   MOVE      *BLANKS       SVK015            3
     C                   MOVE      *BLANKS       SVK016           15
     C                   MOVE      *BLANKS       SVK017            3
     C                   MOVE      *BLANKS       SVK018            5
     C                   MOVE      *BLANKS       SVK021           15
     C                   MOVE      *BLANKS       SVK022            3
     C                   MOVE      *BLANKS       SVK023           20
     C                   MOVE      *BLANKS       SVK024            3
     C                   MOVE      *BLANKS       SVK08             3
     C                   MOVE      *BLANKS       SVK09            15
     C                   MOVE      *BLANKS       SVK10             5
     C                   MOVE      *BLANKS       SVK12             3
     C                   MOVE      *BLANKS       SVPORD           10
     C                   MOVE      *BLANKS       RN0005            6            SVSUPPN
     C                   MOVE      *BLANKS       SVWHSE            3
     C                   MOVE      *ZEROS        SYCCYY            4 0
     C                   MOVE      *BLANKS       RN0006            4            SYCCYYA
     C                   MOVE      *ZEROS        SYCMD             8 0
     C                   MOVE      *ZEROS        RN0007            8 0          SYCMD
     C                   MOVE      *BLANKS       SYCMDA            8
     C                   MOVE      *ZEROS        SYCYN             4 0
     C                   MOVE      *BLANKS       RN0008           10            SYDATAI
     C                   MOVE      *BLANKS       RN0009           10            SYDATAI
     C                   MOVE      *ZEROS        SYDATI            8 0
     C                   MOVE      *ZEROS        RN0010            8 0          SYDATI
     C                   MOVE      *ZEROS        RN0011            8 0          SYDATNO = Number out
     C                   MOVE      *BLANKS       SYDATO           10
     C                   MOVE      *BLANKS       RN0012           10            SYDATO
     C                   MOVE      *ZEROS        SYDATV            8 0
     C                   MOVE      *ZEROS        RN0013            8 0          SYDATV
     C                   MOVE      *BLANKS       SYDAT0           20
     C                   MOVE      *ZEROS        SYDD              2 0
     C                   MOVE      *BLANKS       SYDDA             2
     C                   MOVE      *ZEROS        SYDDN             2 0
     C                   MOVE      *BLANKS       SYDERR            1
     C                   MOVE      *BLANKS       RN0014            1            SYDERR
     C                   MOVE      *BLANKS       SYDFMT            1
     C                   MOVE      *BLANKS       RN0015            1            SYDFMT
     C                   MOVE      *BLANKS       RN0016            1            SYDFMT
     C                   MOVE      *ZEROS        SYDMC             8 0
     C                   MOVE      *BLANKS       SYDMCA            8
     C                   MOVE      *BLANKS       SYDSEP            1
     C                   MOVE      *BLANKS       RN0017            1            SYDSEP
     C                   MOVE      *BLANKS       RN0018            1            SYDSEP
     C                   MOVE      *ZEROS        SYMDC             8 0
     C                   MOVE      *BLANKS       SYMDCA            8
     C                   MOVE      *ZEROS        SYMDN             4 0
     C                   MOVE      *ZEROS        SYMM              2 0
     C                   MOVE      *BLANKS       SYMMA             2
     C                   MOVE      *ZEROS        SYMMDD            4 0
     C                   MOVE      *BLANKS       RN0019            4            SYMMDDA
     C                   MOVE      *ZEROS        SYMMN             2 0
     C                   MOVE      *ZEROS        Y6                2 0          SY1
     C                   MOVE      *ZEROS        Y7                2 0          SY2
     C                   MOVE      *ZEROS        S08CNT            3 0
     C                   MOVE      *ZEROS        S09CNT            3 0
     C                   MOVE      *ZEROS        S10CNT            3 0
     C                   MOVE      *ZEROS        S12CNT            3 0
     C                   MOVE      *ZEROS        UPDFLG            1 0
     C                   MOVE      *BLANKS       RN0020           10            USER
     C                   MOVE      *BLANKS       WKCYY             4
     C                   MOVE      *BLANKS       WKDA8F            8
     C                   MOVE      *BLANKS       WKDDA             2
     C                   MOVE      *ZEROS        RN0021            8 0          WSDLVDT
     C                   MOVE      *ZEROS        WKEND             2 0
     C                   MOVE      *ZEROS        WKLEAP           15 6
     C                   MOVE      *BLANKS       WKMMA             2
     C                   MOVE      *BLANKS       RN0022           15            WKNLALL
     C                   MOVE      *ZEROS        WKNOD             8 0
     C                   MOVE      *ZEROS        WKPORD           10 0
     C                   MOVE      *ZEROS        RN0023           11 4          WKPRICE
     C                   MOVE      *ZEROS        WKQORD            9 0
     C                   MOVE      *BLANKS       RN0024           20            WKSVIA1
     C                   MOVE      *BLANKS       RN0025           20            WKSVIA2
     C                   MOVE      *BLANKS       WK01A1            1
     C                   MOVE      *ZEROS        WK0601            6 0
     C                   MOVE      *ZEROS        WK0801            8 0
     C                   MOVE      *ZEROS        WK1523           15 6
     C                   MOVE      *BLANKS       RN0026           10            WSDLVDT
     C                   MOVE      *BLANKS       WSFOC             1
     C                   MOVE      *BLANKS       WSMANF           20
     C                   MOVE      *BLANKS       RN0027           20            WSSHIP1
     C                   MOVE      *BLANKS       RN0028           20            WSSHIP2
     C                   MOVE      *ZEROS        X                 3 0
     C                   MOVE      *ZEROS        LCK08             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK09             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK10             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK01             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK12             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK17             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK11             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK05             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK13             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK15             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK03             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK02             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK06             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK14             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK07             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK04             1 0          File lock flag
     C                   MOVE      *ZEROS        LCK16             1 0          File lock flag
     C                   MOVE      *BLANKS       RN0126            3            Branch Number
     C                   MOVE      *BLANKS       EDCARR           20            Carrier
     C                   MOVE      *BLANKS       RN0127            3            Company number
     C                   MOVE      *ZEROS        EDDTTR            8 0          Transaction Date
     C                   MOVE      *BLANKS       RN0128            6            Supplier Number
     C                   MOVE      *ZEROS        EDTIME            6 0          Expected time
     C                   MOVE      *BLANKS       EDTREF           15            Transaction Referenc
     C                   MOVE      *ZEROS        LCK18             1 0          File lock flag
     C                   MOVE      'N'           IOFLAG            1
     C                   MOVE      *BLANKS       SCRNID            8            Scrn ID
     C                   MOVE      *BLANKS       IN01             99            Save Ind
     C                   MOVE      *BLANKS       IN02             99            Save Ind
     C                   MOVE      *BLANKS       IN03             99            Save Ind
     C                   MOVE      *BLANKS       IN04             99            Save Ind
     C                   MOVE      *BLANKS       IN05             99            Save Ind
     C                   MOVE      *BLANKS       DSPLY             1            Display screen flag
     C                   MOVE      *BLANKS       INS01            99            Savd.Ind
     C                   MOVE      *BLANKS       SWRD08            1            RD STS
     C                   MOVE      *BLANKS       SWRD09            1            RD STS
     C                   MOVE      *BLANKS       SWRD10            1            RD STS
     C                   MOVE      *BLANKS       KYCO01            3            CYCOYNO
     C                   MOVE      *BLANKS       KDTR02            2            CDTRNP
     C                   MOVE      *BLANKS       KDCO01            3            CDCOYNO
     C                   MOVE      *BLANKS       SWRD02            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD11            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD03            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD17            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD05            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD13            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD14            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD04            1            RD STS          003
     C                   MOVE      *BLANKS       SWRD06            1            RD STS          003
     C                   MOVE      *BLANKS       KHCO01            3            PHCOYNO
     C                   MOVE      *BLANKS       KHPO02           10            PHPORD
     C                   MOVE      *BLANKS       KOWH02            3            POWHSE
     C                   MOVE      *BLANKS       KHSU02            6            PHSUPPN
     C                   MOVE      *BLANKS       KHBR03            3            PHBRNBR
     C                   MOVE      *BLANKS       INS02            99            Savd.Ind
     C                   MOVE      *ZEROS        KHSE03            5 0          THSEQ
     C                   MOVE      *BLANKS       INS03            99            Savd.Ind
     C                   MOVE      *ZEROS        KOSE03            5 0          POSEQ
     C                   MOVE      *BLANKS       SWRD01            1            RD STS          0030
     C                   MOVE      *BLANKS       KOIT03           20            POITEM
     C                   MOVE      *BLANKS       RIERR             1            RI FLAG
     C                   MOVE      *BLANKS       SWRD12            1            RD STS          0030
     C                   MOVE      *BLANKS       KICO01            3            PICOYNO
     C                   MOVE      *BLANKS       KISU02            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR03            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT04           20            PIITEM
     C                   MOVE      *BLANKS       SWRD15            1            RD STS          0030
     C                   MOVE      *BLANKS       KOIT02           20            POITEM
     C                   MOVE      *BLANKS       KOUO02            5            POUOM
     C                   MOVE      *BLANKS       SWRD16            1            RD STS          0030
     C                   MOVE      *BLANKS       KHCO02            3            WHCOYNO
     C                   MOVE      *BLANKS       KHWH03            3            WHWHSE
     C                   MOVE      *BLANKS       KDIT04           20            WDITEM
     C                   MOVE      *BLANKS       KTTR05            2            WTTRNC
     C                   MOVE      *BLANKS       INS04            99            Savd.Ind
     C                   MOVE      *ZEROS        KDSE04            5 0          TDSEQ
     C                   MOVE      *BLANKS       SWRD07            1            RD STS
     C                   MOVE      *BLANKS       KDCO02            3            UDCOYNO
     C                   MOVE      *BLANKS       KDUS03           10            UDUSER
     C                   MOVE      *BLANKS       INS05            99            Savd.Ind
     C                   MOVE      'N'           CMDKEY            1             Cmd key pressed fla
     C                   MOVE      *BLANKS       RN0130           99
     C                   MOVE      *BLANKS       RN0131           99
     C                   MOVE      *BLANKS       RN0132           99
     C                   MOVE      *BLANKS       ARSLT0          256
     C                   MOVE      *BLANKS       RN0133           99
     C                   MOVE      *BLANKS       RN0134           99
     C                   MOVE      *BLANKS       KHCO03            3            THCOYNO
     C                   MOVE      *BLANKS       KHPO04           10            THPORD
     C                   MOVE      *ZEROS        KHSE05            5 0          THSEQ
     C                   MOVE      *BLANKS       KOCO01            3            POCOYNO
     C                   MOVE      *BLANKS       KOPO02           10            POPORD
     C                   MOVE      *BLANKS       KICO02            3            PICOYNO
     C                   MOVE      *BLANKS       KISU03            6            PISUPPN
     C                   MOVE      *BLANKS       KIBR04            3            PIBRNBR
     C                   MOVE      *BLANKS       KIIT05           20            PIITEM
     C                   MOVE      *BLANKS       KDCO03            3            TDCOYNO
     C                   MOVE      *BLANKS       KDPO04           10            TDPORD
     C                   MOVE      *ZEROS        KDPO05            5 0          TDPOSEQ
     C                   MOVE      *ZEROS        KDSE06            5 0          TDSEQ
     C                   MOVE      *BLANKS       KDCO04            3            PDCOYNO
     C                   MOVE      *BLANKS       KDWH05            3            PDWHSE
     C                   MOVE      *BLANKS       KTCO01            3            ITCOYNO
     C                   MOVE      *BLANKS       KTIT02           20            ITITEM
     C                   MOVE      *BLANKS       KMCO01            3            UMCOYNO
     C                   MOVE      *BLANKS       KMUO02            5            UMUOM
     C                   MOVE      *BLANKS       KUCO01            3            SUCOYNO
     C                   MOVE      *BLANKS       KUSU02            6            SUSUPPN
     C                   MOVE      *BLANKS       KUBR03            3            SUBRNBR
     C                   MOVE      *ZEROS        VALIDF            1 0          Flag for validation
     C                   MOVE      *ZEROS        LISTF             1 0          List of value flag
     C                   MOVE      *ZEROS        RANGEF            1 0          Range chk flag
     C                   MOVE      *BLANKS       RN0135           99
     C                   MOVE      *BLANKS       RN0136           99
     C                   MOVE      *BLANKS       RN0137           99
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
     C                   MOVE      *ZEROS        T12001                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T12002                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T12003                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T12004                         Init DS/*DTA flds
     C                   MOVE      *ZEROS        T12005                         Init DS/*DTA flds
     C                   MOVEL     'LANDIPS'     APPSET
     C                   MOVEL     PGM           APPPGM           10
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
     C                   Z-ADD     *ZEROS        NRSLT0           30 9
     C                   Z-ADD     *ZEROS        SVS02             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        RN0129           30 9
     C                   Z-ADD     *ZEROS        SRN02             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN02             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN02             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN03             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN03             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN03             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SVS03             5 0          SV STS          0030
     C                   Z-ADD     *ZEROS        SRN04             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN04             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN04             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        SRN05             4 0          Savd.Rrn
     C                   Z-ADD     *ZEROS        DRN05             4 0          Dspl.Rrn
     C                   Z-ADD     *ZEROS        ERN05             4 0          SFLEND +
     C                   Z-ADD     *ZEROS        WRRN01            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ01            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WLCNTR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        WLGETR            5 0          LOOP CT         0030
     C                   Z-ADD     *ZEROS        SWEXBL            1 0          @EXITBLK        0030
     C                   Z-ADD     *ZEROS        SWSKPR            1 0          @SKIPREC        0030
     C                   Z-ADD     *ZEROS        NXTRRN            4 0          NXT RRNC        0030
     C                   Z-ADD     *ZEROS        WRRN02            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ02            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS11             5 0          SV STS
     C                   Z-ADD     *ZEROS        WRRN03            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ03            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        WRRN04            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ04            3 0          WRK ADJ
     C                   Z-ADD     *ZEROS        SVS17             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS05             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS13             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS14             5 0          SV STS
     C                   Z-ADD     *ZEROS        SVS06             5 0          SV STS
     C                   Z-ADD     *ZEROS        WRRN05            3 0          WRK RRN
     C                   Z-ADD     *ZEROS        WADJ05            3 0          WRK ADJ
     C                   Z-ADD     1             XYES              1 0          *YES keyword
     C                   Z-ADD     1             CALLST            1 0          CALL STSword
     C                   Z-ADD     *ZEROS        XNO               1 0          *NO keyword
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
     C                   MOVEL     'SC0001'      SCRNID
     C     *INLR         DOWEQ     '0'
     C     SCRNID        CASEQ     'SC0001'      S001
     C     SCRNID        CASEQ     'SC0002'      S002
     C     SCRNID        CASEQ     'SC0003'      S003
     C     SCRNID        CASEQ     'SC0005'      S004
     C     SCRNID        CASEQ     'SC0006'      S005
     C     SCRNID        CASEQ     'SC0007'      S006
     C     SCRNID        CASEQ     'SC0008'      S007
     C     SCRNID        CASEQ     'SC0009'      S008
     C     SCRNID        CASEQ     'SC0010'      S009
     C     SCRNID        CASEQ     'SCRADD'      S010
     C     SCRNID        CASEQ     'SC0012'      S011
     C     SCRNID        CASEQ     'SETSPEC'     S012
     C     SCRNID        CASEQ     'SUPP'        S013
     C     SCRNID        CASEQ     'SCDELD'      S014
     C     SCRNID        CASEQ     'SDET'        S015
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
     C* S001 - List Screen for PORDH
     C*****************************************************************
     C     S001          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0010'        *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* WK0601 = *ymd
     C                   Z-ADD     XYMD          WK0601
     C* PGO = ' '
     C                   MOVEL     *BLANKS       PGO
     C* GETDTAA KDPKEY3  ;Landmark Key
     C                   IN        @DS002                               93
     C                   Z-ADD     0             DAS002
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS002
     C                   END
     C* CALL 'MITMKV',pgo,KDPKEY,WK0601
     C                   Z-ADD     1             CALLST
     C                   CALL      'MITMKV'      P0001                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* IF pgo <> '@@*'
     C     PGO           IFNE      '@@*'
     C* EXTPGM                                                        *
     C                   MOVE      'Y'           LRFLAG
     C                   MOVE      *BLANK        SCRNID
     C                   MOVEL     'SEND'        SCRNID
     C                   GOTO      $00199
     C* END                                                           *
     C                   END
     C* ***  Clear list panel and start display on
     C* ***  first record in file. Performed only once
     C* ***  at start of program.
     C*                                                               *
     C* GETDTAA compnumb ; contains COYNO#
     C                   IN        @DS001                               93
     C                   Z-ADD     0             DAS001
     C     *IN93         IFEQ      '1'
     C                   Z-ADD     USTAT         DAS001
     C                   END
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* PHPORD = ' '
     C                   MOVEL     *BLANKS       XHPORD
     C* PHWHSE = ' '
     C                   MOVEL     *BLANKS       XHWHSE
     C* PHSUPPN = ' '
     C                   MOVEL     *BLANKS       WK0052
     C* PHBRNBR = ' '
     C                   MOVEL     *BLANKS       WK0035
     C* PHSNAME = ' '
     C                   MOVEL     *BLANKS       WK0050
     C* GETREC D.COMPANY,*EQ,COYNO#
     C*
     C                   EXSR      S016
     C* SYDFMT = CYDFMT
     C                   MOVE      WYDFMT        RN0016
     C* SYDSEP = CYDSEP
     C                   MOVE      WYDSEP        RN0018
     C* GETREC D.imscpyd,f.imscpyd,*EQ,COYNO#
     C*
     C                   EXSR      S017
     C* PHCOYNO = COYNO#
     C                   MOVE      COYNO#        WK0038
     C* Set Key values to parms passed
     C* SVK001 = COYNO#
     C                   MOVE      COYNO#        SVK001
     C* Set file for list to first record in file
     C* SETLL D.PORENT,F.PORDH,SVK001
     C*
     C                   EXSR      S018
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
     C* Create
     C*
     C     *INKF         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Process ADD Request on function key 6
     C*                                                               *
     C* MODE = 6
     C                   Z-ADD     6             MODE
     C* EXSCR SCRADD
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   EXSR      S010
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
     C                   END
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* IF UPDFLG=1
     C     UPDFLG        IFEQ      1
     C* SETLL D.PORENT,F.PORDH,SVK001,SVK002
     C*
     C                   EXSR      S019
     C* EXSUBR S01FWD
     C                   EXSR      S01FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00199
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
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK002 = PS0102
     C                   MOVE      PS0102        SVK002
     C* PS0102 = ' '
     C                   MOVEL     *BLANKS       PS0102
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* Set pointer to file.
     C* SETLL D.PORENT,F.PORDH,SVK001,SVK002
     C*
     C                   EXSR      S019
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
     C* S002 - Detail Screen for PORDH
     C*****************************************************************
     C     S002          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00001000'    *IN(1)
     C                   MOVEA     '00001000'    *IN(9)
     C                   MOVEA     '00001001'    *IN(17)
     C                   MOVEA     '00100100'    *IN(25)
     C                   MOVEA     '00001001'    *IN(33)
     C                   MOVEA     '1'           *IN(80)
     C* *** Clear detail screens, setup field attributes,
     C* *** and retrieve field values from files.
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C* SAVMOD = 0
     C                   Z-ADD     *ZERO         SAVMOD
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* SVK001 = PHCOYNO
     C                   MOVE      WK0038        SVK001
     C* SVK002 = PHPORD
     C                   MOVE      XHPORD        SVK002
     C*                                                               *
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR PORENT.PORDH.PHPORD,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XHPORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S020
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.PORENT,F.PORDH)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK02         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* *** Save the supplier number
     C* SVSUPPN = PHSUPPN
     C                   MOVE      WK0052        RN0005
     C* SVBRNBR = PHBRNBR
     C                   MOVE      WK0035        RN0004
     C* *** *** Split Ship Via **
     C* WKSVIA1 = %ljf(PHSHIPV)
     C*  Left Justify field into result field
     C                   MOVEL     WK0043        RN0024
     C* WKSVIA2 = %rjf(PHSHIPV)
     C*  Right Justify field into result field
     C                   MOVE      WK0043        RN0025
     C*                                                               *
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR PORENT.PORDH.PHSUPPN,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHBRNBR,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0035  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSNAME,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0050  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0044  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN2,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0045  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN3,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0046  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN4,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0047  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN5,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0048  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSLIN6,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0049  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHSPSTCD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0051  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHCONNAM,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0037  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWHSE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XHWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWNAME,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0059  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wksvia1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'RN0024  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wksvia2,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'RN0025  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWLIN1,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0053  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWLIN2,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0054  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWLIN3,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0055  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWLIN4,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0056  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHWLIN5*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0057  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHNLALL,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0042  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdlvdt,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'RN0026  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHbuyer,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0036  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHcusord,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0039  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDH.PHwpstcd,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0060  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S020
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.PORENT,F.PORDH)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK02         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** *** Split Ship Via **
     C* WKSVIA1 = %ljf(PHSHIPV)
     C*  Left Justify field into result field
     C                   MOVEL     WK0043        RN0024
     C* WKSVIA2 = %rjf(PHSHIPV)
     C*  Right Justify field into result field
     C                   MOVE      WK0043        RN0025
     C*                                                               *
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* Get selected record for display function.
     C* GETREC D.PORENT,F.PORDH,*eq,SVK001,SVK002
     C*
     C                   EXSR      S021
     C*                                                               *
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* *** *** Split Ship Via **
     C* WKSVIA1 = %ljf(PHSHIPV)
     C*  Left Justify field into result field
     C                   MOVEL     WK0043        RN0024
     C* WKSVIA2 = %rjf(PHSHIPV)
     C*  Right Justify field into result field
     C                   MOVE      WK0043        RN0025
     C*                                                               *
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Format the date
     C* WSDLVDT %dmc(phdlvdt)
     C* SYDATI = phdlvdt
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C*                                                               *
     C* Clear screens for Add function.
     C* CLRSCR SETSPEC
     C*
     C                   EXSR      S022
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C* PHOS01 = 'Y'
     C                   MOVE      'Y'           WHOS01
     C* PHOS02 = 'N'
     C                   MOVE      'N'           WHOS02
     C* PHOS03 = 'Y'
     C                   MOVE      'Y'           WHOS03
     C* PHOS04 = 'N'
     C                   MOVE      'N'           XHOS04
     C* PHOS05 = 'N'
     C                   MOVE      'N'           WHOS05
     C* PHOS06 = 'N'
     C                   MOVE      'N'           XHOS06
     C* PHOS07 = 'N'
     C                   MOVE      'N'           XHOS07
     C* PHOS08 = 'N'
     C                   MOVE      'N'           WHOS08
     C* PHOS09 = 'N'
     C                   MOVE      'N'           XHOS09
     C* PHOS10 = 'N'
     C                   MOVE      'N'           WHOS10
     C* PHOS11 = 'N'
     C                   MOVE      'N'           WHOS11
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* PHENTDT = ##DATE
     C                   Z-ADD     ##DATE        WK0041
     C* WSDLVDT = *blanks
     C                   MOVEL     *BLANKS       RN0026
     C* PHBUYER = ' '
     C                   MOVEL     *BLANKS       WK0036
     C* PHCUSORD = ' '
     C                   MOVEL     *BLANKS       WK0039
     C* PHWNAME = ' '
     C                   MOVEL     *BLANKS       WK0059
     C* PHNLALL = ' '
     C                   MOVEL     *BLANKS       WK0042
     C* WKSVIA1 = ' '
     C                   MOVEL     *BLANKS       RN0024
     C* WKSVIA2 = ' '
     C                   MOVEL     *BLANKS       RN0025
     C* Get warehouse address
     C* GETREC D.PORENT,F.ipswadd,*eq,COYNO#,phwhse
     C*
     C                   EXSR      S023
     C* PHWNAME = pdlin1
     C                   MOVE      WDLIN1        WK0059
     C* PHWLIN1 = pdlin2
     C                   MOVE      WDLIN2        WK0053
     C* PHWLIN2 = pdlin3
     C                   MOVE      WDLIN3        WK0054
     C* PHWLIN3 = pdlin4
     C                   MOVE      WDLIN4        WK0055
     C* PHWLIN4 = pdlin5
     C                   MOVE      WDLIN5        WK0056
     C* PHWLIN5 = pdlin6
     C                   MOVE      WDLIN6        WK0057
     C* PHWPSTCD = pdpstcd
     C                   MOVE      WK0018        WK0060
     C* PHSNAME = ' '
     C                   MOVEL     *BLANKS       WK0050
     C* PHSLIN1 = ' '
     C                   MOVEL     *BLANKS       WK0044
     C* PHSLIN2 = ' '
     C                   MOVEL     *BLANKS       WK0045
     C* PHSLIN3 = ' '
     C                   MOVEL     *BLANKS       WK0046
     C* PHSLIN4 = ' '
     C                   MOVEL     *BLANKS       WK0047
     C* PHSLIN5 = ' '
     C                   MOVEL     *BLANKS       WK0048
     C* PHSLIN6 = ' '
     C                   MOVEL     *BLANKS       WK0049
     C* PHSPSTCD = ' '
     C                   MOVEL     *BLANKS       WK0051
     C* PHCONNAM = ' '
     C                   MOVEL     *BLANKS       WK0037
     C* GETREC D.PORENT,F.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S024
     C* IF %STS(D.PORENT,F.suplier)=*YES
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C* PHSNAME = suname
     C                   MOVE      WUNAME        WK0050
     C* PHSLIN1 = sulin1
     C                   MOVE      WULIN1        WK0044
     C* PHSLIN2 = sulin2
     C                   MOVE      WULIN2        WK0045
     C* PHSLIN3 = sulin3
     C                   MOVE      WULIN3        WK0046
     C* PHSLIN4 = sulin4
     C                   MOVE      WULIN4        WK0047
     C* PHSLIN5 = sulin5
     C                   MOVE      WULIN5        WK0048
     C* PHSLIN6 = sulin6
     C                   MOVE      WULIN6        WK0049
     C* PHSPSTCD = supstcd
     C                   MOVE      WK0063        WK0051
     C* PHCONNAM = suconnam
     C                   MOVE      WK0062        WK0037
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* EXSUBR SAVSADD  ;Save address details for later compare
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
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
     C                   MOVEA     '1'           *IN(5)
     C                   MOVEA     '0'           *IN(11)
     C                   MOVEA     '1'           *IN(13)
     C                   MOVEA     '0'           *IN(19)
     C                   MOVEA     '10'          *IN(21)
     C                   MOVEA     '10'          *IN(24)
     C                   MOVEA     '10'          *IN(27)
     C                   MOVEA     '1'           *IN(30)
     C                   MOVEA     '0'           *IN(35)
     C                   MOVEA     '10'          *IN(37)
     C                   MOVEA     '1'           *IN(40)
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
     C* IF %clf(PORENT.PORDh.Phsuppn)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* **
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* ** Display prompt window.
     C* EXSCR SC0012
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
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* **
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* PHSUPPN = F02001
     C                   MOVE      F02001        WK0052
     C* PHBRNBR = F02002
     C                   MOVE      F02002        WK0035
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
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
     C* RLSREC D.PORENT,F.PORDH
     C*
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
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
     C* ** Display Details to confirm deletion.
     C* EXSCR SCDELD
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S014
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* ** Delete
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* DELETE D.PORENT,F.PORDH
     C*
     C                   EXSR      S025
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C*                                                               *
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
     C* Text
     C*
     C     *INKJ         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* Check details are valid
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* IF mode=2 | mode=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C* IF phsuppn <> ' '
     C     WK0052        IFNE      *BLANKS
     C* ***  Supplier must be on file
     C* GETREC D.PORENT,F.SUPLIER,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S024
     C* IF %sts(d.PORENT,f.suplier)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
     C* DSPERR PHSUPPN,'USR2071','ERRORS',*LIBL
     C                   MOVEL     'USR2071'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END ;supplier not found
     C                   END
     C* END ;Supplier not entered
     C                   END
     C* *** if supplier changed check status
     C* IF phsuppn <> svsuppn | phbrnbr <> svbrnbr
     C     WK0052        IFNE      RN0005
     C     WK0035        ORNE      RN0004
     C* IF phos01 = 'N' & phos04 = 'N'
     C     WHOS01        IFEQ      'N'
     C     XHOS04        ANDEQ     'N'
     C* DSPERR PHSUPPN,'USR2072','ERRORS',*LIBL
     C                   MOVEL     'USR2072'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END ; Supplier not changed
     C                   END
     C* END ; type ok.
     C                   END
     C* **Supplier not changed or blank check addr
     C* IF phsuppn=svsuppn&phbrnbr=svbrnbr|phsuppn=' '
     C     WK0052        IFEQ      RN0005
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WK0035        IFEQ      RN0004
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WK0052        IFEQ      *BLANKS
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* IF phsname = ' '
     C     WK0050        IFEQ      *BLANKS
     C* DSPERR PHSNAME,'USR0014','ERRORS',*LIBL
     C                   MOVEL     'USR2095'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0050  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF phslin1 = ' '
     C     WK0044        IFEQ      *BLANKS
     C* DSPERR PHSLIN1,'USR0008','ERRORS',*LIBL
     C                   MOVEL     'USR2096'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0044  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF phspstcd = ' '
     C     WK0051        IFEQ      *BLANKS
     C* DSPERR PHSPSTCD,'USR0022','ERRORS',*LIBL
     C                   MOVEL     'USR2097'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0051  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END ; Supplier changed and not blank
     C                   END
     C* *** if supplier changed output check
     C* IF phsuppn <> svsuppn | phbrnbr <> svbrnbr
     C     WK0052        IFNE      RN0005
     C     WK0035        ORNE      RN0004
     C* IF error='N'
     C     ERROR         IFEQ      'N'
     C* EXSCR supp
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S013
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* END ; error found
     C                   END
     C* END ; supplier number not changed
     C                   END
     C*                                                               *
     C* *** No errors found
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* *** Update header details
     C* SAVMOD = mode
     C                   Z-ADD     MODE          SAVMOD
     C* EXSUBR srupd
     C                   EXSR      SRUPD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* *** call text screen
     C* EXSCR sc0003
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
     C* IF savmod = 6
     C     SAVMOD        IFEQ      6
     C* MODE = 2
     C                   Z-ADD     2             MODE
     C* GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S020
     C* *** Format the date
     C* SYDATI = PHDLVDT
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* SVSUPPN = PHSUPPN
     C                   MOVE      WK0052        RN0005
     C* SVBRNBR = PHBRNBR
     C                   MOVE      WK0035        RN0004
     C* END                                                           *
     C                   END
     C* END ; error found
     C                   END
     C*                                                               *
     C* END ;not mode 2 or 6
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Check details are valid
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C*                                                               *
     C* IF mode=5
     C     MODE          IFEQ      5
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C* END                                                           *
     C                   END
     C* IF mode=2 | mode=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C* ***                                                           *
     C* *** Test the delivery date
     C* ***                                                           *
     C* IF wsdlvdt <> *BLANKS
     C     RN0026        IFNE      *BLANKS
     C* *** Convert the date first to a number
     C* SYDATAI = WSDLVDT
     C                   MOVE      RN0026        RN0009
     C* SYCMD = *ZEROS
     C                   Z-ADD     *ZEROS        RN0007
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* *** Now validate the converted date
     C* SYDATV = SYCMD
     C                   Z-ADD     RN0007        RN0013
     C* SYDERR = '0'
     C                   MOVE      '0'           RN0014
     C* EXSUBR SY0030
     C                   EXSR      SY0030
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C*                                                               *
     C* IF SYDERR = '1'
     C     RN0014        IFEQ      '1'
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR WSDLVDT,'FLD0011','ERRORS',*LIBL
     C                   MOVEL     'FLD0011'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0026  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* SYDATI = SYCMD
     C                   Z-ADD     RN0007        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF phsuppn <> ' '
     C     WK0052        IFNE      *BLANKS
     C* ***  Supplier must be on file
     C* GETREC D.PORENT,F.SUPLIER,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S024
     C* IF %sts(d.PORENT,f.suplier)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
     C* DSPERR PHSUPPN,'USR1018','ERRORS',*LIBL
     C                   MOVEL     'USR2098'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END ;supplier not found
     C                   END
     C* END ;Supplier not entered
     C                   END
     C* *** if supplier changed check status
     C* IF phsuppn <> svsuppn | phbrnbr <> svbrnbr
     C     WK0052        IFNE      RN0005
     C     WK0035        ORNE      RN0004
     C* IF phos01 = 'N' & phos04 = 'N'
     C     WHOS01        IFEQ      'N'
     C     XHOS04        ANDEQ     'N'
     C* DSPERR PHSUPPN,'USR2010','ERRORS'
     C                   MOVEL     'USR2099'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END ; Supplier not changed
     C                   END
     C* END ; type ok.
     C                   END
     C* **Supplier not changed or blank check addr
     C* IF phsuppn=svsuppn&phbrnbr=svbrnbr|phsuppn=' '
     C     WK0052        IFEQ      RN0005
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     WK0035        IFEQ      RN0004
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     WK0052        IFEQ      *BLANKS
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        OREQ      1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      1
     C* IF phsname = ' '
     C     WK0050        IFEQ      *BLANKS
     C* DSPERR PHSNAME,'USR0014','ERRORS',*LIBL
     C                   MOVEL     'USR2100'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0050  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF phslin1 = ' '
     C     WK0044        IFEQ      *BLANKS
     C* DSPERR PHSLIN1,'USR0008','ERRORS',*LIBL
     C                   MOVEL     'USR2101'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0044  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* IF phspstcd = ' '
     C     WK0051        IFEQ      *BLANKS
     C* DSPERR PHSPSTCD,'USR0022','ERRORS',*LIBL
     C                   MOVEL     'USR2102'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0051  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END ; Supplier changed and not blank
     C                   END
     C* *** if supplier changed output check
     C* IF phsuppn <> svsuppn | phbrnbr <> svbrnbr
     C     WK0052        IFNE      RN0005
     C     WK0035        ORNE      RN0004
     C* IF error='N'
     C     ERROR         IFEQ      'N'
     C* EXSCR supp
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S013
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END ; error found
     C                   END
     C* END ; supplier number not changed
     C                   END
     C*                                                               *
     C* **Supplier not changed but details have
     C* IF phsuppn=svsuppn&phbrnbr=svbrnbr
     C     WK0052        IFEQ      RN0005
     C     WK0035        ANDEQ     RN0004
     C* IF error='N'
     C     ERROR         IFEQ      'N'
     C* * compare address details
     C* EXSUBR cmpsav
     C                   EXSR      CMPSAV
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* IF detchg = 'Y'
     C     DETCHG        IFEQ      'Y'
     C* * if details change - display info screen.
     C* EXSCR sdet
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S015
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END ; Supplier not changed, details have.
     C                   END
     C*                                                               *
     C* *** No errors found
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* *** Update header details
     C* EXSUBR srupd
     C                   EXSR      SRUPD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* IF MODE=6 | savmod = 6
     C     MODE          IFEQ      6
     C     SAVMOD        OREQ      6
     C* HEADER = ' '
     C                   MOVE      *BLANKS       HEADER
     C* POCOYNO = PHCOYNO
     C                   MOVE      WK0038        WK0029
     C* POPORD = PHPORD
     C                   MOVE      XHPORD        XOPORD
     C* **** Detail Line List Screen
     C* EXSCR SC0005
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
     C* IF header = 'Y'
     C     HEADER        IFEQ      'Y'
     C* MODE = 2
     C                   Z-ADD     2             MODE
     C* SVK001 = PHCOYNO
     C                   MOVE      WK0038        SVK001
     C* SVK002 = PHPORD
     C                   MOVE      XHPORD        SVK002
     C*                                                               *
     C* FLDATR PORENT.PORDH.PHPORD,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XHPORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0002  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     C*
     C                   EXSR      S020
     C* *** convert the delivery date
     C* SYDATI = PHDLVDT
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* *** Save the supplier number
     C* SVSUPPN = PHSUPPN
     C                   MOVE      WK0052        RN0005
     C* SVBRNBR = PHBRNBR
     C                   MOVE      WK0035        RN0004
     C*                                                               *
     C* GOTO :dtend
     C                   GOTO      DTEND
     C* END ; Header not requested
     C                   END
     C* END ; Not add mode
     C                   END
     C* **** Special conditions window
     C* EXSCR setspec
     C                   ADD       1             SP
     C                   MOVEL     'SC0002  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN02
     C                   EXSR      S012
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00299
     C                   END
     C                   MOVEA     IN02          *IN
     C                   MOVE      '1'           *IN79
     C*                                                               *
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* SVK002 = PHPORD
     C                   MOVE      XHPORD        SVK002
     C* EXTSCR                                                        *
     C                   GOTO      $00299
     C*                                                               *
     C* END ; error found
     C                   END
     C*                                                               *
     C* END ;not mode 2 or 6
     C                   END
     C*                                                               *
     C* TAG :dtend
     C     DTEND         TAG
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S003 - List Screen for IPSTXTH
     C*****************************************************************
     C     S003          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '010101'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Set Keys to values from header file.
     C* SVK003 = PHCOYNO
     C                   MOVE      WK0038        SVK003
     C* SVK004 = PHPORD
     C                   MOVE      XHPORD        SVK004
     C* SVK005 = 0
     C                   Z-ADD     *ZERO         SVK005
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* THCOYNO = PHCOYNO
     C                   MOVE      WK0038        WK0015
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.PORENT,F.IPSTXTH,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S026
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
     C                   MOVEA     '010101'      *IN(1)
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
     C* Previous
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
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S003V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
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
     C* IF PS0301<>0
     C     PS0301        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK005 = PS0301
     C                   Z-ADD     PS0301        SVK005
     C* PS0301 = 0
     C                   Z-ADD     *ZERO         PS0301
     C* END                                                           *
     C                   END
     C*                                                               *
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.PORENT,F.IPSTXTH,SVK003,SVK004,SVK005
     C*
     C                   EXSR      S026
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
     C                   END
     C     $00399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S004 - List Screen for PORDD
     C*****************************************************************
     C     S004          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100'       *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Set Keys to values from header file.
     C* SVK006 = PHCOYNO
     C                   MOVE      WK0038        SVK006
     C* SVK007 = PHPORD
     C                   MOVE      XHPORD        SVK007
     C* SVK008 = 0
     C                   Z-ADD     *ZERO         SVK008
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S027
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
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
     C                   WRITE     SCR004
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
     C                   EXFMT     SCR004C1
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
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen on
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00499
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Header
     C*
     C     *INKY         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to header details
     C* HEADER = 'Y'
     C                   MOVE      'Y'           HEADER
     C* EXTSCR                                                        *
     C                   GOTO      $00499
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
     C                   MOVEA     *IN           IN03
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S027
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
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
     C                   GOTO      $00499
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S05BKW
     C                   EXSR      S05BKW
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
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S05EDT
     C                   EXSR      S05EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
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
     C                   GOTO      $00499
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0501<>0
     C     PS0501        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK008 = PS0501
     C                   Z-ADD     PS0501        SVK008
     C* PS0501 = 0
     C                   Z-ADD     *ZERO         PS0501
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S027
     C* EXSUBR S05FWD
     C                   EXSR      S05FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00499
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00499        ENDSR
     C/EJECT
     C*****************************************************************
     C* S005 - Detail Screen for PORDD
     C*****************************************************************
     C     S005          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00100100'    *IN(1)
     C                   MOVEA     '10010001'    *IN(9)
     C                   MOVEA     '00100100'    *IN(17)
     C                   MOVEA     '1'           *IN(25)
     C                   MOVEA     '1'           *IN(80)
     C* *** Get Purchasing control record
     C* *** Clear detail screens, setup field attributes,
     C* GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     C*
     C                   EXSR      S028
     C* *** and retrieve field values from files.
     C* GETREC D.PORENT,F.PORDh,*eq,pocoyno,popord
     C*
     C                   EXSR      S029
     C*                                                               *
     C* Refresh exit flag at start of detail
     C* EXTSCR = 0
     C                   Z-ADD     *ZERO         EXTSCR
     C* SVK006 = POCOYNO
     C                   MOVE      WK0029        SVK006
     C* SVK007 = POPORD
     C                   MOVE      XOPORD        SVK007
     C* SVK008 = POSEQ
     C                   Z-ADD     XOSEQ         SVK008
     C* PODLVDT = 0
     C                   Z-ADD     *ZERO         WK0030
     C* WSDLVDT = *BLANKS
     C                   MOVEL     *BLANKS       RN0026
     C* POITEM = ' '
     C                   MOVEL     *BLANKS       XOITEM
     C* POIDESC = ' '
     C                   MOVEL     *BLANKS       WK0031
     C* POPRICE = 0
     C                   Z-ADD     *ZERO         WK0033
     C* POQORD = 0
     C                   Z-ADD     *ZERO         XOQORD
     C* PONLALL = ' '
     C                   MOVEL     *BLANKS       WK0032
     C* POWHSE = ' '
     C                   MOVEL     *BLANKS       XOWHSE
     C* POUOM = ' '
     C                   MOVEL     *BLANKS       XOUOM
     C* WSFOC = ' '
     C                   MOVE      *BLANKS       WSFOC
     C*                                                               *
     C* Process Edit, Delete, and Display action choices
     C* IF MODE=2 | MODE=4 | MODE=5
     C     MODE          IFEQ      2
     C     MODE          OREQ      4
     C     MODE          OREQ      5
     C* Save Key values prior to clearing screens,
     C* otherwise, keys will be lost when screen is
     C* cleared.
     C* POCOYNO = SVK006
     C                   MOVE      SVK006        WK0029
     C* POPORD = SVK007
     C                   MOVE      SVK007        XOPORD
     C* POSEQ = SVK008
     C                   Z-ADD     SVK008        XOSEQ
     C* Revise, Delete, and Display, protect
     C* key fields from being changed.
     C* FLDATR PORENT.PORDD.POPORD,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOPORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POSEQ,*PR
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOSEQ   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C*                                                               *
     C* Get selected record for edit function.
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* GETREC D.PORENT,F.PORDD,*lock,*eq,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S030
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.PORENT,F.PORDD)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK03         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* MODDSC = 'CHANGE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'CHANGE'      MODDSC
     C* *** Save elements to determine Alteration
     C* WKDLVDT = PODLVDT
     C                   Z-ADD     WK0030        RN0021
     C* WKPRICE = POPRICE
     C                   Z-ADD     WK0033        RN0023
     C* WKQORD = POQORD
     C                   Z-ADD     XOQORD        WKQORD
     C* WKNLALL = PONLALL
     C                   MOVE      WK0032        RN0022
     C* ELSE                                                          *
     C                   ELSE
     C* Protect Data fields from being changed for
     C* delete and display action choices.
     C* FLDATR PORENT.PORDD.POITEM,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POIDESC,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0031  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POPRICE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0033  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POQORD,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.PONLALL,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WK0032  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POWHSE,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR PORENT.PORDD.POUOM,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOUOM   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsdlvdt,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'RN0026  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR wsfoc,*pr
     C                   MOVE      'X'           #PR
     C                   MOVEL     'WSFOC   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* Get selected record for delete function.
     C* IF MODE=4
     C     MODE          IFEQ      4
     C* GETREC D.PORENT,F.PORDD,*lock,*eq,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S030
     C*                                                               *
     C* If record locked, return to previous
     C* screen and display lock message from OS/400.
     C* IF %lock(D.PORENT,F.PORDD)=*yes
     C*  Lock status on file
     C                   EXSR      SLOCK
     C     LCK03         IFEQ      *ZERO
     C* EXTSCR = 1
     C                   Z-ADD     1             EXTSCR
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* MODDSC = 'DELETE'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DELETE'      MODDSC
     C* ELSE                                                          *
     C                   ELSE
     C* Get selected record for display function.
     C* GETREC D.PORENT,F.PORDD,*eq,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S031
     C* MODDSC = 'DISPLAY'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'DISPLAY'     MODDSC
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYDATI = PODLVDT
     C                   Z-ADD     WK0030        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* IF POPRICE=0
     C     WK0033        IFEQ      *ZERO
     C* WSFOC = 'Y'
     C                   MOVE      'Y'           WSFOC
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* Clear screens for Add function.
     C*                                                               *
     C* SYDATI = PHDLVDT
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* POPORD = ' '
     C                   MOVEL     *BLANKS       XOPORD
     C* POSEQ = 0
     C                   Z-ADD     *ZERO         XOSEQ
     C* SVK006 = PHCOYNO
     C                   MOVE      WK0038        SVK006
     C* SVK007 = PHPORD
     C                   MOVE      XHPORD        SVK007
     C* POCOYNO = PHCOYNO
     C                   MOVE      WK0038        WK0029
     C* POPORD = PHPORD
     C                   MOVE      XHPORD        XOPORD
     C* MODDSC = 'ADD'
     C                   MOVE      *BLANKS       MODDSC
     C                   MOVEL     'ADD'         MODDSC
     C*                                                               *
     C* *** If Allocation Account entered on Header default detail.
     C* IF PHNLALL<>' '
     C     WK0042        IFNE      *BLANKS
     C* PONLALL = PHNLALL
     C                   MOVE      WK0042        WK0032
     C* ELSE                                                          *
     C                   ELSE
     C* PONLALL = ' '
     C                   MOVEL     *BLANKS       WK0032
     C* END                                                           *
     C                   END
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
     C                   EXFMT     SCR005
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '10'          *IN(3)
     C                   MOVEA     '10'          *IN(6)
     C                   MOVEA     '10'          *IN(9)
     C                   MOVEA     '1'           *IN(12)
     C                   MOVEA     '0'           *IN(14)
     C                   MOVEA     '10'          *IN(16)
     C                   MOVEA     '10'          *IN(19)
     C                   MOVEA     '10'          *IN(22)
     C                   MOVEA     '1'           *IN(25)
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
     C* ** Check header fields for prompt.
     C* ** check detail fields for prompt
     C*                                                               *
     C* IF %clf(PORENT.PORDD.POWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XOWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F06001 = ' '
     C                   MOVEL     *BLANKS       F06001
     C* ** Display prompt window.
     C* EXSCR SC0008
     C                   ADD       1             SP
     C                   MOVEL     'SC0006  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S007
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F06001<>' '
     C     F06001        IFNE      *BLANKS
     C* POWHSE = F06001
     C                   MOVE      F06001        XOWHSE
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF %clf(PORENT.PORDD.POITEM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F06002 = ' '
     C                   MOVEL     *BLANKS       F06002
     C* ** Display prompt window.
     C* EXSCR SC0009
     C                   ADD       1             SP
     C                   MOVEL     'SC0006  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S008
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F06002<>' '
     C     F06002        IFNE      *BLANKS
     C* POITEM = F06002
     C                   MOVE      *BLANKS       XOITEM
     C                   MOVEL     F06002        XOITEM
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF %clf(PORENT.PORDD.POUOM)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XOUOM   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F06003 = ' '
     C                   MOVEL     *BLANKS       F06003
     C* ** Display prompt window.
     C* EXSCR SC0010
     C                   ADD       1             SP
     C                   MOVEL     'SC0006  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN04
     C                   EXSR      S009
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F06003<>' '
     C     F06003        IFNE      *BLANKS
     C* POUOM = F06003
     C                   MOVE      F06003        XOUOM
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
     C* RLSREC D.PORENT,F.PORDD
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   UNLOCK    PORDD                                91      RLS LCK PORDD
     C* END                                                           *
     C                   END
     C*                                                               *
     C* EXTSCR                                                        *
     C                   GOTO      $00599
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
     C* DELETE D.PORENT,F.PORDD
     C*
     C                   EXSR      S032
     C* GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     C*
     C                   EXSR      S033
     C* IF %sts(D.PORENT,f.waredet)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* WDQOO = wdqoo - poqord
     C     WK0070        SUB       XOQORD        NRSLT0
     C                   Z-ADD     NRSLT0        WK0070
     C* WDPURM wdpurm - poqord
     C* WDPURY wdpury - poqord
     C* UPDATE D.PORENT,f.waredet
     C*
     C                   EXSR      S034
     C* END                                                           *
     C                   END
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S005V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
     C*
     C* Non Stock
     C*
     C     *INKE         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Check details are valid               y 14
     C* ERROR = ' '
     C                   MOVE      *BLANKS       ERROR
     C* *** Item must not be on file
     C* GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     C*
     C                   EXSR      S033
     C* IF %sts(d.PORENT,f.waredet)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POITEM,'USR2073','ERRORS',*LIBL
     C                   MOVEL     'USR2073'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* *** Details not blank
     C* IF poitem = ' '
     C     XOITEM        IFEQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POITEM,'USR2074','ERRORS',*LIBL
     C                   MOVEL     'USR2074'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,COYNO#,PHSUPPN,PHBRNBR,POITEM
     C*
     C                   EXSR      S036
     C* IF %sts(D.IPSITEM,f.ipsitem)=*yes & error =' '
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
     C     ERROR         IFEQ      *BLANKS
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* IF poidesc = ' '
     C     WK0031        IFEQ      *BLANKS
     C* POIDESC = pidesc
     C                   MOVE      WIDESC        WK0031
     C* END                                                           *
     C                   END
     C* IF pouom = ' '
     C     XOUOM         IFEQ      *BLANKS
     C* POUOM = piuom
     C                   MOVE      WIUOM         XOUOM
     C* END                                                           *
     C                   END
     C* IF poprice = 0 & wsfoc <> 'Y'
     C     WK0033        IFEQ      *ZERO
     C     WSFOC         ANDNE     'Y'
     C* POPRICE = picost
     C                   Z-ADD     WICOST        WK0033
     C* END                                                           *
     C                   END
     C* IF wsdlvdt = *BLANKS
     C     RN0026        IFEQ      *BLANKS
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WK0801 = ##DATE
     C                   Z-ADD     ##DATE        WK0801
     C* WKNOD = %nod(wk0801)
     C*  Number of Days Since the Turn of the Century
     C                   Z-ADD     WK0801        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SNOD
     C                   Z-ADD     NRSLT         RN0129
     C                   Z-ADD     RN0129        WKNOD
     C* WKNOD = wknod + piltim
     C     WKNOD         ADD       WILTIM        RN0129
     C                   Z-ADD     RN0129        WKNOD
     C* WK0801 = %ctd(wknod)
     C*  Convert to Date
     C                   Z-ADD     WKNOD         NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SCTD
     C                   Z-ADD     NRSLT         RN0129
     C                   Z-ADD     RN0129        WK0801
     C* *** Format the date
     C* SYDATI = WK0801
     C                   Z-ADD     WK0801        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF wsdlvdt = *blanks
     C     RN0026        IFEQ      *BLANKS
     C* *** Format the date from the header
     C* SYDATI = PHDLVDT
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF poidesc = ' '
     C     WK0031        IFEQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POIDESC,'USR2076','ERRORS',*LIBL
     C                   MOVEL     'USR2076'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0031  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* *** Warehouse on file
     C* IF powhse = ' '
     C     XOWHSE        IFEQ      *BLANKS
     C* POWHSE = phwhse
     C                   MOVE      XHWHSE        XOWHSE
     C* END                                                           *
     C                   END
     C* GETREC D.PORENT,F.IPSWADD,*EQ,COYNO#,POWHSE
     C*
     C                   EXSR      S037
     C* IF %sts(d.PORENT,f.ipswadd)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POWHSE,'USR2070','ERRORS',*LIBL
     C                   MOVEL     'USR2070'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* **   Check allocated account
     C* IF ponlall= ' '
     C     WK0032        IFEQ      *BLANKS
     C* PONLALL = phnlall
     C                   MOVE      WK0042        WK0032
     C* END                                                           *
     C                   END
     C* IF ponlall = ' '
     C     WK0032        IFEQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR PONLALL,'USR2075','ERRORS',*LIBL
     C                   MOVEL     'USR2075'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0032  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF pouom = ' '
     C     XOUOM         IFEQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POUOM,'USR0012','ERRORS',*LIBL
     C                   MOVEL     'USR2103'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOUOM   '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* IF poprice = 0 & wsfoc<> 'Y'
     C     WK0033        IFEQ      *ZERO
     C     WSFOC         ANDNE     'Y'
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POPRICE,'USR0013','ERRORS'
     C                   MOVEL     'USR2104'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0033  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* *** Perform updates to file on function ke
     C*                                                               *
     C* IF error = ' '
     C     ERROR         IFEQ      *BLANKS
     C* SYDATAI = WSDLVDT
     C                   MOVE      RN0026        RN0009
     C* SYCMD = *ZEROS
     C                   Z-ADD     *ZEROS        RN0007
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* PODLVDT = SYCMD
     C                   Z-ADD     RN0007        WK0030
     C*                                                               *
     C* IF wsdlvdt = *BLANKS
     C     RN0026        IFEQ      *BLANKS
     C* PODLVDT = phdlvdt
     C                   Z-ADD     WK0040        WK0030
     C* END                                                           *
     C                   END
     C* POCCDE = ' '
     C                   MOVE      *BLANKS       WOCCDE
     C* POCONV = 0
     C                   Z-ADD     *ZERO         WOCONV
     C* POPCDE = ' '
     C                   MOVE      *BLANKS       WOPCDE
     C*                                                               *
     C* PAITEM = poitem
     C                   MOVE      XOITEM        WAITEM
     C* PAIDESC = poidesc
     C                   MOVE      WK0031        WK0025
     C* PAQRCVD = poqrcvd
     C                   Z-ADD     WK0034        WK0028
     C* PAUOM = pouom
     C                   MOVE      XOUOM         WAUOM
     C* PACONV = poconv
     C                   Z-ADD     WOCONV        WACONV
     C* PACCDE = poccde
     C                   MOVE      WOCCDE        WACCDE
     C* PAPCDE = popcde
     C                   MOVE      WOPCDE        WAPCDE
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* PADATE = ##DATE
     C                   Z-ADD     ##DATE        WADATE
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* IF wkdlvdt<>podlvdt | wkprice<>poprice | wkqord<>poqord | wknlall<>ponla
     C*    ll
     C     RN0021        IFNE      WK0030
     C     RN0023        ORNE      WK0033
     C     WKQORD        ORNE      XOQORD
     C     RN0022        ORNE      WK0032
     C* PACOYNO = pocoyno
     C                   MOVE      WK0029        WK0023
     C* PAPORD = popord
     C                   MOVE      XOPORD        WAPORD
     C* PASEQ = poseq
     C                   Z-ADD     XOSEQ         WASEQ
     C* PATYPE = 'B'
     C                   MOVE      'B'           WATYPE
     C* PADLVDT = wkdlvdt
     C                   Z-ADD     RN0021        WK0024
     C* PAPRICE = wkprice
     C                   Z-ADD     RN0023        WK0027
     C* PAQORD = wkqord
     C                   Z-ADD     WKQORD        WAQORD
     C* PANLALL = wknlall
     C                   MOVE      RN0022        WK0026
     C* WRITE d.poDTALT,f.podtalt
     C*
     C                   EXSR      S038
     C* PATYPE = 'C'
     C                   MOVE      'C'           WATYPE
     C* PADLVDT = podlvdt
     C                   Z-ADD     WK0030        WK0024
     C* PAPRICE = poprice
     C                   Z-ADD     WK0033        WK0027
     C* PAQORD = poqord
     C                   Z-ADD     XOQORD        WAQORD
     C* PANLALL = ponlall
     C                   MOVE      WK0032        WK0026
     C* WRITE d.podtalt,f.podtalt
     C*
     C                   EXSR      S038
     C* *** Details not changed
     C* END                                                           *
     C                   END
     C* UPDATE D.PORENT,F.PORDD
     C*
     C                   EXSR      S039
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* WRITE D.PORENT,F.PORDD
     C*
     C                   EXSR      S040
     C* IF phos01 = 'N'
     C     WHOS01        IFEQ      'N'
     C* PACOYNO = pocoyno
     C                   MOVE      WK0029        WK0023
     C* PAPORD = popord
     C                   MOVE      XOPORD        WAPORD
     C* PASEQ = poseq
     C                   Z-ADD     XOSEQ         WASEQ
     C* PATYPE = 'A'
     C                   MOVE      'A'           WATYPE
     C* PADLVDT = podlvdt
     C                   Z-ADD     WK0030        WK0024
     C* PAPRICE = poprice
     C                   Z-ADD     WK0033        WK0027
     C* PAQORD = poqord
     C                   Z-ADD     XOQORD        WAQORD
     C* PANLALL = ponlall
     C                   MOVE      WK0032        WK0026
     C* WRITE d.podtalt,f.podtalt
     C*
     C                   EXSR      S038
     C* *** Details not changed
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF MODE=2 | mode=5 | mode=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      5
     C     MODE          OREQ      6
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* *** Check details are valid
     C* ERROR = ' '
     C                   MOVE      *BLANKS       ERROR
     C* *** Item must be on either item files
     C* *** Look at the supplier item file first
     C* GETREC D.ipsitem,*EQ,COYNO#,PHSUPPN,PHBRNBR,POITEM
     C*
     C                   EXSR      S036
     C* *** If inventory is not used - this is an error
     C* IF %sts(d.ipsitem,f.ipsitem)=*no
     C*  Status of last file I/O
     C     STS12         IFNE      *ZERO
     C*                                                               *
     C* IF CDIMS='N'
     C     WDIMS         IFEQ      'N'
     C* DSPERR POITEM,'USR2059','ERRORS',*LIBL
     C                   MOVEL     'USR2059'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** IMS Master File
     C* IF CDIMS='Y'
     C     WDIMS         IFEQ      'Y'
     C* GETREC d.PORENT,f.itmmast,*eq,COYNO#,poitem
     C*
     C                   EXSR      S041
     C* IF %sts(D.PORENT,f.itmmast)=*no
     C*  Status of last file I/O
     C     STS13         IFNE      *ZERO
     C* DSPERR POITEM,'USR2058','ERRORS',*LIBL
     C                   MOVEL     'USR2058'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOITEM  '    FLDNAM
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
     C* *** Warehouse on file
     C* IF powhse = ' '
     C     XOWHSE        IFEQ      *BLANKS
     C* POWHSE = phwhse
     C                   MOVE      XHWHSE        XOWHSE
     C* END                                                           *
     C                   END
     C* GETREC D.PORENT,F.IPSWADD,*EQ,COYNO#,POWHSE
     C*
     C                   EXSR      S037
     C* IF %sts(D.PORENT,f.ipswadd)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POWHSE,'USR2060','ERRORS',*LIBL
     C                   MOVEL     'USR2060'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* *** Item must be on warehouse details
     C* IF cdims = 'Y'
     C     WDIMS         IFEQ      'Y'
     C* GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     C*
     C                   EXSR      S033
     C* IF %sts(D.PORENT,f.waredet)=*no
     C*  Status of last file I/O
     C     STS04         IFNE      *ZERO
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR POITEM,'USR2057','ERRORS',*LIBL
     C                   MOVEL     'USR2057'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOITEM  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Validate the delivery date
     C* IF WSDLVDT <> *BLANKS
     C     RN0026        IFNE      *BLANKS
     C* SYDATAI = WSDLVDT
     C                   MOVE      RN0026        RN0009
     C* SYCMD = *ZEROS
     C                   Z-ADD     *ZEROS        RN0007
     C* EXSUBR SY0020 ; convert alpha date to CMD
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* SYDATV = SYCMD
     C                   Z-ADD     RN0007        RN0013
     C* SYDERR = '0'
     C                   MOVE      '0'           RN0014
     C* EXSUBR SY0030
     C                   EXSR      SY0030
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* *** Validate the date
     C* IF syderr = '1'
     C     RN0014        IFEQ      '1'
     C* DSPERR WSDLVDT,'FLD0007','ERRORS',*LIBL
     C                   MOVEL     'FLD0007'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'RN0026  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* ELSE                                                          *
     C                   ELSE
     C* *** Output formatted date
     C* SYDATI = SYCMD
     C                   Z-ADD     RN0007        RN0010
     C* SYDATO = *blanks
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Find delivery date if not entered
     C* IF wsdlvdt = *BLANKS & error = ' '
     C     RN0026        IFEQ      *BLANKS
     C     ERROR         ANDEQ     *BLANKS
     C* SYDATI = PHDLVDT
     C                   Z-ADD     WK0040        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WK0801 = ##DATE
     C                   Z-ADD     ##DATE        WK0801
     C* WKNOD = %nod(wk0801)
     C*  Number of Days Since the Turn of the Century
     C                   Z-ADD     WK0801        NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SNOD
     C                   Z-ADD     NRSLT         RN0129
     C                   Z-ADD     RN0129        WKNOD
     C* IF %sts(d.ipsitem,f.ipsitem)=*yes & piltim <>0
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     WILTIM        IFNE      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      1
     C* WKNOD = wknod + piltim
     C     WKNOD         ADD       WILTIM        NRSLT0
     C                   Z-ADD     NRSLT0        WKNOD
     C* WK0801 = %ctd(wknod)
     C*  Convert to Date
     C                   Z-ADD     WKNOD         NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SCTD
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* SYDATI = WK0801
     C                   Z-ADD     WK0801        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* ELSE                                                          *
     C                   ELSE
     C* IF wdltim <> 0
     C     WK0068        IFNE      *ZERO
     C* WKNOD = wknod  + wdltim
     C     WKNOD         ADD       WK0068        NRSLT0
     C                   Z-ADD     NRSLT0        WKNOD
     C* WK0801 = %ctd(wknod)
     C*  Convert to Date
     C                   Z-ADD     WKNOD         NARG1
     C                   MOVE      'CMD'         DATFMT
     C                   EXSR      SCTD
     C                   Z-ADD     NRSLT         NRSLT0
     C                   Z-ADD     NRSLT0        WK0801
     C* SYDATI = WK0801
     C                   Z-ADD     WK0801        RN0010
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* EXSUBR SY0010
     C                   EXSR      SY0010
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* WSDLVDT = SYDATO
     C                   MOVE      RN0012        RN0026
     C*                                                               *
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Check allocated nl account
     C* IF ponlall = ' '
     C     WK0032        IFEQ      *BLANKS
     C* GETREC D.PORENT,f.itmmast,*eq,COYNO#,poitem
     C*
     C                   EXSR      S041
     C* IF %sts(D.PORENT,f.itmmast)=*yes
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C* PONLALL = itnlst
     C                   MOVE      WTNLST        WK0032
     C* END                                                           *
     C                   END
     C* IF ponlall = ' '
     C     WK0032        IFEQ      *BLANKS
     C* PONLALL = phnlall
     C                   MOVE      WK0042        WK0032
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF ponlall = ' '
     C     WK0032        IFEQ      *BLANKS
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR PONLALL,'USR2061','ERRORS',*LIBL
     C                   MOVEL     'USR2061'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0032  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0006  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* *** UOM from Item Master
     C* IF pouom<>' ' *and CDIMS='Y'
     C     XOUOM         IFNE      *BLANKS
     C     WDIMS         ANDEQ     'Y'
     C* GETREC d.PORENT,f.itmmast,*eq,COYNO#,poitem
     C*
     C                   EXSR      S041
     C* IF %sts(D.PORENT,f.itmmast)=*yes
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C* POUOM = ituom
     C                   MOVE      WTUOM         XOUOM
     C* END                                                           *
     C                   END
     C* *** Check Unit of Measure on file
     C* GETREC D.PORENT,F.UOM,*eq,COYNO#,POUOM
     C*
     C                   EXSR      S042
     C* IF %sts(D.PORENT,F.UOM)=*NO
     C*  Status of last file I/O
     C     STS14         IFNE      *ZERO
     C* DSPERR POUOM,'USR2062','ERRORS',*LIBL
     C                   MOVEL     'USR2062'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XOUOM   '    FLDNAM
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
     C* *** Perform updates to file on function key
     C*                                                               *
     C* GETREC D.IPSITEM,f.IPSITEM,*eq,COYNO#,PHSUPPN,PHBRNBR,poitem
     C*
     C                   EXSR      S036
     C* IF %sts(d.ipsitem,f.ipsitem)=*yes
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C* IF pouom=' '
     C     XOUOM         IFEQ      *BLANKS
     C* POUOM = piuom
     C                   MOVE      WIUOM         XOUOM
     C* END                                                           *
     C                   END
     C* IF poidesc= ' '
     C     WK0031        IFEQ      *BLANKS
     C* POIDESC = pidesc
     C                   MOVE      WIDESC        WK0031
     C* END                                                           *
     C                   END
     C* ELSE                                                          *
     C                   ELSE
     C* IF poidesc= ' ' *and CDIMS='Y'
     C     WK0031        IFEQ      *BLANKS
     C     WDIMS         ANDEQ     'Y'
     C* POIDESC = itidesc
     C                   MOVE      WK0021        WK0031
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* IF poprice = 0 & wsfoc <> 'Y'
     C     WK0033        IFEQ      *ZERO
     C     WSFOC         ANDNE     'Y'
     C* DTQORD = poqord
     C                   Z-ADD     XOQORD        DTQORD
     C* DTPRICE = 0
     C                   Z-ADD     *ZERO         RN0001
     C* CALL 'IPSPRCC',INT,COYNO#,PHSUPPN,PHBRNBR,POWHSE,POITEM,DTQORD,DTPRICE
     C                   Z-ADD     1             CALLST
     C                   CALL      'IPSPRCC'     P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* POPRICE = dtprice
     C                   Z-ADD     RN0001        WK0033
     C* END                                                           *
     C                   END
     C* POCCDE = picnvcde
     C                   MOVE      WK0008        WOCCDE
     C* POPCDE = piprcod
     C                   MOVE      WK0009        WOPCDE
     C* POCONV = picnv
     C                   Z-ADD     WICNV         WOCONV
     C* SYDATAI = WSDLVDT
     C                   MOVE      RN0026        RN0009
     C* SYCMD = *zeros
     C                   Z-ADD     *ZEROS        RN0007
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* PODLVDT = SYCMD
     C                   Z-ADD     RN0007        WK0030
     C*                                                               *
     C* PAITEM = poitem
     C                   MOVE      XOITEM        WAITEM
     C* PAIDESC = poidesc
     C                   MOVE      WK0031        WK0025
     C* PAQRCVD = poqrcvd
     C                   Z-ADD     WK0034        WK0028
     C* PAUOM = pouom
     C                   MOVE      XOUOM         WAUOM
     C* PACONV = poconv
     C                   Z-ADD     WOCONV        WACONV
     C* PACCDE = poccde
     C                   MOVE      WOCCDE        WACCDE
     C* PAPCDE = popcde
     C                   MOVE      WOPCDE        WAPCDE
     C* EXSUBR SYSDAT
     C                   EXSR      SYSDAT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00599
     C                   END
     C* PADATE = ##DATE
     C                   Z-ADD     ##DATE        WADATE
     C*                                                               *
     C* IF error = ' '
     C     ERROR         IFEQ      *BLANKS
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* IF wkdlvdt<>podlvdt | wkprice<>poprice | wkqord<>poqord | wknlall<>ponla
     C*    ll
     C     RN0021        IFNE      WK0030
     C     RN0023        ORNE      WK0033
     C     WKQORD        ORNE      XOQORD
     C     RN0022        ORNE      WK0032
     C* PACOYNO = pocoyno
     C                   MOVE      WK0029        WK0023
     C* PAPORD = popord
     C                   MOVE      XOPORD        WAPORD
     C* PASEQ = poseq
     C                   Z-ADD     XOSEQ         WASEQ
     C* PATYPE = 'B'
     C                   MOVE      'B'           WATYPE
     C* PADLVDT = wkdlvdt
     C                   Z-ADD     RN0021        WK0024
     C* PAPRICE = wkprice
     C                   Z-ADD     RN0023        WK0027
     C* PAQORD = wkqord
     C                   Z-ADD     WKQORD        WAQORD
     C* PANLALL = wknlall
     C                   MOVE      RN0022        WK0026
     C* PAWHSE = powhse
     C                   MOVE      XOWHSE        WAWHSE
     C* WRITE d.podtalt,f.podtalt
     C*
     C                   EXSR      S038
     C* PATYPE = 'C'
     C                   MOVE      'C'           WATYPE
     C* PADLVDT = podlvdt
     C                   Z-ADD     WK0030        WK0024
     C* PAPRICE = poprice
     C                   Z-ADD     WK0033        WK0027
     C* PAQORD = poqord
     C                   Z-ADD     XOQORD        WAQORD
     C* PANLALL = ponlall
     C                   MOVE      WK0032        WK0026
     C* PAWHSE = powhse
     C                   MOVE      XOWHSE        WAWHSE
     C* WRITE d.podtalt,f.podtalt
     C*
     C                   EXSR      S038
     C* *** Details not changed
     C* END                                                           *
     C                   END
     C*                                                               *
     C* UPDATE d.PORENT,f.pordd
     C*
     C                   EXSR      S039
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF mode= 6
     C     MODE          IFEQ      6
     C* POCOYNO = COYNO#
     C                   MOVE      COYNO#        WK0029
     C* WRITE D.PORENT,f.pordd
     C*
     C                   EXSR      S040
     C* SVK006 = pocoyno
     C                   MOVE      WK0029        SVK006
     C* SVK007 = popord
     C                   MOVE      XOPORD        SVK007
     C* SVK008 = poseq
     C                   Z-ADD     XOSEQ         SVK008
     C* *** If old order output alter file
     C* IF phos01='N'
     C     WHOS01        IFEQ      'N'
     C* PACOYNO = pocoyno
     C                   MOVE      WK0029        WK0023
     C* PAPORD = popord
     C                   MOVE      XOPORD        WAPORD
     C* PASEQ = poseq
     C                   Z-ADD     XOSEQ         WASEQ
     C* PATYPE = 'A'
     C                   MOVE      'A'           WATYPE
     C* PADLVDT = podlvdt
     C                   Z-ADD     WK0030        WK0024
     C* PAPRICE = poprice
     C                   Z-ADD     WK0033        WK0027
     C* PAQORD = poqord
     C                   Z-ADD     XOQORD        WAQORD
     C* PANLALL = ponlall
     C                   MOVE      WK0032        WK0026
     C* PAWHSE = powhse
     C                   MOVE      XOWHSE        WAWHSE
     C* WRITE d.podtalt,f.podtalt
     C*
     C                   EXSR      S038
     C* *** New order
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Update item details for order qty
     C* IF MODE=2 | mode=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      6
     C* GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     C*
     C                   EXSR      S033
     C* IF %sts(D.PORENT,f.waredet)=*yes
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* WDQOO = wdqoo + poqord
     C     WK0070        ADD       XOQORD        NRSLT0
     C                   Z-ADD     NRSLT0        WK0070
     C* IF podlvdt > wdnrdt
     C     WK0030        IFGT      WK0069
     C* WDNRDT = podlvdt
     C                   Z-ADD     WK0030        WK0069
     C* END                                                           *
     C                   END
     C* WDLPDT = phentdt
     C                   Z-ADD     WK0041        WK0067
     C* WTTRPQ = 0
     C                   Z-ADD     *ZERO         WK0074
     C* WTTRYQ = 0
     C                   Z-ADD     *ZERO         WK0076
     C* WTTRPV = 0
     C                   Z-ADD     *ZERO         WK0075
     C* WTTRYV = 0
     C                   Z-ADD     *ZERO         WK0077
     C* *** Add/Update Transactions summary.
     C* GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNP
     C*
     C                   EXSR      S043
     C* WTTRPQ = wttrpq + poqord
     C     WK0074        ADD       XOQORD        NRSLT0
     C                   Z-ADD     NRSLT0        WK0074
     C* WTTRYQ = wttryq + poqord
     C     WK0076        ADD       XOQORD        NRSLT0
     C                   Z-ADD     NRSLT0        WK0076
     C* WK1523 = poqord * poprice
     C     XOQORD        MULT      WK0033        NRSLT0
     C                   Z-ADD     NRSLT0        WK1523
     C* WTTRPV = WTTRPV + wk1523
     C     WK0075        ADD       WK1523        NRSLT0
     C                   Z-ADD     NRSLT0        WK0075
     C* WTTRYV = WTTRyV + wk1523
     C     WK0077        ADD       WK1523        NRSLT0
     C                   Z-ADD     NRSLT0        WK0077
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* WDQOO = wdqoo - wkqord
     C     WK0070        SUB       WKQORD        NRSLT0
     C                   Z-ADD     NRSLT0        WK0070
     C* WTTRPQ wttrpq - wkqord
     C* WTTRYQ wttryq - wkqord
     C* END                                                           *
     C                   END
     C* IF %sts(d.warehed,f.writtyp)=*yes
     C*  Status of last file I/O
     C     STS16         IFEQ      *ZERO
     C* UPDATE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S044
     C* ELSE                                                          *
     C                   ELSE
     C* WTCOYNO = pocoyno
     C                   MOVE      WK0029        WK0071
     C* WTWHSE = powhse
     C                   MOVE      XOWHSE        WK0078
     C* WTITEM = poitem
     C                   MOVE      XOITEM        WK0072
     C* WTTRNC = cdtrnp
     C                   MOVE      WDTRNP        WK0073
     C* WRITE D.WAREHED,F.WRITTYP
     C*
     C                   EXSR      S045
     C* END                                                           *
     C                   END
     C* UPDATE D.PORENT,f.waredet
     C*
     C                   EXSR      S034
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF MODE=2 | mode=5 | mode=6
     C     MODE          IFEQ      2
     C     MODE          OREQ      5
     C     MODE          OREQ      6
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* SVK008 = poseq
     C                   Z-ADD     XOSEQ         SVK008
     C* EXTSCR                                                        *
     C                   GOTO      $00599
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00599        ENDSR
     C/EJECT
     C*****************************************************************
     C* S006 - List Screen for IPSTXTD
     C*****************************************************************
     C     S006          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '010101'      *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C* Set Keys to values from header file.
     C* SVK009 = POCOYNO
     C                   MOVE      WK0029        SVK009
     C* SVK010 = POPORD
     C                   MOVE      XOPORD        SVK010
     C* SVK011 = POSEQ
     C                   Z-ADD     XOSEQ         SVK011
     C* TDCOYNO = POCOYNO
     C                   MOVE      WK0029        WK0012
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.PORENT,F.IPSTXTD,SVK009,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S046
     C* Fill List panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
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
     C                   WRITE     SCR006
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
     C                   EXFMT     SCR006C1
     C     SFLRRN        IFGT      0
     C     DRN04         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN04
     C                   Z-ADD     SFLRRN        DRN04
     C                   END
     C                   MOVEA     '010101'      *IN(1)
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
     C                   GOTO      $00699
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* *** Return to previous screen on
     C* *** on function key 12
     C* EXTSCR                                                        *
     C                   GOTO      $00699
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* Process Screen Validation.
     C     CHKVAR        IFEQ      1
     C                   EXSR      S006V
     C                   END
     C     VALIDF        IFEQ      1
     C     CHKVAR        OREQ      0
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
     C                   GOTO      $00699
     C                   END
     C*     2. Fill panel.
     C* EXSUBR S07BKW
     C                   EXSR      S07BKW
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
     C* *** Scroll information forwards
     C*     1. Check for selected records.
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C*     2. Fill Panel.
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
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
     C* EXSUBR S07EDT
     C                   EXSR      S07EDT
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* *** Check for reposition
     C*                                                               *
     C* IF PS0701<>0
     C     PS0701        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* ELSE                                                          *
     C                   ELSE
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK012 = PS0701
     C                   Z-ADD     PS0701        SVK012
     C* PS0701 = 0
     C                   Z-ADD     *ZERO         PS0701
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1 | updflg=1
     C     POSFLG        IFEQ      1
     C     UPDFLG        OREQ      1
     C* SETLL D.PORENT,F.IPSTXTD,SVK009,SVK010,SVK011,SVK012
     C*
     C                   EXSR      S046
     C* EXSUBR S07FWD
     C                   EXSR      S07FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00699
     C                   END
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C                   END
     C     $00699        ENDSR
     C/EJECT
     C*****************************************************************
     C* S007 - Valid Warehouse Numbers
     C*****************************************************************
     C     S007          BEGSR
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
     C* SVK013 = COYNO#
     C                   MOVE      COYNO#        SVK013
     C* S08CNT = 005
     C                   Z-ADD     005           S08CNT
     C* ** Array forward read.
     C* EXSUBR S08AFR
     C                   EXSR      S08AFR
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
     C* SVK08 = FST08
     C                   MOVE      FST08         SVK08
     C* ** Array Backwards read.
     C* EXSUBR S08ABR
     C                   EXSR      S08ABR
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
     C* SVK08 = LST08
     C                   MOVE      LST08         SVK08
     C* ** Array Forward Read.
     C* EXSUBR S08AFR
     C                   EXSR      S08AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00799
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I08 = 1
     C                   Z-ADD     1             Y2
     C* DOW (I08<=C08)&(T01(I08)<>1)
     C     Y2            DOWLE     Z5
     C     T01(Y2)       ANDNE     1
     C* I08 = I08+1
     C     Y2            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y2
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I08<=C08)&(T01(I08)=1)
     C     Y2            IFLE      Z5
     C     T01(Y2)       ANDEQ     1
     C* F06001 = B01(I08)
     C                   MOVE      B01(Y2)       F06001
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
     C* S008 - Valid Item Numbers
     C*****************************************************************
     C     S008          BEGSR
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
     C* SVK015 = COYNO#
     C                   MOVE      COYNO#        SVK015
     C* S09CNT = 005
     C                   Z-ADD     005           S09CNT
     C* ** Array forward read.
     C* EXSUBR S09AFR
     C                   EXSR      S09AFR
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
     C* SVK09 = FST09
     C                   MOVE      FST09         SVK09
     C* ** Array Backwards read.
     C* EXSUBR S09ABR
     C                   EXSR      S09ABR
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
     C* SVK09 = LST09
     C                   MOVE      LST09         SVK09
     C* ** Array Forward Read.
     C* EXSUBR S09AFR
     C                   EXSR      S09AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $00899
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I09 = 1
     C                   Z-ADD     1             Y3
     C* DOW (I09<=C09)&(T04(I09)<>1)
     C     Y3            DOWLE     Z6
     C     T04(Y3)       ANDNE     1
     C* I09 = I09+1
     C     Y3            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y3
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I09<=C09)&(T04(I09)=1)
     C     Y3            IFLE      Z6
     C     T04(Y3)       ANDEQ     1
     C* F06002 = B02(I09)
     C                   MOVE      B02(Y3)       F06002
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
     C* S009 - Valid Units of Measure
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
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK017 = POCOYNO
     C                   MOVE      WK0029        SVK017
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
     C* SVK10 = FST10
     C                   MOVE      FST10         SVK10
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
     C* SVK10 = LST10
     C                   MOVE      LST10         SVK10
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
     C                   Z-ADD     1             Y4
     C* DOW (I10<=C10)&(T07(I10)<>1)
     C     Y4            DOWLE     Z7
     C     T07(Y4)       ANDNE     1
     C* I10 = I10+1
     C     Y4            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y4
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I10<=C10)&(T07(I10)=1)
     C     Y4            IFLE      Z7
     C     T07(Y4)       ANDEQ     1
     C* F06003 = B03(I10)
     C                   MOVE      B03(Y4)       F06003
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
     C* S010 - Screen for additions
     C*****************************************************************
     C     S010          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0101'        *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C* SVDESC = CYDESC
     C                   MOVE      XYDESC        SVDESC
     C* CLRSCR SCRADD
     C*
     C                   EXSR      S047
     C* CYDESC = SVDESC
     C                   MOVE      SVDESC        XYDESC
     C* USER = *userid
     C                   MOVE      *BLANKS       RN0020
     C                   MOVEL     USER          RN0020
     C* GETREC d.userdef,f.userdef,*eq,COYNO#,user
     C*
     C                   EXSR      S048
     C* IF %STS(d.userdef,f.userdef)=*yes
     C*  Status of last file I/O
     C     STS07         IFEQ      *ZERO
     C* PHWHSE = udwhse
     C                   MOVE      WK0066        XHWHSE
     C* POSCUR 08,33  ;Position Cursor at Supplier if W/h defaulted
     C                   Z-ADD     08            LIN
     C                   Z-ADD     33            POS
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
     C                   EXFMT     SCR010
     C                   MOVEA     '0101'        *IN(1)
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
     C* IF %clf(PORENT.PORDh.PhWHSE)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'XHWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCRADD  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* ** Clear prompt work field used by
     C* ** prompt window.
     C* F06001 = ' '
     C                   MOVEL     *BLANKS       F06001
     C* ** Display prompt window.
     C* EXSCR SC0008
     C                   ADD       1             SP
     C                   MOVEL     'SCRADD  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   EXSR      S007
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* ** If user selected a value, the prompt
     C* ** work field will be filled in. Load
     C* ** this value to field being prompted.
     C* IF F06001<>' '
     C     F06001        IFNE      *BLANKS
     C* PHWHSE = F06001
     C                   MOVE      F06001        XHWHSE
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF %clf(PORENT.PORDh.Phsuppn)
     C*  Cursor location on fields/Keywords.
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCRADD  '    FLDSCR
     C                   EXSR      SCLF
     C                   Z-ADD     NRSLT         NRSLT0
     C     NRSLT0        IFEQ      1
     C* **
     C* F02001 = ' '
     C                   MOVEL     *BLANKS       F02001
     C* ** Display prompt window.
     C* EXSCR SC0012
     C                   ADD       1             SP
     C                   MOVEL     'SCRADD  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   EXSR      S011
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* ** Signal that F4 has been processed.
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* **
     C* IF F02001<>' '
     C     F02001        IFNE      *BLANKS
     C* PHSUPPN = F02001
     C                   MOVE      F02001        WK0052
     C* PHBRNBR = F02002
     C                   MOVE      F02002        WK0035
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
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
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ERROR = ' '
     C                   MOVE      *BLANKS       ERROR
     C* ***  Purchase order number unique
     C* DSPERR PHPORD,'USR2069','ERRORS',*LIBL
     C* *** Warehouse on file
     C* GETREC d.porent,f.ipswadd,*eq,COYNO#,phwhse
     C*
     C                   EXSR      S023
     C* IF %sts(d.porent,f.ipswadd)=*no
     C*  Status of last file I/O
     C     STS05         IFNE      *ZERO
     C* DSPERR PHWHSE,'USR2070','ERRORS',*LIBL
     C                   MOVEL     'USR2070'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XHWHSE  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCRADD  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* *** Supplier on supplier file
     C* IF phsuppn <> ' '
     C     WK0052        IFNE      *BLANKS
     C* GETREC d.porent,F.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S024
     C* IF %sts(d.porent,f.suplier)=*no
     C*  Status of last file I/O
     C     STS06         IFNE      *ZERO
     C* DSPERR PHSUPPN,'USR2071','ERRORS',*LIBL
     C                   MOVEL     'USR2071'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'WK0052  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCRADD  '    FLDSCR
     C                   EXSR      SATRIB
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** If no error output details screen
     C* IF error <> 'Y'
     C     ERROR         IFNE      'Y'
     C* SVPORD = phpord
     C                   MOVE      XHPORD        SVPORD
     C* SVWHSE = phwhse
     C                   MOVE      XHWHSE        SVWHSE
     C* SVSUPPN = phsuppn
     C                   MOVE      WK0052        RN0005
     C* SVBRNBR = phbrnbr
     C                   MOVE      WK0035        RN0004
     C* WSDLVDT = *BLANKS
     C                   MOVEL     *BLANKS       RN0026
     C* EXSCR SC0002
     C                   ADD       1             SP
     C                   MOVEL     'SCRADD  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN05
     C                   EXSR      S002
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01099
     C                   END
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C* EXTSCR                                                        *
     C                   GOTO      $01099
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $01099        ENDSR
     C/EJECT
     C*****************************************************************
     C* S011 - Valid Suppliers
     C*****************************************************************
     C     S011          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '00000000'    *IN(1)
     C                   MOVEA     '00'          *IN(9)
     C                   MOVEA     '1'           *IN(80)
     C* FST12 = ' '
     C                   MOVEL     *BLANKS       FST12
     C* LST12 = ' '
     C                   MOVEL     *BLANKS       LST12
     C* SVK12 = ' '
     C                   MOVEL     *BLANKS       SVK12
     C* ** set prompt file keys to values
     C* ** from header file.
     C* SVK022 = PHCOYNO
     C                   MOVE      WK0038        SVK022
     C* S12CNT = 005
     C                   Z-ADD     005           S12CNT
     C* ** Array forward read.
     C* EXSUBR S12AFR
     C                   EXSR      S12AFR
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
     C     CMDKEY        IFEQ      'N'
     C*
     C* Bkwd
     C*
     C     *IN62         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* SVK023 = FST11
     C                   MOVE      *BLANKS       SVK023
     C                   MOVEL     FST11         SVK023
     C* SVK12 = FST12
     C                   MOVE      FST12         SVK12
     C* ** Array Backwards read.
     C* EXSUBR S12ABR
     C                   EXSR      S12ABR
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
     C* SVK023 = LST11
     C                   MOVE      LST11         SVK023
     C* SVK12 = LST12
     C                   MOVE      LST12         SVK12
     C* ** Array Forward Read.
     C* EXSUBR S12AFR
     C                   EXSR      S12AFR
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01199
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* ** Check for any selected records.
     C*    1. Check each array element that
     C*       was loaded in load routine.
     C* I12 = 1
     C                   Z-ADD     1             Y5
     C* DOW (I12<=C12)&(T12(I12)<>1)
     C     Y5            DOWLE     Z8
     C     T12(Y5)       ANDNE     1
     C* I12 = I12+1
     C     Y5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Y5
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** If value was found, fill prompt work
     C* ** field, get screen values, and return.
     C* IF (I12<=C12)&(T12(I12)=1)
     C     Y5            IFLE      Z8
     C     T12(Y5)       ANDEQ     1
     C* F02001 = t13(I12)
     C                   MOVE      T13(Y5)       F02001
     C* F02002 = t14(I12)
     C                   MOVE      T14(Y5)       F02002
     C* EXTSCR                                                        *
     C                   GOTO      $01199
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C                   END
     C     $01199        ENDSR
     C/EJECT
     C*****************************************************************
     C* S012 - Set Special Details
     C*****************************************************************
     C     S012          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* GETREC d.porent,f.pordh,*eq,COYNO#,phpord
     C*
     C                   EXSR      S049
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
     C                   MOVEA     '01'          *IN(1)
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
     C* Ignore
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* ERROR = 'N'
     C                   MOVE      'N'           ERROR
     C* IF phos04 = 'Y'
     C     XHOS04        IFEQ      'Y'
     C* SETLL d.PORENT,f.pordd,COYNO#,phpord
     C*
     C                   EXSR      S050
     C* DOU %sts(d.PORENT,f.pordd)=*no | poqrcvd <> 0
     C     RSLT01        DOUEQ     1
     C* GETREC D.PORENT,F.pordd,*ne,COYNO#,phpord
     C*
     C                   EXSR      S051
     C* IF %sts(d.PORENT,f.pordd)=*yes & poqrcvd <> 0
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
     C     WK0034        IFNE      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* DSPERR PHOS04,'USR1005','ERRORS',*LIBL
     C                   MOVEL     'USR2105'     MSGID
     C                   MOVEL     'ERRORS'      MSGF
     C                   MOVEL     '*LIBL'       MSGFL
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'XHOS04  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SETSPEC '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XNO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     WK0034        IFNE      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        OREQ      1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C                   END
     C* *** pending not Y
     C* END                                                           *
     C                   END
     C*                                                               *
     C* IF error = 'N'
     C     ERROR         IFEQ      'N'
     C* UPDATE d.PORENT,f.pordh
     C*
     C                   EXSR      S053
     C* EXTSCR                                                        *
     C                   GOTO      $01299
     C* END                                                           *
     C                   END
     C                   END
     C                   END
     C     $01299        ENDSR
     C/EJECT
     C*****************************************************************
     C* S013 - Supplier Changed
     C*****************************************************************
     C     S013          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '01'          *IN(1)
     C                   MOVEA     '1'           *IN(80)
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
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* EXTSCR                                                        *
     C                   GOTO      $01399
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* **   update all purchase order details
     C* **   move name and address
     C* GETREC D.PORENT,f.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C*
     C                   EXSR      S024
     C* PHSNAME = suname
     C                   MOVE      WUNAME        WK0050
     C* PHSLIN1 = sulin1
     C                   MOVE      WULIN1        WK0044
     C* PHSLIN2 = sulin2
     C                   MOVE      WULIN2        WK0045
     C* PHSLIN3 = sulin3
     C                   MOVE      WULIN3        WK0046
     C* PHSLIN4 = sulin4
     C                   MOVE      WULIN4        WK0047
     C* PHSLIN5 = sulin5
     C                   MOVE      WULIN5        WK0048
     C* PHSLIN6 = sulin6
     C                   MOVE      WULIN6        WK0049
     C* PHSPSTCD = supstcd
     C                   MOVE      WK0063        WK0051
     C* PHCONNAM = suconnam
     C                   MOVE      WK0062        WK0037
     C* SVSUPPN = phsuppn
     C                   MOVE      WK0052        RN0005
     C* SVBRNBR = phbrnbr
     C                   MOVE      WK0035        RN0004
     C* *** Update cost price
     C* SETLL D.PORENT,f.pordd,COYNO#,phpord
     C*
     C                   EXSR      S050
     C* DOU %sts(d.PORENT,f.pordd)=*no
     C     RSLT01        DOUEQ     1
     C* GETREC d.PORENT,F.PORDD,*EQ,COYNO#,phpord
     C*
     C                   EXSR      S054
     C* IF %sts(D.PORENT,f.pordd)=*yes
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C* GETREC d.IPSITEM,*eq,COYNO#,poitem,phsuppn,phbrnbr
     C*
     C                   EXSR      S055
     C* IF %sts(d.ipsitem,f.ipsitem)=*yes
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C* POUOM = piuom
     C                   MOVE      WIUOM         XOUOM
     C* POCCDE = picnvcde
     C                   MOVE      WK0008        WOCCDE
     C* POPCDE = piprcod
     C                   MOVE      WK0009        WOPCDE
     C* POCONV = picnv
     C                   Z-ADD     WICNV         WOCONV
     C* END                                                           *
     C                   END
     C* DTQORD = poqord
     C                   Z-ADD     XOQORD        DTQORD
     C* DTPRICE = 0
     C                   Z-ADD     *ZERO         RN0001
     C* INT = 'I'
     C                   MOVE      'I'           INT
     C* CALL 'IPSPRCC',INT,COYNO#,PHSUPPN,PHBRNBR,POWHSE,POITEM,DTQORD,DTPRICE
     C                   Z-ADD     1             CALLST
     C                   CALL      'IPSPRCC'     P0002                  93
     C                   MOVE      '1'           *IN79
     C     *IN93         IFEQ      '1'
     C                   MOVE      'Y'           MSGFLG
     C                   Z-ADD     *ZERO         CALLST
     C                   END
     C* POPRICE = dtprice
     C                   Z-ADD     RN0001        WK0033
     C* **  status order detail no
     C* END                                                           *
     C                   END
     C* EXTSCR                                                        *
     C                   GOTO      $01399
     C* END                                                           *
     C*  Status of last file I/O
     C     STS03         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XNO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C                   END
     C                   END
     C     $01399        ENDSR
     C/EJECT
     C*****************************************************************
     C* S014 - Display Details before Delete
     C*****************************************************************
     C     S014          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '0'           *IN(64)
     C                   MOVEA     '1'           *IN(80)
     C*                                                               *
     C* Set Keys to values from header file.
     C* SVK006 = PHCOYNO
     C                   MOVE      WK0038        SVK006
     C* SVK007 = PHPORD
     C                   MOVE      XHPORD        SVK007
     C* SVK008 = 0
     C                   Z-ADD     *ZERO         SVK008
     C* POCOYNO = PHCOYNO
     C                   MOVE      WK0038        WK0029
     C*                                                               *
     C* F12FLG = 0
     C                   Z-ADD     *ZERO         F12FLG
     C* ***  Start display on
     C* ***  first record in file.
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S027
     C*                                                               *
     C* Fill List panel.
     C* EXSUBR S75FWD
     C                   EXSR      S75FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
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
     C                   WRITE     SCR014
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
     C                   EXFMT     SCR014C1
     C     SFLRRN        IFGT      0
     C     DRN05         ANDNE     0
     C                   Z-ADD     SFLRRN        RRN05
     C                   Z-ADD     SFLRRN        DRN05
     C                   END
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
     C* *** Return to Order Header List Screen
     C* *** on function key 12
     C* MODE = 5
     C                   Z-ADD     5             MODE
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
     C* *** Scroll information backwards
     C* EXSUBR S75BKW
     C                   EXSR      S75BKW
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
     C* *** Scroll information forwards
     C* EXSUBR S75FWD
     C                   EXSR      S75FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
     C                   END
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C*                                                               *
     C* Reset reposition flag and check for any
     C* selected records.
     C* POSFLG = 0
     C                   Z-ADD     *ZERO         POSFLG
     C*                                                               *
     C* *** Check for reposition
     C* IF PS7501<>0
     C     PS7501        IFNE      *ZERO
     C* POSFLG = 1
     C                   Z-ADD     1             POSFLG
     C* END                                                           *
     C                   END
     C* If reposition values entered, set key
     C* values to reposition values.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SVK008 = PS7501
     C                   Z-ADD     PS7501        SVK008
     C* PS7501 = 0
     C                   Z-ADD     *ZERO         PS7501
     C* END                                                           *
     C                   END
     C* Refresh screen if record selected or
     C* if reposition was selected.
     C* IF POSFLG=1
     C     POSFLG        IFEQ      1
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C*
     C                   EXSR      S027
     C* EXSUBR S75FWD
     C                   EXSR      S75FWD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01499
     C                   END
     C*                                                               *
     C* *** ELSE Re-adjust On Order Figures & Delete PORDD records.
     C* ELSE                                                          *
     C                   ELSE
     C* SETLL D.PORENT,F.PORDD,SVK006,SVK007
     C*
     C                   EXSR      S056
     C* GETREC D.PORENT,F.PORDD,*NE,SVK006,SVK007
     C*
     C                   EXSR      S057
     C*                                                               *
     C* DOW %STS(D.PORENT,F.PORDD)=*YES
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
     C                   Z-ADD     NRSLT0        RSLT01
     C     RSLT01        DOWEQ     1
     C* GETREC D.PORENT,F.WAREDET,*EQ,SVK006,POWHSE,POITEM
     C*
     C                   EXSR      S059
     C*                                                               *
     C* IF %STS(D.PORENT,F.WAREDET)=*YES
     C*  Status of last file I/O
     C     STS04         IFEQ      *ZERO
     C* OUTSQY = POQORD - POQRCVD
     C     XOQORD        SUB       WK0034        NRSLT0
     C                   Z-ADD     NRSLT0        OUTSQY
     C* WDQOO = WDQOO - OUTSQY
     C     WK0070        SUB       OUTSQY        NRSLT0
     C                   Z-ADD     NRSLT0        WK0070
     C*                                                               *
     C* ** If On-Order -ve set to zero.
     C* IF WDQOO > 0
     C     WK0070        IFGT      *ZERO
     C* WDQOO = 0
     C                   Z-ADD     *ZERO         WK0070
     C* END                                                           *
     C                   END
     C* UPDATE D.PORENT,F.WAREDET
     C*
     C                   EXSR      S034
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Delete Line just read.
     C* DELETE D.PORENT,F.PORDD
     C*
     C                   EXSR      S032
     C*                                                               *
     C* ** Get next Detail Line.
     C* GETREC D.PORENT,F.PORDD,*NE,SVK006,SVK007
     C*
     C                   EXSR      S057
     C* END                                                           *
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
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
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
     C* S015 - Supplier Details changed
     C*****************************************************************
     C     S015          BEGSR
     C*
     C                   MOVE      'Y'           DSPLY
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(80)
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
     C                   MOVE      'N'           CMDKEY
     C*
     C* Clear Message Subfile.
     C     MSGFLG        IFEQ      'Y'
     C                   MOVE      'C'           MSGACT
     C                   EXSR      SMSG
     C                   WRITE     MSGCTL
     C                   END
     C*
     C* Previous
     C*
     C     *INKL         IFEQ      '1'
     C     CMDKEY        ANDEQ     'N'
     C* ERROR = 'Y'
     C                   MOVE      'Y'           ERROR
     C* **   update all purchase order details
     C* **   move saved details back
     C* PHSNAME = savnam
     C                   MOVE      SAVNAM        WK0050
     C* PHSLIN1 = savs1
     C                   MOVE      SAVS1         WK0044
     C* PHSLIN2 = savs2
     C                   MOVE      SAVS2         WK0045
     C* PHSLIN3 = savs3
     C                   MOVE      SAVS3         WK0046
     C* PHSLIN4 = savs4
     C                   MOVE      SAVS4         WK0047
     C* PHSLIN5 = savs5
     C                   MOVE      SAVS5         WK0048
     C* PHSLIN6 = savs6
     C                   MOVE      SAVS6         WK0049
     C* PHSPSTCD = savpc
     C                   MOVE      SAVPC         WK0051
     C* EXTSCR                                                        *
     C                   GOTO      $01599
     C                   MOVE      'Y'           CMDKEY
     C                   END
     C     CMDKEY        IFEQ      'N'
     C* * Update saved address details if Enter
     C* EXSUBR savsadd
     C                   EXSR      S500
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $01599
     C                   END
     C* EXTSCR                                                        *
     C                   GOTO      $01599
     C                   END
     C                   END
     C     $01599        ENDSR
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
     C                   WRITE     SCR003C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0005'
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR004
     C                   WRITE     SCR004C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0006'
     C                   MOVEA     IN04          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR005
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0007'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR006
     C                   WRITE     SCR006C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0008'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR007
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0009'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR008
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0010'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR009
     C                   ELSE
     C     SID(CT)       IFEQ      'SCRADD'
     C                   MOVEA     IN05          *IN
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR010
     C                   ELSE
     C     SID(CT)       IFEQ      'SC0012'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR011
     C                   ELSE
     C     SID(CT)       IFEQ      'SETSPEC'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR012
     C                   ELSE
     C     SID(CT)       IFEQ      'SUPP'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR013
     C                   ELSE
     C     SID(CT)       IFEQ      'SCDELD'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR014
     C                   WRITE     SCR014C1
     C                   ELSE
     C     SID(CT)       IFEQ      'SDET'
     C                   MOVE      '1'           *IN79
     C                   MOVE      '1'           *IN99
     C                   WRITE     SCR015
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
     C* CMPSAV - Compare supplier details
     C*****************************************************************
     C     CMPSAV        BEGSR
     C*
     C* * Compare address details for change
     C* DETCHG = ' '
     C                   MOVE      *BLANKS       DETCHG
     C* IF phslin1 <> savs1
     C     WK0044        IFNE      SAVS1
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phslin2 <> savs2
     C     WK0045        IFNE      SAVS2
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phslin3 <> savs3
     C     WK0046        IFNE      SAVS3
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phslin4 <> savs4
     C     WK0047        IFNE      SAVS4
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phslin5 <> savs5
     C     WK0048        IFNE      SAVS5
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phslin6 <> savs6
     C     WK0049        IFNE      SAVS6
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phsname <> savnam
     C     WK0050        IFNE      SAVNAM
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C* IF phspstcd <> savpc
     C     WK0051        IFNE      SAVPC
     C* DETCHG = 'Y'
     C                   MOVE      'Y'           DETCHG
     C* END                                                           *
     C                   END
     C*
     C     $CMPSA        ENDSR
     C/EJECT
     C*****************************************************************
     C* S500 - Save Supp. details for compare
     C*****************************************************************
     C     S500          BEGSR
     C*
     C* * Save details for later compare.
     C* SAVS1 = PHSLIN1
     C                   MOVE      WK0044        SAVS1
     C* SAVS2 = PHSLIN2
     C                   MOVE      WK0045        SAVS2
     C* SAVS3 = PHSLIN3
     C                   MOVE      WK0046        SAVS3
     C* SAVS4 = PHSLIN4
     C                   MOVE      WK0047        SAVS4
     C* SAVS5 = PHSLIN5
     C                   MOVE      WK0048        SAVS5
     C* SAVS6 = PHSLIN6
     C                   MOVE      WK0049        SAVS6
     C* SAVNAM = PHSNAME
     C                   MOVE      WK0050        SAVNAM
     C* SAVPC = PHSPSTCD
     C                   MOVE      WK0051        SAVPC
     C*
     C     $S500         ENDSR
     C/EJECT
     C*****************************************************************
     C* SRNUMB - Update
     C*****************************************************************
     C     SRNUMB        BEGSR
     C*
     C*                                                               *
     C* *** find purchase order number
     C*                                                               *
     C* WK01A1 = %sub(phpord,1,1)
     C*  Substring
     C                   Z-ADD     1             C1
     C                   Z-ADD     1             C2
     C     C1            IFLE      0
     C     C2            ORLE      0
     C                   MOVE      *BLANKS       ARSLT0
     C                   ELSE
     C     C2            SUBST(P)  XHPORD:C1     ARSLT0
     C                   END
     C                   MOVE      *BLANKS       WK01A1
     C                   MOVEL     ARSLT0        WK01A1
     C* IF wk01a1>='0' & wk01a1<='9' | phpord=' '
     C     WK01A1        IFGE      '0'
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     WK01A1        IFLE      '9'
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     XHPORD        IFEQ      *BLANKS
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        OREQ      1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      1
     C* GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,COYNO#
     C*
     C                   EXSR      S060
     C* IF %STS(D.IPSCPYD,F.IPSCPYD)=*YES
     C*  Status of last file I/O
     C     STS01         IFEQ      *ZERO
     C* CDPORD = cdpord + 1
     C     WDPORD        ADD       1             RN0129
     C                   Z-ADD     RN0129        WDPORD
     C* UPDATE d.ipscpyd,f.ipscpyd
     C*
     C                   EXSR      S061
     C* WKPORD = cdpord
     C                   Z-ADD     WDPORD        WKPORD
     C* PHPORD = %ctc(wkpord)
     C*  Convert To Character
     C                   MOVE      *BLANK        XHPORD
     C                   MOVEL     WKPORD        XHPORD
     C* ELSE                                                          *
     C                   ELSE
     C* PHPORD = 'A999999999'
     C                   MOVE      *BLANKS       XHPORD
     C                   MOVEL     C0002         XHPORD
     C* END                                                           *
     C                   END
     C* X = 1
     C                   Z-ADD     1             X
     C* DOU ord(x)<> '0' | x = 10
     C     ORD(X)        DOUNE     '0'
     C     X             OREQ      10
     C* IF ord(x) = '0'
     C     ORD(X)        IFEQ      '0'
     C* ORD(X) = ' '
     C                   MOVE      *BLANKS       ORD(X)
     C* END                                                           *
     C                   END
     C* X = x + 1
     C     X             ADD       1             RN0129
     C                   Z-ADD     RN0129        X
     C* END                                                           *
     C                   END
     C* Alpha character entered
     C* END                                                           *
     C                   END
     C*
     C     $SRNUM        ENDSR
     C/EJECT
     C*****************************************************************
     C* SRUPD - Update
     C*****************************************************************
     C     SRUPD         BEGSR
     C*
     C* *** Convert + Reverse delivery Date
     C* SYDATAI = WSDLVDT
     C                   MOVE      RN0026        RN0009
     C* SYCMD = *zeros
     C                   Z-ADD     *ZEROS        RN0007
     C* EXSUBR SY0020
     C                   EXSR      SY0020
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $SRUPD
     C                   END
     C* PHDLVDT = SYCMD
     C                   Z-ADD     RN0007        WK0040
     C*                                                               *
     C* *** Load Ship Via
     C*                                                               *
     C* PHSHIPV = %ljf(wksvia1)
     C*  Left Justify field into result field
     C                   MOVEL     RN0024        WK0043
     C* PHSHIPV = %rjf(wksvia2)
     C*  Right Justify field into result field
     C                   MOVE      RN0025        WK0043
     C*                                                               *
     C* IF MODE=2
     C     MODE          IFEQ      2
     C* UPDATE D.PORENT,F.PORDH
     C*
     C                   EXSR      S053
     C* ELSE                                                          *
     C                   ELSE
     C*                                                               *
     C* IF MODE=6
     C     MODE          IFEQ      6
     C* *** Get purchase order number
     C* EXSUBR srnumb
     C                   EXSR      SRNUMB
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $SRUPD
     C                   END
     C* WRITE D.PORENT,F.PORDH
     C*
     C                   EXSR      S062
     C* SVK001 = PHCOYNO
     C                   MOVE      WK0038        SVK001
     C* SVK002 = PHPORD
     C                   MOVE      XHPORD        SVK002
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $SRUPD        ENDSR
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
     C     19000000      ADD       XYMD          RN0129
     C                   Z-ADD     RN0129        ##DATE
     C* ELSE                                                          *
     C                   ELSE
     C* ##DATE = 20000000 + *YMD
     C     20000000      ADD       XYMD          RN0129
     C                   Z-ADD     RN0129        ##DATE
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
     C* C01 = 0
     C                   Z-ADD     *ZERO         Z1
     C* ** Clear hidden key arrays used for record
     C* ** retrieval.
     C* A001 = ' '
     C                   MOVEA     *BLANKS       A01
     C* A002 = ' '
     C                   MOVEA     *BLANKS       A02
     C* FLDATR FL0001,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDH,*PV,SVK001
     C*
     C                   EXSR      S063
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH     SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0052
     C                   MOVEL     *BLANKS       WK0035
     C                   MOVEL     *BLANKS       WK0050
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0004         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0015                         Company number
     C                   MOVEL     *BLANK        HD0016                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH     SUPL
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
     C     Z1            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z1
     C* ** Save key values in key arrays.
     C* A001(C01) = PHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0038        A01(Z1)
     C* A002(C01) = PHPORD
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHPORD        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0052
     C                   MOVEL     *BLANKS       WK0035
     C                   MOVEL     *BLANKS       WK0050
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
     C                   EXSR      S065                                         CHK EOF
     C*                                                               *
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
     C* DOBLK D.PORENT
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
     C* I01 = I01+1
     C     Z9            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z9
     C* ** display detail screen
     C* IF (FL0001=2)|(FL0001=4)|(FL0001=5)
     C     FL0001        IFEQ      2
     C     FL0001        OREQ      4
     C     FL0001        OREQ      5
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* ** set keys from hidden key arrays.
     C* PHCOYNO = A001(I01)
     C                   MOVE      A01(Z9)       WK0038
     C* PHPORD = A002(I01)
     C                   MOVE      A02(Z9)       XHPORD
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
     C* PHCOYNO = A001(I01)
     C                   MOVE      A01(Z9)       WK0038
     C* PHPORD = A002(I01)
     C                   MOVE      A02(Z9)       XHPORD
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
     C* IF FL0001=07
     C     FL0001        IFEQ      07
     C* MODE = FL0001
     C                   Z-ADD     FL0001        MODE
     C* PHCOYNO = A001(I01)
     C                   MOVE      A01(Z9)       WK0038
     C* PHPORD = A002(I01)
     C                   MOVE      A02(Z9)       XHPORD
     C* EXSCR SC0005
     C                   ADD       1             SP
     C                   MOVEL     'SC0001  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN01
     C                   UPDATE    SCR001S1                             90
     C                   EXSR      S004
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S01ED
     C                   END
     C     RRN01         CHAIN     SCR001S1                           9091
     C                   MOVEA     IN01          *IN
     C                   MOVE      '1'           *IN79
     C* ** set keys from hidden key arrays.
     C* IF header = 'Y'
     C     HEADER        IFEQ      'Y'
     C* MODE = 2
     C                   Z-ADD     2             MODE
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
     C* END                                                           *
     C                   END
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
     C                   MOVEL     C0003         MSGDTA
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
     C* FLDATR FL0001,*PR,*ND
     C                   MOVE      'X'           #PR
     C                   MOVE      'X'           #ND
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDH,*NE,SVK001
     C*
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH     SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0001
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0052
     C                   MOVEL     *BLANKS       WK0035
     C                   MOVEL     *BLANKS       WK0050
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0004         READE(N)  PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0015                         Company number
     C                   MOVEL     *BLANK        HD0016                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* FLDATR FL0001,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0001  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0001  '    FLDSCR
     C                   EXSR      SATRIB
     C* C01 = C01+1
     C     Z1            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z1
     C* ** Save key information in key arrays.
     C* A001(C01) = PHCOYNO
     C                   MOVE      *BLANKS       A01(Z1)
     C                   MOVE      WK0038        A01(Z1)
     C* A002(C01) = PHPORD
     C                   MOVE      *BLANKS       A02(Z1)
     C                   MOVE      XHPORD        A02(Z1)
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
     C                   MOVEL     *BLANKS       XHPORD
     C                   MOVEL     *BLANKS       XHWHSE
     C                   MOVEL     *BLANKS       WK0052
     C                   MOVEL     *BLANKS       WK0035
     C                   MOVEL     *BLANKS       WK0050
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
     C                   EXSR      S065                                         RESET FP
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
     C* A005 = 0
     C                   Z-ADD     *ZERO         A05
     C* GETBLK D.PORENT,F.IPSTXTH,*PV,SVK003,SVK004
     C*
     C                   EXSR      S066
     C*
     C                   MOVEL     *BLANK        KHCO03
     C                   MOVEL     SVK003        KHCO03
     C                   MOVEL     *BLANK        KHPO04
     C                   MOVEL     SVK004        KHPO04
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD11        DOUNE     'Y'                                          RD.SW.IPSTXTH   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   Z-ADD     *ZEROS        XHSEQ
     C                   MOVEL     *BLANKS       XHTCDE
     C                   MOVEL     *BLANKS       XHTEXT
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C     K0017         READE(N)  IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   Z-ADD     *ZERO         HRC11                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0010                         Company number
     C                   MOVEL     *BLANK        HHPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HHSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   END
     C*
     C     SWRD11        IFEQ      'Y'                                          RD.SW.IPSTXTH   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* C03 = C03+1
     C     Z2            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z2
     C* A003(C03) = THCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0015        A03(Z2)
     C* A004(C03) = THPORD
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WHPORD        A04(Z2)
     C* A005(C03) = THSEQ
     C                   Z-ADD     XHSEQ         A05(Z2)
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
     C                   Z-ADD     *ZEROS        XHSEQ
     C                   MOVEL     *BLANKS       XHTCDE
     C                   MOVEL     *BLANKS       XHTEXT
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
     C                   EXSR      S068                                         CHK EOF
     C*
     C     $S03BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S03EDT - SCRN SUB
     C*****************************************************************
     C     S03EDT        BEGSR
     C*
     C* **   Process Maintenance List Panel (ML)
     C* **   1. Check for any selected records,
     C* UPDFLG = 0
     C                   Z-ADD     *ZERO         UPDFLG
     C* I03 = 0
     C                   Z-ADD     *ZERO         I03
     C* DOBLK D.PORENT
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
     C                   MOVEA     '010101'      *IN(1)
     C* I03 = I03+1
     C     I03           ADD       1             RN0129
     C                   Z-ADD     RN0129        I03
     C* ** Add new record
     C* IF FL0002=1
     C     FL0002        IFEQ      1
     C* ** Set key values to header file
     C* THCOYNO = PHCOYNO
     C                   MOVE      WK0038        WK0015
     C* THPORD = PHPORD
     C                   MOVE      XHPORD        WHPORD
     C* WRITE D.PORENT,F.IPSTXTH
     C*
     C                   EXSR      S069
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Update existing record
     C* IF FL0002=2
     C     FL0002        IFEQ      2
     C* UPDATE D.PORENT,F.IPSTXTH
     C*
     C                   EXSR      S070
     C* FL0002 = 0
     C                   Z-ADD     *ZERO         FL0002
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Delete existing record
     C* IF FL0002=4
     C     FL0002        IFEQ      4
     C* DELETE D.PORENT,F.IPSTXTH
     C*
     C                   EXSR      S071
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
     C                   MOVEL     C0003         MSGDTA
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
     C                   MOVEA     '010101'      *IN(1)
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
     C* A005 = 0
     C                   Z-ADD     *ZERO         A05
     C* GETBLK D.PORENT,F.IPSTXTH,*NE,SVK003,SVK004
     C*
     C*
     C                   MOVEL     *BLANK        KHCO03
     C                   MOVEL     SVK003        KHCO03
     C                   MOVEL     *BLANK        KHPO04
     C                   MOVEL     SVK004        KHPO04
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
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
     C     SWRD11        DOUNE     'Y'                                          RD.SW.IPSTXTH   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0002
     C                   Z-ADD     *ZEROS        XHSEQ
     C                   MOVEL     *BLANKS       XHTCDE
     C                   MOVEL     *BLANKS       XHTEXT
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C     K0017         READE(N)  IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   Z-ADD     *ZERO         HRC11                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0010                         Company number
     C                   MOVEL     *BLANK        HHPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HHSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   END
     C*
     C     SWRD11        IFEQ      'Y'                                          RD.SW.IPSTXTH   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* C03 = C03+1
     C     Z2            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z2
     C* A003(C03) = THCOYNO
     C                   MOVE      *BLANKS       A03(Z2)
     C                   MOVE      WK0015        A03(Z2)
     C* A004(C03) = THPORD
     C                   MOVE      *BLANKS       A04(Z2)
     C                   MOVE      WHPORD        A04(Z2)
     C* A005(C03) = THSEQ
     C                   Z-ADD     XHSEQ         A05(Z2)
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
     C                   Z-ADD     *ZEROS        XHSEQ
     C                   MOVEL     *BLANKS       XHTCDE
     C                   MOVEL     *BLANKS       XHTEXT
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
     C                   EXSR      S068                                         RESET FP
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
     C* A008 = 0
     C                   Z-ADD     *ZERO         A08
     C* FLDATR FL0003,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR POQORD,*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     C*
     C                   EXSR      S072
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR004S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR004C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN03
     C*
     C                   Z-ADD     1             XRN03                          Init Next RRN
     C                   Z-ADD     XRN03         SRN03
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS03
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0003
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* ITEMDO = POIDESC
     C                   MOVE      *BLANKS       ITEMDO
     C                   MOVEL     WK0031        ITEMDO
     C* FLDATR FL0003,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR POQORD,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z3
     C* A006(C05) = POCOYNO
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WK0029        A06(Z3)
     C* A007(C05) = POPORD
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      XOPORD        A07(Z3)
     C* A008(C05) = POSEQ
     C                   Z-ADD     XOSEQ         A08(Z3)
     C*                                                               *
     C* *** Get Supplier Item Number.
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,SVK006,PHSUPPN,PHBRNBR,POITEM
     C*
     C                   EXSR      S075
     C* IF %STS(D.IPSITEM,F.IPSITEM)=*YES
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C* WSMANF = PISPITM
     C                   MOVE      WK0011        WSMANF
     C* ELSE                                                          *
     C                   ELSE
     C* WSMANF = ' '
     C                   MOVEL     *BLANKS       WSMANF
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN03
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR004S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN03         NXTRRN
     C                   Z-ADD     *ZEROS        FL0003
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       ITEMDO
     C                   MOVEA     INS03         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR004S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR004S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR004S1                             90
     C                   MOVEA     INS03         *IN
     C                   END
     C     RRN03         IFGT      SRN03
     C                   Z-ADD     SRN03         RRN03
     C                   END
     C                   EXSR      S074                                         CHK EOF
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
     C                   Z-ADD     *ZERO         Y1
     C* DOBLK D.PORENT
     C*
     C                   Z-ADD     RRN03         SRN03                          Save RRN
     C                   Z-ADD     1             RRN03                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS03
     C     SRN03         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR004S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '0'           *IN(1)
     C                   MOVEA     '1'           *IN(3)
     C* I05 = I05+1
     C     Y1            ADD       1             RN0129
     C                   Z-ADD     RN0129        Y1
     C*                                                               *
     C* ** display detail screen
     C* IF (FL0003=2)|(FL0003=4)|(FL0003=5)
     C     FL0003        IFEQ      2
     C     FL0003        OREQ      4
     C     FL0003        OREQ      5
     C* MODE = FL0003
     C                   Z-ADD     FL0003        MODE
     C* ** set keys from hidden key arrays.
     C* POCOYNO = A006(I05)
     C                   MOVE      A06(Y1)       WK0029
     C* POPORD = A007(I05)
     C                   MOVE      A07(Y1)       XOPORD
     C* POSEQ = A008(I05)
     C                   Z-ADD     A08(Y1)       XOSEQ
     C* ** Get record and any secondary records.
     C* GETREC D.PORENT,F.PORDD,*EQ,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S076
     C* ** Display Screen.
     C* EXSCR SC0006
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR004S1                             90
     C                   EXSR      S005
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05ED
     C                   END
     C     RRN03         CHAIN     SCR004S1                           9091
     C                   MOVEA     IN03          *IN
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
     C* POCOYNO = A006(I05)
     C                   MOVE      A06(Y1)       WK0029
     C* POPORD = A007(I05)
     C                   MOVE      A07(Y1)       XOPORD
     C* POSEQ = A008(I05)
     C                   Z-ADD     A08(Y1)       XOSEQ
     C* GETREC D.PORENT,F.PORDD,*EQ,POCOYNO,POPORD,POSEQ
     C*
     C                   EXSR      S076
     C* EXSCR SC0007
     C                   ADD       1             SP
     C                   MOVEL     'SC0005  '    SID(SP)
     C                   MOVE      'F'           STY(SP)
     C                   MOVEA     *IN           IN03
     C                   UPDATE    SCR004S1                             90
     C                   EXSR      S006
     C                   MOVE      *BLANKS       SID(SP)
     C                   MOVE      *BLANKS       STY(SP)
     C                   SUB       1             SP
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S05ED
     C                   END
     C     RRN03         CHAIN     SCR004S1                           9091
     C                   MOVEA     IN03          *IN
     C                   MOVE      '1'           *IN79
     C* FL0003 = 0
     C                   Z-ADD     *ZERO         FL0003
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
     C* IF (FL0003<>0)&(UPDFLG=0)
     C     FL0003        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0003,'Invalid action choice'
     C                   MOVEL     C0003         MSGDTA
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
     C                   UPDATE    SCR004S1                             90
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
     C* A006 = ' '
     C                   MOVEA     *BLANKS       A06
     C* A007 = ' '
     C                   MOVEA     *BLANKS       A07
     C* A008 = 0
     C                   Z-ADD     *ZERO         A08
     C* FLDATR FL0003,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR POQORD,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDD,*NE,SVK006,SVK007
     C*
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     6             WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR004S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR004C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN03
     C*
     C                   Z-ADD     1             XRN03                          Init Next RRN
     C                   Z-ADD     XRN03         SRN03
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS03
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0003
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* ITEMDO = POIDESC
     C                   MOVE      *BLANKS       ITEMDO
     C                   MOVEL     WK0031        ITEMDO
     C* FLDATR FL0003,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'FL0003  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* FLDATR POQORD,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0005  '    FLDSCR
     C                   EXSR      SATRIB
     C* C05 = C05+1
     C     Z3            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z3
     C* A006(C05) = POCOYNO
     C                   MOVE      *BLANKS       A06(Z3)
     C                   MOVE      WK0029        A06(Z3)
     C* A007(C05) = POPORD
     C                   MOVE      *BLANKS       A07(Z3)
     C                   MOVE      XOPORD        A07(Z3)
     C* A008(C05) = POSEQ
     C                   Z-ADD     XOSEQ         A08(Z3)
     C*                                                               *
     C* *** Get Supplier Item Number.
     C* GETREC D.IPSITEM,F.IPSITEM,*EQ,SVK006,PHSUPPN,PHBRNBR,POITEM
     C*
     C                   EXSR      S075
     C* IF %STS(D.IPSITEM,F.IPSITEM)=*YES
     C*  Status of last file I/O
     C     STS12         IFEQ      *ZERO
     C* WSMANF = PISPITM
     C                   MOVE      WK0011        WSMANF
     C* ELSE                                                          *
     C                   ELSE
     C* WSMANF = ' '
     C                   MOVEL     *BLANKS       WSMANF
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN03
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR004S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN03         NXTRRN
     C                   Z-ADD     *ZEROS        FL0003
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEL     *BLANKS       WSMANF
     C                   MOVEL     *BLANKS       ITEMDO
     C                   MOVEA     INS03         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN03                          INCREMENT RRN
     C                   WRITE     SCR004S1                             90
     C                   ADD       1             XRN03                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR004S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR004S1                             90
     C                   MOVEA     INS03         *IN
     C                   END
     C     RRN03         IFGT      SRN03
     C                   Z-ADD     SRN03         RRN03
     C                   END
     C                   EXSR      S074                                         RESET FP
     C*                                                               *
     C* IF C05=0
     C     Z3            IFEQ      *ZERO
     C* EXSUBR S05BKW
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
     C                   Z-ADD     *ZERO         Z4
     C* A009 = ' '
     C                   MOVEA     *BLANKS       A09
     C* A010 = ' '
     C                   MOVEA     *BLANKS       A10
     C* A011 = 0
     C                   Z-ADD     *ZERO         A11
     C* A012 = 0
     C                   Z-ADD     *ZERO         A12
     C* GETBLK D.PORENT,F.IPSTXTD,*PV,SVK009,SVK010,SVK011
     C*
     C                   EXSR      S077
     C*
     C                   MOVEL     *BLANK        KDCO03
     C                   MOVEL     SVK009        KDCO03
     C                   MOVEL     *BLANK        KDPO04
     C                   MOVEL     SVK010        KDPO04
     C                   Z-ADD     SVK011        KDPO05
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR006S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR006C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD17        DOUNE     'Y'                                          RD.SW.IPSTXTD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0005
     C                   Z-ADD     *ZEROS        XDSEQ
     C                   MOVEL     *BLANKS       XDTCDE
     C                   MOVEL     *BLANKS       XDTEXT
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0022         READE(N)  IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HDPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HD0009                         Purchase order line
     C                   Z-ADD     *ZERO         HDSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* C07 = C07+1
     C     Z4            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z4
     C* A009(C07) = TDCOYNO
     C                   MOVE      *BLANKS       A09(Z4)
     C                   MOVE      WK0012        A09(Z4)
     C* A010(C07) = TDPORD
     C                   MOVE      *BLANKS       A10(Z4)
     C                   MOVE      WK0013        A10(Z4)
     C* A011(C07) = TDPOSEQ
     C                   Z-ADD     WK0014        A11(Z4)
     C* A012(C07) = TDSEQ
     C                   Z-ADD     XDSEQ         A12(Z4)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN04
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR006S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN04         NXTRRN
     C                   Z-ADD     *ZEROS        FL0005
     C                   Z-ADD     *ZEROS        XDSEQ
     C                   MOVEL     *BLANKS       XDTCDE
     C                   MOVEL     *BLANKS       XDTEXT
     C                   MOVEA     INS04         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR006S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR006S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR006S1                             90
     C                   MOVEA     INS04         *IN
     C                   END
     C     RRN04         IFGT      SRN04
     C                   Z-ADD     SRN04         RRN04
     C                   END
     C                   EXSR      S079                                         CHK EOF
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
     C* I07 = 0
     C                   Z-ADD     *ZERO         I07
     C* DOBLK D.PORENT
     C*
     C                   Z-ADD     RRN04         SRN04                          Save RRN
     C                   Z-ADD     1             RRN04                          INIT RRN
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INS04
     C     SRN04         IFGE      1
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C     SWEXBL        ORNE      *ZERO
     C                   READC     SCR006S1                             9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   MOVEA     '010101'      *IN(1)
     C* I07 = I07+1
     C     I07           ADD       1             RN0129
     C                   Z-ADD     RN0129        I07
     C*                                                               *
     C* ** Add new record
     C* IF FL0005=1
     C     FL0005        IFEQ      1
     C* ** Set key values to header file
     C* TDCOYNO = POCOYNO
     C                   MOVE      WK0029        WK0012
     C* TDPORD = POPORD
     C                   MOVE      XOPORD        WK0013
     C* TDPOSEQ = POSEQ
     C                   Z-ADD     XOSEQ         WK0014
     C* WRITE D.PORENT,F.IPSTXTD
     C*
     C                   EXSR      S080
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Update existing record
     C* IF FL0005=2
     C     FL0005        IFEQ      2
     C* UPDATE D.PORENT,F.IPSTXTD
     C*
     C                   EXSR      S081
     C* FL0005 = 0
     C                   Z-ADD     *ZERO         FL0005
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C*                                                               *
     C* ** Delete existing record
     C* IF FL0005=4
     C     FL0005        IFEQ      4
     C* DELETE D.PORENT,F.IPSTXTD
     C*
     C                   EXSR      S082
     C* FL0005 = 0
     C                   Z-ADD     *ZERO         FL0005
     C* UPDFLG = 1
     C                   Z-ADD     1             UPDFLG
     C* END                                                           *
     C                   END
     C* ** Process any optional action choices.
     C* ** 1. Set key values to hidden key arrays.
     C* ** 2. Retrieve file and any secondary files.
     C* ** 3. Display screen.
     C*                                                               *
     C* ** If the action choice is not
     C* ** one of the allowed values,
     C* ** display error message.
     C* IF (FL0005<>0)&(UPDFLG=0)
     C     FL0005        IFNE      *ZERO
     C     UPDFLG        ANDEQ     *ZERO
     C* DSPERR FL0005,'Invalid action choice'
     C                   MOVEL     C0003         MSGDTA
     C                   MOVEL     'CPF9898'     MSGID
     C                   MOVE      'A'           MSGACT
     C                   EXSR      SMSG
     C                   MOVE      'X'           DSPERR
     C                   MOVEL     'FL0005  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0007  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   MOVEA     '00'          *IN(90)
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR006S1                             90
     C                   MOVEA     '010101'      *IN(1)
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
     C* *** Scroll information forward
     C*                                                               *
     C* C07 = 0
     C                   Z-ADD     *ZERO         Z4
     C* A009 = ' '
     C                   MOVEA     *BLANKS       A09
     C* A010 = ' '
     C                   MOVEA     *BLANKS       A10
     C* A011 = 0
     C                   Z-ADD     *ZERO         A11
     C* A012 = 0
     C                   Z-ADD     *ZERO         A12
     C* GETBLK D.PORENT,F.IPSTXTD,*NE,SVK009,SVK010,SVK011
     C*
     C*
     C                   MOVEL     *BLANK        KDCO03
     C                   MOVEL     SVK009        KDCO03
     C                   MOVEL     *BLANK        KDPO04
     C                   MOVEL     SVK010        KDPO04
     C                   Z-ADD     SVK011        KDPO05
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     12            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR006S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR006C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN04
     C*
     C                   Z-ADD     1             XRN04                          Init Next RRN
     C                   Z-ADD     XRN04         SRN04
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS04
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD17        DOUNE     'Y'                                          RD.SW.IPSTXTD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        FL0005
     C                   Z-ADD     *ZEROS        XDSEQ
     C                   MOVEL     *BLANKS       XDTCDE
     C                   MOVEL     *BLANKS       XDTEXT
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0022         READE(N)  IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HDPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HD0009                         Purchase order line
     C                   Z-ADD     *ZERO         HDSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* C07 = C07+1
     C     Z4            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z4
     C* A009(C07) = TDCOYNO
     C                   MOVE      *BLANKS       A09(Z4)
     C                   MOVE      WK0012        A09(Z4)
     C* A010(C07) = TDPORD
     C                   MOVE      *BLANKS       A10(Z4)
     C                   MOVE      WK0013        A10(Z4)
     C* A011(C07) = TDPOSEQ
     C                   Z-ADD     WK0014        A11(Z4)
     C* A012(C07) = TDSEQ
     C                   Z-ADD     XDSEQ         A12(Z4)
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN04
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR006S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN04         NXTRRN
     C                   Z-ADD     *ZEROS        FL0005
     C                   Z-ADD     *ZEROS        XDSEQ
     C                   MOVEL     *BLANKS       XDTCDE
     C                   MOVEL     *BLANKS       XDTEXT
     C                   MOVEA     INS04         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN04                          INCREMENT RRN
     C                   WRITE     SCR006S1                             90
     C                   ADD       1             XRN04                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR006S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR006S1                             90
     C                   MOVEA     INS04         *IN
     C                   END
     C     RRN04         IFGT      SRN04
     C                   Z-ADD     SRN04         RRN04
     C                   END
     C                   EXSR      S079                                         RESET FP
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
     C                   Z-ADD     *ZERO         Z5
     C* ** Set pointer to first record on screen.
     C* SETLL D.PORENT,F.IPSWADD,SVK013,SVK08
     C*
     C                   EXSR      S083
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.PORENT,F.IPSWADD,*PV,SVK013
     C*
     C                   EXSR      S084
     C* DOW (C08<S08CNT)&%STS(D.PORENT,F.IPSWADD)=*YES
     C     Z5            IFLT      S08CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C* GETREC D.PORENT,F.IPSWADD,*PV,SVK013
     C*
     C                   EXSR      S084
     C* END                                                           *
     C     Z5            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
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
     C* SETLL D.PORENT,F.IPSWADD,SVK013,SVK08
     C*
     C                   EXSR      S083
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
     C                   Z-ADD     *ZERO         Z5
     C* ** protect select field
     C* DOW C08<S08CNT
     C     Z5            DOWLT     S08CNT
     C* C08 = C08+1
     C     Z5            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z5
     C* FLDATR T01(C08),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C08 = 0
     C                   Z-ADD     *ZERO         Z5
     C* GETREC D.PORENT,F.IPSWADD,*NE,SVK013
     C*
     C                   EXSR      S086
     C* DOW (C08<S08CNT)&%STS(D.PORENT,F.IPSWADD)=*YES
     C     Z5            IFLT      S08CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C08 = C08+1
     C     Z5            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z5
     C* ** Unprotect select field.
     C* FLDATR T01(C08),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T01     '    FLDNAM
     C                   Z-ADD     Z5            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0008  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B01(C08) = PORENT.IPSWADD.PDWHSE
     C                   MOVE      *BLANKS       B01(Z5)
     C                   MOVE      WK0020        B01(Z5)
     C* ** load screen array.
     C* T02(C08) = PORENT.IPSWADD.PDWHSE
     C                   MOVE      *BLANKS       T02(Z5)
     C                   MOVE      WK0020        T02(Z5)
     C* T03(C08) = PORENT.IPSWADD.PDLIN1
     C                   MOVE      *BLANKS       T03(Z5)
     C                   MOVE      WDLIN1        T03(Z5)
     C* ** Save first record on screen.
     C* IF C08=1
     C     Z5            IFEQ      1
     C* FST08 = B01(C08)
     C                   MOVE      B01(Z5)       FST08
     C* END                                                           *
     C                   END
     C* IF C08<S08CNT
     C     Z5            IFLT      S08CNT
     C* GETREC D.PORENT,F.IPSWADD,*NE,SVK013
     C*
     C                   EXSR      S086
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z5            IFLT      S08CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS05         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C08>0
     C     Z5            IFGT      *ZERO
     C* LST08 = B01(C08)
     C                   MOVE      B01(Z5)       LST08
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
     C                   Z-ADD     *ZERO         Z6
     C* ** Set pointer to first record on screen.
     C* SETLL D.PORENT,F.ITMMAST,SVK015,SVK09
     C*
     C                   EXSR      S088
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.PORENT,F.ITMMAST,*PV,SVK015
     C*
     C                   EXSR      S089
     C* DOW (C09<S09CNT)&%STS(D.PORENT,F.ITMMAST)=*YES
     C     Z6            IFLT      S09CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C09 = C09+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* GETREC D.PORENT,F.ITMMAST,*PV,SVK015
     C*
     C                   EXSR      S089
     C* END                                                           *
     C     Z6            IFLT      S09CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
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
     C* SETLL D.PORENT,F.ITMMAST,SVK015,SVK09
     C*
     C                   EXSR      S088
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
     C* T04 = 0
     C                   Z-ADD     *ZERO         T04
     C* B02 = ' '
     C                   MOVEA     *BLANKS       B02
     C* T05 = ' '
     C                   MOVEA     *BLANKS       T05
     C* T06 = ' '
     C                   MOVEA     *BLANKS       T06
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z6
     C* ** protect select field
     C* DOW C09<S09CNT
     C     Z6            DOWLT     S09CNT
     C* C09 = C09+1
     C     Z6            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z6
     C* FLDATR T04(C09),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C09 = 0
     C                   Z-ADD     *ZERO         Z6
     C* GETREC D.PORENT,F.ITMMAST,*NE,SVK015
     C*
     C                   EXSR      S091
     C* DOW (C09<S09CNT)&%STS(D.PORENT,F.ITMMAST)=*YES
     C     Z6            IFLT      S09CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C09 = C09+1
     C     Z6            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z6
     C* ** Unprotect select field.
     C* FLDATR T04(C09),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T04     '    FLDNAM
     C                   Z-ADD     Z6            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0009  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B02(C09) = PORENT.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       B02(Z6)
     C                   MOVEL     WK0022        B02(Z6)
     C* ** load screen array.
     C* T05(C09) = PORENT.ITMMAST.ITITEM
     C                   MOVE      *BLANKS       T05(Z6)
     C                   MOVE      WK0022        T05(Z6)
     C* T06(C09) = PORENT.ITMMAST.ITIDESC
     C                   MOVE      *BLANKS       T06(Z6)
     C                   MOVE      WK0021        T06(Z6)
     C* ** Save first record on screen.
     C* IF C09=1
     C     Z6            IFEQ      1
     C* FST09 = B02(C09)
     C                   MOVE      B02(Z6)       FST09
     C* END                                                           *
     C                   END
     C* IF C09<S09CNT
     C     Z6            IFLT      S09CNT
     C* GETREC D.PORENT,F.ITMMAST,*NE,SVK015
     C*
     C                   EXSR      S091
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z6            IFLT      S09CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS13         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C09>0
     C     Z6            IFGT      *ZERO
     C* LST09 = B02(C09)
     C                   MOVE      B02(Z6)       LST09
     C* END                                                           *
     C                   END
     C*
     C     $S09AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S10ABR - SCRN SUB
     C*****************************************************************
     C     S10ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** Set pointer to first record on screen.
     C* SETLL D.PORENT,F.UOM,SVK017,SVK10
     C*
     C                   EXSR      S093
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.PORENT,F.UOM,*PV,SVK017
     C*
     C                   EXSR      S094
     C* DOW (C10<S10CNT)&%STS(D.PORENT,F.UOM)=*YES
     C     Z7            IFLT      S10CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C10 = C10+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* GETREC D.PORENT,F.UOM,*PV,SVK017
     C*
     C                   EXSR      S094
     C* END                                                           *
     C     Z7            IFLT      S10CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
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
     C* SETLL D.PORENT,F.UOM,SVK017,SVK10
     C*
     C                   EXSR      S093
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
     C* T07 = 0
     C                   Z-ADD     *ZERO         T07
     C* B03 = ' '
     C                   MOVEA     *BLANKS       B03
     C* T08 = ' '
     C                   MOVEA     *BLANKS       T08
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z7
     C* ** protect select field
     C* DOW C10<S10CNT
     C     Z7            DOWLT     S10CNT
     C* C10 = C10+1
     C     Z7            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z7
     C* FLDATR T07(C10),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C10 = 0
     C                   Z-ADD     *ZERO         Z7
     C* GETREC D.PORENT,F.UOM,*NE,SVK017
     C*
     C                   EXSR      S096
     C* DOW (C10<S10CNT)&%STS(D.PORENT,F.UOM)=*YES
     C     Z7            IFLT      S10CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     NRSLT0        IFEQ      XYES
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C10 = C10+1
     C     Z7            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z7
     C* ** Unprotect select field.
     C* FLDATR T07(C10),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T07     '    FLDNAM
     C                   Z-ADD     Z7            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0010  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** Save field being prompted for.
     C* B03(C10) = PORENT.UOM.UMUOM
     C                   MOVE      *BLANKS       B03(Z7)
     C                   MOVE      WMUOM         B03(Z7)
     C* ** load screen array.
     C* T08(C10) = PORENT.UOM.UMUOM
     C                   MOVE      *BLANKS       T08(Z7)
     C                   MOVE      WMUOM         T08(Z7)
     C* ** Save first record on screen.
     C* IF C10=1
     C     Z7            IFEQ      1
     C* FST10 = B03(C10)
     C                   MOVE      B03(Z7)       FST10
     C* END                                                           *
     C                   END
     C* IF C10<S10CNT
     C     Z7            IFLT      S10CNT
     C* GETREC D.PORENT,F.UOM,*NE,SVK017
     C*
     C                   EXSR      S096
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z7            IFLT      S10CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS14         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C10>0
     C     Z7            IFGT      *ZERO
     C* LST10 = B03(C10)
     C                   MOVE      B03(Z7)       LST10
     C* END                                                           *
     C                   END
     C*
     C     $S10AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S12ABR - SCRN SUB
     C*****************************************************************
     C     S12ABR        BEGSR
     C*
     C* ** Array backwards read.
     C* C12 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** Set pointer to first record on screen.
     C* SETLL D.PORENT,F.SUPLIER,SVK022,svk023,svk12
     C*
     C                   EXSR      S098
     C* ** Read backwards until number
     C* ** elements reached, or beginning
     C* ** of file.
     C* GETREC D.PORENT,F.SUPLIER,*PV,SVK022
     C*
     C                   EXSR      S099
     C* DOW (C12<S12CNT)&%STS(D.PORENT,F.SUPLIER)=*YES
     C     Z8            IFLT      S12CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C12 = C12+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* GETREC D.PORENT,F.SUPLIER,*PV,SVK022
     C*
     C                   EXSR      S099
     C* END                                                           *
     C     Z8            IFLT      S12CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Load arrays from this point.
     C* EXSUBR S12ALD
     C                   EXSR      S12ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S12AB
     C                   END
     C*
     C     $S12AB        ENDSR
     C/EJECT
     C*****************************************************************
     C* S12AFR - SCRN SUB
     C*****************************************************************
     C     S12AFR        BEGSR
     C*
     C* ** Set pointer to last record on screen.
     C* SETLL D.PORENT,F.SUPLIER,SVK022,SVK023,SVK12
     C*
     C                   EXSR      S098
     C* ** Load arrays from this point.
     C* EXSUBR S12ALD
     C                   EXSR      S12ALD
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S12AF
     C                   END
     C*
     C     $S12AF        ENDSR
     C/EJECT
     C*****************************************************************
     C* S12ALD - SCRN SUB
     C*****************************************************************
     C     S12ALD        BEGSR
     C*
     C* ** load arrays from file
     C* ** clear arrays
     C* T12 = 0
     C                   Z-ADD     *ZERO         T12
     C* B05 = ' '
     C                   MOVEA     *BLANKS       B05
     C* T13 = ' '
     C                   MOVEA     *BLANKS       T13
     C* T14 = ' '
     C                   MOVEA     *BLANKS       T14
     C* T15 = ' '
     C                   MOVEA     *BLANKS       T15
     C* C12 = 0
     C                   Z-ADD     *ZERO         Z8
     C* ** protect select field
     C* DOW C12<S12CNT
     C     Z8            DOWLT     S12CNT
     C* C12 = C12+1
     C     Z8            ADD       1             RN0129
     C                   Z-ADD     RN0129        Z8
     C* FLDATR T12(C12),*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'T12     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C* END                                                           *
     C                   END
     C* ** Read file and load to arrays.
     C* C12 = 0
     C                   Z-ADD     *ZERO         Z8
     C* GETREC D.PORENT,F.SUPLIER,*NE,SVK022
     C*
     C                   EXSR      S101
     C* DOW (C12<S12CNT)&%STS(D.PORENT,F.SUPLIER)=*YES
     C     Z8            IFLT      S12CNT
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
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
     C     RN0129        IFEQ      1
     C     NRSLT0        ANDEQ     1
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C                   Z-ADD     RN0129        RSLT01
     C     RSLT01        DOWEQ     1
     C* C12 = C12+1
     C     Z8            ADD       1             NRSLT0
     C                   Z-ADD     NRSLT0        Z8
     C* ** Unprotect select field.
     C* FLDATR T12(C12),*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'T12     '    FLDNAM
     C                   Z-ADD     Z8            FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SC0012  '    FLDSCR
     C                   EXSR      SATRIB
     C* ** load screen array.
     C* T13(C12) = PORENT.SUPLIER.SUSUPPN
     C                   MOVE      *BLANKS       T13(Z8)
     C                   MOVE      WK0064        T13(Z8)
     C* T14(C12) = PORENT.SUPLIER.SUBRNBR
     C                   MOVE      *BLANKS       T14(Z8)
     C                   MOVE      WK0061        T14(Z8)
     C* T15(C12) = PORENT.SUPLIER.SUNAME
     C                   MOVE      *BLANKS       T15(Z8)
     C                   MOVE      WUNAME        T15(Z8)
     C* ** Save first record on screen.
     C* IF C12=1
     C     Z8            IFEQ      1
     C* FST11 = t13(C12)
     C                   MOVE      T13(Z8)       FST11
     C* FST12 = t14(C12)
     C                   MOVE      T14(Z8)       FST12
     C* END                                                           *
     C                   END
     C* IF C12<S12CNT
     C     Z8            IFLT      S12CNT
     C* GETREC D.PORENT,F.SUPLIER,*NE,SVK022
     C*
     C                   EXSR      S101
     C* END                                                           *
     C                   END
     C* END                                                           *
     C     Z8            IFLT      S12CNT
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C*  Status of last file I/O
     C     STS06         IFEQ      *ZERO
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     RN0129        IFEQ      XYES
     C                   Z-ADD     1             RN0129
     C                   ELSE
     C                   Z-ADD     0             RN0129
     C                   END
     C     NRSLT0        IFEQ      1
     C     RN0129        ANDEQ     1
     C                   Z-ADD     1             NRSLT0
     C                   ELSE
     C                   Z-ADD     0             NRSLT0
     C                   END
     C                   Z-ADD     NRSLT0        RSLT01
     C                   END
     C* ** Save last record on screen.
     C* IF C12>0
     C     Z8            IFGT      *ZERO
     C* LST11 = t13(C12)
     C                   MOVE      *BLANKS       LST11
     C                   MOVEL     T13(Z8)       LST11
     C* LST12 = t14(C12)
     C                   MOVE      T14(Z8)       LST12
     C* END                                                           *
     C                   END
     C*
     C     $S12AL        ENDSR
     C/EJECT
     C*****************************************************************
     C* S75BKW - Roll Back
     C*****************************************************************
     C     S75BKW        BEGSR
     C*
     C* ***  Scroll information backward
     C*                                                               *
     C* C75 = 0
     C                   Z-ADD     *ZERO         C75
     C* FLDATR POQORD,*ND
     C                   MOVE      'X'           #ND
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCDELD  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     C*
     C                   EXSR      S103
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     13            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR014S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR014C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN05
     C*
     C                   Z-ADD     1             XRN05                          Init Next RRN
     C                   Z-ADD     XRN05         SRN05
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS05
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C*
     C* ITEMDO = POIDESC
     C                   MOVE      *BLANKS       ITEMDO
     C                   MOVEL     WK0031        ITEMDO
     C* FLDATR POQORD,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCDELD  '    FLDSCR
     C                   EXSR      SATRIB
     C* C75 = C75+1
     C     C75           ADD       1             RN0129
     C                   Z-ADD     RN0129        C75
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN05
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR014S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN05         NXTRRN
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEA     INS05         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR014S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR014S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR014S1                             90
     C                   MOVEA     INS05         *IN
     C                   END
     C     RRN05         IFGT      SRN05
     C                   Z-ADD     SRN05         RRN05
     C                   END
     C                   EXSR      S105                                         CHK EOF
     C*
     C     $S75BK        ENDSR
     C/EJECT
     C*****************************************************************
     C* S75FWD - Roll Forward
     C*****************************************************************
     C     S75FWD        BEGSR
     C*
     C* *** Scroll information forward
     C*                                                               *
     C* C75 = 0
     C                   Z-ADD     *ZERO         C75
     C* FLDATR POQORD,*ND,*PR
     C                   MOVE      'X'           #ND
     C                   MOVE      'X'           #PR
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCDELD  '    FLDSCR
     C                   EXSR      SATRIB
     C* GETBLK D.PORENT,F.PORDD,*NE,SVK006,SVK007
     C*
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     13            WLCNTR                         INIT LOOP CNTR
     C*          ---------------------------------------------------------------
     C*          | Initialize subfile    SCR014S1
     C*          ---------------------------------------------------------------
     C                   MOVEA     '0000'        *IN(63)                        SFLCLR,DSP,NXTCHG,IN
     C                   WRITE     SCR014C1                                     CLEAR SUBFILE
     C                   Z-ADD     0             RRN05
     C*
     C                   Z-ADD     1             XRN05                          Init Next RRN
     C                   Z-ADD     XRN05         SRN05
     C                   MOVEA     '1110'        *IN(63)                        DSP,DSPCTL,NXTCHG
     C                   MOVEA     *IN           INS05
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     *ZEROS        XOQORD
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C* ITEMDO = POIDESC
     C                   MOVE      *BLANKS       ITEMDO
     C                   MOVEL     WK0031        ITEMDO
     C* FLDATR POQORD,*DS
     C                   MOVE      'X'           #DS
     C                   MOVEL     'XOQORD  '    FLDNAM
     C                   Z-ADD     *ZERO         FLDINX
     C                   MOVE      *BLANK        FLDSCR
     C                   MOVEL     'SCDELD  '    FLDSCR
     C                   EXSR      SATRIB
     C* C75 = C75+1
     C     C75           ADD       1             RN0129
     C                   Z-ADD     RN0129        C75
     C*                                                               *
     C* ENDBLK                                                        *
     C     SWEXBL        IFEQ      *ZERO
     C     SWSKPR        ANDEQ     *ZERO
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   Z-ADD     WCNTR         WRRN05
     C                   MOVEA     *IN           INSAV1
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR014S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   END
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   Z-ADD     RRN05         NXTRRN
     C                   Z-ADD     *ZEROS        XOSEQ
     C                   MOVEL     *BLANKS       XOWHSE
     C                   MOVEL     *BLANKS       XOITEM
     C                   MOVEL     *BLANKS       ITEMDO
     C                   Z-ADD     *ZEROS        XOQORD
     C                   MOVEA     INS05         *IN
     C                   MOVE      '0'           *IN65
     C                   MOVEA     *IN           INSAV1
     C                   Z-ADD     WCNTR         WGETR
     C     WGETR         DOWLT     WLCNTR
     C                   ADD       1             RRN05                          INCREMENT RRN
     C                   WRITE     SCR014S1                             90
     C                   ADD       1             XRN05                          Incr NEXT RRN
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   END
     C     NXTRRN        IFGT      0
     C     NXTRRN        CHAIN     SCR014S1                           90
     C                   MOVEA     INSAV1        *IN
     C                   MOVE      '1'           *IN65
     C                   UPDATE    SCR014S1                             90
     C                   MOVEA     INS05         *IN
     C                   END
     C     RRN05         IFGT      SRN05
     C                   Z-ADD     SRN05         RRN05
     C                   END
     C                   EXSR      S105                                         RESET FP
     C*                                                               *
     C* IF C75=0
     C     C75           IFEQ      *ZERO
     C* EXSUBR S75BKW
     C                   EXSR      S75BKW
     C     LRFLAG        IFNE      *BLANK
     C                   GOTO      $S75FW
     C                   END
     C* END                                                           *
     C                   END
     C*
     C     $S75FW        ENDSR
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
     C                   MOVEL     *BLANKS       RN0012
     C* ***                                                           *
     C* IF sydsep = ' '
     C     RN0018        IFEQ      *BLANKS
     C* SYDSEP = '/'
     C                   MOVE      '/'           RN0018
     C* END                                                           *
     C                   END
     C*                                                               *
     C* SYCCYY = %ljf(SYDATI) ; YEAR  4
     C*  Left Justify field into result field
     C                   MOVEL     RN0010        SYCCYY
     C* SYMMDD = %RJF(SYDATI) ; MMDD  4
     C*  Right Justify field into result field
     C                   MOVE      RN0010        SYMMDD
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
     C                   MOVE      *BLANK        RN0006
     C                   MOVEL     SYCCYY        RN0006
     C* SYMMDDA = %CTC(SYMMDD)
     C*  Convert To Character
     C                   MOVE      *BLANK        RN0019
     C                   MOVEL     SYMMDD        RN0019
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
     C     RN0016        IFEQ      '1'
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0012        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0018:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0012        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0018:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* END                                                           *
     C                   END
     C* IF SYDFMT = '2'
     C     RN0016        IFEQ      '2'
     C* SYDATO = %CON(SYDATO,SYMMA)
     C*  Concatenate
     C     RN0012        CAT(P)    SYMMA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0018:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,SYDDA)
     C*  Concatenate
     C     RN0012        CAT(P)    SYDDA:0       ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,sydsep)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0018:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* SYDATO = %CON(SYDATO,SYCCYYA)
     C*  Concatenate
     C     RN0012        CAT(P)    RN0006:0      ARSLT0
     C                   MOVE      *BLANKS       RN0012
     C                   MOVEL     ARSLT0        RN0012
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** If the input date is Blank - Blank the output date
     C* IF SYDATI = 0
     C     RN0010        IFEQ      *ZERO
     C* SYDATO = *BLANKS
     C                   MOVEL     *BLANKS       RN0012
     C* END                                                           *
     C                   END
     C* *** Initialise the input fields
     C* SYDATI = SYDATI  ; Input date
     C                   Z-ADD     RN0010        RN0010
     C* SYDSEP = SYDSEP  ; date seperator
     C                   MOVE      RN0018        RN0018
     C* SYDFMT = SYDFMT  ; date format
     C                   MOVE      RN0016        RN0016
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
     C                   Z-ADD     *ZEROS        RN0011
     C* ***                                                           *
     C* IF SYDSEP = ' '
     C     RN0018        IFEQ      *BLANKS
     C* SYDSEP = '/'           ;default seperator
     C                   MOVE      '/'           RN0018
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA10 = *blanks
     C                   MOVEA     *BLANKS       A13
     C* WKDA10 = %MVA(SYDATAI); char date to array
     C*  Move array instruction
     C                   MOVEA     RN0009        A13
     C* WKDA8 = *blanks
     C                   MOVEA     *BLANKS       A14
     C* SY1 = 1 ; input index
     C                   Z-ADD     1             Y6
     C* SY2 = 1 ; output index
     C                   Z-ADD     1             Y7
     C*                                                               *
     C* DOW sy1 < 11
     C     Y6            DOWLT     11
     C* *** Drop the seperators
     C* IF WKDA10(SY1) <> ' ' & SY2 < 9 ; process the input
     C     A13(Y6)       IFNE      *BLANKS
     C     Y7            ANDLT     9
     C*                                                               *
     C* *** Drop anything that is not a number
     C*                                                               *
     C* IF WKDA10(SY1) >= '0' *and WKDA10(SY1) <='9'
     C     A13(Y6)       IFGE      '0'
     C     A13(Y6)       ANDLE     '9'
     C* WKDA8(SY2) = WKDA10(SY1)
     C                   MOVE      *BLANKS       A14(Y7)
     C                   MOVE      A13(Y6)       A14(Y7)
     C* *** Ignore non-numerics
     C* SY2 = sy2 + 1
     C     Y7            ADD       1             RN0129
     C                   Z-ADD     RN0129        Y7
     C* END                                                           *
     C                   END
     C*                                                               *
     C* END                                                           *
     C                   END
     C* SY1 = sy1 + 1
     C     Y6            ADD       1             RN0129
     C                   Z-ADD     RN0129        Y6
     C* END                                                           *
     C                   END
     C*                                                               *
     C* WKDA8F = %MVA(wkda8) ; array to field
     C*  Move array instruction
     C                   MOVEA     A14           WKDA8F
     C* SYDATNO = %CTN(WKDA8F); stripped date to number
     C*  Convert To Number
     C                   Z-ADD     *ZEROS        RN0011
     C                   MOVE      WKDA8F        RN0011
     C* ***                                                           *
     C* *** Create system base date
     C* ***                                                           *
     C* IF SYDFMT = '1' ; the input date should be in DMC format
     C     RN0016        IFEQ      '1'
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
     C     RN0016        IFEQ      '2'
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
     C                   Z-ADD     *ZEROS        SYDMC
     C                   MOVE      SYDMCA        SYDMC
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
     C                   Z-ADD     *ZEROS        RN0007
     C                   MOVE      SYCMDA        RN0007
     C* ***                                                           *
     C* *** Initialise the input fields
     C* ***                                                           *
     C* SYDSEP = SYDSEP
     C                   MOVE      RN0018        RN0018
     C* SYDFMT = SYDFMT
     C                   MOVE      RN0016        RN0016
     C* SYDATAI = SYDATAI
     C                   MOVE      RN0009        RN0009
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
     C                   MOVE      '0'           RN0014
     C* IF sydatv <> 0
     C     RN0013        IFNE      *ZERO
     C*                                                               *
     C* *** Split the date
     C*                                                               *
     C* SYCYN = %ljf(sydatv)  ; CYY portion
     C*  Left Justify field into result field
     C                   MOVEL     RN0013        SYCYN
     C* SYMDN = %rjf(sydatv)  ; MMDD portion
     C*  Right Justify field into result field
     C                   MOVE      RN0013        SYMDN
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
     C                   Z-ADD     NRSLT         RN0129
     C                   Z-ADD     RN0129        WKLEAP
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
     C                   MOVE      '1'           RN0014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the months
     C*                                                               *
     C* IF symmn <1 *or symmn >12
     C     SYMMN         IFLT      1
     C     SYMMN         ORGT      12
     C* SYDERR = '1' ; 1=error 0=Valid   ; the month is invalid
     C                   MOVE      '1'           RN0014
     C* END                                                           *
     C                   END
     C*                                                               *
     C* *** Check the days
     C*                                                               *
     C* IF syddn <1 *or syddn > wkend
     C     SYDDN         IFLT      1
     C     SYDDN         ORGT      WKEND
     C* SYDERR = '1' ; 1=error 0=Valid   ; the days are invalid
     C                   MOVE      '1'           RN0014
     C* END                                                           *
     C                   END
     C* END                                                           *
     C                   END
     C* *** Init Fields
     C* SYDATV = 0
     C                   Z-ADD     *ZERO         RN0013
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
     C* SNOD - Convert date to number of days since Jan 1, 1900 B.C.
     C*        Argument with value of zero results in zero.
     C*        If year is B.C, it must be passed as negative.
     C*
     C* FUNCTION:    NOD(DATE)
     C*****************************************************************
     C     SNOD          BEGSR
     C*
     C     NARG1         IFEQ      *ZERO
     C                   Z-ADD     *ZERO         NRSLT
     C                   ELSE
     C*
     C* Break Date in MONTH, DAY, and YEAR.
     C                   EXSR      SBRDAT
     C     NRSLT         IFNE      *HIVAL
     C*
     C*  Correct for negative year
     C*
     C     SVCY          IFGT      0
     C                   Z-ADD     0             YRCORR            2 2
     C                   ELSE
     C                   Z-ADD     0.75          YRCORR
     C                   END
     C*
     C     SVMM          IFLE      2
     C                   SUB       1             SVCY
     C                   ADD       12            SVMM
     C                   END
     C*
     C*   Cope with Gregorian calender reform
     C*
     C     SVCY          MULT      10000         WKYR             30 0
     C     SVMM          MULT      100           WKMT             30 0
     C                   Z-ADD     WKYR          WKSUM            30 9
     C                   ADD       WKMT          WKSUM
     C                   ADD       SVDD          WKSUM
     C     WKSUM         IFGE      15821015
     C     SVCY          DIV       100           NARGX            10 0
     C     NARGX         DIV       4             ADIV4            30 0
     C     2             SUB       NARGX         ADIV             30 9
     C                   Z-ADD     0             NARGY
     C                   ADD       ADIV          NARGY            21 0
     C                   ADD       ADIV4         NARGY
     C                   END
     C*
     C* Get result in JUL Format.
     C*
     C                   Z-ADD     0             WKYR
     C     SVCY          MULT      365.25        WKYR
     C                   SUB       YRCORR        WKYR
     C                   Z-ADD     0             WKMT
     C     SVMM          ADD       1             WKMT
     C                   MULT      30.6001       WKMT
     C     WKYR          ADD       WKMT          NRSLT
     C                   ADD       SVDD          NRSLT
     C                   ADD       1720994       NRSLT
     C                   ADD       NARGY         NRSLT
     C*
     C* Adjust date so  1 Jan 1900 returns 1.
     C                   SUB       2415019       NRSLT
     C*
     C                   END
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SBRDAT - Converts DATE field into YEAR, MONTH, and DAYS
     C*          Accepts numeric argument (DATE) and a format
     C*          (DATFMT) and breaks it into YEAR, MONTH, and DAYS.
     C*****************************************************************
     C     SBRDAT        BEGSR
     C*
     C                   Z-ADD     *ZERO         SVCY
     C                   Z-ADD     *ZERO         SVCC
     C                   Z-ADD     *ZERO         NRSLT
     C     NARG1         IFEQ      *HIVAL
     C                   MOVE      *HIVAL        NRSLT
     C                   ELSE
     C*
     C     DATFMT        IFNE      'JUL'
     C     DATFMT        ANDNE     'CJL'
     C*
     C     DATFMT        IFEQ      'YMD'
     C     DATFMT        OREQ      'MDY'
     C     DATFMT        OREQ      'DMY'
     C                   Z-ADD     NARG1         X1DATE
     C* Year_Month_Day
     C     DATFMT        IFEQ      'YMD'
     C                   Z-ADD     X12           SVYY
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVDD
     C                   ELSE
     C*
     C* Month_Day_Year
     C     DATFMT        IFEQ      'MDY'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   Z-ADD     X56           SVYY
     C                   ELSE
     C*
     C* Day_Month_Year
     C     DATFMT        IFEQ      'DMY'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   Z-ADD     X56           SVYY
     C                   END
     C                   END
     C                   END
     C                   ELSE
     C*
     C                   Z-ADD     NARG1         X1CDAT                         CCYY
     C     DATFMT        IFEQ      'CMD'
     C                   Z-ADD     X12           SVCC
     C                   Z-ADD     X34           SVYY
     C                   Z-ADD     X56           SVMM
     C                   Z-ADD     X78           SVDD
     C                   ELSE
     C*
     C                   Z-ADD     X56           SVCC
     C                   Z-ADD     X78           SVYY
     C     DATFMT        IFEQ      'MDC'
     C                   Z-ADD     X12           SVMM
     C                   Z-ADD     X34           SVDD
     C                   ELSE
     C*
     C     DATFMT        IFEQ      'DMC'
     C                   Z-ADD     X12           SVDD
     C                   Z-ADD     X34           SVMM
     C                   END
     C                   END
     C                   END
     C                   END
     C                   MOVEL     SVCC          SVCY
     C                   MOVE      SVYY          SVCY
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVYY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C                   Z-ADD     29            FEB
     C                   ELSE
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C* Process julian date.
     C                   ELSE
     C     NARG1         IFGT      99366
     C     DATFMT        ANDEQ     'JUL'
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C     NARG1         IFGT      9999366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Get the year.
     C     DATFMT        IFEQ      'JUL'
     C     NARG1         DIV       1000          SVYY
     C                   MVR                     SVDAYS
     C                   MOVE      SVYY          SVCY
     C                   ELSE
     C     NARG1         DIV       1000          SVCY                           CCYY
     C                   MVR                     SVDAYS
     C                   MOVEL     SVCY          SVCC
     C                   MOVE      SVCY          SVYY
     C                   END
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C     SVCY          IFGT      45
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   ELSE
     C                   Z-ADD     20            SVCC
     C                   MOVEL     20            SVCY
     C                   ENDIF
     C                   END
     C*
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C     SVDAYS        IFGT      366
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     29            FEB
     C                   ELSE
     C     SVDAYS        IFGT      365
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C                   END
     C                   END
     C*
     C* Change SVDAYS into month and days.
     C*
     C     NRSLT         IFNE      *HIVAL
     C*
     C                   MOVE      '0'           *IN92
     C                   DO        12            C1
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     C1            IFEQ      1
     C     C1            OREQ      3
     C     C1            OREQ      5
     C     C1            OREQ      7
     C     C1            OREQ      8
     C     C1            OREQ      10
     C     C1            OREQ      12
     C     SVDAYS        IFGT      31
     C                   SUB       31            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* apr, jun, sept, or nov.
     C     C1            IFEQ      4
     C     C1            OREQ      6
     C     C1            OREQ      9
     C     C1            OREQ      11
     C     SVDAYS        IFGT      30
     C                   SUB       30            SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C* feb
     C     C1            IFEQ      2
     C     SVDAYS        IFGT      FEB
     C                   SUB       FEB           SVDAYS
     C                   ELSE
     C                   MOVE      '1'           *IN92
     C                   END
     C                   END
     C*
     C  N92              END
     C*
     C                   Z-ADD     C1            SVMM
     C                   Z-ADD     SVDAYS        SVDD
     C*
     C                   END
     C                   END
     C*
     C     SVMM          IFGT      12
     C     SVMM          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     SVDD          IFGT      31
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   ELSE
     C* apr, jun, sept, or nov.
     C     SVMM          IFEQ      4
     C     SVMM          OREQ      6
     C     SVMM          OREQ      9
     C     SVMM          OREQ      11
     C     SVDD          IFGT      30
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C* feb
     C     SVMM          IFEQ      2
     C     SVDD          IFGT      FEB
     C     SVDD          ORLE      0
     C                   Z-ADD     *HIVAL        NRSLT
     C                   END
     C                   END
     C                   END
     C                   END
     C*
     C                   END
     C*
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SCTD - Convert number of days into date .
     C*        Argument with value of zero results in zero.
     C*
     C* FUNCTION:    CTD(DATE)
     C*****************************************************************
     C     SCTD          BEGSR
     C*
     C*   Cope with Gregorian calender reform
     C* Adjust date so  1 Jan 1900 becomes 2415020
     C                   ADD       2415019       NARG1
     C*
     C     NARG1         ADD       1             NARGZ            30 0
     C     NARGZ         IFLT      2299161
     C                   Z-ADD     NARGZ         NARGA            30 0
     C                   ELSE
     C     NARGZ         SUB       1867216.25    CONST1           30 9
     C                   Z-ADD     36524.25      CONST2           30 9
     C     CONST1        DIV       CONST2        ALPHA            30 0
     C                   Z-ADD     0             ADIV4
     C     ALPHA         DIV       4             ADIV4
     C                   Z-ADD     NARGZ         NARGA
     C                   ADD       1             NARGA
     C                   ADD       ALPHA         NARGA
     C                   SUB       ADIV4         NARGA
     C                   END
     C     NARGA         ADD       1524          NARGB            30 0
     C     NARGB         SUB       122.1         NARGW            30 9
     C     NARGW         DIV       365.25        NARGC            30 0
     C     NARGC         MULT      365.25        NARGD            30 0
     C     NARGB         SUB       NARGD         NARGV            30 9
     C     NARGV         DIV       30.6001       NARGE            30 0
     C     NARGE         MULT      30.6001       WK3              30 0
     C                   Z-ADD     NARGV         NARGQ            30 0
     C     NARGQ         SUB       WK3           SVDD
     C     NARGE         IFLT      13.5
     C     NARGE         SUB       1             SVMM
     C                   ELSE
     C     NARGE         SUB       13            SVMM
     C                   END
     C     SVMM          IFGT      2.5
     C     NARGC         SUB       4716          SVCY
     C                   ELSE
     C     NARGC         SUB       4715          SVCY
     C                   END
     C*
     C*    Put result in appropriate format
     C*
     C     DATFMT        IFEQ      'MDC'
     C                   MOVE      SVMM          X12
     C                   MOVE      SVDD          X34
     C                   MOVEL     SVCY          X56
     C                   MOVE      SVCY          X78
     C                   END
     C     DATFMT        IFEQ      'DMC'
     C                   MOVE      SVDD          X12
     C                   MOVE      SVMM          X34
     C                   MOVEL     SVCY          X56
     C                   MOVE      SVCY          X78
     C                   END
     C     DATFMT        IFEQ      'CMD'
     C                   MOVEL     SVCY          X12
     C                   MOVE      SVCY          X34
     C                   MOVE      SVMM          X56
     C                   MOVE      SVDD          X78
     C                   END
     C     DATFMT        IFEQ      'MDY'
     C                   MOVE      SVMM          X12
     C                   MOVE      SVDD          X34
     C                   MOVE      SVCY          X56
     C                   END
     C     DATFMT        IFEQ      'DMY'
     C                   MOVE      SVDD          X12
     C                   MOVE      SVMM          X34
     C                   MOVE      SVCY          X56
     C                   END
     C     DATFMT        IFEQ      'YMD'
     C                   MOVE      SVCY          X12
     C                   MOVE      SVMM          X34
     C                   MOVE      SVDD          X56
     C                   END
     C     DATFMT        IFEQ      'CMD'
     C     DATFMT        OREQ      'DMC'
     C     DATFMT        OREQ      'MDC'
     C                   Z-ADD     X1CDAT        NRSLT
     C                   ELSE
     C                   Z-ADD     X1DATE        NRSLT
     C                   END
     C*
     C     DATFMT        IFEQ      'JUL'
     C     DATFMT        OREQ      'CJL'
     C* Get totol number of dayd in a year.
     C                   MOVEL     SVCC          SVCY
     C                   MOVE      SVYY          SVCY
     C*
     C* Assign default to century.
     C     SVCC          IFEQ      *ZERO
     C                   Z-ADD     19            SVCC
     C                   MOVEL     19            SVCY
     C                   END
     C*
     C* If year is 1900, 2100, 2200 then it's not a leap year.
     C* If year is 2000, 2400, 2800 then it's a leap year.
     C     SVYY          IFEQ      0
     C     SVCC          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   ELSE
     C* Check for leap year.
     C     SVYY          DIV       4             X12
     C                   MVR                     SVLEAP
     C                   END
     C* Setup month of FEB and validate date.
     C     SVLEAP        IFEQ      0
     C                   Z-ADD     29            FEB
     C                   ELSE
     C                   Z-ADD     28            FEB
     C                   END
     C*
     C                   Z-ADD     0             SVDAYS
     C                   Z-ADD     1             C1
     C     C1            DOWLT     SVMM
     C* Jan, mar, may, jul, aug, oct, or dec.
     C     C1            IFEQ      1
     C     C1            OREQ      3
     C     C1            OREQ      5
     C     C1            OREQ      7
     C     C1            OREQ      8
     C     C1            OREQ      10
     C     C1            OREQ      12
     C                   ADD       31            SVDAYS
     C                   END
     C* apr, jun, sept, or nov.
     C     C1            IFEQ      4
     C     C1            OREQ      6
     C     C1            OREQ      9
     C     C1            OREQ      11
     C                   ADD       30            SVDAYS
     C                   END
     C* feb
     C     C1            IFEQ      2
     C                   ADD       FEB           SVDAYS
     C                   END
     C*
     C                   ADD       1             C1
     C                   END
     C**
     C                   ADD       SVDD          SVDAYS
     C     DATFMT        IFEQ      'JUL'
     C     SVYY          MULT      1000          NRSLT
     C                   ELSE
     C     SVCY          MULT      1000          NRSLT
     C                   END
     C                   ADD       SVDAYS        NRSLT
     C                   END
     C*
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
     C* S016   - GETREC D.COMPANY,*EQ,COYNO#
     C**************************************************************************
     C     S016          BEGSR
     C                   Z-ADD     8             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01
     C                   MOVEL     COYNO#        KYCO01
     C     K0001         CHAIN     COMPANY                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD08                         RD.SW.COMPANY   IMSC
     C                   ELSE
     C                   MOVE      'Y'           SWRD08                         RD.SW.COMPANY   IMSC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0029        KYCO01
     C     K0001         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.IMSCPYD   IMST
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.IMSCPYD   IMST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   Z-ADD     10            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KYCO01                         Company number
     C                   MOVEL     RN0035        KYCO01
     C                   MOVEL     *BLANK        KDTR02
     C                   MOVEL     CDTRNP        KDTR02
     C     K0002         CHAIN     IMSTRN                             9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD10                         RD.SW.IMSTRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD10                         RD.SW.IMSTRN
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   ADD       1             WGETR                          INCREMENT CNTR
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S017   - GETREC D.imscpyd,f.imscpyd,*EQ,COYNO#
     C**************************************************************************
     C     S017          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0003         CHAIN     IMSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD09                         RD.SW.IMSCPYD
     C                   Z-ADD     *ZERO         HRC09                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD09                         RD.SW.IMSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S018   - SETLL D.PORENT,F.PORDH,SVK001
     C**************************************************************************
     C     S018          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   MOVE      'N'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0015                         Company number
     C                   MOVEL     *LOVAL        HD0016                         Purchase Order Numbe
     C*
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     SVK001        HD0015                         Company number
     C                   MOVEL     SVK001        RN0088                         Company number
     C*
     C     K0004         SETLL     PORDH                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S019   - SETLL D.PORENT,F.PORDH,SVK001,SVK002
     C**************************************************************************
     C     S019          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   MOVE      'N'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   MOVEL     *LOVAL        HD0015                         Company number
     C                   MOVEL     *LOVAL        HD0016                         Purchase Order Numbe
     C*
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     SVK001        HD0015                         Company number
     C                   MOVEL     SVK001        RN0088                         Company number
     C                   MOVEL     SVK002        KHPO02
     C                   MOVEL     SVK002        HD0016                         Purchase Order Numbe
     C                   MOVEL     SVK002        PHPORD                         Purchase Order Numbe
     C*
     C     K0005         SETLL     PORDH                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS02                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S020   - GETREC D.PORENT,F.PORDH,*lock,*eq,SVK001,SVK002
     C**************************************************************************
     C     S020          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK002        KHPO02
     C     K0005         CHAIN     PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S021   - GETREC D.PORENT,F.PORDH,*eq,SVK001,SVK002
     C**************************************************************************
     C     S021          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK002        KHPO02
     C     K0005         CHAIN(N)  PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S022   - CLRSCR SETSPEC
     C**************************************************************************
     C     S022          BEGSR
     C                   MOVEL     *BLANK        XHOS04                         INZ XHOS04
     C                   MOVEL     *BLANK        XHOS06                         INZ XHOS06
     C                   MOVEL     *BLANK        XHOS07                         INZ XHOS07
     C                   MOVEL     *BLANK        XHOS09                         INZ XHOS09
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S023   - GETREC D.PORENT,F.ipswadd,*eq,COYNO#,phwhse
     C**************************************************************************
     C     S023          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KOWH02
     C                   MOVEL     XHWHSE        KOWH02
     C     K0006         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S024   - GETREC D.PORENT,F.suplier,*eq,COYNO#,phsuppn,phbrnbr
     C**************************************************************************
     C     S024          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHSU02
     C                   MOVEL     WK0052        KHSU02
     C                   MOVEL     *BLANK        KHBR03
     C                   MOVEL     WK0035        KHBR03
     C     K0007         CHAIN     SUPLIER                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S025   - DELETE D.PORENT,F.PORDH
     C**************************************************************************
     C     S025          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS02
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0038        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XHPORD        KHPO02
     C     K0005         SETLL     PORDH                                        SETLL  PORDH
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - PORDH
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0005         READE     PORDH                                9190    READE  PORDH
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PORDH                                91      DELETE PORDH
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
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
     C     K0005         SETLL     PORDH                                        RESUME FILE POINTER
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S026   - SETLL D.PORENT,F.IPSTXTH,SVK003,SVK004,SVK005
     C**************************************************************************
     C     S026          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *LOVAL        HHSEQ                          Sequence
     C*
     C                   MOVEL     SVK003        KHCO01
     C                   MOVEL     SVK003        HD0010                         Company number
     C                   MOVEL     SVK003        RN0063                         Company number
     C                   MOVEL     SVK004        KHPO02
     C                   MOVEL     SVK004        HHPORD                         P.O. Number
     C                   MOVEL     SVK004        THPORD                         P.O. Number
     C                   Z-ADD     SVK005        KHSE03
     C                   Z-ADD     SVK005        HHSEQ                          Sequence
     C                   Z-ADD     SVK005        THSEQ                          Sequence
     C*
     C     K0008         SETLL     IPSTXTH                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS11                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S027   - SETLL D.PORENT,F.PORDD,SVK006,SVK007,SVK008
     C**************************************************************************
     C     S027          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     SVK006        HD0014                         Company number
     C                   MOVEL     SVK006        RN0077                         Company number
     C                   MOVEL     SVK007        KHPO02
     C                   MOVEL     SVK007        HOPORD                         Purchase Order Numbe
     C                   MOVEL     SVK007        POPORD                         Purchase Order Numbe
     C                   Z-ADD     SVK008        KOSE03
     C                   Z-ADD     SVK008        HOSEQ                          Sequence
     C                   Z-ADD     SVK008        POSEQ                          Sequence
     C*
     C     K0009         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S028   - GETREC D.IPSCPYD,F.IPSCPYD,*EQ,COYNO#
     C**************************************************************************
     C     S028          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0003         CHAIN(N)  IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S029   - GETREC D.PORENT,F.PORDh,*eq,pocoyno,popord
     C**************************************************************************
     C     S029          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0029        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XOPORD        KHPO02
     C     K0005         CHAIN(N)  PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S030   - GETREC D.PORENT,F.PORDD,*lock,*eq,SVK006,SVK007,SVK008
     C**************************************************************************
     C     S030          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK007        KHPO02
     C                   Z-ADD     SVK008        KOSE03
     C     K0009         CHAIN     PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S031   - GETREC D.PORENT,F.PORDD,*eq,SVK006,SVK007,SVK008
     C**************************************************************************
     C     S031          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK007        KHPO02
     C                   Z-ADD     SVK008        KOSE03
     C     K0009         CHAIN(N)  PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S032   - DELETE D.PORENT,F.PORDD
     C**************************************************************************
     C     S032          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS03
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     WK0029        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XOPORD        KHPO02
     C                   Z-ADD     XOSEQ         KOSE03
     C     K0009         SETLL     PORDD                                        SETLL  PORDD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - PORDD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0009         READE     PORDD                                9190    READE  PORDD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    PORDD                                91      DELETE PORDD
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
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
     C     K0009         SETLL     PORDD                                        RESUME FILE POINTER
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S033   - GETREC D.PORENT,F.WAREDET,*EQ,COYNO#,POWHSE,POITEM
     C**************************************************************************
     C     S033          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KOWH02
     C                   MOVEL     XOWHSE        KOWH02
     C                   MOVEL     *BLANK        KOIT03
     C                   MOVEL     XOITEM        KOIT03
     C     K0010         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREDET   IPST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S034   - UPDATE D.PORENT,f.waredet
     C**************************************************************************
     C     S034          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company Number
     C                   MOVEL     HD0022        KHCO01
     C                   MOVEL     *BLANK        KOWH02                         Warehouse Number
     C                   MOVEL     HD0023        KOWH02
     C                   MOVEL     *BLANK        KOIT03                         Item Number
     C                   MOVEL     HDITEM        KOIT03
     C     K0010         CHAIN     WAREDET                            9091      CHAIN  WAREDET
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     WDQOO         IFEQ      WK0070
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   ELSE
     C*
     C                   EXSR      S035                                         Refer.Integrity chk.
     C     RIERR         IFEQ      'N'
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WDETAILF                             90      UPDATE WAREDET
     C                   ELSE
     C                   UNLOCK    WAREDET                              91      RLS LCK WAREDET
     C                   MOVE      '1'           *IN90
     C                   MOVE      *HIVAL        STS04
     C                   END
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
     C* S035   - Referential Integrity Check (Update) For File WAREDET
     C**************************************************************************
     C     S035          BEGSR
     C                   MOVE      'N'           RIERR                          INIT CHECK FLAG
     C*
     C     $035          ENDSR
     C/EJECT
     C**************************************************************************
     C* S036   - GETREC D.IPSITEM,F.IPSITEM,*EQ,COYNO#,PHSUPPN,PHBRNBR,POITEM
     C**************************************************************************
     C     S036          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     COYNO#        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     WK0052        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0035        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     XOITEM        KIIT04
     C     K0011         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S037   - GETREC D.PORENT,F.IPSWADD,*EQ,COYNO#,POWHSE
     C**************************************************************************
     C     S037          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KOWH02
     C                   MOVEL     XOWHSE        KOWH02
     C     K0006         CHAIN     IPSWADD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S038   - WRITE d.poDTALT,f.podtalt
     C**************************************************************************
     C     S038          BEGSR
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   Z-ADD     18            WFILE#                         SET FILE#
     C                   WRITE     FMT001                               90      ADD REC TO PODTALT
     C                   Z-ADD     STS18         STS15                          SYNC STATUS
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   Z-ADD     REC18         REC15
     C                   Z-ADD     15            WFILE#                         SET FILE#
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S039   - UPDATE D.PORENT,F.PORDD
     C**************************************************************************
     C     S039          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0014        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     HOPORD        KHPO02
     C                   Z-ADD     HOSEQ         KOSE03                         Sequence
     C     K0009         CHAIN     PORDD                              9091      CHAIN  PORDD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     POCCDE        IFEQ      WOCCDE
     C     POCONV        ANDEQ     WOCONV
     C     RN0077        ANDEQ     WK0029
     C     RN0078        ANDEQ     WK0030
     C     RN0079        ANDEQ     WK0031
     C     POITEM        ANDEQ     XOITEM
     C     RN0080        ANDEQ     WK0032
     C     POPCDE        ANDEQ     WOPCDE
     C     POPORD        ANDEQ     XOPORD
     C     RN0081        ANDEQ     WK0033
     C     POQORD        ANDEQ     XOQORD
     C     RN0082        ANDEQ     WK0034
     C     POSEQ         ANDEQ     XOSEQ
     C     POUOM         ANDEQ     XOUOM
     C     POWHSE        ANDEQ     XOWHSE
     C                   UNLOCK    PORDD                                91      RLS LCK PORDD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDDF                               90      UPDATE PORDD
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
     C* S040   - WRITE D.PORENT,F.PORDD
     C**************************************************************************
     C     S040          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0029        KHCO01                         INITIALIZE KHCO01
     C                   MOVEL     XOPORD        KHPO02                         INITIALIZE KHPO02
     C                   Z-ADD     *HIVAL        KOSE03                         INITIALIZE KOSE03
     C     K0009         SETGT     PORDD
     C                   READP(N)  PORDD                                9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0077        ANDEQ     KHCO01                                       Company number
     C     POPORD        ANDEQ     KHPO02                                       Purchase Order Numbe
     C     POSEQ         ADD       1             XOSEQ                          Sequence
     C                   ELSE
     C                   Z-ADD     1             XOSEQ
     C                   END
     C*
     C                   Z-ADD     *ZERO         RN0083                         Received this cycle
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     PORDDF                               90      ADD REC TO PORDD
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S041   - GETREC d.PORENT,f.itmmast,*eq,COYNO#,poitem
     C**************************************************************************
     C     S041          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KOIT02
     C                   MOVEL     XOITEM        KOIT02
     C     K0012         CHAIN     ITMMAST                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S042   - GETREC D.PORENT,F.UOM,*eq,COYNO#,POUOM
     C**************************************************************************
     C     S042          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KOUO02
     C                   MOVEL     XOUOM         KOUO02
     C     K0013         CHAIN     UOM                                9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S043   - GETREC D.WAREHED,F.WRITTYP,*EQ,POCOYNO,POWHSE,POITEM,CDTRNP
     C**************************************************************************
     C     S043          BEGSR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02
     C                   MOVEL     WK0029        KHCO02
     C                   MOVEL     *BLANK        KHWH03
     C                   MOVEL     XOWHSE        KHWH03
     C                   MOVEL     *BLANK        KDIT04
     C                   MOVEL     XOITEM        KDIT04
     C                   MOVEL     *BLANK        KTTR05
     C                   MOVEL     WDTRNP        KTTR05
     C     K0014         CHAIN(N)  WRITTYP                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   Z-ADD     *ZERO         HRC16                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD16                         RD.SW.WRITTYP   WLOC
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S044   - UPDATE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S044          BEGSR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO02                         Company number
     C                   MOVEL     HD0024        KHCO02
     C                   MOVEL     *BLANK        KHWH03                         Warehouse Number
     C                   MOVEL     HTWHSE        KHWH03
     C                   MOVEL     *BLANK        KDIT04                         Item Number
     C                   MOVEL     HD0025        KDIT04
     C                   MOVEL     *BLANK        KTTR05                         Transaction Type
     C                   MOVEL     HD0026        KTTR05
     C     K0014         CHAIN     WRITTYP                            9091      CHAIN  WRITTYP
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0125        IFEQ      WK0071
     C     WTITEM        ANDEQ     WK0072
     C     WTTRNC        ANDEQ     WK0073
     C     WTTRPQ        ANDEQ     WK0074
     C     WTTRPV        ANDEQ     WK0075
     C     WTTRYQ        ANDEQ     WK0076
     C     WTTRYV        ANDEQ     WK0077
     C     WTWHSE        ANDEQ     WK0078
     C                   UNLOCK    WRITTYP                              91      RLS LCK WRITTYP
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    WRITTYPF                             90      UPDATE WRITTYP
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
     C* S045   - WRITE D.WAREHED,F.WRITTYP
     C**************************************************************************
     C     S045          BEGSR
     C                   Z-ADD     16            WFILE#                         SET FILE#
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     WRITTYPF                             90      ADD REC TO WRITTYP
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S046   - SETLL D.PORENT,F.IPSTXTD,SVK009,SVK010,SVK011,SVK012
     C**************************************************************************
     C     S046          BEGSR
     C                   Z-ADD     9             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *LOVAL        HDSEQ                          Sequence
     C*
     C                   MOVEL     SVK009        KHCO01
     C                   MOVEL     SVK009        HD0008                         Company number
     C                   MOVEL     SVK009        RN0061                         Company number
     C                   MOVEL     SVK010        KHPO02
     C                   MOVEL     SVK010        HDPORD                         P.O. Number
     C                   MOVEL     SVK010        TDPORD                         P.O. Number
     C                   Z-ADD     SVK011        KOSE03
     C                   Z-ADD     SVK011        HD0009                         Purchase order line
     C                   Z-ADD     SVK011        RN0062                         Purchase order line
     C                   Z-ADD     SVK012        KDSE04
     C                   Z-ADD     SVK012        HDSEQ                          Sequence
     C                   Z-ADD     SVK012        TDSEQ                          Sequence
     C*
     C     K0015         SETLL     IPSTXTD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS17                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S047   - CLRSCR SCRADD
     C**************************************************************************
     C     S047          BEGSR
     C                   MOVEL     *BLANK        XYDESC                         INZ XYDESC
     C                   MOVEL     *BLANK        XHPORD                         INZ XHPORD
     C                   MOVEL     *BLANK        XHWHSE                         INZ XHWHSE
     C                   MOVEL     *BLANK        WK0035                         INZ WK0035
     C                   MOVEL     *BLANK        WK0052                         INZ WK0052
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S048   - GETREC d.userdef,f.userdef,*eq,COYNO#,user
     C**************************************************************************
     C     S048          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO02
     C                   MOVEL     COYNO#        KDCO02
     C                   MOVEL     *BLANK        KDUS03
     C                   MOVEL     RN0020        KDUS03
     C     K0016         CHAIN     USERDEF                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD07                         RD.SW.USERDEF
     C                   Z-ADD     *ZERO         HRC07                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD07                         RD.SW.USERDEF
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S049   - GETREC d.porent,f.pordh,*eq,COYNO#,phpord
     C**************************************************************************
     C     S049          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XHPORD        KHPO02
     C     K0005         CHAIN(N)  PORDH                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S050   - SETLL d.PORENT,f.pordd,COYNO#,phpord
     C**************************************************************************
     C     S050          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     COYNO#        HD0014                         Company number
     C                   MOVEL     COYNO#        RN0077                         Company number
     C                   MOVEL     XHPORD        KHPO02
     C                   MOVEL     XHPORD        HOPORD                         Purchase Order Numbe
     C                   MOVEL     XHPORD        POPORD                         Purchase Order Numbe
     C*
     C     K0005         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S051   - GETREC D.PORENT,F.pordd,*ne,COYNO#,phpord
     C**************************************************************************
     C     S051          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XHPORD        KHPO02
     C     K0005         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S052                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S052   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S052          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0077        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KHPO02
     C     K0005         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S053   - UPDATE d.PORENT,f.pordh
     C**************************************************************************
     C     S053          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     HD0015        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     HD0016        KHPO02
     C     K0005         CHAIN     PORDH                              9091      CHAIN  PORDH
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0084        IFEQ      WK0035
     C     RN0085        ANDEQ     WK0036
     C     RN0087        ANDEQ     WK0037
     C     RN0088        ANDEQ     WK0038
     C     RN0089        ANDEQ     WK0039
     C     RN0090        ANDEQ     WK0040
     C     RN0091        ANDEQ     WK0041
     C     RN0093        ANDEQ     WK0042
     C     PHOS01        ANDEQ     WHOS01
     C     PHOS02        ANDEQ     WHOS02
     C     PHOS03        ANDEQ     WHOS03
     C     PHOS04        ANDEQ     XHOS04
     C     PHOS05        ANDEQ     WHOS05
     C     PHOS06        ANDEQ     XHOS06
     C     PHOS07        ANDEQ     XHOS07
     C     PHOS08        ANDEQ     WHOS08
     C     PHOS09        ANDEQ     XHOS09
     C     PHOS10        ANDEQ     WHOS10
     C     PHOS11        ANDEQ     WHOS11
     C     PHPORD        ANDEQ     XHPORD
     C     RN0096        ANDEQ     WK0043
     C     RN0097        ANDEQ     WK0044
     C     RN0098        ANDEQ     WK0045
     C     RN0099        ANDEQ     WK0046
     C     RN0100        ANDEQ     WK0047
     C     RN0101        ANDEQ     WK0048
     C     RN0102        ANDEQ     WK0049
     C     RN0103        ANDEQ     WK0050
     C     RN0104        ANDEQ     WK0051
     C     RN0105        ANDEQ     WK0052
     C     PHWHSE        ANDEQ     XHWHSE
     C     RN0106        ANDEQ     WK0053
     C     RN0107        ANDEQ     WK0054
     C     RN0108        ANDEQ     WK0055
     C     RN0109        ANDEQ     WK0056
     C     RN0110        ANDEQ     WK0057
     C     RN0111        ANDEQ     WK0058
     C     RN0112        ANDEQ     WK0059
     C     RN0113        ANDEQ     WK0060
     C                   UNLOCK    PORDH                                91      RLS LCK PORDH
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    PORDHF                               90      UPDATE PORDH
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
     C* S054   - GETREC d.PORENT,F.PORDD,*EQ,COYNO#,phpord
     C**************************************************************************
     C     S054          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     COYNO#        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     XHPORD        KHPO02
     C     K0005         CHAIN(N)  PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S055   - GETREC d.IPSITEM,*eq,COYNO#,poitem,phsuppn,phbrnbr
     C**************************************************************************
     C     S055          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO01
     C                   MOVEL     COYNO#        KICO01
     C                   MOVEL     *BLANK        KISU02
     C                   MOVEL     XOITEM        KISU02
     C                   MOVEL     *BLANK        KIBR03
     C                   MOVEL     WK0052        KIBR03
     C                   MOVEL     *BLANK        KIIT04
     C                   MOVEL     WK0035        KIIT04
     C     K0011         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S056   - SETLL D.PORENT,F.PORDD,SVK006,SVK007
     C**************************************************************************
     C     S056          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *LOVAL        HOSEQ                          Sequence
     C*
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     SVK006        HD0014                         Company number
     C                   MOVEL     SVK006        RN0077                         Company number
     C                   MOVEL     SVK007        KHPO02
     C                   MOVEL     SVK007        HOPORD                         Purchase Order Numbe
     C                   MOVEL     SVK007        POPORD                         Purchase Order Numbe
     C*
     C     K0005         SETLL     PORDD                                  90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS03                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S057   - GETREC D.PORENT,F.PORDD,*NE,SVK006,SVK007
     C**************************************************************************
     C     S057          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KHPO02
     C                   MOVEL     SVK007        KHPO02
     C     K0005         READE(N)  PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S058                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S058   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S058          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0077        KHCO01
     C                   MOVEL     *BLANK        KHPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KHPO02
     C     K0005         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S059   - GETREC D.PORENT,F.WAREDET,*EQ,SVK006,POWHSE,POITEM
     C**************************************************************************
     C     S059          BEGSR
     C                   Z-ADD     4             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK006        KHCO01
     C                   MOVEL     *BLANK        KOWH02
     C                   MOVEL     XOWHSE        KOWH02
     C                   MOVEL     *BLANK        KOIT03
     C                   MOVEL     XOITEM        KOIT03
     C     K0010         CHAIN(N)  WAREDET                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   Z-ADD     *ZERO         HRC04                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD04                         RD.SW.WAREDET   IPST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S060   - GETREC D.IPSCPYD,F.IPSCPYD,*LOCK,*EQ,COYNO#
     C**************************************************************************
     C     S060          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01
     C                   MOVEL     COYNO#        KDCO01
     C     K0003         CHAIN     IPSCPYD                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C                   MOVE      'N'           SWRD01                         RD.SW.IPSCPYD
     C                   Z-ADD     *ZERO         HRC01                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD01                         RD.SW.IPSCPYD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S061   - UPDATE d.ipscpyd,f.ipscpyd
     C**************************************************************************
     C     S061          BEGSR
     C                   Z-ADD     1             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO01                         Company number
     C                   MOVEL     HD0004        KDCO01
     C     K0003         CHAIN     IPSCPYD                            9091      CHAIN  IPSCPYD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0040        IFEQ      WK0002
     C     RN0041        ANDEQ     WK0003
     C     RN0042        ANDEQ     WK0004
     C     RN0043        ANDEQ     WK0005
     C     RN0044        ANDEQ     WK0006
     C     CDCGAS        ANDEQ     WDCGAS
     C     RN0045        ANDEQ     WK0007
     C     CDIMS         ANDEQ     WDIMS
     C     CDPORD        ANDEQ     WDPORD
     C     CDPURL        ANDEQ     WDPURL
     C     CDPURO        ANDEQ     WDPURO
     C                   UNLOCK    IPSCPYD                              91      RLS LCK IPSCPYD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSCPYDF                             90      UPDATE IPSCPYD
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
     C* S062   - WRITE D.PORENT,F.PORDH
     C**************************************************************************
     C     S062          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   Z-ADD     *ZERO         RN0086                         Completed Date
     C                   Z-ADD     *ZERO         RN0092                         Last Receipt Date
     C                   Z-ADD     *ZERO         RN0094                         Purchase oprders pri
     C                   Z-ADD     *ZERO         PHOPNL                         Open Lines on order
     C                   Z-ADD     *ZERO         RN0095                         Receiving list|Audit
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     PORDHF                               90      ADD REC TO PORDH
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S063   - GETBLK D.PORENT,F.PORDH,*PV,SVK001
     C**************************************************************************
     C     S063          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO01
     C                   MOVEL     SVK001        KHCO01
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
     C     SWRD02        DOUNE     'Y'                                          RD.SW.PORDH     SUPL
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C     K0004         READPE(N) PORDH                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     *ZERO         HRC02                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0015                         Company number
     C                   MOVEL     *BLANK        HD0016                         Purchase Order Numbe
     C                   ELSE
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   END
     C*
     C     SWRD02        IFEQ      'Y'                                          RD.SW.PORDH     SUPL
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S064                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S064   - Process To Reset File Pointer(BOF) - PORDH
     C**************************************************************************
     C     S064          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDH     SUPL
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0088        KHCO01
     C     K0004         SETLL     PORDH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S065   - Process To Reset File Pointer(EOF) - PORDH
     C**************************************************************************
     C     S065          BEGSR
     C*
     C     SWRD02        IFNE      'Y'                                          RD.SW.PORDH     SUPL
     C     STS02         ANDNE     1122                                         RCD LOCK
     C     STS02         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD02                         RD.SW.PORDH     SUPL
     C                   Z-ADD     STS02         SVS02                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO01                         Company number
     C                   MOVEL     RN0088        KHCO01
     C     K0004         SETGT     PORDH
     C                   Z-ADD     SVS02         STS02                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ01
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ01
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN01        WADJ01
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S066   - GETBLK D.PORENT,F.IPSTXTH,*PV,SVK003,SVK004
     C**************************************************************************
     C     S066          BEGSR
     C*
     C                   MOVEL     *BLANK        KHCO03
     C                   MOVEL     SVK003        KHCO03
     C                   MOVEL     *BLANK        KHPO04
     C                   MOVEL     SVK004        KHPO04
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
     C     SWRD11        DOUNE     'Y'                                          RD.SW.IPSTXTH   PORD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C     K0017         READPE(N) IPSTXTH                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   Z-ADD     *ZERO         HRC11                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0010                         Company number
     C                   MOVEL     *BLANK        HHPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HHSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   END
     C*
     C     SWRD11        IFEQ      'Y'                                          RD.SW.IPSTXTH   PORD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S067                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S067   - Process To Reset File Pointer(BOF) - IPSTXTH
     C**************************************************************************
     C     S067          BEGSR
     C*
     C     SWRD11        IFNE      'Y'                                          RD.SW.IPSTXTH   PORD
     C     STS11         ANDNE     1122                                         RCD LOCK
     C     STS11         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   Z-ADD     STS11         SVS11                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO03                         Company number
     C                   MOVEL     RN0063        KHCO03
     C                   MOVEL     *BLANK        KHPO04                         P.O. Number
     C                   MOVEL     THPORD        KHPO04
     C     K0017         SETLL     IPSTXTH
     C                   Z-ADD     SVS11         STS11                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S068   - Process To Reset File Pointer(EOF) - IPSTXTH
     C**************************************************************************
     C     S068          BEGSR
     C*
     C     SWRD11        IFNE      'Y'                                          RD.SW.IPSTXTH   PORD
     C     STS11         ANDNE     1122                                         RCD LOCK
     C     STS11         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   Z-ADD     STS11         SVS11                          SAVE FILE STS
     C                   MOVEL     *BLANK        KHCO03                         Company number
     C                   MOVEL     RN0063        KHCO03
     C                   MOVEL     *BLANK        KHPO04                         P.O. Number
     C                   MOVEL     THPORD        KHPO04
     C     K0017         SETGT     IPSTXTH
     C                   Z-ADD     SVS11         STS11                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ02
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ02
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN02        WADJ02
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S069   - WRITE D.PORENT,F.IPSTXTH
     C**************************************************************************
     C     S069          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0015        KHCO01                         INITIALIZE KHCO01
     C                   MOVEL     WHPORD        KHPO02                         INITIALIZE KHPO02
     C                   Z-ADD     *HIVAL        KHSE03                         INITIALIZE KHSE03
     C     K0008         SETGT     IPSTXTH
     C                   READP(N)  IPSTXTH                              9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0063        ANDEQ     KHCO01                                       Company number
     C     THPORD        ANDEQ     KHPO02                                       P.O. Number
     C     THSEQ         ADD       1             XHSEQ                          Sequence
     C                   ELSE
     C                   Z-ADD     1             XHSEQ
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     IPSTXTHF                             90      ADD REC TO IPSTXTH
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S070   - UPDATE D.PORENT,F.IPSTXTH
     C**************************************************************************
     C     S070          BEGSR
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KHCO03                         Company number
     C                   MOVEL     HD0010        KHCO03
     C                   MOVEL     *BLANK        KHPO04                         P.O. Number
     C                   MOVEL     HHPORD        KHPO04
     C                   Z-ADD     HHSEQ         KHSE05                         Sequence
     C     K0018         CHAIN     IPSTXTH                            9091      CHAIN  IPSTXTH
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0063        IFEQ      WK0015
     C     THPORD        ANDEQ     WHPORD
     C     THSEQ         ANDEQ     XHSEQ
     C     THTCDE        ANDEQ     XHTCDE
     C     THTEXT        ANDEQ     XHTEXT
     C                   UNLOCK    IPSTXTH                              91      RLS LCK IPSTXTH
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSTXTHF                             90      UPDATE IPSTXTH
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
     C* S071   - DELETE D.PORENT,F.IPSTXTH
     C**************************************************************************
     C     S071          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS11
     C                   MOVEL     *BLANK        KHCO03
     C                   MOVEL     WK0015        KHCO03
     C                   MOVEL     *BLANK        KHPO04
     C                   MOVEL     WHPORD        KHPO04
     C                   Z-ADD     XHSEQ         KHSE05
     C     K0018         SETLL     IPSTXTH                                      SETLL  IPSTXTH
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - IPSTXTH
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     11            WFILE#                         SET FILE#
     C     K0018         READE     IPSTXTH                              9190    READE  IPSTXTH
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    IPSTXTH                              91      DELETE IPSTXTH
     C                   Z-ADD     STS11         SVS11                          SAVE FILE STS
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
     C     K0018         SETLL     IPSTXTH                                      RESUME FILE POINTER
     C                   Z-ADD     SVS11         STS11                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S072   - GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     C**************************************************************************
     C     S072          BEGSR
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
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
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READPE(N) PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S073                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S073   - Process To Reset File Pointer(BOF) - PORDD
     C**************************************************************************
     C     S073          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0077        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0019         SETLL     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S074   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S074          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0077        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0019         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ03
     C     WCNTR         IFNE      *ZERO
     C                   ADD       6             WADJ03
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN03        WADJ03
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S075   - GETREC D.IPSITEM,F.IPSITEM,*EQ,SVK006,PHSUPPN,PHBRNBR,POITEM
     C**************************************************************************
     C     S075          BEGSR
     C                   Z-ADD     12            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KICO02
     C                   MOVEL     SVK006        KICO02
     C                   MOVEL     *BLANK        KISU03
     C                   MOVEL     WK0052        KISU03
     C                   MOVEL     *BLANK        KIBR04
     C                   MOVEL     WK0035        KIBR04
     C                   MOVEL     *BLANK        KIIT05
     C                   MOVEL     XOITEM        KIIT05
     C     K0020         CHAIN     IPSITEM                            9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD12                         RD.SW.IPSITEM
     C                   Z-ADD     *ZERO         HRC12                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD12                         RD.SW.IPSITEM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S076   - GETREC D.PORENT,F.PORDD,*EQ,POCOYNO,POPORD,POSEQ
     C**************************************************************************
     C     S076          BEGSR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     WK0029        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     XOPORD        KOPO02
     C                   Z-ADD     XOSEQ         KOSE03
     C     K0021         CHAIN(N)  PORDD                              9091
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S077   - GETBLK D.PORENT,F.IPSTXTD,*PV,SVK009,SVK010,SVK011
     C**************************************************************************
     C     S077          BEGSR
     C*
     C                   MOVEL     *BLANK        KDCO03
     C                   MOVEL     SVK009        KDCO03
     C                   MOVEL     *BLANK        KDPO04
     C                   MOVEL     SVK010        KDPO04
     C                   Z-ADD     SVK011        KDPO05
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
     C     SWRD17        DOUNE     'Y'                                          RD.SW.IPSTXTD
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0022         READPE(N) IPSTXTD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     *ZERO         HRC17                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0008                         Company number
     C                   MOVEL     *BLANK        HDPORD                         P.O. Number
     C                   Z-ADD     *ZERO         HD0009                         Purchase order line
     C                   Z-ADD     *ZERO         HDSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   END
     C*
     C     SWRD17        IFEQ      'Y'                                          RD.SW.IPSTXTD
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S078                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S078   - Process To Reset File Pointer(BOF) - IPSTXTD
     C**************************************************************************
     C     S078          BEGSR
     C*
     C     SWRD17        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS17         ANDNE     1122                                         RCD LOCK
     C     STS17         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO03                         Company number
     C                   MOVEL     RN0061        KDCO03
     C                   MOVEL     *BLANK        KDPO04                         P.O. Number
     C                   MOVEL     TDPORD        KDPO04
     C                   Z-ADD     RN0062        KDPO05                         Purchase order line
     C     K0022         SETLL     IPSTXTD
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S079   - Process To Reset File Pointer(EOF) - IPSTXTD
     C**************************************************************************
     C     S079          BEGSR
     C*
     C     SWRD17        IFNE      'Y'                                          RD.SW.IPSTXTD
     C     STS17         ANDNE     1122                                         RCD LOCK
     C     STS17         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD17                         RD.SW.IPSTXTD
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO03                         Company number
     C                   MOVEL     RN0061        KDCO03
     C                   MOVEL     *BLANK        KDPO04                         P.O. Number
     C                   MOVEL     TDPORD        KDPO04
     C                   Z-ADD     RN0062        KDPO05                         Purchase order line
     C     K0022         SETGT     IPSTXTD
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ04
     C     WCNTR         IFNE      *ZERO
     C                   ADD       12            WADJ04
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN04        WADJ04
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S080   - WRITE D.PORENT,F.IPSTXTD
     C**************************************************************************
     C     S080          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C*          ---------------------------------------------------------------
     C*          | Auto Increment
     C*          ---------------------------------------------------------------
     C                   MOVEL     WK0012        KHCO01                         INITIALIZE KHCO01
     C                   MOVEL     WK0013        KHPO02                         INITIALIZE KHPO02
     C                   Z-ADD     WK0014        KOSE03                         INITIALIZE KOSE03
     C                   Z-ADD     *HIVAL        KDSE04                         INITIALIZE KDSE04
     C     K0015         SETGT     IPSTXTD
     C                   READP(N)  IPSTXTD                              9190
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C     RN0061        ANDEQ     KHCO01                                       Company number
     C     TDPORD        ANDEQ     KHPO02                                       P.O. Number
     C     RN0062        ANDEQ     KOSE03                                       Purchase order line
     C     TDSEQ         ADD       1             XDSEQ                          Sequence
     C                   ELSE
     C                   Z-ADD     1             XDSEQ
     C                   END
     C*
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   WRITE     IPSTXTDF                             90      ADD REC TO IPSTXTD
     C*
     C     *IN90         IFEQ      *ZERO                                        RECORD ADDED
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ELSE
     C                   END                                                    END-STATUS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S081   - UPDATE D.PORENT,F.IPSTXTD
     C**************************************************************************
     C     S081          BEGSR
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO03                         Company number
     C                   MOVEL     HD0008        KDCO03
     C                   MOVEL     *BLANK        KDPO04                         P.O. Number
     C                   MOVEL     HDPORD        KDPO04
     C                   Z-ADD     HD0009        KDPO05                         Purchase order line
     C                   Z-ADD     HDSEQ         KDSE06                         Sequence
     C     K0023         CHAIN     IPSTXTD                            9091      CHAIN  IPSTXTD
     C*
     C     *IN91         IFEQ      '1'                                          RCK LOCK
     C                   MOVE      'Y'           MSGFLG                         SETON MSG FLAG
     C                   END
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C     RN0061        IFEQ      WK0012
     C     TDPORD        ANDEQ     WK0013
     C     RN0062        ANDEQ     WK0014
     C     TDSEQ         ANDEQ     XDSEQ
     C     TDTCDE        ANDEQ     XDTCDE
     C     TDTEXT        ANDEQ     XDTEXT
     C                   UNLOCK    IPSTXTD                              91      RLS LCK IPSTXTD
     C                   ELSE
     C                   EXSR      SMVTOF                                       MOVE FLD TO FILE
     C                   UPDATE    IPSTXTDF                             90      UPDATE IPSTXTD
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
     C* S082   - DELETE D.PORENT,F.IPSTXTD
     C**************************************************************************
     C     S082          BEGSR
     C                   MOVEA     '00'          *IN(90)
     C                   MOVE      *HIVAL        SVS17
     C                   MOVEL     *BLANK        KDCO03
     C                   MOVEL     WK0012        KDCO03
     C                   MOVEL     *BLANK        KDPO04
     C                   MOVEL     WK0013        KDPO04
     C                   Z-ADD     WK0014        KDPO05
     C                   Z-ADD     XDSEQ         KDSE06
     C     K0023         SETLL     IPSTXTD                                      SETLL  IPSTXTD
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Delete Record - IPSTXTD
     C*          ---------------------------------------------------------------
     C     *IN90         DOUEQ     '1'
     C     *IN91         OREQ      '1'
     C*
     C                   Z-ADD     17            WFILE#                         SET FILE#
     C     K0023         READE     IPSTXTD                              9190    READE  IPSTXTD
     C*
     C     *IN90         IFEQ      '0'
     C     *IN91         ANDEQ     '0'
     C*
     C                   DELETE    IPSTXTD                              91      DELETE IPSTXTD
     C                   Z-ADD     STS17         SVS17                          SAVE FILE STS
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
     C     K0023         SETLL     IPSTXTD                                      RESUME FILE POINTER
     C                   Z-ADD     SVS17         STS17                          RESTORE FILE STS
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S083   - SETLL D.PORENT,F.IPSWADD,SVK013,SVK08
     C**************************************************************************
     C     S083          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C*
     C                   MOVEL     SVK013        KDCO04
     C                   MOVEL     SVK013        HD0011                         Company number
     C                   MOVEL     SVK013        RN0065                         Company number
     C                   MOVEL     SVK08         KDWH05
     C                   MOVEL     SVK08         HDWHSE                         Warehouse Number
     C                   MOVEL     SVK08         PDWHSE                         Warehouse Number
     C*
     C     K0024         SETLL     IPSWADD                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS05                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S084   - GETREC D.PORENT,F.IPSWADD,*PV,SVK013
     C**************************************************************************
     C     S084          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO04
     C                   MOVEL     SVK013        KDCO04
     C     K0025         READPE    IPSWADD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S085                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S085   - Process To Reset File Pointer(BOF) - IPSWADD
     C**************************************************************************
     C     S085          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IPSWADD   ITMM
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO04                         Company number
     C                   MOVEL     RN0065        KDCO04
     C     K0025         SETLL     IPSWADD
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S086   - GETREC D.PORENT,F.IPSWADD,*NE,SVK013
     C**************************************************************************
     C     S086          BEGSR
     C                   Z-ADD     5             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KDCO04
     C                   MOVEL     SVK013        KDCO04
     C     K0025         READE     IPSWADD                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     *ZERO         HRC05                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S087                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S087   - Process To Reset File Pointer(EOF) - IPSWADD
     C**************************************************************************
     C     S087          BEGSR
     C*
     C     SWRD05        IFNE      'Y'                                          RD.SW.IPSWADD   ITMM
     C     STS05         ANDNE     1122                                         RCD LOCK
     C     STS05         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   Z-ADD     STS05         SVS05                          SAVE FILE STS
     C                   MOVEL     *BLANK        KDCO04                         Company number
     C                   MOVEL     RN0065        KDCO04
     C     K0025         SETGT     IPSWADD
     C                   Z-ADD     SVS05         STS05                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S088   - SETLL D.PORENT,F.ITMMAST,SVK015,SVK09
     C**************************************************************************
     C     S088          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C*
     C                   MOVEL     SVK015        KTCO01
     C                   MOVEL     SVK015        HD0012                         Company Number
     C                   MOVEL     SVK015        RN0069                         Company Number
     C                   MOVEL     SVK09         KTIT02
     C                   MOVEL     SVK09         HTITEM                         Item Number
     C                   MOVEL     SVK09         ITITEM                         Item Number
     C*
     C     K0026         SETLL     ITMMAST                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS13                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S089   - GETREC D.PORENT,F.ITMMAST,*PV,SVK015
     C**************************************************************************
     C     S089          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK015        KTCO01
     C     K0027         READPE    ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S090                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S090   - Process To Reset File Pointer(BOF) - ITMMAST
     C**************************************************************************
     C     S090          BEGSR
     C*
     C     SWRD13        IFNE      'Y'                                          RD.SW.ITMMAST   UOM
     C     STS13         ANDNE     1122                                         RCD LOCK
     C     STS13         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   Z-ADD     STS13         SVS13                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company Number
     C                   MOVEL     RN0069        KTCO01
     C     K0027         SETLL     ITMMAST
     C                   Z-ADD     SVS13         STS13                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S091   - GETREC D.PORENT,F.ITMMAST,*NE,SVK015
     C**************************************************************************
     C     S091          BEGSR
     C                   Z-ADD     13            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KTCO01
     C                   MOVEL     SVK015        KTCO01
     C     K0027         READE     ITMMAST                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   Z-ADD     *ZERO         HRC13                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S092                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S092   - Process To Reset File Pointer(EOF) - ITMMAST
     C**************************************************************************
     C     S092          BEGSR
     C*
     C     SWRD13        IFNE      'Y'                                          RD.SW.ITMMAST   UOM
     C     STS13         ANDNE     1122                                         RCD LOCK
     C     STS13         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   Z-ADD     STS13         SVS13                          SAVE FILE STS
     C                   MOVEL     *BLANK        KTCO01                         Company Number
     C                   MOVEL     RN0069        KTCO01
     C     K0027         SETGT     ITMMAST
     C                   Z-ADD     SVS13         STS13                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S093   - SETLL D.PORENT,F.UOM,SVK017,SVK10
     C**************************************************************************
     C     S093          BEGSR
     C                   Z-ADD     7             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C*
     C                   MOVEL     SVK017        KMCO01
     C                   MOVEL     SVK017        HD0020                         Company number
     C                   MOVEL     SVK017        RN0121                         Company number
     C                   MOVEL     SVK10         KMUO02
     C                   MOVEL     SVK10         HMUOM                          Unit of Measure
     C                   MOVEL     SVK10         UMUOM                          Unit of Measure
     C*
     C     K0028         SETLL     UOM                                    90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS14                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S094   - GETREC D.PORENT,F.UOM,*PV,SVK017
     C**************************************************************************
     C     S094          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KMCO01
     C                   MOVEL     SVK017        KMCO01
     C     K0029         READPE    UOM                                  9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S095                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S095   - Process To Reset File Pointer(BOF) - UOM
     C**************************************************************************
     C     S095          BEGSR
     C*
     C     SWRD14        IFNE      'Y'                                          RD.SW.UOM       WARE
     C     STS14         ANDNE     1122                                         RCD LOCK
     C     STS14         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   Z-ADD     STS14         SVS14                          SAVE FILE STS
     C                   MOVEL     *BLANK        KMCO01                         Company number
     C                   MOVEL     RN0121        KMCO01
     C     K0029         SETLL     UOM
     C                   Z-ADD     SVS14         STS14                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S096   - GETREC D.PORENT,F.UOM,*NE,SVK017
     C**************************************************************************
     C     S096          BEGSR
     C                   Z-ADD     14            WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KMCO01
     C                   MOVEL     SVK017        KMCO01
     C     K0029         READE     UOM                                  9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   Z-ADD     *ZERO         HRC14                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S097                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S097   - Process To Reset File Pointer(EOF) - UOM
     C**************************************************************************
     C     S097          BEGSR
     C*
     C     SWRD14        IFNE      'Y'                                          RD.SW.UOM       WARE
     C     STS14         ANDNE     1122                                         RCD LOCK
     C     STS14         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD14                         RD.SW.UOM       WARE
     C                   Z-ADD     STS14         SVS14                          SAVE FILE STS
     C                   MOVEL     *BLANK        KMCO01                         Company number
     C                   MOVEL     RN0121        KMCO01
     C     K0029         SETGT     UOM
     C                   Z-ADD     SVS14         STS14                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S098   - SETLL D.PORENT,F.SUPLIER,SVK022,svk023,svk12
     C**************************************************************************
     C     S098          BEGSR
     C                   Z-ADD     2             WFILE#                         SET FILE#
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   MOVE      'N'           SWRD11                         RD.SW.IPSTXTH   PORD
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   MOVE      'N'           SWRD05                         RD.SW.IPSWADD   ITMM
     C                   MOVE      'N'           SWRD13                         RD.SW.ITMMAST   UOM
     C                   MOVE      'N'           SWRD14                         RD.SW.UOM       WARE
     C                   MOVE      'N'           SWRD04                         RD.SW.WAREDET   IPST
     C                   MOVE      'N'           SWRD17                         RD.SW.IPSTXTD
     C*
     C                   MOVEL     SVK022        KUCO01
     C                   MOVEL     SVK022        HD0018                         Company number
     C                   MOVEL     SVK022        RN0117                         Company number
     C                   MOVEL     SVK023        KUSU02
     C                   MOVEL     SVK023        HD0019                         Supplier Number
     C                   MOVEL     SVK023        RN0119                         Supplier Number
     C                   MOVEL     SVK12         KUBR03
     C                   MOVEL     SVK12         HD0017                         Branch Number
     C                   MOVEL     SVK12         RN0115                         Branch Number
     C*
     C     K0030         SETLL     SUPLIER                                90
     C     *IN90         IFEQ      '0'                                          REC NOT MATCH
     C                   Z-ADD     12            STS06                          SYMUL NOT FND
     C                   END                                                    *IN90=0
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S099   - GETREC D.PORENT,F.SUPLIER,*PV,SVK022
     C**************************************************************************
     C     S099          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK022        KUCO01
     C     K0031         READPE    SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S100                                         CHK BOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S100   - Process To Reset File Pointer(BOF) - SUPLIER
     C**************************************************************************
     C     S100          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.SUPLIER   IPST
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0117        KUCO01
     C     K0031         SETLL     SUPLIER
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S101   - GETREC D.PORENT,F.SUPLIER,*NE,SVK022
     C**************************************************************************
     C     S101          BEGSR
     C                   Z-ADD     6             WFILE#                         SET FILE#
     C                   MOVEL     *BLANK        KUCO01
     C                   MOVEL     SVK022        KUCO01
     C     K0031         READE     SUPLIER                              9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   Z-ADD     *ZERO         HRC06                          ZERO RRN
     C                   ELSE
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   END
     C*
     C                   EXSR      S102                                         CHK EOF
     C*
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S102   - Process To Reset File Pointer(EOF) - SUPLIER
     C**************************************************************************
     C     S102          BEGSR
     C*
     C     SWRD06        IFNE      'Y'                                          RD.SW.SUPLIER   IPST
     C     STS06         ANDNE     1122                                         RCD LOCK
     C     STS06         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD06                         RD.SW.SUPLIER   IPST
     C                   Z-ADD     STS06         SVS06                          SAVE FILE STS
     C                   MOVEL     *BLANK        KUCO01                         Company number
     C                   MOVEL     RN0117        KUCO01
     C     K0031         SETGT     SUPLIER
     C                   Z-ADD     SVS06         STS06                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S103   - GETBLK D.PORENT,F.PORDD,*PV,SVK006,SVK007
     C**************************************************************************
     C     S103          BEGSR
     C*
     C                   MOVEL     *BLANK        KOCO01
     C                   MOVEL     SVK006        KOCO01
     C                   MOVEL     *BLANK        KOPO02
     C                   MOVEL     SVK007        KOPO02
     C*
     C*          ---------------------------------------------------------------
     C*          | Initialize Loop
     C*          ---------------------------------------------------------------
     C                   Z-ADD     *ZERO         WCNTR                          INIT COUNTER
     C                   Z-ADD     WRRN05        WLCNTR                         INIT LOOP CNTR
     C                   ADD       WADJ05        WLCNTR                         ADD ADJ.CNTR
     C*          ---------------------------------------------------------------
     C*          | Setup Loop To Retrieve Record
     C*          ---------------------------------------------------------------
     C     SWRD03        DOUNE     'Y'                                          RD.SW.PORDD     IPSW
     C     WCNTR         ORGE      WLCNTR
     C     SWEXBL        ORNE      *ZERO
     C                   Z-ADD     *ZERO         SWSKPR
     C                   Z-ADD     3             WFILE#                         SET FILE#
     C     K0019         READPE(N) PORDD                                9190
     C     *IN90         IFEQ      '1'
     C     *IN91         OREQ      '1'
     C                   MOVE      'N'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     *ZERO         HRC03                          ZERO HIDDEN RRN
     C                   MOVEL     *BLANK        HD0014                         Company number
     C                   MOVEL     *BLANK        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     *ZERO         HOSEQ                          Sequence
     C                   ELSE
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   END
     C*
     C     SWRD03        IFEQ      'Y'                                          RD.SW.PORDD     IPSW
     C                   EXSR      SMVTOW                                       MOVE FLD TO WORK
     C                   ADD       1             WCNTR                          INCREMENT CNTR
     C                   END
     C                   END
     C                   Z-ADD     *ZERO         SWEXBL
     C                   EXSR      S104                                         CHK BOF
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S104   - Process To Reset File Pointer(BOF) - PORDD
     C**************************************************************************
     C     S104          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0077        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0019         SETLL     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S105   - Process To Reset File Pointer(EOF) - PORDD
     C**************************************************************************
     C     S105          BEGSR
     C*
     C     SWRD03        IFNE      'Y'                                          RD.SW.PORDD     IPSW
     C     STS03         ANDNE     1122                                         RCD LOCK
     C     STS03         ANDNE     1218                                         RCD LOCK
     C*
     C                   MOVE      'Y'           SWRD03                         RD.SW.PORDD     IPSW
     C                   Z-ADD     STS03         SVS03                          SAVE FILE STS
     C                   MOVEL     *BLANK        KOCO01                         Company number
     C                   MOVEL     RN0077        KOCO01
     C                   MOVEL     *BLANK        KOPO02                         Purchase Order Numbe
     C                   MOVEL     POPORD        KOPO02
     C     K0019         SETGT     PORDD
     C                   Z-ADD     SVS03         STS03                          RESTORE FILE STS
     C*
     C                   Z-ADD     1             WADJ05
     C     WCNTR         IFNE      *ZERO
     C                   ADD       13            WADJ05
     C                   END
     C                   ELSE
     C                   Z-ADD     WRRN05        WADJ05
     C                   END
     C                   ENDSR
     C*
     C/EJECT
     C**************************************************************************
     C* S002V - Detail Screen for PORDH
     C* Validation subroutine for -- SC0002
     C**************************************************************************
     C     S002V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     WK0059        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0059'      FLDNAM
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
     C                   MOVEL     'USR2106'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0053        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0053'      FLDNAM
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
     C                   MOVEL     'USR2107'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0060        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0060'      FLDNAM
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
     C                   MOVEL     'USR2108'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S003V - List Screen for IPSTXTH
     C* Validation subroutine for -- SC0003
     C**************************************************************************
     C     S003V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C     *IN64         IFEQ      '1'
     C                   Z-ADD     RRN02         SRN02
     C                   MOVEA     *IN           INS02
     C                   READC     SCR003S1                             9091
     C     *IN91         DOWEQ     '0'
     C     *IN90         ANDEQ     '0'
     C*
     C                   MOVEA     INSAV1        *IN
     C*
     C*
     C     XHTCDE        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XHTCDE        OREQ      A1(3)                                        Valid value
     C     XHTCDE        OREQ      A1(4)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XHTCDE'      FLDNAM
     C                   MOVEL     'SC0003'      FLDSCR
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
     C                   MOVEL     'USR2066'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XHTEXT        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XHTEXT'      FLDNAM
     C                   MOVEL     'SC0003'      FLDSCR
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
     C                   MOVEL     'USR2067'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C                   SETON                                        65
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR003S1
     C                   READC     SCR003S1                             9091
     C                   END
     C                   Z-ADD     SRN02         RRN02
     C                   MOVEA     INS02         *IN
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S005V - Detail Screen for PORDD
     C* Validation subroutine for -- SC0006
     C**************************************************************************
     C     S005V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C*
     C     XOQORD        IFLE      N1(1)                                        High value
     C     XOQORD        ANDGE     N1(2)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XOQORD'      FLDNAM
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
     C                   MOVEL     'USR2064'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     WK0033        IFLE      N1(3)                                        High value
     C     WK0033        ANDGE     N1(4)                                        Low value
     C                   Z-ADD     1             RANGEF                         Valid range
     C                   ELSE
     C                   Z-ADD     0             RANGEF                         Invalid range
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'WK0033'      FLDNAM
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
     C                   MOVEL     'USR2065'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C                   ENDSR
     C**************************************************************************
     C/EJECT
     C**************************************************************************
     C* S006V - List Screen for IPSTXTD
     C* Validation subroutine for -- SC0007
     C**************************************************************************
     C     S006V         BEGSR
     C*
     C                   Z-ADD     1             VALIDF
     C     *IN64         IFEQ      '1'
     C                   Z-ADD     RRN04         SRN04
     C                   MOVEA     *IN           INS04
     C                   READC     SCR006S1                             9091
     C     *IN91         DOWEQ     '0'
     C     *IN90         ANDEQ     '0'
     C*
     C                   MOVEA     INSAV1        *IN
     C*
     C*
     C     XDTCDE        IFEQ      A1(2)                                        Lst Valid/Invalid va
     C     XDTCDE        OREQ      A1(3)                                        Valid value
     C     XDTCDE        OREQ      A1(4)                                        Valid value
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   ELSE
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDTCDE'      FLDNAM
     C                   MOVEL     'SC0007'      FLDSCR
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
     C                   MOVEL     'USR2066'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C     XDTEXT        IFEQ      A1(1)                                        Lst Valid/Invalid va
     C                   Z-ADD     0             LISTF                          Invalid value found
     C                   ELSE
     C                   Z-ADD     1             LISTF                          Valid value found
     C                   END
     C*
     C                   Z-ADD     0             FLDINX
     C                   MOVEL     'XDTEXT'      FLDNAM
     C                   MOVEL     'SC0007'      FLDSCR
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
     C                   MOVEL     'USR2067'     MSGID                          Message id.
     C                   MOVEL     'ERRORS'      MSGF                           Message file
     C                   EXSR      SMSG                                         Exsr error handler
     C                   MOVE      'X'           DSPERR
     C                   EXSR      SATRIB
     C                   END
     C*
     C                   SETON                                        65
     C                   MOVEA     *IN           INSAV1
     C                   UPDATE    SCR006S1
     C                   READC     SCR006S1                             9091
     C                   END
     C                   Z-ADD     SRN04         RRN04
     C                   MOVEA     INS04         *IN
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
     C     STS02         IFEQ      1218                                         LOCK(SYS)-PORDH
     C     STS02         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK02                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK02                          SET ON LOCK FLAG
     C                   END
     C     STS03         IFEQ      1218                                         LOCK(SYS)-PORDD
     C     STS03         OREQ      1122                                         LOCK(ASSET)
     C                   Z-ADD     *ZERO         LCK03                          SET OFF LOCK FLAG
     C                   ELSE
     C                   Z-ADD     1             LCK03                          SET ON LOCK FLAG
     C                   END
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SEXCP - Dummy EXCPT(s) and Read(s)
     C*****************************************************************
     C     SEXCP         BEGSR
     C                   UNLOCK    PODTALTX                             91      PODTALTX  MPORENTD
     C                   READ      PODTALT                                90
     C                   READ      PODTALTX                               90
     C                   ENDSR
     C/EJECT
     C*****************************************************************
     C* SFERR - File Exception Handler
     C*****************************************************************
     C     SFERR         BEGSR
     C                   MOVE      'Y'           MSGFLG                         MSG FLAG ON
     C     WFILE#        IFEQ      1                                            IPSCPYD
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
     C     WFILE#        IFEQ      2                                            PORDH
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
     C     WFILE#        IFEQ      3                                            PORDD
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
     C     WFILE#        IFEQ      4                                            WAREDET
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
     C     WFILE#        IFEQ      5                                            IPSWADD
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
     C     WFILE#        IFEQ      6                                            SUPLIER
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
     C     WFILE#        IFEQ      7                                            USERDEF
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
     C     WFILE#        IFEQ      9                                            IMSCPYD
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
     C     WFILE#        IFEQ      10                                           IMSTRN
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
     C     WFILE#        IFEQ      11                                           IPSTXTH
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
     C     WFILE#        IFEQ      12                                           IPSITEM
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
     C     WFILE#        IFEQ      13                                           ITMMAST
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
     C     WFILE#        IFEQ      14                                           UOM
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
     C     WFILE#        IFEQ      15                                           PODTALT
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
     C     WFILE#        IFEQ      17                                           IPSTXTD
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
     C     WFILE#        IFEQ      18                                           PODTALTX
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
     C*          | Move Fields From Work Area To File - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   Z-ADD     WK0002        RN0040                         Amendments Report Au
     C                   Z-ADD     WK0003        RN0041                         Goods Received Audit
     C                   Z-ADD     WK0004        RN0042                         Ordered Report Audit
     C                   Z-ADD     WK0005        RN0043                         Payments Report Audi
     C                   Z-ADD     WK0006        RN0044                         Reconciliation Audit
     C                   MOVEL     WDCGAS        CDCGAS                         CGAS to be used
     C                   MOVEL     WK0007        RN0045                         Company number
     C                   MOVEL     WDIMS         CDIMS                          IMS to be used
     C                   Z-ADD     WDPORD        CDPORD                         Last P.O. Number
     C                   MOVEL     WDPURL        CDPURL                         Purge fully rcd line
     C                   MOVEL     WDPURO        CDPURO                         Purge rcd orders
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     WK0035        RN0084                         Branch Number
     C                   MOVEL     WK0036        RN0085                         Buyers Code
     C                   MOVEL     WK0037        RN0087                         Contact name
     C                   MOVEL     WK0038        RN0088                         Company number
     C                   MOVEL     WK0039        RN0089                         Our customers ref
     C                   Z-ADD     WK0040        RN0090                         Delivery Date
     C                   Z-ADD     WK0041        RN0091                         Entered Date
     C                   MOVEL     WK0042        RN0093                         Allocation Acc
     C                   MOVEL     WHOS01        PHOS01                         New Order
     C                   MOVEL     WHOS02        PHOS02                         Updated Order/Line s
     C                   MOVEL     WHOS03        PHOS03                         No action since last
     C                   MOVEL     XHOS04        PHOS04                         P.O. Pending
     C                   MOVEL     WHOS05        PHOS05                         Some receiving since
     C                   MOVEL     XHOS06        PHOS06                         Print P.O.Requested
     C                   MOVEL     XHOS07        PHOS07                         Print Receiving List
     C                   MOVEL     WHOS08        PHOS08                         Order fully recd
     C                   MOVEL     XHOS09        PHOS09                         special order attent
     C                   MOVEL     WHOS10        PHOS10                         P.O. has been printe
     C                   MOVEL     WHOS11        PHOS11                         P.O. has been adjust
     C                   MOVEL     XHPORD        PHPORD                         Purchase Order Numbe
     C                   MOVEL     WK0043        RN0096                         Ship Via
     C                   MOVEL     WK0044        RN0097                         Supplier Address
     C                   MOVEL     WK0045        RN0098                         Line 2
     C                   MOVEL     WK0046        RN0099                         Line 3
     C                   MOVEL     WK0047        RN0100                         Line 4
     C                   MOVEL     WK0048        RN0101                         Line 5
     C                   MOVEL     WK0049        RN0102                         Line 6
     C                   MOVEL     WK0050        RN0103                         Supplier name
     C                   MOVEL     WK0051        RN0104                         Post code
     C                   MOVEL     WK0052        RN0105                         Supplier Account
     C                   MOVEL     XHWHSE        PHWHSE                         Warehouse
     C                   MOVEL     WK0053        RN0106                         Address
     C                   MOVEL     WK0054        RN0107                         Line 2
     C                   MOVEL     WK0055        RN0108                         Line 3
     C                   MOVEL     WK0056        RN0109                         Line 4
     C                   MOVEL     WK0057        RN0110                         Line 5
     C                   MOVEL     WK0058        RN0111                         Line 6
     C                   MOVEL     WK0059        RN0112                         Wharehouse Name
     C                   MOVEL     WK0060        RN0113                         Post code
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     WOCCDE        POCCDE                         Conversion Code
     C                   Z-ADD     WOCONV        POCONV                         Conversion Qty
     C                   MOVEL     WK0029        RN0077                         Company number
     C                   Z-ADD     WK0030        RN0078                         Delivery Date
     C                   MOVEL     WK0031        RN0079                         Item Description
     C                   MOVEL     XOITEM        POITEM                         Item Number
     C                   MOVEL     WK0032        RN0080                         Allocated account
     C                   MOVEL     WOPCDE        POPCDE                         Pricing code
     C                   MOVEL     XOPORD        POPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0033        RN0081                         Price
     C                   Z-ADD     XOQORD        POQORD                         Quantity ordered
     C                   Z-ADD     WK0034        RN0082                         Quantity received
     C                   Z-ADD     XOSEQ         POSEQ                          Sequence
     C                   MOVEL     XOUOM         POUOM                          Unit of Measure
     C                   MOVEL     XOWHSE        POWHSE                         Warehouse
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     WK0067        WDLPDT                         Date Of Last Purchas
     C                   Z-ADD     WK0068        WDLTIM                         Lead Time in days
     C                   Z-ADD     WK0069        WDNRDT                         Date Of Next Receipt
     C                   Z-ADD     WK0070        WDQOO                          Quantity On Order
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     WK0015        RN0063                         Company number
     C                   MOVEL     WHPORD        THPORD                         P.O. Number
     C                   Z-ADD     XHSEQ         THSEQ                          Sequence
     C                   MOVEL     XHTCDE        THTCDE                         Print text code
     C                   MOVEL     XHTEXT        THTEXT                         Text
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - PODTALT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     WACCDE        PACCDE                         Conversion Code
     C                   Z-ADD     WACONV        PACONV                         Packing Multiplier
     C                   MOVEL     WK0023        RN0071                         Company number
     C                   Z-ADD     WADATE        PADATE                         Amend Date
     C                   Z-ADD     WK0024        RN0072                         Delivery Date
     C                   MOVEL     WK0025        RN0073                         Description
     C                   MOVEL     WAITEM        PAITEM                         Item Number
     C                   MOVEL     WK0026        RN0074                         N/L Stock Account
     C                   MOVEL     WAPCDE        PAPCDE                         Priceing Code
     C                   MOVEL     WAPORD        PAPORD                         Purchase Order Numbe
     C                   Z-ADD     WK0027        RN0075                         Price
     C                   Z-ADD     WAQORD        PAQORD                         Quantity ordered
     C                   Z-ADD     WK0028        RN0076                         Quantity received
     C                   Z-ADD     WASEQ         PASEQ                          Sequence
     C                   MOVEL     WATYPE        PATYPE                         a=add B=bef c=aft d=
     C                   MOVEL     WAUOM         PAUOM                          Unit of Measure
     C                   MOVEL     WAWHSE        PAWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      16
     C                   MOVEL     WK0071        RN0125                         Company number
     C                   MOVEL     WK0072        WTITEM                         Item Number
     C                   MOVEL     WK0073        WTTRNC                         Transaction Type
     C                   Z-ADD     WK0074        WTTRPQ                         Trans Period Quantit
     C                   Z-ADD     WK0075        WTTRPV                         Trans Period Value
     C                   Z-ADD     WK0076        WTTRYQ                         Trans YTD Quantity
     C                   Z-ADD     WK0077        WTTRYV                         Trans YTD Value
     C                   MOVEL     WK0078        WTWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From Work Area To File - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      17
     C                   MOVEL     WK0012        RN0061                         Company number
     C                   MOVEL     WK0013        TDPORD                         P.O. Number
     C                   Z-ADD     WK0014        RN0062                         Purchase order line
     C                   Z-ADD     XDSEQ         TDSEQ                          Sequence
     C                   MOVEL     XDTCDE        TDTCDE                         Print text code
     C                   MOVEL     XDTEXT        TDTEXT                         Text
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
     C*****************************************************************
     C* SMVTOW - Move Fields From File(s) To Work Area
     C*****************************************************************
     C     SMVTOW        BEGSR
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      01
     C                   Z-ADD     RN0040        WK0002                         Amendments Report Au
     C                   Z-ADD     RN0041        WK0003                         Goods Received Audit
     C                   Z-ADD     RN0042        WK0004                         Ordered Report Audit
     C                   Z-ADD     RN0043        WK0005                         Payments Report Audi
     C                   Z-ADD     RN0044        WK0006                         Reconciliation Audit
     C                   MOVEL     CDCGAS        WDCGAS                         CGAS to be used
     C                   MOVEL     RN0045        WK0007                         Company number
     C                   MOVEL     CDIMS         WDIMS                          IMS to be used
     C                   Z-ADD     CDPORD        WDPORD                         Last P.O. Number
     C                   MOVEL     CDPURL        WDPURL                         Purge fully rcd line
     C                   MOVEL     CDPURO        WDPURO                         Purge rcd orders
     C                   Z-ADD     REC01         HRC01
     C                   MOVEL     RN0045        HD0004                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      02
     C                   MOVEL     RN0084        WK0035                         Branch Number
     C                   MOVEL     RN0085        WK0036                         Buyers Code
     C                   MOVEL     RN0087        WK0037                         Contact name
     C                   MOVEL     RN0088        WK0038                         Company number
     C                   MOVEL     RN0089        WK0039                         Our customers ref
     C                   Z-ADD     RN0090        WK0040                         Delivery Date
     C                   Z-ADD     RN0091        WK0041                         Entered Date
     C                   MOVEL     RN0093        WK0042                         Allocation Acc
     C                   MOVEL     PHOS01        WHOS01                         New Order
     C                   MOVEL     PHOS02        WHOS02                         Updated Order/Line s
     C                   MOVEL     PHOS03        WHOS03                         No action since last
     C                   MOVEL     PHOS04        XHOS04                         P.O. Pending
     C                   MOVEL     PHOS05        WHOS05                         Some receiving since
     C                   MOVEL     PHOS06        XHOS06                         Print P.O.Requested
     C                   MOVEL     PHOS07        XHOS07                         Print Receiving List
     C                   MOVEL     PHOS08        WHOS08                         Order fully recd
     C                   MOVEL     PHOS09        XHOS09                         special order attent
     C                   MOVEL     PHOS10        WHOS10                         P.O. has been printe
     C                   MOVEL     PHOS11        WHOS11                         P.O. has been adjust
     C                   MOVEL     PHPORD        XHPORD                         Purchase Order Numbe
     C                   MOVEL     RN0096        WK0043                         Ship Via
     C                   MOVEL     RN0097        WK0044                         Supplier Address
     C                   MOVEL     RN0098        WK0045                         Line 2
     C                   MOVEL     RN0099        WK0046                         Line 3
     C                   MOVEL     RN0100        WK0047                         Line 4
     C                   MOVEL     RN0101        WK0048                         Line 5
     C                   MOVEL     RN0102        WK0049                         Line 6
     C                   MOVEL     RN0103        WK0050                         Supplier name
     C                   MOVEL     RN0104        WK0051                         Post code
     C                   MOVEL     RN0105        WK0052                         Supplier Account
     C                   MOVEL     PHWHSE        XHWHSE                         Warehouse
     C                   MOVEL     RN0106        WK0053                         Address
     C                   MOVEL     RN0107        WK0054                         Line 2
     C                   MOVEL     RN0108        WK0055                         Line 3
     C                   MOVEL     RN0109        WK0056                         Line 4
     C                   MOVEL     RN0110        WK0057                         Line 5
     C                   MOVEL     RN0111        WK0058                         Line 6
     C                   MOVEL     RN0112        WK0059                         Wharehouse Name
     C                   MOVEL     RN0113        WK0060                         Post code
     C                   Z-ADD     REC02         HRC02
     C                   MOVEL     RN0088        HD0015                         Company number
     C                   MOVEL     PHPORD        HD0016                         Purchase Order Numbe
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PORDD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      03
     C                   MOVEL     POCCDE        WOCCDE                         Conversion Code
     C                   Z-ADD     POCONV        WOCONV                         Conversion Qty
     C                   MOVEL     RN0077        WK0029                         Company number
     C                   Z-ADD     RN0078        WK0030                         Delivery Date
     C                   MOVEL     RN0079        WK0031                         Item Description
     C                   MOVEL     POITEM        XOITEM                         Item Number
     C                   MOVEL     RN0080        WK0032                         Allocated account
     C                   MOVEL     POPCDE        WOPCDE                         Pricing code
     C                   MOVEL     POPORD        XOPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0081        WK0033                         Price
     C                   Z-ADD     POQORD        XOQORD                         Quantity ordered
     C                   Z-ADD     RN0082        WK0034                         Quantity received
     C                   Z-ADD     POSEQ         XOSEQ                          Sequence
     C                   MOVEL     POUOM         XOUOM                          Unit of Measure
     C                   MOVEL     POWHSE        XOWHSE                         Warehouse
     C                   Z-ADD     REC03         HRC03
     C                   MOVEL     RN0077        HD0014                         Company number
     C                   MOVEL     POPORD        HOPORD                         Purchase Order Numbe
     C                   Z-ADD     POSEQ         HOSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WAREDET
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      04
     C                   Z-ADD     WDLPDT        WK0067                         Date Of Last Purchas
     C                   Z-ADD     WDLTIM        WK0068                         Lead Time in days
     C                   Z-ADD     WDNRDT        WK0069                         Date Of Next Receipt
     C                   Z-ADD     WDQOO         WK0070                         Quantity On Order
     C                   Z-ADD     REC04         HRC04
     C                   MOVEL     RN0123        HD0022                         Company Number
     C                   MOVEL     WDWHSE        HD0023                         Warehouse Number
     C                   MOVEL     WDITEM        HDITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSWADD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      05
     C                   MOVEL     RN0064        WK0016                         Contact name
     C                   MOVEL     RN0065        WK0017                         Company number
     C                   MOVEL     PDLIN1        WDLIN1                         Address
     C                   MOVEL     PDLIN2        WDLIN2                         Address Line 2
     C                   MOVEL     PDLIN3        WDLIN3                         Address Line 3
     C                   MOVEL     PDLIN4        WDLIN4                         Address Line 4
     C                   MOVEL     PDLIN5        WDLIN5                         Address Line 5
     C                   MOVEL     PDLIN6        WDLIN6                         Address Line 6
     C                   MOVEL     RN0066        WK0018                         Post code
     C                   MOVEL     RN0067        WK0019                         Telephone number
     C                   MOVEL     PDWHSE        WK0020                         Warehouse Number
     C                   Z-ADD     REC05         HRC05
     C                   MOVEL     RN0065        HD0011                         Company number
     C                   MOVEL     PDWHSE        HDWHSE                         Warehouse Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - SUPLIER
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      06
     C                   MOVEL     RN0115        WK0061                         Branch Number
     C                   MOVEL     RN0116        WK0062                         Contact name
     C                   MOVEL     SULIN1        WULIN1                         Address
     C                   MOVEL     SULIN2        WULIN2                         Line 2
     C                   MOVEL     SULIN3        WULIN3                         Line 3
     C                   MOVEL     SULIN4        WULIN4                         Line 4
     C                   MOVEL     SULIN5        WULIN5                         Line 5
     C                   MOVEL     SULIN6        WULIN6                         Line 6
     C                   MOVEL     SUNAME        WUNAME                         Supplier name
     C                   MOVEL     RN0118        WK0063                         Post code
     C                   MOVEL     RN0119        WK0064                         Supplier Number
     C                   Z-ADD     REC06         HRC06
     C                   MOVEL     RN0117        HD0018                         Company number
     C                   MOVEL     RN0119        HD0019                         Supplier Number
     C                   MOVEL     RN0115        HD0017                         Branch Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - USERDEF
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      07
     C                   MOVEL     UDWHSE        WK0066                         Warehouse
     C                   Z-ADD     REC07         HRC07
     C                   MOVEL     RN0122        HD0021                         Company number
     C                   MOVEL     UDUSER        HDUSER                         User Id
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - COMPANY
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      08
     C                   MOVEL     RN0029        WK0001                         Company number
     C                   MOVEL     CYDESC        XYDESC                         Company description
     C                   MOVEL     CYDFMT        WYDFMT                         Date Format 1=dmy 2=
     C                   MOVEL     CYDSEP        WYDSEP                         Date Seperator
     C                   Z-ADD     REC08         HRC08
     C                   MOVEL     RN0029        HD0001                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSCPYD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      09
     C                   MOVEL     CDTRNP        WDTRNP                         Purchasing Trans
     C                   MOVEL     CDTRNR        WDTRNR                         Receiving Trans
     C                   Z-ADD     REC09         HRC09
     C                   MOVEL     RN0035        HD0002                         Company number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IMSTRN
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      10
     C                   Z-ADD     REC10         HRC10
     C                   MOVEL     RN0039        HD0003                         Company number
     C                   MOVEL     TTTRNC        HTTRNC                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTH
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      11
     C                   MOVEL     RN0063        WK0015                         Company number
     C                   MOVEL     THPORD        WHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         XHSEQ                          Sequence
     C                   MOVEL     THTCDE        XHTCDE                         Print text code
     C                   MOVEL     THTEXT        XHTEXT                         Text
     C                   Z-ADD     REC11         HRC11
     C                   MOVEL     RN0063        HD0010                         Company number
     C                   MOVEL     THPORD        HHPORD                         P.O. Number
     C                   Z-ADD     THSEQ         HHSEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSITEM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      12
     C                   Z-ADD     PICNV         WICNV                          Conversion Qty
     C                   MOVEL     RN0047        WK0008                         Conversion Code
     C                   Z-ADD     PICOST        WICOST                         Cost Price
     C                   MOVEL     PIDESC        WIDESC                         Description
     C                   MOVEL     PIITEM        WIITEM                         Item Number
     C                   Z-ADD     PILTIM        WILTIM                         Lead Time
     C                   MOVEL     RN0053        WK0009                         Pricing Code
     C                   MOVEL     RN0058        WK0010                         Description
     C                   MOVEL     RN0059        WK0011                         Item Number
     C                   MOVEL     PIUOM         WIUOM                          Unit of Measure
     C                   Z-ADD     REC12         HRC12
     C                   MOVEL     RN0048        HD0006                         Company number
     C                   MOVEL     RN0060        HD0007                         Supplier Number
     C                   MOVEL     RN0046        HD0005                         Branch Number
     C                   MOVEL     PIITEM        HIITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - ITMMAST
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      13
     C                   MOVEL     RN0070        WK0021                         Item Description
     C                   MOVEL     ITITEM        WK0022                         Item Number
     C                   MOVEL     ITNLST        WTNLST                         N/L Stock Account
     C                   MOVEL     ITUOM         WTUOM                          Unit of Measure
     C                   Z-ADD     REC13         HRC13
     C                   MOVEL     RN0069        HD0012                         Company Number
     C                   MOVEL     ITITEM        HTITEM                         Item Number
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - UOM
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      14
     C                   MOVEL     RN0121        WK0065                         Company number
     C                   MOVEL     UMUOM         WMUOM                          Unit of Measure
     C                   Z-ADD     REC14         HRC14
     C                   MOVEL     RN0121        HD0020                         Company number
     C                   MOVEL     UMUOM         HMUOM                          Unit of Measure
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - PODTALT
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      15
     C                   MOVEL     PACCDE        WACCDE                         Conversion Code
     C                   Z-ADD     PACONV        WACONV                         Packing Multiplier
     C                   MOVEL     RN0071        WK0023                         Company number
     C                   Z-ADD     PADATE        WADATE                         Amend Date
     C                   Z-ADD     RN0072        WK0024                         Delivery Date
     C                   MOVEL     RN0073        WK0025                         Description
     C                   MOVEL     PAITEM        WAITEM                         Item Number
     C                   MOVEL     RN0074        WK0026                         N/L Stock Account
     C                   MOVEL     PAPCDE        WAPCDE                         Priceing Code
     C                   MOVEL     PAPORD        WAPORD                         Purchase Order Numbe
     C                   Z-ADD     RN0075        WK0027                         Price
     C                   Z-ADD     PAQORD        WAQORD                         Quantity ordered
     C                   Z-ADD     RN0076        WK0028                         Quantity received
     C                   Z-ADD     PASEQ         WASEQ                          Sequence
     C                   MOVEL     PATYPE        WATYPE                         a=add B=bef c=aft d=
     C                   MOVEL     PAUOM         WAUOM                          Unit of Measure
     C                   MOVEL     PAWHSE        WAWHSE                         Warehouse Number
     C                   Z-ADD     REC15         HRC15
     C                   MOVEL     RN0071        HD0013                         Company number
     C                   MOVEL     PAWHSE        HAWHSE                         Warehouse Number
     C                   MOVEL     PAPORD        HAPORD                         Purchase Order Numbe
     C                   Z-ADD     PASEQ         HASEQ                          Sequence
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - WRITTYP
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      16
     C                   MOVEL     RN0125        WK0071                         Company number
     C                   MOVEL     WTITEM        WK0072                         Item Number
     C                   MOVEL     WTTRNC        WK0073                         Transaction Type
     C                   Z-ADD     WTTRPQ        WK0074                         Trans Period Quantit
     C                   Z-ADD     WTTRPV        WK0075                         Trans Period Value
     C                   Z-ADD     WTTRYQ        WK0076                         Trans YTD Quantity
     C                   Z-ADD     WTTRYV        WK0077                         Trans YTD Value
     C                   MOVEL     WTWHSE        WK0078                         Warehouse Number
     C                   Z-ADD     REC16         HRC16
     C                   MOVEL     RN0125        HD0024                         Company number
     C                   MOVEL     WTWHSE        HTWHSE                         Warehouse Number
     C                   MOVEL     WTITEM        HD0025                         Item Number
     C                   MOVEL     WTTRNC        HD0026                         Transaction Type
     C                   ELSE
     C*          ------------------------------------------------------
     C*          | Move Fields From File To Work Area - IPSTXTD
     C*          ------------------------------------------------------
     C     WFILE#        IFEQ      17
     C                   MOVEL     RN0061        WK0012                         Company number
     C                   MOVEL     TDPORD        WK0013                         P.O. Number
     C                   Z-ADD     RN0062        WK0014                         Purchase order line
     C                   Z-ADD     TDSEQ         XDSEQ                          Sequence
     C                   MOVEL     TDTCDE        XDTCDE                         Print text code
     C                   MOVEL     TDTEXT        XDTEXT                         Text
     C                   Z-ADD     REC17         HRC17
     C                   MOVEL     RN0061        HD0008                         Company number
     C                   MOVEL     TDPORD        HDPORD                         P.O. Number
     C                   Z-ADD     RN0062        HD0009                         Purchase order line
     C                   Z-ADD     TDSEQ         HDSEQ                          Sequence
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

B
R
O
**   Numeric Constant Array - N1
000000000000999999999000000000
000000000000000000001000000000
000000000000009999999999900000
000000000000000000000000000000
**   Cursor Location on field map Array - DA4
                        Boundary
Screen    Field     Idx From  To
=======================+===+===+
SCRADD    XHWHSE    000005130515
SCRADD    WK0052    000005930598
SC0002    WK0052    000011391144
SC0006    XOWHSE    000011511153
SC0006    XOITEM    000007510770
SC0006    XOUOM     000015511555
**   Display Attribute Map Array - DA1
                         H R U B C P N P G R P W T Y B K O
Screen    Field/Grp Idx  I I L L S C D R N D K T Q W U U C
=========+=========+===+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=+=============
SC0002    WK0053    0000  2830    28  29               Y
SC0002    WK0059    0000  3537    35  36               Y
SC0002    WK0060    0000  3840    38  39               Y
SC0003    XHTCDE    0000  0304    03                   Y
SC0003    XHTEXT    0000  0506    05                   Y
SC0006    WK0033    0000  1012    10  11               Y
SC0006    XOQORD    0000  1719    17  18               Y
SC0007    XDTCDE    0000  0304    03                   Y
SC0007    XDTEXT    0000  0506    05                   Y
SCDELD    XOQORD    0000            01
SCRADD    XHWHSE    0000  0304    03                   Y
SCRADD    WK0052    0000  0102    01                   Y
SC0001    FL0001    0000  0103    010402               Y
SC0002    RN0026    0000  0305    03  04               Y
SC0002    WK0052    0000  2527    25  26               Y
SC0002    WK0050    0000  1921    19  20               Y
SC0002    WK0044    0000  1113    11  12               Y
SC0002    WK0051    0000  2224    22  23               Y
SC0002    WK0035    0000              06
SC0002    WK0045    0000              14
SC0002    WK0046    0000              15
SC0002    WK0047    0000              16
SC0002    WK0048    0000              17
SC0002    WK0049    0000              18
SC0002    WK0037    0000              08
SC0002    RN0024    0000              01
SC0002    RN0025    0000              02
SC0002    WK0054    0000              31
SC0002    WK0055    0000              32
SC0002    WK0056    0000              33
SC0002    WK0057    0000              34
SC0002    WK0042    0000              10
SC0002    WK0036    0000              07
SC0002    WK0039    0000              09
SC0003    FL0002    0000  0102    01                   Y
SC0005    FL0003    0000  0103    010402               Y
SC0005    XOQORD    0000            05
SC0006    XOITEM    0000  1416    14  15               Y
SC0006    XOWHSE    0000  2325    23  24               Y
SC0006    RN0026    0000  0103    01  02               Y
SC0006    WK0032    0000  0709    07  08               Y
SC0006    XOUOM     0000  2022    20  21               Y
SC0006    WK0031    0000  0406    04  05               Y
SC0006    WSFOC     0000              13
SC0007    FL0005    0000  0102    01                   Y
SC0008    T01       0001            0201
SC0008    T01       0002            0403
SC0008    T01       0003            0605
SC0008    T01       0004            0807
SC0008    T01       0005            1009
SC0009    T04       0001            0201
SC0009    T04       0002            0403
SC0009    T04       0003            0605
SC0009    T04       0004            0807
SC0009    T04       0005            1009
SC0010    T07       0001            0201
SC0010    T07       0002            0403
SC0010    T07       0003            0605
SC0010    T07       0004            0807
SC0010    T07       0005            1009
SC0012    T12       0001            0201
SC0012    T12       0002            0403
SC0012    T12       0003            0605
SC0012    T12       0004            0807
SC0012    T12       0005            1009
SETSPEC   XHOS04    0000  0102    01                   Y
