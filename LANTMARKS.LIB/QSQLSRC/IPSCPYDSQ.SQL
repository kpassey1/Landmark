--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              21/11/23 14:16:25
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE IPSCPYDSQ (
--  SQL150B   10   REUSEDLT(*NO) in table IPSCPYD in KEV ignored.
  CDCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  CDAUDAM DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDAUDAM ignored.
  CDAUDOR DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDAUDOR ignored.
  CDAUDPR DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDAUDPR ignored.
  CDAUDGR DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDAUDGR ignored.
  CDAUDRE DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDAUDRE ignored.
  CDPORD DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column CDPORD ignored.
  CDIMS CHAR(1) NOT NULL DEFAULT '' ,
  CDCGAS CHAR(1) NOT NULL DEFAULT '' ,
  CDPURL CHAR(1) NOT NULL DEFAULT '' ,
  CDPURO CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( CDCOYNO ) )

  RCDFMT IPSCPYDF   ;

LABEL ON TABLE IPSCPYDSQ
  IS 'IPS Company Details         CD' ;

LABEL ON COLUMN IPSCPYDSQ
( CDCOYNO IS 'Cpy.' ,
  CDAUDAM IS 'Audit number' ,
  CDAUDOR IS 'Audit number' ,
  CDAUDPR IS 'Audit number' ,
  CDAUDGR IS 'Audit number' ,
  CDAUDRE IS 'Audit number' ,
  CDPORD IS 'Audit number' ,
  CDIMS IS 'Yes/No' ,
  CDCGAS IS 'Yes/No' ,
  CDPURL IS 'Yes/No' ,
  CDPURO IS 'Yes/No' ) ;

LABEL ON COLUMN IPSCPYDSQ
( CDCOYNO TEXT IS 'Company number' ,
  CDAUDAM TEXT IS 'Amendments Report Audit number' ,
  CDAUDOR TEXT IS 'Ordered Report Audit number' ,
  CDAUDPR TEXT IS 'Payments Report Audit number' ,
  CDAUDGR TEXT IS 'Goods Received Audit number' ,
  CDAUDRE TEXT IS 'Reconciliation Audit number' ,
  CDPORD TEXT IS 'Last P.O. Number' ,
  CDIMS TEXT IS 'IMS to be used' ,
  CDCGAS TEXT IS 'CGAS to be used' ,
  CDPURL TEXT IS 'Purge fully received lines' ,
  CDPURO TEXT IS 'Purge fully received orders' ) ;
