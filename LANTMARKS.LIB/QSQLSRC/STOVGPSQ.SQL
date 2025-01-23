--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              09/11/23 15:41:18
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE STOVGPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table STOVGP in KEV ignored.
  TGCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  TGSTOG CHAR(1) NOT NULL DEFAULT '' ,
  TGDESC CHAR(40) NOT NULL DEFAULT '' ,
  PRIMARY KEY( TGCOYNO , TGSTOG ) )

  RCDFMT STOVGPF    ;

LABEL ON TABLE STOVGPSQ
  IS 'IMS Stock turnover groups   TG' ;

LABEL ON COLUMN STOVGPSQ
( TGCOYNO IS 'Cpy.' ,
  TGSTOG IS 'Stock|Trnvr Grp' ,
  TGDESC IS 'Description' ) ;

LABEL ON COLUMN STOVGPSQ
( TGCOYNO TEXT IS 'Company number' ,
  TGSTOG TEXT IS 'Stock Turnover Group' ,
  TGDESC TEXT IS 'S.T.G. Description' ) ;
