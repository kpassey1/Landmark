--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 13:21:23
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IMSTRNSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IMSTRN in KEV ignored.
  TTCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TTTRNC CHAR(2) NOT NULL DEFAULT '' ,
  TTDESC CHAR(40) NOT NULL DEFAULT '' ,
  TTNEGA CHAR(1) NOT NULL DEFAULT '' ,
  TTONHC CHAR(1) NOT NULL DEFAULT '' ,
  TTREFE CHAR(1) NOT NULL DEFAULT '' ,
  TTUPDC CHAR(1) NOT NULL DEFAULT '' ,
  TTUSDC CHAR(1) NOT NULL DEFAULT '' ,
  TTOTHT CHAR(2) NOT NULL DEFAULT '' ,
  TTPCKL CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( TTCOYNO , TTTRNC ) )

  RCDFMT IMSTRMF    ;

LABEL ON TABLE IMSTRNSQ
  IS 'IMS Transaction Types       TT' ;

LABEL ON COLUMN IMSTRNSQ
( TTCOYNO IS 'Cpy.' ,
  TTTRNC IS 'Trans|Type' ,
  TTDESC IS 'Description' ,
  TTNEGA IS 'Neg|Alwd' ,
  TTONHC IS 'On Hand|calc' ,
  TTREFE IS 'Enter|ref' ,
  TTUPDC IS 'Upd|Cost' ,
  TTUSDC IS 'Used|Calc' ,
  TTOTHT IS 'Other|Code' ,
  TTPCKL IS 'Pick|List' ) ;

LABEL ON COLUMN IMSTRNSQ
( TTCOYNO TEXT IS 'Company number' ,
  TTTRNC TEXT IS 'Transaction Type' ,
  TTDESC TEXT IS 'Description' ,
  TTNEGA TEXT IS 'Negative allowed' ,
  TTONHC TEXT IS 'On Hand Calculation' ,
  TTREFE TEXT IS 'Enter Reference' ,
  TTUPDC TEXT IS 'Update Cost' ,
  TTUSDC TEXT IS 'Used Calculation' ,
  TTOTHT TEXT IS 'Other Transaction Code' ,
  TTPCKL TEXT IS 'Picking List Y/N' ) ;
