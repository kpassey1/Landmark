--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:49:06
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STRUC5SQ (
--  SQL150B   10   REUSEDLT(*NO) in table STRUC5 in KEV ignored.
  S5COYNO CHAR(3) NOT NULL DEFAULT '' ,
  S5CLAS CHAR(3) NOT NULL DEFAULT '' ,
  S5DISC DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S5DISC ignored.
  S5DCRT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S5DCRT ignored.
  S5DAMD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S5DAMD ignored.
  S5USER CHAR(10) NOT NULL DEFAULT '' ,
  S5PRIC DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S5PRIC ignored.
  PRIMARY KEY( S5COYNO , S5CLAS ) )

  RCDFMT STRUC5F    ;

LABEL ON TABLE STRUC5SQ
  IS 'SOP Price Struc Item Class  S5' ;

LABEL ON COLUMN STRUC5SQ
( S5COYNO IS 'Cpy.' ,
  S5CLAS IS 'Item|Class' ,
  S5DISC IS 'Disc %' ,
  S5DCRT IS 'Date' ,
  S5DAMD IS 'Date' ,
  S5USER IS 'User' ,
  S5PRIC IS 'Purchase            Price' ) ;

LABEL ON COLUMN STRUC5SQ
( S5COYNO TEXT IS 'Company number' ,
  S5CLAS TEXT IS 'Item Class' ,
  S5DISC TEXT IS 'Discount' ,
  S5DCRT TEXT IS 'Date created' ,
  S5DAMD TEXT IS 'Date amended' ,
  S5USER TEXT IS 'Last User' ,
  S5PRIC TEXT IS 'Price' ) ;
