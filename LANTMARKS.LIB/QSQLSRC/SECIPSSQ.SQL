--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              29/11/23 13:09:15
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE SECIPSSQ (
--  SQL150B   10   REUSEDLT(*NO) in table SECIPS in KEV ignored.
  USCOYNO CHAR(3) NOT NULL DEFAULT '' ,
  USUSER CHAR(10) NOT NULL DEFAULT '' ,
  USADD CHAR(1) NOT NULL DEFAULT '' ,
  USDEL CHAR(1) NOT NULL DEFAULT '' ,
  USMAIN CHAR(1) NOT NULL DEFAULT '' ,
  USENQ CHAR(1) NOT NULL DEFAULT '' ,
  USPORD CHAR(1) NOT NULL DEFAULT '' ,
  USRECV CHAR(1) NOT NULL DEFAULT '' ,
  USEOC CHAR(1) NOT NULL DEFAULT '' ,
  USEOM CHAR(1) NOT NULL DEFAULT '' ,
  USEOY CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( USCOYNO , USUSER ) )

  RCDFMT SECIPSF    ;

LABEL ON TABLE SECIPSSQ
  IS 'IPS User Security           US' ;

LABEL ON COLUMN SECIPSSQ
( USCOYNO IS 'Cpy.' ,
  USUSER IS 'User' ,
  USADD IS 'Yes/No' ,
  USDEL IS 'Yes/No' ,
  USMAIN IS 'Yes/No' ,
  USENQ IS 'Yes/No' ,
  USPORD IS 'Yes/No' ,
  USRECV IS 'Yes/No' ,
  USEOC IS 'Yes/No' ,
  USEOM IS 'Yes/No' ,
  USEOY IS 'Yes/No' ) ;

LABEL ON COLUMN SECIPSSQ
( USCOYNO TEXT IS 'Company number' ,
  USUSER TEXT IS 'User' ,
  USADD TEXT IS 'Add' ,
  USDEL TEXT IS 'Delete' ,
  USMAIN TEXT IS 'Amend' ,
  USENQ TEXT IS 'Enquiry' ,
  USPORD TEXT IS 'Access Purchasing' ,
  USRECV TEXT IS 'Access receiving' ,
  USEOC TEXT IS 'Access End of cycle' ,
  USEOM TEXT IS 'Access End of month' ,
  USEOY TEXT IS 'Access end of year' ) ;
