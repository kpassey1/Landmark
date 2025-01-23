--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 16:59:18
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDHEDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDHED in KEV ignored.
--  SQL1506   30   Key or attribute for ORDHED in KEV ignored.
  OHCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  OHSONO CHAR(7) NOT NULL DEFAULT '' ,
  OHAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHAUD ignored.
  OHCUST CHAR(6) NOT NULL DEFAULT '' ,
  OHBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  OHCUSORD CHAR(15) NOT NULL DEFAULT '' ,
  OHORDS CHAR(3) NOT NULL DEFAULT '' ,
  OHCUSCON CHAR(10) NOT NULL DEFAULT '' ,
  OHSPER CHAR(3) NOT NULL DEFAULT '' ,
  OHRELA CHAR(1) NOT NULL DEFAULT '' ,
  OHCHLD CHAR(1) NOT NULL DEFAULT '' ,
  OHNITM DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHNITM ignored.
  OHTQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHTQTY ignored.
  OHENTS CHAR(1) NOT NULL DEFAULT '' ,
  OHPCKS CHAR(1) NOT NULL DEFAULT '' ,
  OHINVS CHAR(1) NOT NULL DEFAULT '' ,
  OHACKF CHAR(1) NOT NULL DEFAULT '' ,
  OHSSEQ DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
  OHISEQ DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
  OHPAYD DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHPAYD ignored.
  OHPAYC CHAR(1) NOT NULL DEFAULT '' ,
  OHTRNC CHAR(2) NOT NULL DEFAULT '' ,
  OHNETV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHNETV ignored.
  OHCSTV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHCSTV ignored.
  OHVATV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OHVATV ignored.
  OHENTD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHENTD ignored.
  OHORDD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHORDD ignored.
  OHFWDD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHFWDD ignored.
  OHFDSD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHFDSD ignored.
  OHLDSD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHLDSD ignored.
  OHFIND NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHFIND ignored.
  OHLIND NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHLIND ignored.
  OHCMPD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHCMPD ignored.
  OHIMFO CHAR(1) NOT NULL DEFAULT '' ,
  OHJOBN CHAR(10) NOT NULL DEFAULT '' ,
  OHWKST CHAR(10) NOT NULL DEFAULT '' ,
  OHUSER CHAR(10) NOT NULL DEFAULT '' ,
  OHPORD CHAR(10) NOT NULL DEFAULT '' ,
  OHSRTD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHSRTD ignored.
  OHPFED NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column OHPFED ignored.
  OHCCCD CHAR(3) NOT NULL DEFAULT '' ,
  OHCCNO CHAR(20) NOT NULL DEFAULT '' ,
  OHCEXD NUMERIC(4, 0) NOT NULL DEFAULT 0 )

  RCDFMT ORDHEDF    ;

LABEL ON TABLE ORDHEDSQ
  IS 'SOP Order Header            OH' ;

LABEL ON COLUMN ORDHEDSQ
( OHCOYNO IS 'Cpy.' ,
  OHSONO IS 'Order|Number' ,
  OHAUD IS 'Audit number' ,
  OHCUST IS 'Cust No.' ,
  OHBRNBR IS 'Br' ,
  OHCUSORD IS 'Cus Order No.' ,
  OHCUSCON IS 'Cont No.' ,
  OHSPER IS 'Salesperson' ,
  OHRELA IS 'Yes/No' ,
  OHCHLD IS 'Yes/No' ,
  OHNITM IS 'Seq' ,
  OHTQTY IS 'Counted Qty' ,
  OHENTS IS 'Entry|Status' ,
  OHPCKS IS 'Picked|Status' ,
  OHINVS IS 'Invoice|Status' ,
  OHACKF IS 'Ack|Printed' ,
  OHSSEQ IS 'Alt Address Seq' ,
  OHISEQ IS 'Alt Address Seq' ,
  OHPAYD IS 'Payment|Days' ,
  OHPAYC IS 'Payment|Code' ,
  OHTRNC IS 'Trans|Type' ,
  OHNETV IS 'VALUE' ,
  OHCSTV IS 'VALUE' ,
  OHVATV IS 'VALUE' ,
  OHENTD IS 'Date' ,
  OHORDD IS 'Date' ,
  OHFWDD IS 'Date' ,
  OHFDSD IS 'Date' ,
  OHLDSD IS 'Date' ,
  OHFIND IS 'Date' ,
  OHLIND IS 'Date' ,
  OHCMPD IS 'Date' ,
  OHIMFO IS 'Yes/No' ,
  OHJOBN IS 'Job|Number' ,
  OHWKST IS 'User' ,
  OHUSER IS 'User' ,
  OHPORD IS 'P.O.Number' ,
  OHSRTD IS 'Date' ,
  OHPFED IS 'Date' ,
  OHCCCD IS 'Credit|Card Code' ,
  OHCEXD IS 'Credit Card|Month Ye' ) ;

LABEL ON COLUMN ORDHEDSQ
( OHCOYNO TEXT IS 'Company number' ,
  OHSONO TEXT IS 'S.O.Number' ,
  OHAUD TEXT IS 'Audit number' ,
  OHCUST TEXT IS 'Customer Number' ,
  OHBRNBR TEXT IS 'Branch Number' ,
  OHCUSORD TEXT IS 'Customer order number' ,
  OHORDS TEXT IS 'Order Description Code' ,
  OHCUSCON TEXT IS 'Contract number' ,
  OHSPER TEXT IS 'Salesperson code' ,
  OHRELA TEXT IS 'Release Authority' ,
  OHCHLD TEXT IS 'Credit Held' ,
  OHNITM TEXT IS 'Number of Items' ,
  OHTQTY TEXT IS 'Total Order Qty' ,
  OHENTS TEXT IS 'Entry Status' ,
  OHPCKS TEXT IS 'Picked Status' ,
  OHINVS TEXT IS 'Invoice Status' ,
  OHACKF TEXT IS 'Acknowledgment printed' ,
  OHSSEQ TEXT IS 'Shipped to seq' ,
  OHISEQ TEXT IS 'Invoiced to Seq' ,
  OHPAYD TEXT IS 'Payment Days' ,
  OHPAYC TEXT IS 'Payment Code' ,
  OHTRNC TEXT IS 'Transaction Code' ,
  OHNETV TEXT IS 'Total Net' ,
  OHCSTV TEXT IS 'Total Cost' ,
  OHVATV TEXT IS 'Total Vat' ,
  OHENTD TEXT IS 'Entered Date' ,
  OHORDD TEXT IS 'Order Date' ,
  OHFWDD TEXT IS 'Forward Order Date' ,
  OHFDSD TEXT IS 'First Despatch Date' ,
  OHLDSD TEXT IS 'Last Despatch date.' ,
  OHFIND TEXT IS 'First Invoice Date' ,
  OHLIND TEXT IS 'Last Invoice Date' ,
  OHCMPD TEXT IS 'Completed Date' ,
  OHIMFO TEXT IS 'Immed. Allocate Forward' ,
  OHJOBN TEXT IS 'Job Number' ,
  OHWKST TEXT IS 'Workstn' ,
  OHUSER TEXT IS 'User' ,
  OHPORD TEXT IS 'Purchase Order Number' ,
  OHSRTD TEXT IS 'Sale or return by date' ,
  OHPFED TEXT IS 'Pro forma expiry date' ,
  OHCCCD TEXT IS 'Credit Card Code' ,
  OHCCNO TEXT IS 'Credit Card Number' ,
  OHCEXD TEXT IS 'Credit Card Month Year' ) ;
