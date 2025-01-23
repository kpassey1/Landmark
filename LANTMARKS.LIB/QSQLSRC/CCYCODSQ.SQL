--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              04/11/23 13:22:24
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CCYCODSQ (
--  SQL150B   10   REUSEDLT(*NO) in table CCYCOD in KEV ignored.
  CCCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CCCURR CHAR(3) NOT NULL DEFAULT '' ,
  CCDESC CHAR(40) NOT NULL DEFAULT '' ,
  CCEXCC CHAR(1) NOT NULL DEFAULT '' ,
  CCEXCR DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CCEXCR ignored.
  PRIMARY KEY( CCCOYNO , CCCURR ) )

  RCDFMT CCYCODF    ;

LABEL ON TABLE CCYCODSQ
  IS 'IMS Currency Code           CC' ;

LABEL ON COLUMN CCYCODSQ
( CCCOYNO IS 'Cpy.' ,
  CCCURR IS 'Ccy|Code' ,
  CCDESC IS 'Description' ,
  CCEXCC IS 'Exc|calc' ,
  CCEXCR IS 'Exchange Rate' ) ;

LABEL ON COLUMN CCYCODSQ
( CCCOYNO TEXT IS 'Company number' ,
  CCCURR TEXT IS 'Currency code' ,
  CCDESC TEXT IS 'Description' ,
  CCEXCC TEXT IS 'Exchange Calc' ,
  CCEXCR TEXT IS 'Exchange Rate' ) ;
