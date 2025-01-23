--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 12:44:43
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CRDSTSSQ (
--  SQL150B   10   REUSEDLT(*NO) in table CRDSTS in KEV ignored.
  CSCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CSCSTC CHAR(3) NOT NULL DEFAULT '' ,
  CSDESC CHAR(40) NOT NULL DEFAULT '' ,
  CSCSTP CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CSCOYNO , CSCSTC ) )

  RCDFMT CRDSTSF    ;

LABEL ON TABLE CRDSTSSQ
  IS 'SOP Credit status codes     CS' ;

LABEL ON COLUMN CRDSTSSQ
( CSCOYNO IS 'Cpy.' ,
  CSCSTC IS 'Credit|Status' ,
  CSDESC IS 'Description' ,
  CSCSTP IS 'Yes/No' ) ;

LABEL ON COLUMN CRDSTSSQ
( CSCOYNO TEXT IS 'Company number' ,
  CSCSTC TEXT IS 'Credit Status Code' ,
  CSDESC TEXT IS 'Description' ,
  CSCSTP TEXT IS 'Stopped Flag' ) ;
