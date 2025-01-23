--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 12:38:06
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CRCRDSSQ (
  CRCOYN CHAR(3) NOT NULL DEFAULT '' ,
  CRINVN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  CRACNO CHAR(6) NOT NULL DEFAULT '' ,
  CRBRAN CHAR(3) NOT NULL DEFAULT '' ,
  CRCCCD CHAR(3) NOT NULL DEFAULT '' ,
  CRCCNO CHAR(20) NOT NULL DEFAULT '' ,
  CRCEXD NUMERIC(4, 0) NOT NULL DEFAULT 0 ,
  CRIDTE NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  CRNETT DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
  CRPROC CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CRCOYN , CRINVN ) )

  RCDFMT CRCRDSF    ;

LABEL ON TABLE CRCRDSSQ
  IS 'SOP Credit Card Sales.' ;

LABEL ON COLUMN CRCRDSSQ
( CRCOYN IS 'Cpy.' ,
  CRACNO IS 'Cust No.' ,
  CRBRAN IS 'Br' ,
  CRCCCD IS 'Credit|Card Code' ,
  CRCEXD IS 'Credit Card|Month Ye' ,
  CRIDTE IS 'Date' ,
  CRNETT IS 'VALUE' ,
  CRPROC IS 'Yes/No' ) ;

LABEL ON COLUMN CRCRDSSQ
( CRCOYN TEXT IS 'Company number' ,
  CRINVN TEXT IS 'Invoice Number' ,
  CRACNO TEXT IS 'Customer Number' ,
  CRBRAN TEXT IS 'Branch Number' ,
  CRCCCD TEXT IS 'Credit Card Code' ,
  CRCCNO TEXT IS 'Credit Card Number' ,
  CRCEXD TEXT IS 'Credit Card Month Year' ,
  CRIDTE TEXT IS 'Invoice/Tax Point Date YYMMDD' ,
  CRNETT TEXT IS 'Taxable Amount' ,
  CRPROC TEXT IS 'Processed Record Flag' ) ;
