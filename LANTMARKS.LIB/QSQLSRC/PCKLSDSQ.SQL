--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 11:11:04
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PCKLSDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PCKLSD in KEV ignored.
--  SQL1506   30   Key or attribute for PCKLSD in KEV ignored.
  PDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PDSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PDSEQ ignored.
  PDWHSE CHAR(3) NOT NULL DEFAULT '' ,
  PDPCKR CHAR(5) NOT NULL DEFAULT '' ,
  PDLOCN CHAR(10) NOT NULL DEFAULT '' ,
  PDITEM CHAR(20) NOT NULL DEFAULT '' ,
  PDTQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PDTQTY ignored.
  PDTRNC CHAR(2) NOT NULL DEFAULT '' ,
  PDCOST DECIMAL(12, 5) NOT NULL DEFAULT 0 )

  RCDFMT PCKLSDF    ;
--  SQL150D   10   EDTCDE in column PDCOST ignored.

LABEL ON TABLE PCKLSDSQ
  IS 'IMS Picking list details    PD' ;

LABEL ON COLUMN PCKLSDSQ
( PDCOYNO IS 'Cpy.' ,
  PDSEQ IS 'Seq' ,
  PDWHSE IS 'Whse|No.' ,
  PDPCKR IS 'Picking|Route' ,
  PDLOCN IS 'Location' ,
  PDITEM IS 'Item Number' ,
  PDTQTY IS 'Trans Qty' ,
  PDTRNC IS 'Trans|Type' ,
  PDCOST IS 'Unit Cost' ) ;

LABEL ON COLUMN PCKLSDSQ
( PDCOYNO TEXT IS 'Company number' ,
  PDSEQ TEXT IS 'Picking list' ,
  PDWHSE TEXT IS 'Warehouse Number' ,
  PDPCKR TEXT IS 'Picking Route' ,
  PDLOCN TEXT IS 'Location' ,
  PDITEM TEXT IS 'Item Number' ,
  PDTQTY TEXT IS 'Transaction Quantity' ,
  PDTRNC TEXT IS 'Transaction Type' ,
  PDCOST TEXT IS 'Unit Cost' ) ;
