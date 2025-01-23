--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 17:20:06
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDSCLSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDSCL in KEV ignored.
--  SQL1506   30   Key or attribute for ORDSCL in KEV ignored.
  OLCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  OLSONO CHAR(7) NOT NULL DEFAULT '' ,
  OLSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OLSEQ ignored.
  OLOSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OLOSEQ ignored.
  OLAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OLAUD ignored.
  OLSCHC CHAR(3) NOT NULL DEFAULT '' ,
  OLDESC CHAR(40) NOT NULL DEFAULT '' ,
  OLCHGV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OLCHGV ignored.
  OLVATC CHAR(2) NOT NULL DEFAULT '' ,
  OLVATV DECIMAL(13, 2) NOT NULL DEFAULT 0 )

  RCDFMT ORDSCLF    ;
--  SQL150D   10   EDTCDE in column OLVATV ignored.

LABEL ON TABLE ORDSCLSQ
  IS 'SOP Order Line Charges      OL' ;

LABEL ON COLUMN ORDSCLSQ
( OLCOYNO IS 'Cpy.' ,
  OLSONO IS 'Order|Number' ,
  OLSEQ IS 'Seq' ,
  OLOSEQ IS 'Seq' ,
  OLAUD IS 'Audit number' ,
  OLSCHC IS 'Special|Charge' ,
  OLDESC IS 'Description' ,
  OLCHGV IS 'VALUE' ,
  OLVATC IS 'VAT' ,
  OLVATV IS 'VALUE' ) ;

LABEL ON COLUMN ORDSCLSQ
( OLCOYNO TEXT IS 'Company number' ,
  OLSONO TEXT IS 'S.O.Number' ,
  OLSEQ TEXT IS 'Sequence' ,
  OLOSEQ TEXT IS 'Sequence2' ,
  OLAUD TEXT IS 'Audit number' ,
  OLSCHC TEXT IS 'Special Charge Code' ,
  OLDESC TEXT IS 'Description' ,
  OLCHGV TEXT IS 'Charge Value' ,
  OLVATC TEXT IS 'VAT Code' ,
  OLVATV TEXT IS 'VAT Value' ) ;
