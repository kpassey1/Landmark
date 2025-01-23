--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:43:38
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE VATCODSQ (
--  SQL150B   10   REUSEDLT(*NO) in table VATCOD in KEV ignored.
  VCCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  VCVATC CHAR(2) NOT NULL DEFAULT '' ,
  VCDESC CHAR(40) NOT NULL DEFAULT '' ,
  VCVATR DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column VCVATR ignored.
  PRIMARY KEY( VCCOYNO , VCVATC ) )

  RCDFMT VATCODF    ;

LABEL ON TABLE VATCODSQ
  IS 'IMS VAT code' ;

LABEL ON COLUMN VATCODSQ
( VCCOYNO IS 'Cpy.' ,
  VCVATC IS 'VAT' ,
  VCDESC IS 'Description' ,
  VCVATR IS 'VAT rate' ) ;

LABEL ON COLUMN VATCODSQ
( VCCOYNO TEXT IS 'Company number' ,
  VCVATC TEXT IS 'VAT Code' ,
  VCDESC TEXT IS 'Description' ,
  VCVATR TEXT IS 'Vat rate' ) ;
