--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 12:28:24
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE PRCGRPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table PRCGRP in KEV ignored.
  PGCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  PGPRCG CHAR(3) NOT NULL DEFAULT '' ,
  PGDESC CHAR(20) NOT NULL DEFAULT '' ,
  PGPRICE DECIMAL(12, 5) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PGPRICE ignored.
  PGDATL NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column PGDATL ignored.
  PGAMNP DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column PGAMNP ignored.
  PGDATN NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column PGDATN ignored.
  PGINDE CHAR(1) NOT NULL DEFAULT '' ,
  PGUPDL CHAR(1) NOT NULL DEFAULT '' ,
  PGUPDO CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( PGCOYNO , PGPRCG ) )

  RCDFMT PRCGRPF    ;

LABEL ON TABLE PRCGRPSQ
  IS 'SOP Pricing Groups          PG' ;

LABEL ON COLUMN PRCGRPSQ
( PGCOYNO IS 'Cpy.' ,
  PGPRCG IS 'Price|Group' ,
  PGDESC IS 'Parm. Desc.' ,
  PGPRICE IS 'Purchase            Price' ,
  PGDATL IS 'Date' ,
  PGAMNP IS 'Disc %' ,
  PGDATN IS 'Date' ,
  PGINDE IS 'Yes/No' ,
  PGUPDL IS 'Yes/No' ,
  PGUPDO IS 'Yes/No' ) ;

LABEL ON COLUMN PRCGRPSQ
( PGCOYNO TEXT IS 'Company number' ,
  PGPRCG TEXT IS 'Price Group' ,
  PGDESC TEXT IS 'Description' ,
  PGPRICE TEXT IS 'Group Price' ,
  PGDATL TEXT IS 'Last update date' ,
  PGAMNP TEXT IS 'Next price change %' ,
  PGDATN TEXT IS 'Next price date' ,
  PGINDE TEXT IS 'Increase Y/N' ,
  PGUPDL TEXT IS 'Update List prices' ,
  PGUPDO TEXT IS 'Update other prices' ) ;
