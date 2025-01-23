--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:52:06
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE TRDDISSQ (
--  SQL150B   10   REUSEDLT(*NO) in table TRDDIS in KEV ignored.
  TDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TDDSCC CHAR(3) NOT NULL DEFAULT '' ,
  TDDIS1 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDDIS1 ignored.
  TDDIS2 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDDIS2 ignored.
  TDDIS3 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDDIS3 ignored.
  PRIMARY KEY( TDCOYNO , TDDSCC ) )

  RCDFMT TRDDISF    ;

LABEL ON TABLE TRDDISSQ
  IS 'SOP Trade Discount Codes    TD' ;

LABEL ON COLUMN TRDDISSQ
( TDCOYNO IS 'Cpy.' ,
  TDDSCC IS 'Trade|Disc' ,
  TDDIS1 IS 'Disc %' ,
  TDDIS2 IS 'Disc %' ,
  TDDIS3 IS 'Disc %' ) ;

LABEL ON COLUMN TRDDISSQ
( TDCOYNO TEXT IS 'Company number' ,
  TDDSCC TEXT IS 'Trade Discount Code' ,
  TDDIS1 TEXT IS 'Trade discount 1' ,
  TDDIS2 TEXT IS 'Trade Discount 2' ,
  TDDIS3 TEXT IS 'Trade Discount 3' ) ;
