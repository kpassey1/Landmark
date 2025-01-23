--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 11:19:41
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PCKLSTSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PCKLST in KEV ignored.
  PLCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PLSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PLSEQ ignored.
  PLCRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column PLCRDT ignored.
  PLCRBY CHAR(10) NOT NULL DEFAULT '' ,
  PLFWH CHAR(3) NOT NULL DEFAULT '' ,
  PLTWH CHAR(3) NOT NULL DEFAULT '' ,
  PRIMARY KEY( PLCOYNO , PLSEQ ) )

  RCDFMT PCKLSTF    ;

LABEL ON TABLE PCKLSTSQ
  IS 'IMS Picking List            PL' ;

LABEL ON COLUMN PCKLSTSQ
( PLCOYNO IS 'Cpy.' ,
  PLSEQ IS 'Seq' ,
  PLCRDT IS 'Created|date' ,
  PLCRBY IS 'Created By' ,
  PLFWH IS 'Whse|No.' ,
  PLTWH IS 'Whse|No.' ) ;

LABEL ON COLUMN PCKLSTSQ
( PLCOYNO TEXT IS 'Company number' ,
  PLSEQ TEXT IS 'Picking List No.' ,
  PLCRDT TEXT IS 'Created Date' ,
  PLCRBY TEXT IS 'Created By' ,
  PLFWH TEXT IS 'From Warehouse' ,
  PLTWH TEXT IS 'To Warehouse (if transfer)' ) ;
