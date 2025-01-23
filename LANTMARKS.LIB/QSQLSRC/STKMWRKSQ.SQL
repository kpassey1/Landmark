--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:25:29
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STKMWRKSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STKMWRK in  ignored.
  WKSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKSEQ ignored.
  WKWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WKITEM CHAR(20) NOT NULL DEFAULT '' ,
  WKTQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKTQTY ignored.
  WKTREF CHAR(15) NOT NULL DEFAULT '' ,
  WKUCST DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKUCST ignored.
  PRIMARY KEY( WKSEQ ) )

  RCDFMT STKMWRKF   ;

LABEL ON TABLE STKMWRKSQ
  IS 'IMS Stock movement work fileWK' ;

LABEL ON COLUMN STKMWRKSQ
( WKSEQ IS 'Seq' ,
  WKWHSE IS 'Whse|No.' ,
  WKITEM IS 'Item Number' ,
  WKTQTY IS 'Counted Qty' ,
  WKTREF IS 'TR. Reference' ,
  WKUCST IS 'Purchase            Price' ) ;

LABEL ON COLUMN STKMWRKSQ
( WKSEQ TEXT IS 'Sequence Number' ,
  WKWHSE TEXT IS 'To Warehouse Number' ,
  WKITEM TEXT IS 'Item Number' ,
  WKTQTY TEXT IS 'Transaction Quantity' ,
  WKTREF TEXT IS 'Transaction Reference' ,
  WKUCST TEXT IS 'Input Unit Cost' ) ;
