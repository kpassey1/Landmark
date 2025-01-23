--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:27:25
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STOKMOVSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STOKMOV in KEV ignored.
--  SQL1506   30   Key or attribute for STOKMOV in KEV ignored.
  STCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  STWHSE CHAR(3) NOT NULL DEFAULT '' ,
  STITEM CHAR(20) NOT NULL DEFAULT '' ,
  STLOCN CHAR(10) NOT NULL DEFAULT '' ,
  STDTTR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column STDTTR ignored.
  STTTYP CHAR(2) NOT NULL DEFAULT '' ,
  STDTAC NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column STDTAC ignored.
  STTQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column STTQTY ignored.
  STTREF CHAR(15) NOT NULL DEFAULT '' ,
  STUCST DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column STUCST ignored.
  STPCKL CHAR(1) NOT NULL DEFAULT '' ,
  STSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column STSEQ ignored.
  STWHST CHAR(3) NOT NULL DEFAULT '' ,
  STLOCT CHAR(10) NOT NULL DEFAULT '' ,
  STTIME DECIMAL(6, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column STTIME ignored.
  STSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  STBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  STWEIG DECIMAL(13, 2) NOT NULL DEFAULT 0 )

  RCDFMT STOKMOVF   ;
--  SQL150D   10   EDTCDE in column STWEIG ignored.

LABEL ON TABLE STOKMOVSQ
  IS 'IMS Stock movement history  ST' ;

LABEL ON COLUMN STOKMOVSQ
( STCOYNO IS 'Cpy.' ,
  STWHSE IS 'Whse|No.' ,
  STITEM IS 'Item Number' ,
  STLOCN IS 'Location' ,
  STDTTR IS 'Transact|Date' ,
  STTTYP IS 'Trans|Type' ,
  STDTAC IS 'Actual|Date' ,
  STTQTY IS 'Trans Qty' ,
  STTREF IS 'TR. Reference' ,
  STUCST IS 'Unit Cost' ,
  STPCKL IS 'Pick|List' ,
  STSEQ IS 'Seq' ,
  STWHST IS 'Whse|No.' ,
  STLOCT IS 'Location' ,
  STTIME IS 'Expect|Time' ,
  STSUPPN IS 'Supplier' ,
  STBRNBR IS 'Br' ,
  STWEIG IS 'Weight' ) ;

LABEL ON COLUMN STOKMOVSQ
( STCOYNO TEXT IS 'Company number' ,
  STWHSE TEXT IS 'Warehouse Number' ,
  STITEM TEXT IS 'Item Number' ,
  STLOCN TEXT IS 'Location' ,
  STDTTR TEXT IS 'Transaction Date' ,
  STTTYP TEXT IS 'Transaction Type' ,
  STDTAC TEXT IS 'Actual Date' ,
  STTQTY TEXT IS 'Transaction Quantity' ,
  STTREF TEXT IS 'Transaction Reference' ,
  STUCST TEXT IS 'Unit Cost' ,
  STPCKL TEXT IS 'Picking List Y/N' ,
  STSEQ TEXT IS 'Picking List No.' ,
  STWHST TEXT IS 'Other Warehouse' ,
  STLOCT TEXT IS 'Other Location' ,
  STTIME TEXT IS 'Expected Time' ,
  STSUPPN TEXT IS 'Supplier Number' ,
  STBRNBR TEXT IS 'Branch Number' ,
  STWEIG TEXT IS 'Weight' ) ;
