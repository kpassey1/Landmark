--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              04/11/23 13:47:01
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE AREACDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table AREACD in KEV ignored.
  ARCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  ARAREA CHAR(3) NOT NULL DEFAULT '' ,
  ARDESC CHAR(20) NOT NULL DEFAULT '' ,
  PRIMARY KEY( ARCOYNO , ARAREA ) )

  RCDFMT AREACDF    ;

LABEL ON TABLE AREACDSQ
  IS 'SOP Area codes              AR' ;

LABEL ON COLUMN AREACDSQ
( ARCOYNO IS 'Cpy.' ,
  ARAREA IS 'Area|Code' ,
  ARDESC IS 'Parm. Desc.' ) ;

LABEL ON COLUMN AREACDSQ
( ARCOYNO TEXT IS 'Company number' ,
  ARAREA TEXT IS 'Area code' ,
  ARDESC TEXT IS 'Area Description' ) ;

