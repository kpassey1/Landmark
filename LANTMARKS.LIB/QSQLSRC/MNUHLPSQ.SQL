--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              27/11/23 14:16:54
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MNUHLPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MNUHLP in KEV ignored.
  MDMNUC CHAR(5) NOT NULL DEFAULT '' ,
  MDOPTC CHAR(5) NOT NULL DEFAULT '' ,
  MDSEQN DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column MDSEQN ignored.
  MDTEXT CHAR(60) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MDMNUC , MDOPTC , MDSEQN ) )

  RCDFMT MNUHLPF    ;

LABEL ON TABLE MNUHLPSQ
  IS 'Menu Help Text              MD' ;

LABEL ON COLUMN MNUHLPSQ
( MDMNUC IS 'Menu' ,
  MDOPTC IS 'Option' ,
  MDSEQN IS 'Seq' ,
  MDTEXT IS 'Text' ) ;

LABEL ON COLUMN MNUHLPSQ
( MDMNUC TEXT IS 'Menu' ,
  MDOPTC TEXT IS 'Option' ,
  MDSEQN TEXT IS 'Sequence Number' ,
  MDTEXT TEXT IS 'Text' ) ;
