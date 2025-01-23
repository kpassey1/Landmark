--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:28:11
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STOKREQSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STOKREQ in KEV ignored.
--  SQL1506   30   Key or attribute for STOKREQ in KEV ignored.
  SRCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SRSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SRSEQ ignored.
  SRFWHSE CHAR(3) NOT NULL DEFAULT '' ,
  SRTWHSE CHAR(3) NOT NULL DEFAULT '' ,
  SRFSTIG CHAR(2) NOT NULL DEFAULT '' ,
  SRTSTIG CHAR(2) NOT NULL DEFAULT '' ,
  SRFSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  SRFSBRN CHAR(3) NOT NULL DEFAULT '' ,
  SRTSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  SRTSBRN CHAR(3) NOT NULL DEFAULT '' ,
  SRFCLAS CHAR(3) NOT NULL DEFAULT '' ,
  SRTCLAS CHAR(3) NOT NULL DEFAULT '' ,
  SRFSGRP CHAR(3) NOT NULL DEFAULT '' ,
  SRTSGRP CHAR(3) NOT NULL DEFAULT '' ,
  SRFLOCN CHAR(10) NOT NULL DEFAULT '' ,
  SRTLOCN CHAR(10) NOT NULL DEFAULT '' ,
  SRFITEM CHAR(20) NOT NULL DEFAULT '' ,
  SRTITEM CHAR(20) NOT NULL DEFAULT '' ,
  SRBFLAG CHAR(1) NOT NULL DEFAULT '' )

  RCDFMT STOKREQF   ;

LABEL ON TABLE STOKREQSQ
  IS 'IMS Stock take request      SR' ;

LABEL ON COLUMN STOKREQSQ
( SRCOYNO IS 'Cpy.' ,
  SRSEQ IS 'Seq' ,
  SRFWHSE IS 'Whse|No.' ,
  SRTWHSE IS 'Whse|No.' ,
  SRFSTIG IS 'Stock|Inv Grp' ,
  SRTSTIG IS 'Stock|Inv Grp' ,
  SRFSUPPN IS 'Supplier' ,
  SRFSBRN IS 'Br' ,
  SRTSUPPN IS 'Supplier' ,
  SRTSBRN IS 'Br' ,
  SRFCLAS IS 'Item|Class' ,
  SRTCLAS IS 'Item|Class' ,
  SRFSGRP IS 'Stock|Group' ,
  SRTSGRP IS 'Stock|Group' ,
  SRFLOCN IS 'Location' ,
  SRTLOCN IS 'Location' ,
  SRFITEM IS 'Item Number' ,
  SRTITEM IS 'Item Number' ,
  SRBFLAG IS 'Batch' ) ;

LABEL ON COLUMN STOKREQSQ
( SRCOYNO TEXT IS 'Company number' ,
  SRSEQ TEXT IS 'Sequence' ,
  SRFWHSE TEXT IS 'From Warehouse Number' ,
  SRTWHSE TEXT IS 'To Warehouse Number' ,
  SRFSTIG TEXT IS 'From Stock Inventory Group' ,
  SRTSTIG TEXT IS 'To Stock Inventory Group' ,
  SRFSUPPN TEXT IS 'From Supplier Number' ,
  SRFSBRN TEXT IS 'From Branch Number' ,
  SRTSUPPN TEXT IS 'To Supplier Number' ,
  SRTSBRN TEXT IS 'To Branch Number' ,
  SRFCLAS TEXT IS 'From Item Class' ,
  SRTCLAS TEXT IS 'To Item Class' ,
  SRFSGRP TEXT IS 'FromStock Group' ,
  SRTSGRP TEXT IS 'To Stock Group' ,
  SRFLOCN TEXT IS 'From Location' ,
  SRTLOCN TEXT IS 'To Location' ,
  SRFITEM TEXT IS 'From Item Number' ,
  SRTITEM TEXT IS 'To Item Number' ,
  SRBFLAG TEXT IS 'Batch Update flag' ) ;
