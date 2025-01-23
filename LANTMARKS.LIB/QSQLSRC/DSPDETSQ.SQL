--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 17:10:57
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE DSPDETSQ (
  DDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DDDESN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  DDSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
  DDSONO CHAR(7) NOT NULL DEFAULT '' ,
  DDITEM CHAR(20) NOT NULL DEFAULT '' ,
  DDIDESC CHAR(40) NOT NULL DEFAULT '' ,
  DDWHSE CHAR(3) NOT NULL DEFAULT '' ,
  DDLOCN CHAR(10) NOT NULL DEFAULT '' ,
  DDQTSH DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
  DDQSHP DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
  DDENTS CHAR(1) NOT NULL DEFAULT '' ,
  DDPCKS CHAR(1) NOT NULL DEFAULT '' ,
  DDINVS CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( DDCOYNO , DDDESN , DDSEQ ) )

  RCDFMT DSPDETF    ;

LABEL ON TABLE DSPDETSQ
  IS 'SOP Despatch Details        DD' ;

LABEL ON COLUMN DSPDETSQ
( DDCOYNO IS 'Cpy.' ,
  DDDESN IS 'Despatch|Note' ,
  DDSEQ IS 'Seq' ,
  DDSONO IS 'Order|Number' ,
  DDITEM IS 'Item Number' ,
  DDIDESC IS 'Item Description' ,
  DDWHSE IS 'Whse|No.' ,
  DDLOCN IS 'Location' ,
  DDQTSH IS 'Counted Qty' ,
  DDQSHP IS 'Counted Qty' ,
  DDENTS IS 'Entry|Status' ,
  DDPCKS IS 'Picked|Status' ,
  DDINVS IS 'Invoice|Status' ) ;

LABEL ON COLUMN DSPDETSQ
( DDCOYNO TEXT IS 'Company number' ,
  DDDESN TEXT IS 'Despatch Note Number' ,
  DDSEQ TEXT IS 'Sequence' ,
  DDSONO TEXT IS 'S.O.Number' ,
  DDITEM TEXT IS 'Item Number' ,
  DDIDESC TEXT IS 'Item Description' ,
  DDWHSE TEXT IS 'Warehouse Number' ,
  DDLOCN TEXT IS 'Location' ,
  DDQTSH TEXT IS 'Qty To Ship' ,
  DDQSHP TEXT IS 'Quantity Shipped' ,
  DDENTS TEXT IS 'Entry Status' ,
  DDPCKS TEXT IS 'Picked Status' ,
  DDINVS TEXT IS 'Invoice Status' ) ;
