--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 16:21:14
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MNUHEDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MNUHED in KEV ignored.
  MBUSER CHAR(10) NOT NULL DEFAULT '' ,
  MBMNUC CHAR(5) NOT NULL DEFAULT '' ,
  MBMNUD CHAR(50) NOT NULL DEFAULT '' ,
  MBSTRT CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MBUSER , MBMNUC ) )

  RCDFMT MNUHEDF    ;

LABEL ON TABLE MNUHEDSQ
  IS 'Menu Heading file           MB' ;

LABEL ON COLUMN MNUHEDSQ
( MBUSER IS 'User' ,
  MBMNUC IS 'Menu' ,
  MBMNUD IS 'Menu Description' ,
  MBSTRT IS 'Start Menu' ) ;

LABEL ON COLUMN MNUHEDSQ
( MBUSER TEXT IS 'User' ,
  MBMNUC TEXT IS 'Menu' ,
  MBMNUD TEXT IS 'Menu Description' ,
  MBSTRT TEXT IS 'Start Menu' ) ;
