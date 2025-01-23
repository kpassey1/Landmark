--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 14:10:11
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE INVCOMSQ (
--  SQL150B   10   REUSEDLT(*NO) in table INVCOM in KEV ignored.
  ICCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  ICINVC CHAR(3) NOT NULL DEFAULT '' ,
  ICCOMM CHAR(60) NOT NULL DEFAULT '' ,
  PRIMARY KEY( ICCOYNO , ICINVC ) )

  RCDFMT INVCOMF    ;

LABEL ON TABLE INVCOMSQ
  IS 'SOP Invoice comments        IC' ;

LABEL ON COLUMN INVCOMSQ
( ICCOYNO IS 'Cpy.' ,
  ICINVC IS 'Invoice|Commt Code' ,
  ICCOMM IS 'Comment' ) ;

LABEL ON COLUMN INVCOMSQ
( ICCOYNO TEXT IS 'Company number' ,
  ICINVC TEXT IS 'Invoice Comment code' ,
  ICCOMM TEXT IS 'Invoice Comment' ) ;
