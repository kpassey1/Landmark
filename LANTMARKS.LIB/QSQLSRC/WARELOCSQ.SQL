--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:56:43
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE WARELOCSQ (
--  SQL150B   10   REUSEDLT(*NO) in table WARELOC in KEV ignored.
  WLCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  WLWHSE CHAR(3) NOT NULL DEFAULT '' ,
  WLLOCN CHAR(10) NOT NULL DEFAULT '' ,
  WLDESC CHAR(40) NOT NULL DEFAULT '' ,
  WLPCKR CHAR(5) NOT NULL DEFAULT '' ,
  WLPCKA CHAR(1) NOT NULL DEFAULT '' ,
  WLPCKF CHAR(1) NOT NULL DEFAULT '' ,
  WLSIZE DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WLSIZE ignored.
  WLHITE DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WLHITE ignored.
  WLWEIG DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column WLWEIG ignored.
  WLRSTN CHAR(15) NOT NULL DEFAULT '' ,
  WLCRBY CHAR(10) NOT NULL DEFAULT '' ,
  WLCRDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WLCRDT ignored.
  WLLMBY CHAR(10) NOT NULL DEFAULT '' ,
  WLLMDT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column WLLMDT ignored.
  PRIMARY KEY( WLCOYNO , WLWHSE , WLLOCN ) )

  RCDFMT WARELOCF   ;

LABEL ON TABLE WARELOCSQ
  IS 'IMS Warehouse Locations     WL' ;

LABEL ON COLUMN WARELOCSQ
( WLCOYNO IS 'Cpy.' ,
  WLWHSE IS 'Whse|No.' ,
  WLLOCN IS 'Location' ,
  WLDESC IS 'Description' ,
  WLPCKR IS 'Picking|Route' ,
  WLPCKA IS 'Pick|Alwd' ,
  WLPCKF IS 'Pick|Face' ,
  WLSIZE IS 'Size' ,
  WLHITE IS 'Height' ,
  WLWEIG IS 'Weight' ,
  WLRSTN IS 'Restrictions' ,
  WLCRBY IS 'Created By' ,
  WLCRDT IS 'Created|date' ,
  WLLMBY IS 'Last Maint' ,
  WLLMDT IS 'Maintained|date' ) ;

LABEL ON COLUMN WARELOCSQ
( WLCOYNO TEXT IS 'Company number' ,
  WLWHSE TEXT IS 'Warehouse Number' ,
  WLLOCN TEXT IS 'Location' ,
  WLDESC TEXT IS 'Location Description' ,
  WLPCKR TEXT IS 'Picking Route' ,
  WLPCKA TEXT IS 'Picking Allowed Y/N' ,
  WLPCKF TEXT IS 'Pick Face Y/N' ,
  WLSIZE TEXT IS 'Size' ,
  WLHITE TEXT IS 'Height' ,
  WLWEIG TEXT IS 'Maximum weight' ,
  WLRSTN TEXT IS 'Restrictions' ,
  WLCRBY TEXT IS 'Created By' ,
  WLCRDT TEXT IS 'Created Date' ,
  WLLMBY TEXT IS 'Last Maint User' ,
  WLLMDT TEXT IS 'Date last maintained' ) ;
