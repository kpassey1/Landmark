--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 12:46:59
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PRICESSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PRICES in KEV ignored.
  PRCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PRITEM CHAR(20) NOT NULL DEFAULT '' ,
  PRPRI1 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI1 ignored.
  PRPRI2 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI2 ignored.
  PRPRI3 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI3 ignored.
  PRPRI4 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI4 ignored.
  PRPRI5 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI5 ignored.
  PRPRI6 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI6 ignored.
  PRPRI7 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI7 ignored.
  PRPRI8 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI8 ignored.
  PRPRI9 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PRPRI9 ignored.
  PRIMARY KEY( PRCOYNO , PRITEM ) )

  RCDFMT PRICESF    ;

LABEL ON TABLE PRICESSQ
  IS 'SOP Price file              PR' ;

LABEL ON COLUMN PRICESSQ
( PRCOYNO IS 'Cpy.' ,
  PRITEM IS 'Item Number' ,
  PRPRI1 IS 'Purchase            Price' ,
  PRPRI2 IS 'Purchase            Price' ,
  PRPRI3 IS 'Purchase            Price' ,
  PRPRI4 IS 'Purchase            Price' ,
  PRPRI5 IS 'Purchase            Price' ,
  PRPRI6 IS 'Purchase            Price' ,
  PRPRI7 IS 'Purchase            Price' ,
  PRPRI8 IS 'Purchase            Price' ,
  PRPRI9 IS 'Purchase            Price' ) ;

LABEL ON COLUMN PRICESSQ
( PRCOYNO TEXT IS 'Company number' ,
  PRITEM TEXT IS 'Item Number' ,
  PRPRI1 TEXT IS 'Price 1' ,
  PRPRI2 TEXT IS 'Price 2' ,
  PRPRI3 TEXT IS 'Price 3' ,
  PRPRI4 TEXT IS 'Price 4' ,
  PRPRI5 TEXT IS 'Price 5' ,
  PRPRI6 TEXT IS 'Price 6' ,
  PRPRI7 TEXT IS 'Price 7' ,
  PRPRI8 TEXT IS 'Price 8' ,
  PRPRI9 TEXT IS 'Price 9' ) ;
