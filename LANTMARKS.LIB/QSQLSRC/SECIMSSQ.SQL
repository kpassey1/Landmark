--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 13:02:33
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SECIMSSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SECIMS in KEV ignored.
  USCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  USUSER CHAR(10) NOT NULL DEFAULT '' ,
  USADD CHAR(1) NOT NULL DEFAULT '' ,
  USDEL CHAR(1) NOT NULL DEFAULT '' ,
  USMAIN CHAR(1) NOT NULL DEFAULT '' ,
  USENQ CHAR(1) NOT NULL DEFAULT '' ,
  USSTKU CHAR(1) NOT NULL DEFAULT '' ,
  USWHSE CHAR(3) NOT NULL DEFAULT '' ,
  USUGRP CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( USCOYNO , USUSER ) )

  RCDFMT SECIMSF    ;

LABEL ON TABLE SECIMSSQ
  IS 'IMS User Security           US' ;

LABEL ON COLUMN SECIMSSQ
( USCOYNO IS 'Cpy.' ,
  USUSER IS 'User' ,
  USADD IS 'Add' ,
  USDEL IS 'Dlt' ,
  USMAIN IS 'Amd' ,
  USENQ IS 'Enq' ,
  USSTKU IS 'Stock|Take' ,
  USWHSE IS 'Whse|No.' ,
  USUGRP IS 'User' ) ;

LABEL ON COLUMN SECIMSSQ
( USCOYNO TEXT IS 'Company number' ,
  USUSER TEXT IS 'User' ,
  USADD TEXT IS 'Add' ,
  USDEL TEXT IS 'Delete' ,
  USMAIN TEXT IS 'Amend' ,
  USENQ TEXT IS 'Enquiry' ,
  USSTKU TEXT IS 'Stock take Update' ,
  USWHSE TEXT IS 'Allowed Warehouse' ,
  USUGRP TEXT IS 'Group User' ) ;
