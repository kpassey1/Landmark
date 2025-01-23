--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 13:27:23
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SHIPINSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SHIPIN in KEV ignored.
  SICOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SISHPC CHAR(3) NOT NULL DEFAULT '' ,
  SISHPT1 CHAR(60) NOT NULL DEFAULT '' ,
  SISHPT2 CHAR(60) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SICOYNO , SISHPC ) )

  RCDFMT SHIPINF    ;

LABEL ON TABLE SHIPINSQ
  IS 'SOP Shipping Ins. Codes     SI' ;

LABEL ON COLUMN SHIPINSQ
( SICOYNO IS 'Cpy.' ,
  SISHPC IS 'Shipping|Code' ,
  SISHPT1 IS 'Shipping Inst.' ,
  SISHPT2 IS 'Shipping Inst.' ) ;

LABEL ON COLUMN SHIPINSQ
( SICOYNO TEXT IS 'Company number' ,
  SISHPC TEXT IS 'Shipping Instructions code' ,
  SISHPT1 TEXT IS 'Shipping intructions Line 1' ,
  SISHPT2 TEXT IS 'Shipping intructions Line 2' ) ;
