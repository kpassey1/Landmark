--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 12:59:52
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IMSPURGESQ (
--  SQL150B   10   REUSEDLT(*NO) in table IMSPURGE in KEV ignored.
  STCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  STWHSE CHAR(3) NOT NULL DEFAULT '' ,
  STITEM CHAR(20) NOT NULL DEFAULT '' ,
  STDTAC NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column STDTAC ignored.
  STDTTR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column STDTTR ignored.
  STTQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column STTQTY ignored.
  STTREF CHAR(15) NOT NULL DEFAULT '' ,
  STTTYP CHAR(2) NOT NULL DEFAULT '' ,
  STUCST DECIMAL(12, 5) NOT NULL DEFAULT 0 )

  RCDFMT STOKMOVF   ;
--  SQL150D   10   EDTCDE in column STUCST ignored.

LABEL ON TABLE IMSPURGESQ
  IS 'IMS Stock Movement History' ;

LABEL ON COLUMN IMSPURGESQ
( STCOYNO IS 'Cpy.' ,
  STWHSE IS 'Whse|No.' ,
  STITEM IS 'Item Number' ,
  STDTAC IS 'Date' ,
  STDTTR IS 'Date' ,
  STTQTY IS 'Counted Qty' ,
  STTREF IS 'TR. Reference' ,
  STTTYP IS 'Transaction|Type' ,
  STUCST IS 'Purchase            Price' ) ;

LABEL ON COLUMN IMSPURGESQ
( STCOYNO TEXT IS 'Company number' ,
  STWHSE TEXT IS 'Warehouse Number' ,
  STITEM TEXT IS 'Item Number' ,
  STDTAC TEXT IS 'Actual Date' ,
  STDTTR TEXT IS 'Transaction Date' ,
  STTQTY TEXT IS 'Transaction Quantity' ,
  STTREF TEXT IS 'Transaction Reference' ,
  STTTYP TEXT IS 'Transaction Type' ,
  STUCST TEXT IS 'Unit Cost' ) ;
