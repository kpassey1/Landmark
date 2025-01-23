--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 11:37:14
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PODALTSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PODALTSQ in KEV ignored.
--  SQL1506   30   Key or attribute for PODALTSQ in KEV ignored.
  PACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PAWHSE CHAR(3) NOT NULL DEFAULT '' ,
  PAPORD CHAR(10) NOT NULL DEFAULT '' ,
  PASEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PASEQ ignored.
  PATYPE CHAR(1) NOT NULL DEFAULT '' ,
  PADLVDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column PADLVDT ignored.
  PAITEM CHAR(20) NOT NULL DEFAULT '' ,
  PAIDESC CHAR(40) NOT NULL DEFAULT '' ,
  PAPRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PAPRICE ignored.
  PAQORD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PAQORD ignored.
  PAQRCVD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PAQRCVD ignored.
  PANLALL CHAR(15) NOT NULL DEFAULT '' ,
  PAUOM CHAR(5) NOT NULL DEFAULT '' ,
  PACONV DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PACONV ignored.
  PACCDE CHAR(1) NOT NULL DEFAULT '' ,
  PAPCDE CHAR(1) NOT NULL DEFAULT '' ,
  PADATE NUMERIC(8, 0) NOT NULL DEFAULT 0 )

  RCDFMT PODTALTF   ;
--  SQL150D   10   EDTWRD in column PADATE ignored.

LABEL ON TABLE PODALTSQ
  IS 'IPS Purchase Order Altered' ;

LABEL ON COLUMN PODALTSQ
( PACOYNO IS 'Cpy.' ,
  PAWHSE IS 'Whse|No.' ,
  PAPORD IS 'P.O.Number' ,
  PASEQ IS 'Seq' ,
  PATYPE IS 'Yes/No' ,
  PADLVDT IS 'Date' ,
  PAITEM IS 'Item Number' ,
  PAIDESC IS 'Description' ,
  PAPRICE IS 'Purchase            Price' ,
  PAQORD IS 'Counted Qty' ,
  PAQRCVD IS 'Counted Qty' ,
  PANLALL IS 'Stock Account' ,
  PAUOM IS 'UOM' ,
  PACONV IS 'Pack|Mult' ,
  PACCDE IS 'Cnv|Code' ,
  PAPCDE IS 'Cnv|Code' ,
  PADATE IS 'Date' ) ;

LABEL ON COLUMN PODALTSQ
( PACOYNO TEXT IS 'Company number' ,
  PAWHSE TEXT IS 'Warehouse Number' ,
  PAPORD TEXT IS 'Purchase Order Number' ,
  PASEQ TEXT IS 'Sequence' ,
  PATYPE TEXT IS 'a=add B=bef c=aft d=Del' ,
  PADLVDT TEXT IS 'Delivery Date' ,
  PAITEM TEXT IS 'Item Number' ,
  PAIDESC TEXT IS 'Description' ,
  PAPRICE TEXT IS 'Price' ,
  PAQORD TEXT IS 'Quantity ordered' ,
  PAQRCVD TEXT IS 'Quantity received' ,
  PANLALL TEXT IS 'N/L Stock Account' ,
  PAUOM TEXT IS 'Unit of Measure' ,
  PACONV TEXT IS 'Packing Multiplier' ,
  PACCDE TEXT IS 'Conversion Code' ,
  PAPCDE TEXT IS 'Priceing Code' ,
  PADATE TEXT IS 'Amend Date' ) ;
