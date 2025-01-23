--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 15:41:28
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IPSWADDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IPSWADD in KEV ignored.
  PDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PDWHSE CHAR(3) NOT NULL DEFAULT '' ,
  PDLIN1 CHAR(40) NOT NULL DEFAULT '' ,
  PDLIN2 CHAR(40) NOT NULL DEFAULT '' ,
  PDLIN3 CHAR(40) NOT NULL DEFAULT '' ,
  PDLIN4 CHAR(40) NOT NULL DEFAULT '' ,
  PDLIN5 CHAR(40) NOT NULL DEFAULT '' ,
  PDLIN6 CHAR(40) NOT NULL DEFAULT '' ,
  PDPSTCD CHAR(9) NOT NULL DEFAULT '' ,
  PDCONNAM CHAR(20) NOT NULL DEFAULT '' ,
  PDTELEPH CHAR(15) NOT NULL DEFAULT '' ,
  PRIMARY KEY( PDCOYNO , PDWHSE ) )

  RCDFMT IPSWADDF   ;

LABEL ON TABLE IPSWADDSQ
  IS 'IPS Warehouse address      PD' ;

LABEL ON COLUMN IPSWADDSQ
( PDCOYNO IS 'Cpy.' ,
  PDWHSE IS 'Whse|No.' ,
  PDLIN1 IS 'Address Line' ,
  PDLIN2 IS 'Address Line' ,
  PDLIN3 IS 'Address Line' ,
  PDLIN4 IS 'Address Line' ,
  PDLIN5 IS 'Address Line' ,
  PDLIN6 IS 'Address Line' ,
  PDPSTCD IS 'Post cd' ,
  PDCONNAM IS 'Contact' ,
  PDTELEPH IS 'Telephone' ) ;

LABEL ON COLUMN IPSWADDSQ
( PDCOYNO TEXT IS 'Company number' ,
  PDWHSE TEXT IS 'Warehouse Number' ,
  PDLIN1 TEXT IS 'Address Line 1' ,
  PDLIN2 TEXT IS 'Address Line 2' ,
  PDLIN3 TEXT IS 'Address Line 3' ,
  PDLIN4 TEXT IS 'Address Line 4' ,
  PDLIN5 TEXT IS 'Address Line 5' ,
  PDLIN6 TEXT IS 'Address Line 6' ,
  PDPSTCD TEXT IS 'Post code' ,
  PDCONNAM TEXT IS 'Contact name' ,
  PDTELEPH TEXT IS 'Telephone number' ) ;
