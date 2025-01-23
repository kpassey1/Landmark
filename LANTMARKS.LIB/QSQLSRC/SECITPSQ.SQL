--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 13:14:55
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SECITPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SECITP in KEV ignored.
  UTCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  UTUSER CHAR(10) NOT NULL DEFAULT '' ,
  UTTRNC CHAR(2) NOT NULL DEFAULT '' ,
  PRIMARY KEY( UTCOYNO , UTUSER , UTTRNC ) )

  RCDFMT SECITPF    ;

LABEL ON TABLE SECITPSQ
  IS 'IMS User allowed types      UT' ;

LABEL ON COLUMN SECITPSQ
( UTCOYNO IS 'Cpy.' ,
  UTUSER IS 'User' ,
  UTTRNC IS 'Trans|Type' ) ;

LABEL ON COLUMN SECITPSQ
( UTCOYNO TEXT IS 'Company number' ,
  UTUSER TEXT IS 'User' ,
  UTTRNC TEXT IS 'Transaction Type' ) ;
