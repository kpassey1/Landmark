--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              04/11/23 14:19:55
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE EXPDELSQ (
  EDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  EDDTTR NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  EDTIME DECIMAL(6, 0) NOT NULL DEFAULT 0 ,
  EDTREF CHAR(15) NOT NULL DEFAULT '' ,
  EDCARR CHAR(20) NOT NULL DEFAULT '' ,
  EDSUPPN CHAR(6) NOT NULL DEFAULT '' ,
  EDBRNBR CHAR(3) NOT NULL DEFAULT '' )

  RCDFMT EXPDELF    ;

LABEL ON TABLE EXPDELSQ
  IS 'IMS Expected Deliveries     ED' ;

LABEL ON COLUMN EXPDELSQ
( EDCOYNO IS 'Cpy.' ,
  EDDTTR IS 'Transact|Date' ,
  EDTIME IS 'Expect|Time' ,
  EDTREF IS 'TR. Reference' ,
  EDCARR IS 'Carrier' ,
  EDSUPPN IS 'Supplier' ,
  EDBRNBR IS 'Br' ) ;

LABEL ON COLUMN EXPDELSQ
( EDCOYNO TEXT IS 'Company number' ,
  EDDTTR TEXT IS 'Expected Date' ,
  EDTIME TEXT IS 'Expected time' ,
  EDTREF TEXT IS 'Transaction Reference' ,
  EDCARR TEXT IS 'Carrier' ,
  EDSUPPN TEXT IS 'Supplier Number' ,
  EDBRNBR TEXT IS 'Branch Number' ) ;
