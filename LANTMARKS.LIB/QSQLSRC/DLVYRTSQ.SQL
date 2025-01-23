--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 13:47:12
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE DLVYRTSQ (
  DRCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DRDLRC CHAR(3) NOT NULL DEFAULT '' ,
  DRDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( DRCOYNO , DRDLRC ) )

  RCDFMT DLVYRTF    ;

LABEL ON TABLE DLVYRTSQ
  IS 'SOP Delivery route codes    DR' ;

LABEL ON COLUMN DLVYRTSQ
( DRCOYNO IS 'Cpy.' ,
  DRDLRC IS 'Dlvry|Route' ,
  DRDESC IS 'Description' ) ;

LABEL ON COLUMN DLVYRTSQ
( DRCOYNO TEXT IS 'Company number' ,
  DRDLRC TEXT IS 'Delivery Route Code' ,
  DRDESC TEXT IS 'Description' ) ;
