--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:40:36
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STOKSELSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STOKSEL in KEV ignored.
  SSCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SSSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SSSEQ ignored.
  SSWHSE CHAR(3) NOT NULL DEFAULT '' ,
  SSPCKR CHAR(5) NOT NULL DEFAULT '' ,
  SSLOCN CHAR(10) NOT NULL DEFAULT '' ,
  SSITEM CHAR(20) NOT NULL DEFAULT '' ,
  SSQUANT DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SSQUANT ignored.
  PRIMARY KEY( SSCOYNO , SSSEQ , SSWHSE , SSPCKR , SSLOCN , SSITEM ) )

  RCDFMT STOKSELF   ;

LABEL ON TABLE STOKSELSQ
  IS 'IMS Stocktake items rqustd  SS' ;

LABEL ON COLUMN STOKSELSQ
( SSCOYNO IS 'Cpy.' ,
  SSSEQ IS 'Seq' ,
  SSWHSE IS 'Whse|No.' ,
  SSPCKR IS 'Picking|Route' ,
  SSLOCN IS 'Location' ,
  SSITEM IS 'Item Number' ,
  SSQUANT IS 'Counted Qty' ) ;

LABEL ON COLUMN STOKSELSQ
( SSCOYNO TEXT IS 'Company number' ,
  SSSEQ TEXT IS 'Sequence' ,
  SSWHSE TEXT IS 'Warehouse Number' ,
  SSPCKR TEXT IS 'Picking Route' ,
  SSLOCN TEXT IS 'Location' ,
  SSITEM TEXT IS 'Item Number' ,
  SSQUANT TEXT IS 'Quantity counted' ) ;
