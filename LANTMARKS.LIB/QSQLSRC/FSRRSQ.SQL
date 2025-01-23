--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 14:52:36
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE FSRRSQ (
--  SQL150B   10   REUSEDLT(*NO) in table FSRR in KEV ignored.
  RCCLOC NUMERIC(4, 0) NOT NULL DEFAULT 0 ,
  RCCNO NUMERIC(7, 0) NOT NULL DEFAULT 0 ,
  RCCIT# CHAR(14) NOT NULL DEFAULT '' ,
  RCCIV# CHAR(10) NOT NULL DEFAULT '' ,
  RCCIVD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  RCCVD# CHAR(7) NOT NULL DEFAULT '' ,
  RCCCAT NUMERIC(4, 0) NOT NULL DEFAULT 0 ,
  RCCSBC NUMERIC(4, 0) NOT NULL DEFAULT 0 ,
  RCCRE# CHAR(14) NOT NULL DEFAULT '' ,
  RCCQTY NUMERIC(9, 0) NOT NULL DEFAULT 0 ,
  RCCEAC NUMERIC(12, 3) NOT NULL DEFAULT 0 ,
  RCCUNC NUMERIC(12, 3) NOT NULL DEFAULT 0 )

  RCDFMT FSRRR      ;

LABEL ON TABLE FSRRSQ
  IS 'Farmstores Receiving Record' ;

LABEL ON COLUMN FSRRSQ
( RCCLOC IS 'Location' ,
  RCCNO IS 'Receiving Location' ,
  RCCIT# IS 'Item Number' ,
  RCCIV# IS 'Invoice Number' ,
  RCCIVD IS 'Invoice Date' ,
  RCCVD# IS 'Vendor Number' ,
  RCCCAT IS 'Category' ,
  RCCSBC IS 'Sub-category' ,
  RCCRE# IS 'Reorder Number' ,
  RCCQTY IS 'Quantity Received' ,
  RCCEAC IS 'Each Cost' ,
  RCCUNC IS 'Unit Cost' ) ;

LABEL ON COLUMN FSRRSQ
( RCCLOC TEXT IS 'Location' ,
  RCCNO TEXT IS 'Receiving Location' ,
  RCCIT# TEXT IS 'Item Number' ,
  RCCIV# TEXT IS 'Invoice Number' ,
  RCCIVD TEXT IS 'Invoice Date' ,
  RCCVD# TEXT IS 'Vendor Number' ,
  RCCCAT TEXT IS 'Category' ,
  RCCSBC TEXT IS 'Sub-category' ,
  RCCRE# TEXT IS 'Reorder Number' ,
  RCCQTY TEXT IS 'Quantity Received' ,
  RCCEAC TEXT IS 'Each Cost' ,
  RCCUNC TEXT IS 'Unit Cost' ) ;
