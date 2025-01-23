--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              27/11/23 14:31:11
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MNUPGMSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MNUPGM in KEV ignored.
  MPPGMN CHAR(10) NOT NULL DEFAULT '' ,
  MPPGMD CHAR(50) NOT NULL DEFAULT '' ,
  MPPGMT CHAR(1) NOT NULL DEFAULT '' ,
  MPPRM1 CHAR(50) NOT NULL DEFAULT '' ,
  MPPRM2 CHAR(50) NOT NULL DEFAULT '' ,
  MPPRM3 CHAR(50) NOT NULL DEFAULT '' ,
  MPPRM4 CHAR(50) NOT NULL DEFAULT '' ,
  MPSPGM CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MPPGMN , MPSPGM ) )

  RCDFMT MNUPGMF    ;

LABEL ON TABLE MNUPGMSQ
  IS 'Program Names               MP' ;

LABEL ON COLUMN MNUPGMSQ
( MPPGMN IS 'Program|Name' ,
  MPPGMD IS 'Description' ,
  MPPGMT IS 'Pgm|Type' ,
  MPPRM1 IS 'Parameter' ,
  MPPRM2 IS 'Parameter' ,
  MPPRM3 IS 'Parameter' ,
  MPPRM4 IS 'Parameter' ,
  MPSPGM IS 'Program|Name' ) ;

LABEL ON COLUMN MNUPGMSQ
( MPPGMN TEXT IS 'Program Name' ,
  MPPGMD TEXT IS 'Program Description' ,
  MPPGMT TEXT IS 'Program Type' ,
  MPPRM1 TEXT IS 'Parameter' ,
  MPPRM2 TEXT IS 'Parameter' ,
  MPPRM3 TEXT IS 'Parameter' ,
  MPPRM4 TEXT IS 'Parameter' ,
  MPSPGM TEXT IS 'Secondary Program Name' ) ;
