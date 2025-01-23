--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:59:24
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WRKPORDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WRKPORD in KEV ignored.
  WKCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WKPORD CHAR(10) NOT NULL DEFAULT '' ,
  WKLINE DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKLINE ignored.
  WKSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKSEQ ignored.
  WKPRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKPRICE ignored.
  WKQRCVD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WKQRCVD ignored.
  WKWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WKITEM CHAR(20) NOT NULL DEFAULT '' ,
  WKLOCN CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( WKCOYNO , WKPORD , WKLINE , WKSEQ ) )

  RCDFMT WRKPORDF   ;

LABEL ON TABLE WRKPORDSQ
  IS 'IPS Receiving Work File     WK' ;

LABEL ON COLUMN WRKPORDSQ
( WKCOYNO IS 'Cpy.' ,
  WKPORD IS 'P.O.Number' ,
  WKLINE IS 'Seq' ,
  WKSEQ IS 'Seq' ,
  WKPRICE IS 'Purchase            Price' ,
  WKQRCVD IS 'Quantity|Received' ,
  WKWHSE IS 'Whse|No.' ,
  WKITEM IS 'Item Number' ,
  WKLOCN IS 'Location' ) ;

LABEL ON COLUMN WRKPORDSQ
( WKCOYNO TEXT IS 'Company number' ,
  WKPORD TEXT IS 'Purchase Order Number' ,
  WKLINE TEXT IS 'Line Number' ,
  WKSEQ TEXT IS 'Auto incr. Sequence' ,
  WKPRICE TEXT IS 'Price' ,
  WKQRCVD TEXT IS 'Quantity Received' ,
  WKWHSE TEXT IS 'Warehouse Number' ,
  WKITEM TEXT IS 'Item Number' ,
  WKLOCN TEXT IS 'Location' ) ;
