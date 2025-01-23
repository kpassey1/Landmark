--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              08/11/23 10:35:10
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE CASDISSQ (
  CDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CDCDSC CHAR(3) NOT NULL DEFAULT '' ,
  CDDESC CHAR(40) NOT NULL DEFAULT '' ,
  CDCDIS DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
  CDPAYD DECIMAL(3, 0) NOT NULL DEFAULT 0 ,
  PRIMARY KEY( CDCOYNO , CDCDSC ) )

  RCDFMT CASDISF    ;

LABEL ON TABLE CASDISSQ
  IS 'SOP Cash Discount Codes     CD' ;

LABEL ON COLUMN CASDISSQ
( CDCOYNO IS 'Cpy.' ,
  CDCDSC IS 'Cash|Disc' ,
  CDDESC IS 'Description' ,
  CDCDIS IS 'Disc %' ,
  CDPAYD IS 'Payment|Days' ) ;

LABEL ON COLUMN CASDISSQ
( CDCOYNO TEXT IS 'Company number' ,
  CDCDSC TEXT IS 'Cash discount code' ,
  CDDESC TEXT IS 'Description' ,
  CDCDIS TEXT IS 'Cash discount %' ,
  CDPAYD TEXT IS 'No Days' ) ;
