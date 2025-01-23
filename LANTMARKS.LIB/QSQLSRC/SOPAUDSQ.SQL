--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:20:53
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SOPAUDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SOPAUD in KEV ignored.
  DACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DATYPE CHAR(3) NOT NULL DEFAULT '' ,
  DADESC CHAR(20) NOT NULL DEFAULT '' ,
  DACURR DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column DACURR ignored.
  DAPREV DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column DAPREV ignored.
  DADATE NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column DADATE ignored.
  PRIMARY KEY( DACOYNO , DATYPE ) )

  RCDFMT SOPAUDF    ;

LABEL ON TABLE SOPAUDSQ
  IS 'SOP Docket Audit Number     DA' ;

LABEL ON COLUMN SOPAUDSQ
( DACOYNO IS 'Cpy.' ,
  DATYPE IS 'Sts' ,
  DADESC IS 'Parm. Desc.' ,
  DACURR IS 'Docket|Number' ,
  DAPREV IS 'Docket|Number' ,
  DADATE IS 'Date' ) ;

LABEL ON COLUMN SOPAUDSQ
( DACOYNO TEXT IS 'Company number' ,
  DATYPE TEXT IS 'Record Type' ,
  DADESC TEXT IS 'Type Description' ,
  DACURR TEXT IS 'Current Audit No' ,
  DAPREV TEXT IS 'Previous Audit No.' ,
  DADATE TEXT IS 'Last updated date' ) ;
