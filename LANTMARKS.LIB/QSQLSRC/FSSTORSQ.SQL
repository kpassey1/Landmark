--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              10/11/23 15:08:31
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE FSSTORSQ (
--  SQL150B   10   REUSEDLT(*NO) in table FSSTOR in KEV ignored.
  WLCNO CHAR(3) NOT NULL DEFAULT '' ,
  WLUSDF CHAR(5) NOT NULL DEFAULT '' ,
  WLWHSE CHAR(3) NOT NULL DEFAULT '' ,
  PRIMARY KEY( WLCNO , WLUSDF ) )

  RCDFMT FSSTORR    ;

LABEL ON TABLE FSSTORSQ
  IS 'IMS Warehouse/Store Xref' ;

LABEL ON COLUMN FSSTORSQ
( WLCNO IS 'Cpy.' ,
  WLUSDF IS 'USDF' ,
  WLWHSE IS 'Whse|No.' ) ;

LABEL ON COLUMN FSSTORSQ
( WLCNO TEXT IS 'Company number' ,
  WLUSDF TEXT IS 'Store Number' ,
  WLWHSE TEXT IS 'Warehouse Number' ) ;
