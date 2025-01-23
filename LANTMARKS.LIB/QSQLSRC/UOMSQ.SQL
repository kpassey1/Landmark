--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:53:10
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE UOMSQ (
--  SQL150B   10   REUSEDLT(*NO) in table UOM in KEV ignored.
  UMCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  UMUOM CHAR(5) NOT NULL DEFAULT '' ,
  UMQTYO DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column UMQTYO ignored.
  PRIMARY KEY( UMCOYNO , UMUOM ) )

  RCDFMT UOMF       ;

LABEL ON TABLE UOMSQ
  IS 'IMS Unit of measure         UM' ;

LABEL ON COLUMN UOMSQ
( UMCOYNO IS 'Cpy.' ,
  UMUOM IS 'UOM' ,
  UMQTYO IS 'Qty/Outer' ) ;

LABEL ON COLUMN UOMSQ
( UMCOYNO TEXT IS 'Company number' ,
  UMUOM TEXT IS 'Unit of Measure' ,
  UMQTYO TEXT IS 'Quantity per unit' ) ;
