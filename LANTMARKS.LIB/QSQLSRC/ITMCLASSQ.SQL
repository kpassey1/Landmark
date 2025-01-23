--  Generate SQL
--  Version:                   V6R1M0 080215
--  Generated on:              11/04/19 09:38:37
--  Relational Database:
--  Standards Option:          DB2 for i

CREATE TABLE ITMCLASSQ (
--  SQL150B   10   REUSEDLT(*NO) in table ITMCLAS in LAN8MARK ignored.
  ICCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  ICCLAS CHAR(3) NOT NULL DEFAULT '' ,
  ICDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( ICCOYNO , ICCLAS ) )
  RCDFMT ITMCLASF   ;

LABEL ON TABLE ITMCLASSQ
  IS 'IMS Item class parameters   IC' ;

LABEL ON COLUMN ITMCLASSQ
( ICCOYNO IS 'Cpy.' ,
  ICCLAS IS 'Item|Class' ,
  ICDESC IS 'Description' ) ;

LABEL ON COLUMN ITMCLASSQ
( ICCOYNO TEXT IS 'Company number' ,
  ICCLAS TEXT IS 'Item Class' ,
  ICDESC TEXT IS 'Item Class Description' ) ;

