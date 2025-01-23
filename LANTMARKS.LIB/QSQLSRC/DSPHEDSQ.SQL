--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 17:22:22
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE DSPHEDSQ (
  DHCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DHDSPN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  DHSONO CHAR(7) NOT NULL DEFAULT '' ,
  DHCUST CHAR(6) NOT NULL DEFAULT '' ,
  DHBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  DHENTS CHAR(1) NOT NULL DEFAULT '' ,
  DHPCKS CHAR(1) NOT NULL DEFAULT '' ,
  DHINVS CHAR(1) NOT NULL DEFAULT '' ,
  DHFDSD NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
  PRIMARY KEY( DHCOYNO , DHDSPN ) )

  RCDFMT DESHEDF    ;

LABEL ON TABLE DSPHEDSQ
  IS 'SOP Despatch Header         DH' ;

LABEL ON COLUMN DSPHEDSQ
( DHCOYNO IS 'Cpy.' ,
  DHDSPN IS 'Despatch|Note' ,
  DHSONO IS 'Order|Number' ,
  DHCUST IS 'Cust No.' ,
  DHBRNBR IS 'Br' ,
  DHENTS IS 'Entry|Status' ,
  DHPCKS IS 'Picked|Status' ,
  DHINVS IS 'Invoice|Status' ,
  DHFDSD IS 'Date' ) ;

LABEL ON COLUMN DSPHEDSQ
( DHCOYNO TEXT IS 'Company number' ,
  DHDSPN TEXT IS 'Despatch Note Number' ,
  DHSONO TEXT IS 'S.O.Number' ,
  DHCUST TEXT IS 'Customer Number' ,
  DHBRNBR TEXT IS 'Branch Number' ,
  DHENTS TEXT IS 'Entry Status' ,
  DHPCKS TEXT IS 'Picked Status' ,
  DHINVS TEXT IS 'Invoice Status' ,
  DHFDSD TEXT IS 'Despatch Date' ) ;
