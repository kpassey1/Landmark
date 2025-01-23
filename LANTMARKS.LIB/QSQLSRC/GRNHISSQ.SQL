--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 14:55:00
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE GRNHISSQ (
--  SQL150B   10   REUSEDLT(*NO) in table GRNHIS in KEV ignored.
  GRCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  GRRCAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRRCAUD ignored.
  GRPORD CHAR(10) NOT NULL DEFAULT '' ,
  GRSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRSEQ ignored.
  GRDLVDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column GRDLVDT ignored.
  GRITEM CHAR(20) NOT NULL DEFAULT '' ,
  GRIDESC CHAR(40) NOT NULL DEFAULT '' ,
  GRPRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRPRICE ignored.
  GRQRCYC DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRQRCYC ignored.
  GRQORD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRQORD ignored.
  GRNLALL CHAR(15) NOT NULL DEFAULT '' ,
  GRWHSE CHAR(3) NOT NULL DEFAULT '' ,
  GRUOM CHAR(5) NOT NULL DEFAULT '' ,
  GRCONV DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column GRCONV ignored.
  GRCCDE CHAR(1) NOT NULL DEFAULT '' ,
  GRPCDE CHAR(1) NOT NULL DEFAULT '' ,
  GRSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  GRBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  GRINVNUM CHAR(10) NOT NULL DEFAULT '' ,
  GRWNAME CHAR(40) NOT NULL DEFAULT '' ,
  GRRECBY CHAR(5) NOT NULL DEFAULT '' ,
  GRGRNPR CHAR(1) NOT NULL DEFAULT '' ,
  GRRECPR CHAR(1) NOT NULL DEFAULT '' ,
  GRREQ NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column GRREQ ignored.
  PRIMARY KEY( GRCOYNO , GRRCAUD , GRPORD , GRSEQ ) )

  RCDFMT GRNHISF    ;

LABEL ON TABLE GRNHISSQ
  IS 'IPS G.R.N. History          GR' ;

LABEL ON COLUMN GRNHISSQ
( GRCOYNO IS 'Cpy.' ,
  GRRCAUD IS 'G.R.N' ,
  GRPORD IS 'P.O.Number' ,
  GRSEQ IS 'Seq' ,
  GRDLVDT IS 'Date' ,
  GRITEM IS 'Item Number' ,
  GRIDESC IS 'Item Description' ,
  GRPRICE IS 'Purchase            Price' ,
  GRQRCYC IS 'Counted Qty' ,
  GRQORD IS 'Counted Qty' ,
  GRNLALL IS 'Stock Account' ,
  GRWHSE IS 'Whse|No.' ,
  GRUOM IS 'UOM' ,
  GRCONV IS 'Pack|Mult' ,
  GRCCDE IS 'Cnv|Code' ,
  GRPCDE IS 'Cnv|Code' ,
  GRSUPPN IS 'Supplier' ,
  GRBRNBR IS 'Br' ,
  GRINVNUM IS 'Invoice No.' ,
  GRWNAME IS 'Customer name' ,
  GRRECBY IS 'Emp' ,
  GRGRNPR IS 'Yes/No' ,
  GRRECPR IS 'Yes/No' ,
  GRREQ IS 'Date' ) ;

LABEL ON COLUMN GRNHISSQ
( GRCOYNO TEXT IS 'Company number' ,
  GRRCAUD TEXT IS 'Goods Received Note no.' ,
  GRPORD TEXT IS 'Purchase Order Number' ,
  GRSEQ TEXT IS 'Sequence' ,
  GRDLVDT TEXT IS 'Delivery Date' ,
  GRITEM TEXT IS 'Item Number' ,
  GRIDESC TEXT IS 'Item Description' ,
  GRPRICE TEXT IS 'Price' ,
  GRQRCYC TEXT IS 'Received this cycle' ,
  GRQORD TEXT IS 'Quantity Ordered' ,
  GRNLALL TEXT IS 'Allocated account' ,
  GRWHSE TEXT IS 'Warehouse Number' ,
  GRUOM TEXT IS 'Unit of Measure' ,
  GRCONV TEXT IS 'Conversion Qty' ,
  GRCCDE TEXT IS 'Conversion Code' ,
  GRPCDE TEXT IS 'Pricing code' ,
  GRSUPPN TEXT IS 'Supplier Number' ,
  GRBRNBR TEXT IS 'Branch Number' ,
  GRINVNUM TEXT IS 'Invoice number' ,
  GRWNAME TEXT IS 'Wharehouse name' ,
  GRRECBY TEXT IS 'Received By' ,
  GRGRNPR TEXT IS 'Grn Printed Y/N' ,
  GRRECPR TEXT IS 'Yes no' ,
  GRREQ TEXT IS 'Date Requested yymmdd' ) ;
