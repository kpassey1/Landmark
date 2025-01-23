--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:56:07
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WAREHEDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WAREHED in KEV ignored.
  WHCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WHWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WHWDESC CHAR(40) NOT NULL DEFAULT '' ,
  WHWTYP CHAR(2) NOT NULL DEFAULT '' ,
  WHCTYP DECIMAL(1, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WHCTYP ignored.
  WHDTLC NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WHDTLC ignored.
  WHREPC CHAR(1) NOT NULL DEFAULT '' ,
  WHVALU DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WHVALU ignored.
  WHDTNR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WHDTNR ignored.
  WHDTLR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WHDTLR ignored.
  WHCRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WHCRDT ignored.
  WHCRBY CHAR(10) NOT NULL DEFAULT '' ,
  WHDTLM NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WHDTLM ignored.
  WHLMBY CHAR(10) NOT NULL DEFAULT '' ,
  PRIMARY KEY( WHCOYNO , WHWHSE ) )

  RCDFMT WAREHEDF   ;

LABEL ON TABLE WAREHEDSQ
  IS 'IMS Warehouse Header        WH' ;

LABEL ON COLUMN WAREHEDSQ
( WHCOYNO IS 'Cpy.' ,
  WHWHSE IS 'Whse|No.' ,
  WHWDESC IS 'Whse Description' ,
  WHWTYP IS 'Whse|Type' ,
  WHCTYP IS 'Cost|Type' ,
  WHDTLC IS 'Last|Count' ,
  WHREPC IS 'Rpln|Cycle' ,
  WHVALU IS 'Value|Last Count' ,
  WHDTNR IS 'Next Replen' ,
  WHDTLR IS 'Last Replen' ,
  WHCRDT IS 'Created|date' ,
  WHCRBY IS 'Created By' ,
  WHDTLM IS 'Maintained|date' ,
  WHLMBY IS 'Last Maint' ) ;

LABEL ON COLUMN WAREHEDSQ
( WHCOYNO TEXT IS 'Company number' ,
  WHWHSE TEXT IS 'Warehouse Number' ,
  WHWDESC TEXT IS 'Warehouse Description' ,
  WHWTYP TEXT IS 'Warehouse Type' ,
  WHCTYP TEXT IS 'Costing Type' ,
  WHDTLC TEXT IS 'Date of last count' ,
  WHREPC TEXT IS 'Replenishment Cycle flag' ,
  WHVALU TEXT IS 'W/H Value last count' ,
  WHDTNR TEXT IS 'Date next replenishment' ,
  WHDTLR TEXT IS 'Date last replenishment' ,
  WHCRDT TEXT IS 'Created Date' ,
  WHCRBY TEXT IS 'Created by' ,
  WHDTLM TEXT IS 'Amended date' ,
  WHLMBY TEXT IS 'Amended By' ) ;
