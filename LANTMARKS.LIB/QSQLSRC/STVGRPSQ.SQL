--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:49:44
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STVGRPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STVGRP in KEV ignored.
  VGCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  VGSVALG CHAR(1) NOT NULL DEFAULT '' ,
  VGDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( VGCOYNO , VGSVALG ) )

  RCDFMT STVGRPF    ;

LABEL ON TABLE STVGRPSQ
  IS 'IMS Stock value group       VG' ;

LABEL ON COLUMN STVGRPSQ
( VGCOYNO IS 'Cpy.' ,
  VGSVALG IS 'Stck|Val grp' ,
  VGDESC IS 'Description' ) ;

LABEL ON COLUMN STVGRPSQ
( VGCOYNO TEXT IS 'Company number' ,
  VGSVALG TEXT IS 'Stock Value Group' ,
  VGDESC TEXT IS 'Stock Value Description' ) ;
