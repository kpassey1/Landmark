--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              30/11/23 12:18:14
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SOCUSTSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SOCUST in KEV ignored.
  SCCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  SCSEQ DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SCSEQ ignored.
  SCCUST CHAR(6) NOT NULL DEFAULT '' ,
  SCBRNBR CHAR(3) NOT NULL DEFAULT '' ,
  SCSOCT CHAR(3) NOT NULL DEFAULT '' ,
  SCCUSORD CHAR(15) NOT NULL DEFAULT '' ,
  SCSOQF DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column SCSOQF ignored.
  PRIMARY KEY( SCCOYNO , SCSEQ , SCCUST , SCBRNBR , SCSOCT ) )

  RCDFMT SOCUSH     ;

LABEL ON TABLE SOCUSTSQ
  IS 'SOP Customer Standing order SC' ;

LABEL ON COLUMN SOCUSTSQ
( SCCOYNO IS 'Cpy.' ,
  SCSEQ IS 'Seq' ,
  SCCUST IS 'Cust No.' ,
  SCBRNBR IS 'Br' ,
  SCSOCT IS 'Category|Code' ,
  SCCUSORD IS 'Cus Order No.' ,
  SCSOQF IS 'Qty|Factor' ) ;

LABEL ON COLUMN SOCUSTSQ
( SCCOYNO TEXT IS 'Company number' ,
  SCSEQ TEXT IS 'Standing Order Number' ,
  SCCUST TEXT IS 'Customer Number' ,
  SCBRNBR TEXT IS 'Branch Number' ,
  SCSOCT TEXT IS 'S.O.Category Code' ,
  SCCUSORD TEXT IS 'Customer order number' ,
  SCSOQF TEXT IS 'S.O. Qty Factor' ) ;
