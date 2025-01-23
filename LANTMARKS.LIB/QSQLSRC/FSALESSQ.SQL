--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 14:51:49
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE FSALESSQ (
--  SQL150B   10   REUSEDLT(*NO) in table FSALES in KEV ignored.
  RMDLOC NUMERIC(4, 0) NOT NULL DEFAULT 0 ,
  RMDDAT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column RMDDAT ignored.
  RMDIT# CHAR(20) NOT NULL DEFAULT '' ,
  RMUOM CHAR(5) NOT NULL DEFAULT '' ,
  RMDQTY DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column RMDQTY ignored.
  RMDUNC DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column RMDUNC ignored.
  RMDUCR DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column RMDUCR ignored.
  RMDEXR DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column RMDEXR ignored.
  RMAMEN CHAR(1) NOT NULL DEFAULT '' )

  RCDFMT FSALESR    ;

LABEL ON TABLE FSALESSQ
  IS 'Farmstores Sales Receipts' ;

LABEL ON COLUMN FSALESSQ
( RMDLOC IS 'Location Code' ,
  RMDDAT IS 'Date' ,
  RMDIT# IS 'Item Number' ,
  RMUOM IS 'UOM' ,
  RMDQTY IS 'Quantity|Invoiced' ,
  RMDUNC IS 'Price' ,
  RMDUCR IS 'Price' ,
  RMDEXR IS 'Price' ,
  RMAMEN IS 'Amd' ) ;

LABEL ON COLUMN FSALESSQ
( RMDLOC TEXT IS 'Location Code' ,
  RMDDAT TEXT IS 'Date ccmmdd' ,
  RMDIT# TEXT IS 'Item Number' ,
  RMUOM TEXT IS 'Unit of Measure' ,
  RMDQTY TEXT IS 'Quantity Invoiced' ,
  RMDUNC TEXT IS 'Unit Cost' ,
  RMDUCR TEXT IS 'Unit Retail' ,
  RMDEXR TEXT IS 'Extended Retail' ,
  RMAMEN TEXT IS 'Processed Y/N' ) ;
