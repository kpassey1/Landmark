--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 16:39:29
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDDETSQ (
  ODCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  ODSONO CHAR(7) NOT NULL DEFAULT '' ,
  ODSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODSEQ ignored.
  ODAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODAUD ignored.
  ODITEM CHAR(20) NOT NULL DEFAULT '' ,
  ODIDESC CHAR(40) NOT NULL DEFAULT '' ,
  ODWHSE CHAR(3) NOT NULL DEFAULT '' ,
  ODLOCN CHAR(10) NOT NULL DEFAULT '' ,
  ODQORD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODQORD ignored.
  ODQTSH DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODQTSH ignored.
  ODQOBO DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODQOBO ignored.
  ODQSHP DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODQSHP ignored.
  ODUOM CHAR(5) NOT NULL DEFAULT '' ,
  ODUCST DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODUCST ignored.
  ODUPRC DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODUPRC ignored.
  ODVATC CHAR(2) NOT NULL DEFAULT '' ,
  ODCUSCON CHAR(10) NOT NULL DEFAULT '' ,
  ODDISC DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODDISC ignored.
  ODNLAS CHAR(15) NOT NULL DEFAULT '' ,
  ODNLST CHAR(15) NOT NULL DEFAULT '' ,
  ODNLAC CHAR(15) NOT NULL DEFAULT '' ,
  ODNETV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODNETV ignored.
  ODCSTV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODCSTV ignored.
  ODVATV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODVATV ignored.
  ODENTS CHAR(1) NOT NULL DEFAULT '' ,
  ODPCKS CHAR(1) NOT NULL DEFAULT '' ,
  ODINVS CHAR(1) NOT NULL DEFAULT '' ,
  ODACKF CHAR(1) NOT NULL DEFAULT '' ,
  ODMISC CHAR(1) NOT NULL DEFAULT '' ,
  ODLDSD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ODLDSD ignored.
  ODDSPN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ODDSPN ignored.
  ODLIND NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ODLIND ignored.
  ODINVN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  ODJOBN CHAR(10) NOT NULL DEFAULT '' ,
  ODUSD1 CHAR(10) NOT NULL DEFAULT '' ,
  ODUSD2 CHAR(10) NOT NULL DEFAULT '' ,
  ODUSD3 CHAR(10) NOT NULL DEFAULT '' ,
  ODUSD4 CHAR(10) NOT NULL DEFAULT '' ,
  ODUSD5 CHAR(10) NOT NULL DEFAULT '' )

  RCDFMT ORDDETF    ;

LABEL ON TABLE ORDDETSQ
  IS 'SOP Order Details           OD' ;

LABEL ON COLUMN ORDDETSQ
( ODCOYNO IS 'Cpy.' ,
  ODSONO IS 'Order|Number' ,
  ODSEQ IS 'Seq' ,
  ODAUD IS 'Audit number' ,
  ODITEM IS 'Item Number' ,
  ODIDESC IS 'Item Description' ,
  ODWHSE IS 'Whse|No.' ,
  ODLOCN IS 'Location' ,
  ODQORD IS 'Counted Qty' ,
  ODQTSH IS 'Counted Qty' ,
  ODQOBO IS 'Counted Qty' ,
  ODQSHP IS 'Counted Qty' ,
  ODUOM IS 'UOM' ,
  ODUCST IS 'Purchase            Price' ,
  ODUPRC IS 'List Price' ,
  ODVATC IS 'VAT' ,
  ODCUSCON IS 'Cont No.' ,
  ODDISC IS 'Disc %' ,
  ODNLAS IS 'Sales Account' ,
  ODNLST IS 'Stock Account' ,
  ODNLAC IS 'Cost of Sales' ,
  ODNETV IS 'VALUE' ,
  ODCSTV IS 'VALUE' ,
  ODVATV IS 'VALUE' ,
  ODENTS IS 'Entry|Status' ,
  ODPCKS IS 'Picked|Status' ,
  ODINVS IS 'Invoice|Status' ,
  ODACKF IS 'Ack|Printed' ,
  ODMISC IS 'Yes/No' ,
  ODLDSD IS 'Date' ,
  ODDSPN IS 'Despatch|Note' ,
  ODLIND IS 'Date' ,
  ODJOBN IS 'Job|Number' ,
  ODUSD1 IS 'User Field' ,
  ODUSD2 IS 'User Field' ,
  ODUSD3 IS 'User Field' ,
  ODUSD4 IS 'User Field' ,
  ODUSD5 IS 'User Field' ) ;

LABEL ON COLUMN ORDDETSQ
( ODCOYNO TEXT IS 'Company number' ,
  ODSONO TEXT IS 'S.O.Number' ,
  ODSEQ TEXT IS 'Sequence' ,
  ODAUD TEXT IS 'Audit number' ,
  ODITEM TEXT IS 'Item Number' ,
  ODIDESC TEXT IS 'Item Description' ,
  ODWHSE TEXT IS 'Warehouse Number' ,
  ODLOCN TEXT IS 'Location' ,
  ODQORD TEXT IS 'Qty Ordered' ,
  ODQTSH TEXT IS 'Qty To Ship' ,
  ODQOBO TEXT IS 'Qty Backordered' ,
  ODQSHP TEXT IS 'Qty Shipped' ,
  ODUOM TEXT IS 'Unit of Measure' ,
  ODUCST TEXT IS 'Unit Cost' ,
  ODUPRC TEXT IS 'List Price' ,
  ODVATC TEXT IS 'VAT Code' ,
  ODCUSCON TEXT IS 'Contract number' ,
  ODDISC TEXT IS 'Discount %' ,
  ODNLAS TEXT IS 'N/L Sales Account' ,
  ODNLST TEXT IS 'N/L Stock Account' ,
  ODNLAC TEXT IS 'N/L Cost of Sales Account' ,
  ODNETV TEXT IS 'Net value' ,
  ODCSTV TEXT IS 'Cost Value' ,
  ODVATV TEXT IS 'Vat Value' ,
  ODENTS TEXT IS 'Entry Status' ,
  ODPCKS TEXT IS 'Picked Status' ,
  ODINVS TEXT IS 'Invoice Status' ,
  ODACKF TEXT IS 'Acknowledgment printed' ,
  ODMISC TEXT IS 'Miscellaneous Item' ,
  ODLDSD TEXT IS 'Last despatch date' ,
  ODDSPN TEXT IS 'Despatch Note Number' ,
  ODLIND TEXT IS 'Last Invoice Date' ,
  ODINVN TEXT IS 'Invoice Number' ,
  ODJOBN TEXT IS 'Job Number' ,
  ODUSD1 TEXT IS 'User Field 1' ,
  ODUSD2 TEXT IS 'User Field 2' ,
  ODUSD3 TEXT IS 'User Field 3' ,
  ODUSD4 TEXT IS 'User Field 4' ,
  ODUSD5 TEXT IS 'User Field 5' ) ;
