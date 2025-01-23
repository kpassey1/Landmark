--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:51:25
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE TRANCDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table TRANCD in KEV ignored.
  TRCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TRTRNC CHAR(2) NOT NULL DEFAULT '' ,
  TRDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( TRCOYNO , TRTRNC ) )

  RCDFMT TRANCDF    ;

LABEL ON TABLE TRANCDSQ
  IS 'SOP Transaction Codes       TR' ;

LABEL ON COLUMN TRANCDSQ
( TRCOYNO IS 'Cpy.' ,
  TRTRNC IS 'Trans|Type' ,
  TRDESC IS 'Description' ) ;

LABEL ON COLUMN TRANCDSQ
( TRCOYNO TEXT IS 'Company number' ,
  TRTRNC TEXT IS 'Transaction Code' ,
  TRDESC TEXT IS 'Description' ) ;
