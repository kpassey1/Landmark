--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 12:55:38
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SALPERSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SALPER in KEV ignored.
  SPCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SPSPER CHAR(3) NOT NULL DEFAULT '' ,
  SPDESC CHAR(40) NOT NULL DEFAULT '' ,
  SPSPC1 DECIMAL(4, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SPSPC1 ignored.
  SPSPC2 DECIMAL(4, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SPSPC2 ignored.
  SPSPC3 DECIMAL(4, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SPSPC3 ignored.
  SPSPC4 DECIMAL(4, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SPSPC4 ignored.
  SPSPC5 DECIMAL(4, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SPSPC5 ignored.
  SPUSD1 CHAR(5) NOT NULL DEFAULT '' ,
  SPUSD2 CHAR(5) NOT NULL DEFAULT '' ,
  SPUSD3 CHAR(5) NOT NULL DEFAULT '' ,
  SPUSD4 CHAR(5) NOT NULL DEFAULT '' ,
  SPUSD5 CHAR(5) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SPCOYNO , SPSPER ) )

  RCDFMT SALPERF    ;

LABEL ON TABLE SALPERSQ
  IS 'SOP Sales Person Codes      SP' ;

LABEL ON COLUMN SALPERSQ
( SPCOYNO IS 'Cpy.' ,
  SPSPER IS 'Salesperson' ,
  SPDESC IS 'Description' ,
  SPSPC1 IS 'Commission' ,
  SPSPC2 IS 'Commission' ,
  SPSPC3 IS 'Commission' ,
  SPSPC4 IS 'Commission' ,
  SPSPC5 IS 'Commission' ,
  SPUSD1 IS 'USDF' ,
  SPUSD2 IS 'USDF' ,
  SPUSD3 IS 'USDF' ,
  SPUSD4 IS 'USDF' ,
  SPUSD5 IS 'USDF' ) ;

LABEL ON COLUMN SALPERSQ
( SPCOYNO TEXT IS 'Company number' ,
  SPSPER TEXT IS 'Salesperson code' ,
  SPDESC TEXT IS 'Salesperson name' ,
  SPSPC1 TEXT IS 'Commission rate 1' ,
  SPSPC2 TEXT IS 'Rate 2' ,
  SPSPC3 TEXT IS 'Rate 3' ,
  SPSPC4 TEXT IS 'Rate 4' ,
  SPSPC5 TEXT IS 'Rate 5' ,
  SPUSD1 TEXT IS 'User Defined 1' ,
  SPUSD2 TEXT IS 'User Defined 2' ,
  SPUSD3 TEXT IS 'User Defined 3' ,
  SPUSD4 TEXT IS 'User Defined 4' ,
  SPUSD5 TEXT IS 'User Defined 5' ) ;
