--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:58:44
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WRITTYPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WRITTYP in KEV ignored.
  WTCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WTWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WTITEM CHAR(20) NOT NULL DEFAULT '' ,
  WTTRNC CHAR(2) NOT NULL DEFAULT '' ,
  WTTRPQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WTTRPQ ignored.
  WTTRPV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WTTRPV ignored.
  WTTRYQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WTTRYQ ignored.
  WTTRYV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WTTRYV ignored.
  PRIMARY KEY( WTCOYNO , WTWHSE , WTITEM , WTTRNC ) )

  RCDFMT WRITTYPF   ;

LABEL ON TABLE WRITTYPSQ
  IS 'IMS Warehouse Item Types    WT' ;

LABEL ON COLUMN WRITTYPSQ
( WTCOYNO IS 'Cpy.' ,
  WTWHSE IS 'Whse|No.' ,
  WTITEM IS 'Item Number' ,
  WTTRNC IS 'Trans|Type' ,
  WTTRPQ IS 'Period Qty' ,
  WTTRPV IS 'Period Value' ,
  WTTRYQ IS 'YTD Qty' ,
  WTTRYV IS 'YTD Value' ) ;

LABEL ON COLUMN WRITTYPSQ
( WTCOYNO TEXT IS 'Company number' ,
  WTWHSE TEXT IS 'Warehouse Number' ,
  WTITEM TEXT IS 'Item Number' ,
  WTTRNC TEXT IS 'Transaction Type' ,
  WTTRPQ TEXT IS 'Trans Period Quantity' ,
  WTTRPV TEXT IS 'Trans Period Value' ,
  WTTRYQ TEXT IS 'Trans YTD Quantity' ,
  WTTRYV TEXT IS 'Trans YTD Value' ) ;
