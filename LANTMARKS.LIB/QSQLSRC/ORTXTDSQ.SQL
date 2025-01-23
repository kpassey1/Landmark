--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 10:51:14
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORTXTDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORTXTD in KEV ignored.
--  SQL1506   30   Key or attribute for ORTXTD in KEV ignored.
  TDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TDSONO CHAR(7) NOT NULL DEFAULT '' ,
  TDOSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDOSEQ ignored.
  TDCSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDCSEQ ignored.
  TDAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column TDAUD ignored.
  TDTEXT CHAR(40) NOT NULL DEFAULT '' ,
  TDPRTF CHAR(1) NOT NULL DEFAULT '' )

  RCDFMT ORTXTDF    ;

LABEL ON TABLE ORTXTDSQ
  IS 'SOP Order Line Text         TD' ;

LABEL ON COLUMN ORTXTDSQ
( TDCOYNO IS 'Cpy.' ,
  TDSONO IS 'Order|Number' ,
  TDOSEQ IS 'Seq' ,
  TDCSEQ IS 'Seq' ,
  TDAUD IS 'Audit number' ,
  TDTEXT IS 'Text' ,
  TDPRTF IS 'Yes/No' ) ;

LABEL ON COLUMN ORTXTDSQ
( TDCOYNO TEXT IS 'Company number' ,
  TDSONO TEXT IS 'S.O.Number' ,
  TDOSEQ TEXT IS 'Order Line Sequence' ,
  TDCSEQ TEXT IS 'Comment Line Sequence' ,
  TDAUD TEXT IS 'Audit number' ,
  TDTEXT TEXT IS 'Comment Narrative' ,
  TDPRTF TEXT IS 'Print Flag' ) ;
