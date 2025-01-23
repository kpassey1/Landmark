--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              27/11/23 14:40:21
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MNUUSRSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MNUUSR in KEV ignored.
  MAUSER CHAR(10) NOT NULL DEFAULT '' ,
  MAGUSER CHAR(10) NOT NULL DEFAULT '' ,
  MAACTA CHAR(1) NOT NULL DEFAULT '' ,
  MAACTR CHAR(1) NOT NULL DEFAULT '' ,
  MAACTD CHAR(1) NOT NULL DEFAULT '' ,
  MAFORN CHAR(20) NOT NULL DEFAULT '' ,
  MASURN CHAR(20) NOT NULL DEFAULT '' ,
  MADFV1 CHAR(10) NOT NULL DEFAULT '' ,
  MADFV2 CHAR(10) NOT NULL DEFAULT '' ,
  MADFV3 CHAR(10) NOT NULL DEFAULT '' ,
  MACHG CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MAUSER ) )

  RCDFMT MNUUSRF    ;

LABEL ON TABLE mnuusrsq
  IS 'Menu Users                  MA' ;

LABEL ON COLUMN mnuusrsq
( MAUSER IS 'User' ,
  MAGUSER IS 'User' ,
  MAACTA IS 'Add|Delete|Revise' ,
  MAACTR IS 'Add|Delete|Revise' ,
  MAACTD IS 'Add|Delete|Revise' ,
  MAFORN IS 'Forename' ,
  MASURN IS 'Surname' ,
  MADFV1 IS 'Default Value for Location' ,
  MADFV2 IS 'Default Value for Location' ,
  MADFV3 IS 'Default Value for Location' ,
  MACHG IS 'Allow               Change' ) ;

LABEL ON COLUMN mnuusrsq
( MAUSER TEXT IS 'User' ,
  MAGUSER TEXT IS 'Group User' ,
  MAACTA TEXT IS 'Add' ,
  MAACTR TEXT IS 'Revise' ,
  MAACTD TEXT IS 'Delete' ,
  MAFORN TEXT IS 'Forename' ,
  MASURN TEXT IS 'Surname' ,
  MADFV1 TEXT IS 'Default Value for Level 1' ,
  MADFV2 TEXT IS 'Default Value for Level 2' ,
  MADFV3 TEXT IS 'Default Value for Level 3' ,
  MACHG TEXT IS 'Allow Change of Location' ) ;
