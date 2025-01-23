--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 13:36:10
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE DELADRSQ (
  DLCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DLCUST CHAR(6) NOT NULL DEFAULT '' ,
  DLBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  DLASEQ DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
  DLNAME CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN1 CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN2 CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN3 CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN4 CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN5 CHAR(40) NOT NULL DEFAULT '' ,
  DLLIN6 CHAR(40) NOT NULL DEFAULT '' ,
  DLPSTCD CHAR(9) NOT NULL DEFAULT '' ,
  DLDTCR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  DLDTAM NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  DLUSER CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( DLCOYNO , DLCUST , DLBRNBR , DLASEQ ) )

  RCDFMT DELADRF    ;

LABEL ON TABLE DELADRSQ
  IS 'SOP Delivery addresses      DL' ;

LABEL ON COLUMN DELADRSQ
( DLCOYNO IS 'Cpy.' ,
  DLCUST IS 'Cust No.' ,
  DLBRNBR IS 'Br' ,
  DLASEQ IS 'Alt Address Seq' ,
  DLNAME IS 'Customer name' ,
  DLLIN1 IS 'Address Line' ,
  DLLIN2 IS 'Address Line' ,
  DLLIN3 IS 'Address Line' ,
  DLLIN4 IS 'Address Line' ,
  DLLIN5 IS 'Address Line' ,
  DLLIN6 IS 'Address Line' ,
  DLPSTCD IS 'Post cd' ,
  DLDTCR IS 'Date' ,
  DLDTAM IS 'Date' ,
  DLUSER IS 'User' ) ;

LABEL ON COLUMN DELADRSQ
( DLCOYNO TEXT IS 'Company number' ,
  DLCUST TEXT IS 'Customer Number' ,
  DLBRNBR TEXT IS 'Branch Number' ,
  DLASEQ TEXT IS 'Alt address Seq' ,
  DLNAME TEXT IS 'Customer name' ,
  DLLIN1 TEXT IS 'Address Line' ,
  DLLIN2 TEXT IS 'Address Line' ,
  DLLIN3 TEXT IS 'Address Line' ,
  DLLIN4 TEXT IS 'Address Line' ,
  DLLIN5 TEXT IS 'Address Line' ,
  DLLIN6 TEXT IS 'Address Line' ,
  DLPSTCD TEXT IS 'Post code' ,
  DLDTCR TEXT IS 'Date record created' ,
  DLDTAM TEXT IS 'Date last amended' ,
  DLUSER TEXT IS 'Last user to amend' ) ;
