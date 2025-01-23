--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              03/11/23 15:39:15
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE COMPANYSQ (
  CYCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CYDESC CHAR(40) NOT NULL DEFAULT '' ,
  CYSDESC CHAR(20) NOT NULL DEFAULT '' ,
  CYEMPHEAD CHAR(15) NOT NULL DEFAULT '' ,
  CYEMPCOL CHAR(5) NOT NULL DEFAULT '' ,
  CYPRDHEAD CHAR(15) NOT NULL DEFAULT '' ,
  CYREFHEAD CHAR(15) NOT NULL DEFAULT '' ,
  CYCGAS CHAR(1) NOT NULL DEFAULT '' ,
  CYDFMT CHAR(1) NOT NULL DEFAULT '' ,
  CYDSEP CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CYCOYNO ) )

  RCDFMT COMPANYF   ;

LABEL ON TABLE COMPANYSQ
  IS 'Company screen headings     CY' ;

LABEL ON COLUMN COMPANYSQ
( CYCOYNO IS 'Cpy.' ,
  CYDESC IS 'Description' ,
  CYSDESC IS 'Short Description' ,
  CYEMPHEAD IS 'Employee|Description' ,
  CYEMPCOL IS 'Employee|Column' ,
  CYPRDHEAD IS 'Product|Description' ,
  CYREFHEAD IS 'Reference|Descriptio' ,
  CYCGAS IS 'Ext|Ldgrs' ) ;

LABEL ON COLUMN COMPANYSQ
( CYCOYNO TEXT IS 'Company number' ,
  CYDESC TEXT IS 'Company description' ,
  CYSDESC TEXT IS 'Short Description' ,
  CYEMPHEAD TEXT IS 'Employee description' ,
  CYEMPCOL TEXT IS 'Employee column heading' ,
  CYPRDHEAD TEXT IS 'Product description' ,
  CYREFHEAD TEXT IS 'Reference description' ,
  CYCGAS TEXT IS 'CGAS is to be used' ,
  CYDFMT TEXT IS 'Date Format 1=dmy 2=mdy' ,
  CYDSEP TEXT IS 'Date Seperator' ) ;

