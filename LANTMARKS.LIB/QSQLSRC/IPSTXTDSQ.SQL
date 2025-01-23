--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 14:33:15
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IPSTXTDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IPSTXTD in KEV ignored.
  TDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TDPORD CHAR(10) NOT NULL DEFAULT '' ,
  TDPOSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDPOSEQ ignored.
  TDSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDSEQ ignored.
  TDTCDE CHAR(1) NOT NULL DEFAULT '' ,
  TDTEXT CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( TDCOYNO , TDPORD , TDPOSEQ , TDSEQ ) )

  RCDFMT IPSTXTDF   ;

LABEL ON TABLE IPSTXTDSQ
  IS 'IPS POD Text Detail' ;

LABEL ON COLUMN IPSTXTDSQ
( TDCOYNO IS 'Cpy.' ,
  TDPORD IS 'P.O.Number' ,
  TDPOSEQ IS 'Seq' ,
  TDSEQ IS 'Seq' ,
  TDTCDE IS 'Text|code' ,
  TDTEXT IS 'Text' ) ;

LABEL ON COLUMN IPSTXTDSQ
( TDCOYNO TEXT IS 'Company number' ,
  TDPORD TEXT IS 'Purchase Order Number' ,
  TDPOSEQ TEXT IS 'Purchase order line' ,
  TDSEQ TEXT IS 'Sequence' ,
  TDTCDE TEXT IS 'Print text code' ,
  TDTEXT TEXT IS 'Text' ) ;
