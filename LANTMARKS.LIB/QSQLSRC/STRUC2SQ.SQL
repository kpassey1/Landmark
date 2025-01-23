--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:42:47
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STRUC2SQ (
--  SQL150B   10   REUSEDLT(*NO) in table STRUC2 in KEV ignored.
  S2COYNO CHAR(3) NOT NULL DEFAULT '' ,
  S2PRCG CHAR(3) NOT NULL DEFAULT '' ,
  S2QTY1 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2QTY1 ignored.
  S2QTY2 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2QTY2 ignored.
  S2QTY3 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2QTY3 ignored.
  S2QTY4 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2QTY4 ignored.
  S2QTY5 DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2QTY5 ignored.
  S2DIS1 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2DIS1 ignored.
  S2DIS2 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2DIS2 ignored.
  S2DIS3 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2DIS3 ignored.
  S2DIS4 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2DIS4 ignored.
  S2DIS5 DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2DIS5 ignored.
  S2DCRT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S2DCRT ignored.
  S2DAMD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column S2DAMD ignored.
  S2USER CHAR(10) NOT NULL DEFAULT '' ,
  S2PRC1 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2PRC1 ignored.
  S2PRC2 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2PRC2 ignored.
  S2PRC3 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2PRC3 ignored.
  S2PRC4 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2PRC4 ignored.
  S2PRC5 DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column S2PRC5 ignored.
  PRIMARY KEY( S2COYNO , S2PRCG ) )

  RCDFMT STRUC2F    ;

LABEL ON TABLE STRUC2SQ
  IS 'SOP Price struc Cum Qty Brk S2' ;

LABEL ON COLUMN STRUC2SQ
( S2COYNO IS 'Cpy.' ,
  S2PRCG IS 'Price|Group' ,
  S2QTY1 IS 'Counted Qty' ,
  S2QTY2 IS 'Counted Qty' ,
  S2QTY3 IS 'Counted Qty' ,
  S2QTY4 IS 'Counted Qty' ,
  S2QTY5 IS 'Counted Qty' ,
  S2DIS1 IS 'Disc %' ,
  S2DIS2 IS 'Disc %' ,
  S2DIS3 IS 'Disc %' ,
  S2DIS4 IS 'Disc %' ,
  S2DIS5 IS 'Disc %' ,
  S2DCRT IS 'Date' ,
  S2DAMD IS 'Date' ,
  S2USER IS 'User' ,
  S2PRC1 IS 'Purchase            Price' ,
  S2PRC2 IS 'Purchase            Price' ,
  S2PRC3 IS 'Purchase            Price' ,
  S2PRC4 IS 'Purchase            Price' ,
  S2PRC5 IS 'Purchase            Price' ) ;

LABEL ON COLUMN STRUC2SQ
( S2COYNO TEXT IS 'Company number' ,
  S2PRCG TEXT IS 'Price Group' ,
  S2QTY1 TEXT IS 'Qty Break 1' ,
  S2QTY2 TEXT IS 'Qty Break 2' ,
  S2QTY3 TEXT IS 'Qty Break 3' ,
  S2QTY4 TEXT IS 'Qty Break 4' ,
  S2QTY5 TEXT IS 'Qty Break 5' ,
  S2DIS1 TEXT IS 'Discount 1' ,
  S2DIS2 TEXT IS 'Discount 2' ,
  S2DIS3 TEXT IS 'Discount 3' ,
  S2DIS4 TEXT IS 'Discount 4' ,
  S2DIS5 TEXT IS 'Discount 5' ,
  S2DCRT TEXT IS 'Date created' ,
  S2DAMD TEXT IS 'Date amended' ,
  S2USER TEXT IS 'Last user' ,
  S2PRC1 TEXT IS 'Price 1' ,
  S2PRC2 TEXT IS 'Price 2' ,
  S2PRC3 TEXT IS 'Price 3' ,
  S2PRC4 TEXT IS 'Price 4' ,
  S2PRC5 TEXT IS 'Price 5' ) ;
