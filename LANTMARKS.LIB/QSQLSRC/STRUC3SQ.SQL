--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:43:30
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STRUC3SQ (
--  SQL150B   10   REUSEDLT(*NO) in table STRUC3 in KEV ignored.
  S3COYNO CHAR(3) NOT NULL DEFAULT '' ,
  S3CONT CHAR(10) NOT NULL DEFAULT '' ,
  S3ITEM CHAR(20) NOT NULL DEFAULT '' ,
  S3CUST CHAR(6) NOT NULL DEFAULT '' ,
  S3BRNBR CHAR(3) NOT NULL DEFAULT '' ,
  S3PRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S3PRICE ignored.
  S3MAXQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S3MAXQ ignored.
  S3SDAT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S3SDAT ignored.
  S3EDAT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S3EDAT ignored.
  S3SOLQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S3SOLQ ignored.
  S3LSAD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S3LSAD ignored.
  S3DCRT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S3DCRT ignored.
  S3DAMD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S3DAMD ignored.
  S3USER CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( S3COYNO , S3CONT , S3ITEM ) )

  RCDFMT STRUC3F    ;

LABEL ON TABLE STRUC3SQ
  IS 'SOP Price Struc Contract    S3' ;

LABEL ON COLUMN STRUC3SQ
( S3COYNO IS 'Cpy.' ,
  S3CONT IS 'Cont No.' ,
  S3ITEM IS 'Item Number' ,
  S3CUST IS 'Cust No.' ,
  S3BRNBR IS 'Br' ,
  S3PRICE IS 'Purchase            Price' ,
  S3MAXQ IS 'Counted Qty' ,
  S3SDAT IS 'Date' ,
  S3EDAT IS 'Date' ,
  S3SOLQ IS 'Counted Qty' ,
  S3LSAD IS 'Date' ,
  S3DCRT IS 'Date' ,
  S3DAMD IS 'Date' ,
  S3USER IS 'User' ) ;

LABEL ON COLUMN STRUC3SQ
( S3COYNO TEXT IS 'Company number' ,
  S3CONT TEXT IS 'Contract number' ,
  S3ITEM TEXT IS 'Item Number' ,
  S3CUST TEXT IS 'Customer Number' ,
  S3BRNBR TEXT IS 'Branch Number' ,
  S3PRICE TEXT IS 'Price' ,
  S3MAXQ TEXT IS 'Quantity' ,
  S3SDAT TEXT IS 'Start date' ,
  S3EDAT TEXT IS 'End Date' ,
  S3SOLQ TEXT IS 'Sold Quantity' ,
  S3LSAD TEXT IS 'Last sale date' ,
  S3DCRT TEXT IS 'Date created' ,
  S3DAMD TEXT IS 'Date amended' ,
  S3USER TEXT IS 'Last User' ) ;
