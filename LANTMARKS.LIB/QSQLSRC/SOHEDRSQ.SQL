--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:18:52
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SOHEDRSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SOHEDR in KEV ignored.
  SHCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SHSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SHSEQ ignored.
  SHDESC CHAR(40) NOT NULL DEFAULT '' ,
  SHNCUS DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SHNCUS ignored.
  SHNITM DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SHNITM ignored.
  PRIMARY KEY( SHCOYNO , SHSEQ ) )

  RCDFMT SOHEDRF    ;

LABEL ON TABLE SOHEDRSQ
  IS 'SOP Standing order header   SH' ;

LABEL ON COLUMN SOHEDRSQ
( SHCOYNO IS 'Cpy.' ,
  SHSEQ IS 'Seq' ,
  SHDESC IS 'Description' ,
  SHNCUS IS 'Users in|Program' ,
  SHNITM IS 'Users in|Program' ) ;

LABEL ON COLUMN SOHEDRSQ
( SHCOYNO TEXT IS 'Company number' ,
  SHSEQ TEXT IS 'Sequence' ,
  SHDESC TEXT IS 'Description' ,
  SHNCUS TEXT IS 'Number Of customers' ,
  SHNITM TEXT IS 'Number of items' ) ;
