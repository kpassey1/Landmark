--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 15:12:47
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IMSCPYDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IMSCPYD in KEV ignored.
  CDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CDHEAD1 CHAR(15) NOT NULL DEFAULT '' ,
  CDCOL1 CHAR(5) NOT NULL DEFAULT '' ,
  CDHEAD2 CHAR(15) NOT NULL DEFAULT '' ,
  CDCOL2 CHAR(5) NOT NULL DEFAULT '' ,
  CDHEAD3 CHAR(15) NOT NULL DEFAULT '' ,
  CDCOL3 CHAR(5) NOT NULL DEFAULT '' ,
  CDCRED CHAR(1) NOT NULL DEFAULT '' ,
  CDTRNP CHAR(2) NOT NULL DEFAULT '' ,
  CDTRNR CHAR(2) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CDCOYNO ) )

  RCDFMT IMSCPYDF   ;

LABEL ON TABLE IMSCPYDSQ
  IS 'IMS Company Details         CD' ;

LABEL ON COLUMN IMSCPYDSQ
( CDCOYNO IS 'Cpy.' ,
  CDHEAD1 IS 'User 1' ,
  CDCOL1 IS 'User 1|Column' ,
  CDHEAD2 IS 'User 2|Heading' ,
  CDCOL2 IS 'User 2|Column' ,
  CDHEAD3 IS 'User 3|Heading' ,
  CDCOL3 IS 'User 3|Column' ,
  CDCRED IS 'Rdce|Crd' ,
  CDTRNP IS 'Trans|Type' ,
  CDTRNR IS 'Trans|Type' ) ;

LABEL ON COLUMN IMSCPYDSQ
( CDCOYNO TEXT IS 'Company number' ,
  CDHEAD1 TEXT IS 'User Field 1 Heading' ,
  CDCOL1 TEXT IS 'User Field 1 Column' ,
  CDHEAD2 TEXT IS 'User Field 2 Heading' ,
  CDCOL2 TEXT IS 'User Field 2 Column' ,
  CDHEAD3 TEXT IS 'User Field 3 Heading' ,
  CDCOL3 TEXT IS 'User Field 3 Column' ,
  CDCRED TEXT IS 'Reduce stock for credits (Y/N)' ,
  CDTRNP TEXT IS 'Purchasing Trans' ,
  CDTRNR TEXT IS 'Receiving Trans' ) ;
