--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:24:39
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STIGRPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STIGRP in KEV ignored.
  SICOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SISTIG CHAR(2) NOT NULL DEFAULT '' ,
  SIDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SICOYNO , SISTIG ) )

  RCDFMT STIGRP     ;

LABEL ON TABLE STIGRPSQ
  IS 'IMS Stock Inventory group   SI' ;

LABEL ON COLUMN STIGRPSQ
( SICOYNO IS 'Cpy.' ,
  SISTIG IS 'Stock|Inv Grp' ,
  SIDESC IS 'Description' ) ;

LABEL ON COLUMN STIGRPSQ
( SICOYNO TEXT IS 'Company number' ,
  SISTIG TEXT IS 'Stock Inventory Group' ,
  SIDESC TEXT IS 'S.I.G. Description' ) ;
