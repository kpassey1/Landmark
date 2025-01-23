--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:23:53
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STANYSSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STANYS in KEV ignored.
  SACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SASANL CHAR(1) NOT NULL DEFAULT '' ,
  SADESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SACOYNO , SASANL ) )

  RCDFMT STANYSF    ;

LABEL ON TABLE STANYSSQ
  IS 'IMS Stock analysis codes    SA' ;

LABEL ON COLUMN STANYSSQ
( SACOYNO IS 'Cpy.' ,
  SASANL IS 'Stck|Anlys' ,
  SADESC IS 'Description' ) ;

LABEL ON COLUMN STANYSSQ
( SACOYNO TEXT IS 'Company number' ,
  SASANL TEXT IS 'Stock Analysis Code' ,
  SADESC TEXT IS 'Stock Analysis Desc.' ) ;
