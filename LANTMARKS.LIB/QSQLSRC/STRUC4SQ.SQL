--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:44:12
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STRUC4SQ (
--  SQL150B   10   REUSEDLT(*NO) in table STRUC4 in KEV ignored.
  S4COYNO CHAR(3) NOT NULL DEFAULT '' ,
  S4CUST CHAR(6) NOT NULL DEFAULT '' ,
  S4BRNBR CHAR(3) NOT NULL DEFAULT '' ,
  S4ITEM CHAR(20) NOT NULL DEFAULT '' ,
  S4DISC DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S4DISC ignored.
  S4DCRT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S4DCRT ignored.
  S4DAMD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S4DAMD ignored.
  S4USER CHAR(10) NOT NULL DEFAULT '' ,
  S4PRIC DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S4PRIC ignored.
  PRIMARY KEY( S4COYNO , S4CUST , S4BRNBR , S4ITEM ) )

  RCDFMT STRUC4F    ;

LABEL ON TABLE STRUC4SQ
  IS 'SOP Price Struc Cust/Price  S4' ;

LABEL ON COLUMN STRUC4SQ
( S4COYNO IS 'Cpy.' ,
  S4CUST IS 'Cust No.' ,
  S4BRNBR IS 'Br' ,
  S4ITEM IS 'Item Number' ,
  S4DISC IS 'Disc %' ,
  S4DCRT IS 'Date' ,
  S4DAMD IS 'Date' ,
  S4USER IS 'User' ,
  S4PRIC IS 'Purchase            Price' ) ;

LABEL ON COLUMN STRUC4SQ
( S4COYNO TEXT IS 'Company number' ,
  S4CUST TEXT IS 'Customer Number' ,
  S4BRNBR TEXT IS 'Branch Number' ,
  S4ITEM TEXT IS 'Item Number' ,
  S4DISC TEXT IS 'Discount' ,
  S4DCRT TEXT IS 'Date created' ,
  S4DAMD TEXT IS 'Date amended' ,
  S4USER TEXT IS 'Last User' ,
  S4PRIC TEXT IS 'Price' ) ;
