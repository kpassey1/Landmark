--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:57:22
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WARETYPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WARETYP in KEV ignored.
  WTCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WTWTYP CHAR(2) NOT NULL DEFAULT '' ,
  WTWDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( WTCOYNO , WTWTYP ) )

  RCDFMT WARETYPF   ;

LABEL ON TABLE WARETYPSQ
  IS 'IMS Warehouse Types         WT' ;

LABEL ON COLUMN WARETYPSQ
( WTCOYNO IS 'Cpy.' ,
  WTWTYP IS 'Whse|Type' ,
  WTWDESC IS 'Whse Description' ) ;

LABEL ON COLUMN WARETYPSQ
( WTCOYNO TEXT IS 'Company number' ,
  WTWTYP TEXT IS 'Warehouse Type' ,
  WTWDESC TEXT IS 'Warehouse Description' ) ;
