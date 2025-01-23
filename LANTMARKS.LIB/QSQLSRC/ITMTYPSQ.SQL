--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 15:53:52
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ITMTYPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ITMTYP in KEV ignored.
  BACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  BAITYP CHAR(1) NOT NULL DEFAULT '' ,
  BADESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( BACOYNO , BAITYP ) )

  RCDFMT ITMTYPF    ;

LABEL ON TABLE ITMTYPSQ
  IS 'IMS Item Type               TP' ;

LABEL ON COLUMN ITMTYPSQ
( BACOYNO IS 'Cpy.' ,
  BAITYP IS 'Item|Type' ,
  BADESC IS 'Description' ) ;

LABEL ON COLUMN ITMTYPSQ
( BACOYNO TEXT IS 'Company number' ,
  BAITYP TEXT IS 'Item Type - business area' ,
  BADESC TEXT IS 'Item Type Description' ) ;
