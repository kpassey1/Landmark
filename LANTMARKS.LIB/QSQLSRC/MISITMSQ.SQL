--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 16:12:08
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE MISITMSQ (
--  SQL150B   10   REUSEDLT(*NO) in table MISITM in KEV ignored.
  MICOYNO CHAR(3) NOT NULL DEFAULT '' ,
  MIITEM CHAR(20) NOT NULL DEFAULT '' ,
  MIDESC CHAR(40) NOT NULL DEFAULT '' ,
  MIVATC CHAR(2) NOT NULL DEFAULT '' ,
  MIUOM CHAR(5) NOT NULL DEFAULT '' ,
  MINLAC CHAR(15) NOT NULL DEFAULT '' ,
  MINLST CHAR(15) NOT NULL DEFAULT '' ,
  MINLAS CHAR(15) NOT NULL DEFAULT '' ,
  PRIMARY KEY( MICOYNO , MIITEM ) )

  RCDFMT MISITMF    ;

LABEL ON TABLE MISITMSQ
  IS 'SOP Miscellaneous Item File MI' ;

LABEL ON COLUMN MISITMSQ
( MICOYNO IS 'Cpy.' ,
  MIITEM IS 'Item Number' ,
  MIDESC IS 'Description' ,
  MIVATC IS 'VAT' ,
  MIUOM IS 'UOM' ,
  MINLAC IS 'Cost of Sales' ,
  MINLST IS 'Stock Account' ,
  MINLAS IS 'Sales Account' ) ;

LABEL ON COLUMN MISITMSQ
( MICOYNO TEXT IS 'Company number' ,
  MIITEM TEXT IS 'Item Number' ,
  MIDESC TEXT IS 'Description' ,
  MIVATC TEXT IS 'VAT Code' ,
  MIUOM TEXT IS 'Unit of Measure' ,
  MINLAC TEXT IS 'N/L Cost of Sales Account' ,
  MINLST TEXT IS 'N/L Stock Account' ,
  MINLAS TEXT IS 'N/L Sales Account' ) ;
