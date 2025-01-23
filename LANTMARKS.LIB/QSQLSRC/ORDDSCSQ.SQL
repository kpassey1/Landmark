--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 16:53:35
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDDSCSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDDSC in KEV ignored.
  OSCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  OSORDS CHAR(3) NOT NULL DEFAULT '' ,
  OSDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( OSCOYNO , OSORDS ) )

  RCDFMT ORDDSCF    ;

LABEL ON TABLE ORDDSCSQ
  IS 'SOP Order Descriptions      OS' ;

LABEL ON COLUMN ORDDSCSQ
( OSCOYNO IS 'Cpy.' ,
  OSDESC IS 'Description' ) ;

LABEL ON COLUMN ORDDSCSQ
( OSCOYNO TEXT IS 'Company number' ,
  OSORDS TEXT IS 'Order Description Code' ,
  OSDESC TEXT IS 'Description' ) ;
