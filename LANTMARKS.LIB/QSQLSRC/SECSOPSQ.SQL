--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 13:20:52
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i
CREATE TABLE SECSOPSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SECSOP in KEV ignored.
  USCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  USUSER CHAR(10) NOT NULL DEFAULT '' ,
  USORDE CHAR(1) NOT NULL DEFAULT '' ,
  USORDC CHAR(1) NOT NULL DEFAULT '' ,
  USORDA CHAR(1) NOT NULL DEFAULT '' ,
  USDELO CHAR(1) NOT NULL DEFAULT '' ,
  USDELL CHAR(1) NOT NULL DEFAULT '' ,
  USINVB CHAR(1) NOT NULL DEFAULT '' ,
  USINVF CHAR(1) NOT NULL DEFAULT '' ,
  USPCRD CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( USCOYNO , USUSER ) )

  RCDFMT SECSOPF    ;

LABEL ON TABLE SECSOPSQ
  IS 'SOP User security details.  US' ;

LABEL ON COLUMN SECSOPSQ
( USCOYNO IS 'Cpy.' ,
  USUSER IS 'User' ,
  USORDE IS 'Acc O/E|  Y/N' ,
  USORDC IS 'Enter|Credit' ,
  USORDA IS 'Auth.|Rels.' ,
  USDELO IS 'Delete|Orders' ,
  USDELL IS 'Delete|Lines' ,
  USINVB IS 'Batch|Invoice' ,
  USINVF IS 'Fast|Inv.' ,
  USPCRD IS 'Print|Cred.' ) ;

LABEL ON COLUMN SECSOPSQ
( USCOYNO TEXT IS 'Company number' ,
  USUSER TEXT IS 'User' ,
  USORDE TEXT IS 'Access Order Entry' ,
  USORDC TEXT IS 'Enter Credits' ,
  USORDA TEXT IS 'Authorise Release' ,
  USDELO TEXT IS 'Delete whole orders' ,
  USDELL TEXT IS 'Delete order lines' ,
  USINVB TEXT IS 'Invoice in Batch' ,
  USINVF TEXT IS 'Fast Invoice' ,
  USPCRD TEXT IS 'Print Credits' ) ;
