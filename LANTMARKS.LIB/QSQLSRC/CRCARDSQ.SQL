--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 12:15:38
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CRCARDSQ (
  CDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CDCCCD CHAR(3) NOT NULL DEFAULT '' ,
  CDNAME CHAR(40) NOT NULL DEFAULT '' ,
  CDCCDG DECIMAL(2, 0) NOT NULL DEFAULT 0 ,
  PRIMARY KEY( CDCOYNO , CDCCCD ) )

  RCDFMT CRCARDF    ;

LABEL ON TABLE CRCARDSQ
  IS 'SOP Credit Card Companies   CD' ;

LABEL ON COLUMN CRCARDSQ
( CDCOYNO IS 'Cpy.' ,
  CDCCCD IS 'Credit|Card Code' ,
  CDNAME IS 'Customer name' ,
  CDCCDG IS 'C.Card Digits' ) ;

LABEL ON COLUMN CRCARDSQ
( CDCOYNO TEXT IS 'Company number' ,
  CDCCCD TEXT IS 'Credit Card Code' ,
  CDNAME TEXT IS 'Credit Card Company Name' ,
  CDCCDG TEXT IS 'Digits in C.Card Number' ) ;
