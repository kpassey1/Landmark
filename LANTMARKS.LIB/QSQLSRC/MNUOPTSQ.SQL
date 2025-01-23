--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:07:41
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MNUOPTSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MNUOPT in KEV ignored.
  MCUSER CHAR(10) NOT NULL DEFAULT '' ,
  MCMNUC CHAR(5) NOT NULL DEFAULT '' ,
  MCOPTC CHAR(5) NOT NULL DEFAULT '' ,
  MCOPTD CHAR(50) NOT NULL DEFAULT '' ,
  MCPGMN CHAR(10) NOT NULL DEFAULT '' ,
  MCPRM1 CHAR(50) NOT NULL DEFAULT '' ,
  MCPRM2 CHAR(50) NOT NULL DEFAULT '' ,
  MCPRM3 CHAR(50) NOT NULL DEFAULT '' ,
  MCPRM4 CHAR(50) NOT NULL DEFAULT '' ,
  MCACTA CHAR(1) NOT NULL DEFAULT '' ,
  MCACTR CHAR(1) NOT NULL DEFAULT '' ,
  MCACTD CHAR(1) NOT NULL DEFAULT '' ,
  MCPGMT CHAR(1) NOT NULL DEFAULT '' ,
  MCSPGM CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MCUSER , MCMNUC , MCOPTC ) )

  RCDFMT MNUOPTF    ;

LABEL ON TABLE MNUOPTSQ
  IS 'Menu Options                MC' ;

LABEL ON COLUMN MNUOPTSQ
( MCUSER IS 'User' ,
  MCMNUC IS 'Menu' ,
  MCOPTC IS 'Option' ,
  MCOPTD IS 'Option Description' ,
  MCPGMN IS 'Program|Name' ,
  MCPRM1 IS 'Parameter' ,
  MCPRM2 IS 'Parameter' ,
  MCPRM3 IS 'Parameter' ,
  MCPRM4 IS 'Parameter' ,
  MCACTA IS 'Add|Delete|Revise' ,
  MCACTR IS 'Add|Delete|Revise' ,
  MCACTD IS 'Add|Delete|Revise' ,
  MCPGMT IS 'Pgm|Type' ,
  MCSPGM IS 'Program|Name' ) ;

LABEL ON COLUMN MNUOPTSQ
( MCUSER TEXT IS 'User' ,
  MCMNUC TEXT IS 'Menu' ,
  MCOPTC TEXT IS 'Option' ,
  MCOPTD TEXT IS 'Option Description' ,
  MCPGMN TEXT IS 'Program Name' ,
  MCPRM1 TEXT IS 'Parameter' ,
  MCPRM2 TEXT IS 'Parameter' ,
  MCPRM3 TEXT IS 'Parameter' ,
  MCPRM4 TEXT IS 'Parameter' ,
  MCACTA TEXT IS 'Add' ,
  MCACTR TEXT IS 'Revise' ,
  MCACTD TEXT IS 'Delete' ,
  MCPGMT TEXT IS 'Program Type' ,
  MCSPGM TEXT IS 'Secondary Program Name' ) ;
