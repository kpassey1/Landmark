--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              17/01/24 15:37:22
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IPSTXTHSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IPSTXTH in KEV ignored.
  THCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  THPORD CHAR(10) NOT NULL DEFAULT '' ,
  THSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column THSEQ ignored.
  THTCDE CHAR(1) NOT NULL DEFAULT '' ,
  THTEXT CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( THCOYNO , THPORD , THSEQ ) )

  RCDFMT IPSTXTHF   ;

LABEL ON TABLE IPSTXTHSQ
  IS 'IPS POD Text header         TH' ;

LABEL ON COLUMN IPSTXTHSQ
( THCOYNO IS 'Cpy.' ,
  THPORD IS 'P.O.Number' ,
  THSEQ IS 'Seq' ,
  THTCDE IS 'Text|code' ,
  THTEXT IS 'Text' ) ;

LABEL ON COLUMN IPSTXTHSQ
( THCOYNO TEXT IS 'Company number' ,
  THPORD TEXT IS 'Purchase Order Number' ,
  THSEQ TEXT IS 'Sequence' ,
  THTCDE TEXT IS 'Print text code' ,
  THTEXT TEXT IS 'Text' ) ;
