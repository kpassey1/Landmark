--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:38:26
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STOKGRPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STOKGRP in KEV ignored.
  SGCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SGSGRP CHAR(3) NOT NULL DEFAULT '' ,
  SGSDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( SGCOYNO , SGSGRP ) )

  RCDFMT STOKGRPF   ;

LABEL ON TABLE STOKGRPSQ
  IS 'IMS Stock group codes       SG' ;

LABEL ON COLUMN STOKGRPSQ
( SGCOYNO IS 'Cpy.' ,
  SGSGRP IS 'Stock|Group' ,
  SGSDESC IS 'Description' ) ;

LABEL ON COLUMN STOKGRPSQ
( SGCOYNO TEXT IS 'Company number' ,
  SGSGRP TEXT IS 'Stock Group' ,
  SGSDESC TEXT IS 'Stock Group Description' ) ;
