--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:50:26
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SUPLIERSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SUPLIER in KEV ignored.
  SUCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SUSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  SUBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  SUNAME CHAR(40) NOT NULL DEFAULT '' ,
  SULIN1 CHAR(40) NOT NULL DEFAULT '' ,
  SULIN2 CHAR(40) NOT NULL DEFAULT '' ,
  SULIN3 CHAR(40) NOT NULL DEFAULT '' ,
  SULIN4 CHAR(40) NOT NULL DEFAULT '' ,
  SULIN5 CHAR(40) NOT NULL DEFAULT '' ,
  SULIN6 CHAR(40) NOT NULL DEFAULT '' ,
  SUPSTCD CHAR(9) NOT NULL DEFAULT '' ,
  SUCONNAM CHAR(20) NOT NULL DEFAULT '' ,
  SUTELEPH CHAR(15) NOT NULL DEFAULT '' ,
  SUFAX CHAR(15) NOT NULL DEFAULT '' ,
  SUCURR CHAR(3) NOT NULL DEFAULT '' ,
  SUALPHA CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SUCOYNO , SUSUPPN , SUBRNBR ) )

  RCDFMT SUPLIERF   ;

LABEL ON TABLE SUPLIERSQ
  IS 'IMS Supplier Master         SU' ;

LABEL ON COLUMN SUPLIERSQ
( SUCOYNO IS 'Cpy.' ,
  SUSUPPN IS 'Supplier' ,
  SUBRNBR IS 'Br' ,
  SUNAME IS 'Customer name' ,
  SULIN1 IS 'Address' ,
  SULIN2 IS 'Address 2' ,
  SULIN3 IS 'Address 3' ,
  SULIN4 IS 'Address 4' ,
  SULIN5 IS 'Address 5' ,
  SULIN6 IS 'Address 6' ,
  SUPSTCD IS 'Post cd' ,
  SUCONNAM IS 'Contact' ,
  SUTELEPH IS 'Telephone' ,
  SUFAX IS 'Fax' ,
  SUCURR IS 'Ccy|Code' ,
  SUALPHA IS 'Alpha search' ) ;

LABEL ON COLUMN SUPLIERSQ
( SUCOYNO TEXT IS 'Company number' ,
  SUSUPPN TEXT IS 'Supplier Number' ,
  SUBRNBR TEXT IS 'Branch Number' ,
  SUNAME TEXT IS 'Customer name' ,
  SULIN1 TEXT IS 'Address' ,
  SULIN2 TEXT IS 'Line 2' ,
  SULIN3 TEXT IS 'Line 3' ,
  SULIN4 TEXT IS 'Line 4' ,
  SULIN5 TEXT IS 'Line 5' ,
  SULIN6 TEXT IS 'Line 6' ,
  SUPSTCD TEXT IS 'Post code' ,
  SUCONNAM TEXT IS 'Contact name' ,
  SUTELEPH TEXT IS 'Telephone number' ,
  SUFAX TEXT IS 'Fax number' ,
  SUCURR TEXT IS 'Currency code' ,
  SUALPHA TEXT IS 'Alpha Search' ) ;
