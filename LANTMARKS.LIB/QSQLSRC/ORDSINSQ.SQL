--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:15:19
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDSINSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ORDSIN in KEV ignored.
--  SQL1506   30   Key or attribute for ORDSIN in KEV ignored.
  OICOYNO CHAR(3) NOT NULL DEFAULT '' ,
  OISONO CHAR(7) NOT NULL DEFAULT '' ,
  OIAUD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column OIAUD ignored.
  OISHPC CHAR(3) NOT NULL DEFAULT '' ,
  OISHPT1 CHAR(60) NOT NULL DEFAULT '' ,
  OISHPT2 CHAR(60) NOT NULL DEFAULT '' )

  RCDFMT ORDSIND    ;

LABEL ON TABLE ORDSINSQ
  IS 'SOP Order Shipping Instr.   OI' ;

LABEL ON COLUMN ORDSINSQ
( OICOYNO IS 'Cpy.' ,
  OISONO IS 'Order|Number' ,
  OIAUD IS 'Audit number' ,
  OISHPC IS 'Shipping|Code' ,
  OISHPT1 IS 'Shipping Inst.' ,
  OISHPT2 IS 'Shipping Inst.' ) ;

LABEL ON COLUMN ORDSINSQ
( OICOYNO TEXT IS 'Company number' ,
  OISONO TEXT IS 'S.O.Number' ,
  OIAUD TEXT IS 'Audit number' ,
  OISHPC TEXT IS 'Shipping Instructions code' ,
  OISHPT1 TEXT IS 'Shipping intructions' ,
  OISHPT2 TEXT IS 'Shipping intructions' ) ;
