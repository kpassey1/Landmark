--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 13:15:39
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CUSCATSQ (
  CACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CACCAT NUMERIC(3, 0) NOT NULL DEFAULT 0 ,
  CADESC CHAR(20) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CACOYNO , CACCAT ) )

  RCDFMT CUSCATF    ;

LABEL ON TABLE CUSCATSQ
  IS 'SOP Customer Category codes CA' ;

LABEL ON COLUMN CUSCATSQ
( CACOYNO IS 'Cpy.' ,
  CACCAT IS 'Category' ,
  CADESC IS 'Parm. Desc.' ) ;

LABEL ON COLUMN CUSCATSQ
( CACOYNO TEXT IS 'Company number' ,
  CACCAT TEXT IS 'Customer category' ,
  CADESC TEXT IS 'Category Description' ) ;
