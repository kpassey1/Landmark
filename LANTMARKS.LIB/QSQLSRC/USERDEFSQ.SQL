--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:54:38
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE USERDEFSQ (
--  SQL150B   10   REUSEDLT(*NO) in table USERDEF in KEV ignored.
  UDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  UDUSER CHAR(10) NOT NULL DEFAULT '' ,
  UDWHSE CHAR(3) NOT NULL DEFAULT '' ,
  PRIMARY KEY( UDCOYNO , UDUSER ) )

  RCDFMT USERDEFF   ;

LABEL ON TABLE USERDEFSQ
  IS 'IPS User Defaults           UD' ;

LABEL ON COLUMN USERDEFSQ
( UDCOYNO IS 'Cpy.' ,
  UDUSER IS 'User' ,
  UDWHSE IS 'Whse|No.' ) ;

LABEL ON COLUMN USERDEFSQ
( UDCOYNO TEXT IS 'Company number' ,
  UDUSER TEXT IS 'User' ,
  UDWHSE TEXT IS 'Warehouse Number' ) ;
