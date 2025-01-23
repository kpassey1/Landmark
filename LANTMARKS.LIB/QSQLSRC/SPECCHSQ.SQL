--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:22:37
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SPECCHSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SPECCH in KEV ignored.
  SCCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SCSCHC CHAR(3) NOT NULL DEFAULT '' ,
  SCDESC CHAR(40) NOT NULL DEFAULT '' ,
  SCCHGV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SCCHGV ignored.
  SCNLAS CHAR(15) NOT NULL DEFAULT '' ,
  SCCHDB CHAR(1) NOT NULL DEFAULT '' ,
  SCVATC CHAR(2) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SCCOYNO , SCSCHC ) )

  RCDFMT SPECCHF    ;

LABEL ON TABLE SPECCHSQ
  IS 'SOP Special Charge Code     SC' ;

LABEL ON COLUMN SPECCHSQ
( SCCOYNO IS 'Cpy.' ,
  SCSCHC IS 'Special|Charge' ,
  SCDESC IS 'Description' ,
  SCCHGV IS 'VALUE' ,
  SCNLAS IS 'Sales Account' ,
  SCCHDB IS 'Yes/No' ,
  SCVATC IS 'VAT' ) ;

LABEL ON COLUMN SPECCHSQ
( SCCOYNO TEXT IS 'Company number' ,
  SCSCHC TEXT IS 'Special Charge Code' ,
  SCDESC TEXT IS 'Description' ,
  SCCHGV TEXT IS 'Charge Value' ,
  SCNLAS TEXT IS 'Charge Sales Account' ,
  SCCHDB TEXT IS 'Discount Bypass' ,
  SCVATC TEXT IS 'VAT Code' ) ;
