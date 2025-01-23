--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:17:32
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SOCATGSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SOCATG in KEV ignored.
  STCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  STSOCT CHAR(3) NOT NULL DEFAULT '' ,
  STDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( STCOYNO , STSOCT ) )

  RCDFMT SOCATGF    ;

LABEL ON TABLE SOCATGSQ
  IS 'SOP Standing Order Category ST' ;

LABEL ON COLUMN SOCATGSQ
( STCOYNO IS 'Cpy.' ,
  STSOCT IS 'Category|Code' ,
  STDESC IS 'Description' ) ;

LABEL ON COLUMN SOCATGSQ
( STCOYNO TEXT IS 'Company number' ,
  STSOCT TEXT IS 'S.O.Category Code' ,
  STDESC TEXT IS 'Description' ) ;
