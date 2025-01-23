--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 17:09:39
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDSCHSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDSCH in KEV ignored.
--  SQL1506   30   Key or attribute for ORDSCH in KEV ignored.
  OCCOYNO CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
  OCSONO CHAR(7) CCSID 37 NOT NULL DEFAULT '' ,
  OCSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OCSEQ ignored.
  OCAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OCAUD ignored.
  OCSCHC CHAR(3) CCSID 37 NOT NULL DEFAULT '' ,
  OCDESC CHAR(40) CCSID 37 NOT NULL DEFAULT '' ,
  OCCHGV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OCCHGV ignored.
  OCONET CHAR(1) CCSID 37 NOT NULL DEFAULT '' ,
  OCVATC CHAR(2) CCSID 37 NOT NULL DEFAULT '' ,
  OCVATV DECIMAL(13, 2) NOT NULL DEFAULT 0 )

  RCDFMT ORDSCHF    ;
--  SQL150D   10   EDTCDE in column OCVATV ignored.

LABEL ON TABLE ORDSCHSQ
  IS 'SOP Order Special Charges   OC' ;

LABEL ON COLUMN ORDSCHSQ
( OCCOYNO IS 'Cpy.' ,
  OCSONO IS 'Order|Number' ,
  OCSEQ IS 'Seq' ,
  OCAUD IS 'Audit number' ,
  OCSCHC IS 'Special|Charge' ,
  OCDESC IS 'Description' ,
  OCCHGV IS 'VALUE' ,
  OCVATC IS 'VAT' ,
  OCVATV IS 'VALUE' ) ;

LABEL ON COLUMN ORDSCHSQ
( OCCOYNO TEXT IS 'Company number' ,
  OCSONO TEXT IS 'S.O.Number' ,
  OCSEQ TEXT IS 'Sequence' ,
  OCAUD TEXT IS 'Audit number' ,
  OCSCHC TEXT IS 'Special Charge Code' ,
  OCDESC TEXT IS 'Description' ,
  OCCHGV TEXT IS 'Default Value' ,
  OCONET TEXT IS 'One time charge Y/N' ,
  OCVATC TEXT IS 'VAT Code' ,
  OCVATV TEXT IS 'VAT Value' ) ;
