--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 17:04:31
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDINASQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDINA in KEV ignored.
--  SQL1506   30   Key or attribute for ORDINA in KEV ignored.
  IACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  IASONO CHAR(7) NOT NULL DEFAULT '' ,
  IAAUDIT DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column IAAUDIT ignored.
  IANAME CHAR(40) NOT NULL DEFAULT '' ,
  IALIN1 CHAR(40) NOT NULL DEFAULT '' ,
  IALIN2 CHAR(40) NOT NULL DEFAULT '' ,
  IALIN3 CHAR(40) NOT NULL DEFAULT '' ,
  IALIN4 CHAR(40) NOT NULL DEFAULT '' ,
  IALIN5 CHAR(40) NOT NULL DEFAULT '' ,
  IALIN6 CHAR(40) NOT NULL DEFAULT '' ,
  IAPSTCD CHAR(9) NOT NULL DEFAULT '' )

  RCDFMT ORDINAF    ;

LABEL ON TABLE ORDINASQ
  IS 'SOP Order Invoice Address   IA' ;

LABEL ON COLUMN ORDINASQ
( IACOYNO IS 'Cpy.' ,
  IASONO IS 'Order|Number' ,
  IAAUDIT IS 'Audit number' ,
  IANAME IS 'Customer name' ,
  IALIN1 IS 'Address Line' ,
  IALIN2 IS 'Address Line' ,
  IALIN3 IS 'Address Line' ,
  IALIN4 IS 'Address Line' ,
  IALIN5 IS 'Address Line' ,
  IALIN6 IS 'Address Line' ,
  IAPSTCD IS 'Post cd' ) ;

LABEL ON COLUMN ORDINASQ
( IACOYNO TEXT IS 'Company number' ,
  IASONO TEXT IS 'S.O.Number' ,
  IAAUDIT TEXT IS 'Audit number' ,
  IANAME TEXT IS 'Customer name' ,
  IALIN1 TEXT IS 'Address Line' ,
  IALIN2 TEXT IS 'Address Line' ,
  IALIN3 TEXT IS 'Address Line' ,
  IALIN4 TEXT IS 'Address Line' ,
  IALIN5 TEXT IS 'Address Line' ,
  IALIN6 TEXT IS 'Address Line' ,
  IAPSTCD TEXT IS 'Post code' ) ;
