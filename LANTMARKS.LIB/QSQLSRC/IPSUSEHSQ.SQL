--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 10:33:12
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IPSUSEHSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IPSUSEH in KEV ignored.
  COYNO CHAR(3) NOT NULL DEFAULT '' ,
  UHHEAD1 CHAR(15) NOT NULL DEFAULT '' ,
  UHCOL1 CHAR(5) NOT NULL DEFAULT '' ,
  UHHEAD2 CHAR(15) NOT NULL DEFAULT '' ,
  UHCOL2 CHAR(5) NOT NULL DEFAULT '' ,
  UHHEAD3 CHAR(15) NOT NULL DEFAULT '' ,
  UHCOL3 CHAR(5) NOT NULL DEFAULT '' ,
  PRIMARY KEY( COYNO ) )

  RCDFMT IPSUSEHF   ;

LABEL ON TABLE IPSUSEHSQ
  IS 'IPS User Field Headings     UH' ;

LABEL ON COLUMN IPSUSEHSQ
( COYNO IS 'Cpy.' ,
  UHHEAD1 IS 'Scr head' ,
  UHCOL1 IS 'Col Head' ,
  UHHEAD2 IS 'Scr head' ,
  UHCOL2 IS 'Col Head' ,
  UHHEAD3 IS 'Scr head' ,
  UHCOL3 IS 'Col Head' ) ;

LABEL ON COLUMN IPSUSEHSQ
( COYNO TEXT IS 'Company number' ,
  UHHEAD1 TEXT IS 'User field 1' ,
  UHCOL1 TEXT IS 'User Column 1' ,
  UHHEAD2 TEXT IS 'User field 2' ,
  UHCOL2 TEXT IS 'User Column 2' ,
  UHHEAD3 TEXT IS 'User field 3' ,
  UHCOL3 TEXT IS 'User Column 3' ) ;
