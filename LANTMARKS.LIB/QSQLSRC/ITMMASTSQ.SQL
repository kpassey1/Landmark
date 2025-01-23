--  Generate SQL
--  Version:                   V6R1M0 080215
--  Generated on:              11/04/19 09:36:44
--  Relational Database:
--  Standards Option:          DB2 for i

CREATE TABLE ITMMASTSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ITMMAST in LAN8MARK ignored.
  ITCOYNO CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
  ITITEM CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
  ITIDESC CHAR(40) CCSID 37 NOT NULL DEFAULT '' ,
  ITALPHA CHAR(10) CCSID 37 NOT NULL DEFAULT '' ,
  ITSUPG CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
  ITSUPD CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
  ITSUBS CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
  ITMANF CHAR(20) CCSID 37 NOT NULL DEFAULT '' ,
  ITCLAS CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
  ITIGRP CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
  ITUOM CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
  ITVATC CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
  ITNLAC CHAR(15) CCSID 37 NOT NULL DEFAULT '' ,
  ITNLAS CHAR(15) CCSID 37 NOT NULL DEFAULT '' ,
  ITNLST CHAR(15) CCSID 37 NOT NULL DEFAULT '' ,
  ITUDF1 CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
  ITUDF2 CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
  ITUDF3 CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
  ITPACK DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITPACK ignored.
  ITITYP CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
  ITSANL CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
  ITSVG CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
  ITSIG CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
  ITLPRC DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITLPRC ignored.
  ITSTUC DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITSTUC ignored.
  ITPALL CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
  ITUOMO CHAR(5) CCSID 37 NOT NULL DEFAULT '' ,
  ITQTYO DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITQTYO ignored.
  ITWEIG DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column ITWEIG ignored.
  ITDTCR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ITDTCR ignored.
  ITCRTU CHAR(10) CCSID 37 NOT NULL DEFAULT '' ,
  ITDTLM NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column ITDTLM ignored.
  ITLMBY CHAR(10) CCSID 37 NOT NULL DEFAULT '' ,
  PRIMARY KEY( ITCOYNO , ITITEM ) )
  RCDFMT ITMSTRF    ;

LABEL ON TABLE ITMMASTSQ
  IS 'IMS Item master             IT' ;

LABEL ON COLUMN ITMMASTSQ
( ITCOYNO IS 'Cpy.' ,
  ITITEM IS 'Item Number' ,
  ITIDESC IS 'Item Description' ,
  ITALPHA IS 'Alpha search' ,
  ITSUPG IS 'Superceding         Item ''To''' ,
  ITSUPD IS 'Superceding         Item ''From''' ,
  ITSUBS IS 'Substitute          Item number' ,
  ITMANF IS 'Manufacturers       Item Number' ,
  ITCLAS IS 'Item|Class' ,
  ITIGRP IS 'Stock|Group' ,
  ITUOM IS 'UOM' ,
  ITVATC IS 'VAT' ,
  ITNLAC IS 'Cost of Sales' ,
  ITNLAS IS 'Sales Account' ,
  ITNLST IS 'Stock Account' ,
  ITUDF1 IS 'User 1' ,
  ITUDF2 IS 'User 2' ,
  ITUDF3 IS 'User 3' ,
  ITPACK IS 'Pack|Mult' ,
  ITITYP IS 'Item|Type' ,
  ITSANL IS 'Stck|Anlys' ,
  ITSVG IS 'Stck|Val grp' ,
  ITSIG IS 'Stock|Inv Grp' ,
  ITLPRC IS 'List Price' ,
  ITSTUC IS 'Standard Unit Cost' ,
  ITPALL IS 'Plt|Lbl' ,
  ITUOMO IS 'UOM' ,
  ITQTYO IS 'Qty/Outer' ,
  ITWEIG IS 'Weight' ,
  ITDTCR IS 'Created|date' ,
  ITCRTU IS 'Created By' ,
  ITDTLM IS 'Maintained|date' ,
  ITLMBY IS 'Last Maint' ) ;

LABEL ON COLUMN ITMMASTSQ
( ITCOYNO TEXT IS 'Company number' ,
  ITITEM TEXT IS 'Item Number' ,
  ITIDESC TEXT IS 'Item Description' ,
  ITALPHA TEXT IS 'Alpha Search' ,
  ITSUPG TEXT IS 'Superceding item ''To''' ,
  ITSUPD TEXT IS 'Superceding Item ''From''' ,
  ITSUBS TEXT IS 'Substitute item number' ,
  ITMANF TEXT IS 'Manufacturers Item No.' ,
  ITCLAS TEXT IS 'Item Class' ,
  ITIGRP TEXT IS 'Stock Group' ,
  ITUOM TEXT IS 'Unit of Measure' ,
  ITVATC TEXT IS 'VAT Code' ,
  ITNLAC TEXT IS 'N/L Cost of Sales Account' ,
  ITNLAS TEXT IS 'N/L Sales Account' ,
  ITNLST TEXT IS 'N/L Stock Account' ,
  ITUDF1 TEXT IS 'User Defined 1' ,
  ITUDF2 TEXT IS 'User Defined 2' ,
  ITUDF3 TEXT IS 'User Defined 3' ,
  ITPACK TEXT IS 'Packing Multiplier' ,
  ITITYP TEXT IS 'Item Type - business area' ,
  ITSANL TEXT IS 'Stock Analysis Code' ,
  ITSVG TEXT IS 'Stock Value Group' ,
  ITSIG TEXT IS 'Stock Inventory Group' ,
  ITLPRC TEXT IS 'List Price' ,
  ITSTUC TEXT IS 'Standard unit cost' ,
  ITPALL TEXT IS 'Pallet label' ,
  ITUOMO TEXT IS 'Outer Unit of Measure' ,
  ITQTYO TEXT IS 'Outer Quantity' ,
  ITWEIG TEXT IS 'Item weight' ,
  ITDTCR TEXT IS 'Created date' ,
  ITCRTU TEXT IS 'Created By' ,
  ITDTLM TEXT IS 'Amended date' ,
  ITLMBY TEXT IS 'Amended By' ) ;

