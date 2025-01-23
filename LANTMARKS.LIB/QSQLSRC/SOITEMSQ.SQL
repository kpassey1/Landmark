--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:20:11
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SOITEMSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SOITEM in KEV ignored.
  SICOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SISEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SISEQ ignored.
  SIWHSE CHAR(3) NOT NULL DEFAULT '' ,
  SIITEM CHAR(20) NOT NULL DEFAULT '' ,
  SILOCN CHAR(10) NOT NULL DEFAULT '' ,
  SIQUANT DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SIQUANT ignored.
  SIPRICE DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SIPRICE ignored.
  PRIMARY KEY( SICOYNO , SISEQ , SIWHSE , SIITEM ) )

  RCDFMT SOITEMF    ;

LABEL ON TABLE SOITEMSQ
  IS 'SOP Standing order items/locs' ;

LABEL ON COLUMN SOITEMSQ
( SICOYNO IS 'Cpy.' ,
  SISEQ IS 'Seq' ,
  SIWHSE IS 'Whse|No.' ,
  SIITEM IS 'Item Number' ,
  SILOCN IS 'Location' ,
  SIQUANT IS 'Counted Qty' ,
  SIPRICE IS 'Price' ) ;

LABEL ON COLUMN SOITEMSQ
( SICOYNO TEXT IS 'Company number' ,
  SISEQ TEXT IS 'Standing Order Number' ,
  SIWHSE TEXT IS 'Warehouse Number' ,
  SIITEM TEXT IS 'Item Number' ,
  SILOCN TEXT IS 'Location' ,
  SIQUANT TEXT IS 'DEfault Quantity' ,
  SIPRICE TEXT IS 'Price' ) ;
