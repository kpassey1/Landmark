--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 15:47:59
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ITMPRCSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ITMPRC in KEV ignored.
  ITCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  ITITEM CHAR(20) NOT NULL DEFAULT '' ,
  ITPRCG CHAR(3) NOT NULL DEFAULT '' ,
  ITPRIN DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITPRIN ignored.
  ITDATN NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ITDATN ignored.
  ITDATL NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ITDATL ignored.
  PRIMARY KEY( ITCOYNO , ITITEM ) )

  RCDFMT ITMPRCF    ;

LABEL ON TABLE ITMPRCSQ
  IS 'SOP Item price details      IP' ;

LABEL ON COLUMN ITMPRCSQ
( ITCOYNO IS 'Cpy.' ,
  ITITEM IS 'Item Number' ,
  ITPRCG IS 'Price|Group' ,
  ITPRIN IS 'Purchase            Price' ,
  ITDATN IS 'Date' ,
  ITDATL IS 'Date' ) ;

LABEL ON COLUMN ITMPRCSQ
( ITCOYNO TEXT IS 'Company number' ,
  ITITEM TEXT IS 'Item Number' ,
  ITPRCG TEXT IS 'Price Group' ,
  ITPRIN TEXT IS 'Next Price' ,
  ITDATN TEXT IS 'Next price date' ,
  ITDATL TEXT IS 'Last price date' ) ;
