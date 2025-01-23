--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 11:48:20
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PORDDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PORDD in KEV ignored.
  POCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  POPORD CHAR(10) NOT NULL DEFAULT '' ,
  POSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POSEQ ignored.
  PODLVDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column PODLVDT ignored.
  POITEM CHAR(20) NOT NULL DEFAULT '' ,
  POIDESC CHAR(40) NOT NULL DEFAULT '' ,
  POPRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POPRICE ignored.
  POQORD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POQORD ignored.
  POQRCVD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POQRCVD ignored.
  POQRCYC DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POQRCYC ignored.
  PONLALL CHAR(15) NOT NULL DEFAULT '' ,
  POWHSE CHAR(3) NOT NULL DEFAULT '' ,
  POUOM CHAR(5) NOT NULL DEFAULT '' ,
  POCONV DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column POCONV ignored.
  POCCDE CHAR(1) NOT NULL DEFAULT '' ,
  POPCDE CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( POCOYNO , POPORD , POSEQ ) )

  RCDFMT PORDDF     ;

LABEL ON TABLE PORDDSQ
  IS 'IPS Purchase Order Detail   PO' ;

LABEL ON COLUMN PORDDSQ
( POCOYNO IS 'Cpy.' ,
  POPORD IS 'P.O.Number' ,
  POSEQ IS 'Seq' ,
  PODLVDT IS 'Date' ,
  POITEM IS 'Item Number' ,
  POIDESC IS 'Item Description' ,
  POPRICE IS 'Purchase            Price' ,
  POQORD IS 'Counted Qty' ,
  POQRCVD IS 'Counted Qty' ,
  POQRCYC IS 'Counted Qty' ,
  PONLALL IS 'Stock Account' ,
  POWHSE IS 'Whse|No.' ,
  POUOM IS 'UOM' ,
  POCONV IS 'Pack|Mult' ,
  POCCDE IS 'Cnv|Code' ,
  POPCDE IS 'Cnv|Code' ) ;

LABEL ON COLUMN PORDDSQ
( POCOYNO TEXT IS 'Company number' ,
  POPORD TEXT IS 'Purchase Order Number' ,
  POSEQ TEXT IS 'Sequence' ,
  PODLVDT TEXT IS 'Delivery Date' ,
  POITEM TEXT IS 'Item Number' ,
  POIDESC TEXT IS 'Item Description' ,
  POPRICE TEXT IS 'Price' ,
  POQORD TEXT IS 'Quantity ordered' ,
  POQRCVD TEXT IS 'Quantity received' ,
  POQRCYC TEXT IS 'Received this cycle' ,
  PONLALL TEXT IS 'Allocated account' ,
  POWHSE TEXT IS 'Warehouse Number' ,
  POUOM TEXT IS 'Unit of Measure' ,
  POCONV TEXT IS 'Conversion Qty' ,
  POCCDE TEXT IS 'Conversion Code' ,
  POPCDE TEXT IS 'Pricing code' ) ;
