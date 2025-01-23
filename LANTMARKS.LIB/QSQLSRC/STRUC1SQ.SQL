--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:42:05
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STRUC1SQ (
--  SQL150B   10   REUSEDLT(*NO) in table STRUC1 in KEV ignored.
  S1COYNO CHAR(3) NOT NULL DEFAULT '' ,
  S1ITEM CHAR(20) NOT NULL DEFAULT '' ,
  S1QTY1 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1QTY1 ignored.
  S1QTY2 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1QTY2 ignored.
  S1QTY3 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1QTY3 ignored.
  S1QTY4 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1QTY4 ignored.
  S1QTY5 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1QTY5 ignored.
  S1DIS1 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1DIS1 ignored.
  S1DIS2 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1DIS2 ignored.
  S1DIS3 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1DIS3 ignored.
  S1DIS4 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1DIS4 ignored.
  S1DIS5 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1DIS5 ignored.
  S1PRC1 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1PRC1 ignored.
  S1PRC2 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1PRC2 ignored.
  S1PRC3 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1PRC3 ignored.
  S1PRC4 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1PRC4 ignored.
  S1PRC5 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S1PRC5 ignored.
  S1DCRT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S1DCRT ignored.
  S1DAMD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S1DAMD ignored.
  S1USER CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( S1COYNO , S1ITEM ) )

  RCDFMT STRUC1F    ;

LABEL ON TABLE STRUC1SQ
  IS 'SOP Price struc Qty Breaks  S1' ;

LABEL ON COLUMN STRUC1SQ
( S1COYNO IS 'Cpy.' ,
  S1ITEM IS 'Item Number' ,
  S1QTY1 IS 'Counted Qty' ,
  S1QTY2 IS 'Counted Qty' ,
  S1QTY3 IS 'Counted Qty' ,
  S1QTY4 IS 'Counted Qty' ,
  S1QTY5 IS 'Counted Qty' ,
  S1DIS1 IS 'Disc %' ,
  S1DIS2 IS 'Disc %' ,
  S1DIS3 IS 'Disc %' ,
  S1DIS4 IS 'Disc %' ,
  S1DIS5 IS 'Disc %' ,
  S1PRC1 IS 'Purchase            Price' ,
  S1PRC2 IS 'Purchase            Price' ,
  S1PRC3 IS 'Purchase            Price' ,
  S1PRC4 IS 'Purchase            Price' ,
  S1PRC5 IS 'Purchase            Price' ,
  S1DCRT IS 'Date' ,
  S1DAMD IS 'Date' ,
  S1USER IS 'User' ) ;

LABEL ON COLUMN STRUC1SQ
( S1COYNO TEXT IS 'Company number' ,
  S1ITEM TEXT IS 'Item Number' ,
  S1QTY1 TEXT IS 'Qty Break 1' ,
  S1QTY2 TEXT IS 'Qty Break 2' ,
  S1QTY3 TEXT IS 'Qty Break 3' ,
  S1QTY4 TEXT IS 'Qty Break 4' ,
  S1QTY5 TEXT IS 'Qty Break 5' ,
  S1DIS1 TEXT IS 'Discount 1' ,
  S1DIS2 TEXT IS 'Discount 2' ,
  S1DIS3 TEXT IS 'Discount 3' ,
  S1DIS4 TEXT IS 'Discount 4' ,
  S1DIS5 TEXT IS 'Discount 5' ,
  S1PRC1 TEXT IS 'Price 1' ,
  S1PRC2 TEXT IS 'Price 2' ,
  S1PRC3 TEXT IS 'Price 3' ,
  S1PRC4 TEXT IS 'Price 4' ,
  S1PRC5 TEXT IS 'Price 5' ,
  S1DCRT TEXT IS 'Date created' ,
  S1DAMD TEXT IS 'Date amended' ,
  S1USER TEXT IS 'User' ) ;
