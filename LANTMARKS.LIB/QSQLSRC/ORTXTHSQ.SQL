--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 11:02:14
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORTXTHSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORTXTH in KEV ignored.
--  SQL1506   30   Key or attribute for ORTXTH in KEV ignored.
  THCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  THSONO CHAR(7) NOT NULL DEFAULT '' ,
  THSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column THSEQ ignored.
  THAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column THAUD ignored.
  THPOSF CHAR(1) NOT NULL DEFAULT '' ,
  THDSPF CHAR(1) NOT NULL DEFAULT '' ,
  THINVF CHAR(1) NOT NULL DEFAULT '' ,
  THTEXT CHAR(40) NOT NULL DEFAULT '' ,
  THAKNF CHAR(1) NOT NULL DEFAULT '' )

  RCDFMT ORTXTHF    ;

LABEL ON TABLE ORTXTHSQ
  IS 'SOP Order Header Text       TH' ;

LABEL ON COLUMN ORTXTHSQ
( THCOYNO IS 'Cpy.' ,
  THSONO IS 'Order|Number' ,
  THSEQ IS 'Seq' ,
  THAUD IS 'Audit number' ,
  THPOSF IS 'Position' ,
  THDSPF IS 'Yes/No' ,
  THINVF IS 'Yes/No' ,
  THTEXT IS 'Text' ,
  THAKNF IS 'Yes/No' ) ;

LABEL ON COLUMN ORTXTHSQ
( THCOYNO TEXT IS 'Company number' ,
  THSONO TEXT IS 'S.O.Number' ,
  THSEQ TEXT IS 'Sequence' ,
  THAUD TEXT IS 'Audit number' ,
  THPOSF TEXT IS 'Position Flag for Documents' ,
  THDSPF TEXT IS 'Despatch Flag' ,
  THINVF TEXT IS 'Invoice Flag' ,
  THTEXT TEXT IS 'Comment Text' ,
  THAKNF TEXT IS 'Acknowledgement Flag' ) ;
