--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:55:27
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WAREDETSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WAREDET in KEV ignored.
  WDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WDWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WDITEM CHAR(20) NOT NULL DEFAULT '' ,
  WDUOM CHAR(5) NOT NULL DEFAULT '' ,
  WDSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  WDSBRN CHAR(3) NOT NULL DEFAULT '' ,
  WDMINB DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDMINB ignored.
  WDMAXB DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDMAXB ignored.
  WDFIXQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDFIXQ ignored.
  WDLTIM DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDLTIM ignored.
  WDSAFE DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDSAFE ignored.
  WDUCST DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDUCST ignored.
  WDLCST DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDLCST ignored.
  WDOBAL DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDOBAL ignored.
  WDQOH DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDQOH ignored.
  WDQAL DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDQAL ignored.
  WDQOR DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDQOR ignored.
  WDQOO DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDQOO ignored.
  WDPHYC DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDPHYC ignored.
  WDTPEB DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDTPEB ignored.
  WDLRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WDLRDT ignored.
  WDNRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WDNRDT ignored.
  WDLPDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WDLPDT ignored.
  WDEOQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDEOQ ignored.
  WDPHYR DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDPHYR ignored.
  WDQBQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDQBQ ignored.
  WDSTOG CHAR(1) NOT NULL DEFAULT '' ,
  WDNSOP DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNSOP ignored.
  WDNSOY DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNSOY ignored.
  WDNOSP DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNOSP ignored.
  WDNOSY DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNOSY ignored.
  WDNORP DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNORP ignored.
  WDNORY DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WDNORY ignored.
  WDCRBY CHAR(10) NOT NULL DEFAULT '' ,
  WDCRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WDCRDT ignored.
  WDLMBY CHAR(10) NOT NULL DEFAULT '' ,
  WDLMDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WDLMDT ignored.
  PRIMARY KEY( WDCOYNO , WDWHSE , WDITEM ) )

  RCDFMT WDETAILF   ;

LABEL ON TABLE WAREDETSQ
  IS 'IMS Warehouse Item Details  WD' ;

LABEL ON COLUMN WAREDETSQ
( WDCOYNO IS 'Cpy.' ,
  WDWHSE IS 'Whse|No.' ,
  WDITEM IS 'Item Number' ,
  WDUOM IS 'UOM' ,
  WDSUPPN IS 'Supplier' ,
  WDSBRN IS 'Br' ,
  WDMINB IS 'Min Balance' ,
  WDMAXB IS 'Max Balance' ,
  WDFIXQ IS 'Fix Ord Qty' ,
  WDLTIM IS 'Lead|Time' ,
  WDSAFE IS 'Safe Qty' ,
  WDUCST IS 'Unit Cost' ,
  WDLCST IS 'Cost at             Last Receipt' ,
  WDOBAL IS 'Opening Bal' ,
  WDQOH IS 'Qty On hand' ,
  WDQAL IS 'Qty Allocated' ,
  WDQOR IS 'Qty on Reserve' ,
  WDQOO IS 'Qty on Order' ,
  WDPHYC IS 'Physical count' ,
  WDTPEB IS 'Period End|Balance' ,
  WDLRDT IS 'Date' ,
  WDNRDT IS 'Date' ,
  WDLPDT IS 'Date' ,
  WDEOQ IS 'Eco Order Qty' ,
  WDPHYR IS 'Pysical Count|on Res' ,
  WDQBQ IS 'Qty Backorder' ,
  WDSTOG IS 'Stock|Trnvr Grp' ,
  WDNSOP IS 'Stkouts' ,
  WDNSOY IS 'Stkouts|Year' ,
  WDNOSP IS 'Orders|Shipped' ,
  WDNOSY IS 'Shipped|Y.T.D.' ,
  WDNORP IS 'Orders|Received' ,
  WDNORY IS 'Received|Y.T.D.' ,
  WDCRBY IS 'Created By' ,
  WDCRDT IS 'Created|date' ,
  WDLMBY IS 'Last Maint' ,
  WDLMDT IS 'Maintained|date' ) ;

LABEL ON COLUMN WAREDETSQ
( WDCOYNO TEXT IS 'Company number' ,
  WDWHSE TEXT IS 'Warehouse Number' ,
  WDITEM TEXT IS 'Item Number' ,
  WDUOM TEXT IS 'Unit of Measure' ,
  WDSUPPN TEXT IS 'Supplier Number' ,
  WDSBRN TEXT IS 'Branch Number' ,
  WDMINB TEXT IS 'Minimum Balance' ,
  WDMAXB TEXT IS 'Maximum Balance' ,
  WDFIXQ TEXT IS 'Fixed Order Quantity' ,
  WDLTIM TEXT IS 'Lead Time in days' ,
  WDSAFE TEXT IS 'Safety Stock Quantity' ,
  WDUCST TEXT IS 'Unit Cost' ,
  WDLCST TEXT IS 'Cost at last receipt' ,
  WDOBAL TEXT IS 'Opening balance' ,
  WDQOH TEXT IS 'Quantity on hand' ,
  WDQAL TEXT IS 'Quantity Allocated' ,
  WDQOR TEXT IS 'Quantity on reserve' ,
  WDQOO TEXT IS 'Quantity on Order' ,
  WDPHYC TEXT IS 'Physical Count' ,
  WDTPEB TEXT IS 'Total of Period End Balance' ,
  WDLRDT TEXT IS 'Date of last receipt' ,
  WDNRDT TEXT IS 'Date of next receipt' ,
  WDLPDT TEXT IS 'Date of last purchase order' ,
  WDEOQ TEXT IS 'Economic order quantity' ,
  WDPHYR TEXT IS 'Physical count on reserve' ,
  WDQBQ TEXT IS 'Quantity on backorder' ,
  WDSTOG TEXT IS 'Stock Turnover Group' ,
  WDNSOP TEXT IS 'Number of Stockouts - Period' ,
  WDNSOY TEXT IS 'Number of Stockouts - Year' ,
  WDNOSP TEXT IS 'No. of Orders Shipped Period' ,
  WDNOSY TEXT IS 'No. of Orders Shipped  Year' ,
  WDNORP TEXT IS 'No. of Orders Received Period' ,
  WDNORY TEXT IS 'No. of Orders Received  Year' ,
  WDCRBY TEXT IS 'Created By' ,
  WDCRDT TEXT IS 'Created Date' ,
  WDLMBY TEXT IS 'Amended By' ,
  WDLMDT TEXT IS 'Amended date' ) ;
