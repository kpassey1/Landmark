--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              28/11/23 16:47:36
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE ORDDLASQ (
  DACOYNO CHAR(3) NOT NULL DEFAULT '' ,
  DASONO CHAR(7) NOT NULL DEFAULT '' ,
  DAAUDIT DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
  DANAME CHAR(40) NOT NULL DEFAULT '' ,
  DALIN1 CHAR(40) NOT NULL DEFAULT '' ,
  DALIN2 CHAR(40) NOT NULL DEFAULT '' ,
  DALIN3 CHAR(40) NOT NULL DEFAULT '' ,
  DALIN4 CHAR(40) NOT NULL DEFAULT '' ,
  DALIN5 CHAR(40) NOT NULL DEFAULT '' ,
  DALIN6 CHAR(40) NOT NULL DEFAULT '' ,
  DAPSTCD CHAR(9) NOT NULL DEFAULT '' )

  RCDFMT ORDDLAF    ;

LABEL ON TABLE ORDDLASQ
  IS 'SOP Order Delivery address  DA' ;

LABEL ON COLUMN ORDDLASQ
( DACOYNO IS 'Cpy.' ,
  DASONO IS 'Order|Number' ,
  DAAUDIT IS 'Audit number' ,
  DANAME IS 'Customer name' ,
  DALIN1 IS 'Address Line' ,
  DALIN2 IS 'Address Line' ,
  DALIN3 IS 'Address Line' ,
  DALIN4 IS 'Address Line' ,
  DALIN5 IS 'Address Line' ,
  DALIN6 IS 'Address Line' ,
  DAPSTCD IS 'Post cd' ) ;

LABEL ON COLUMN ORDDLASQ
( DACOYNO TEXT IS 'Company number' ,
  DASONO TEXT IS 'S.O.Number' ,
  DAAUDIT TEXT IS 'Audit number' ,
  DANAME TEXT IS 'Customer name' ,
  DALIN1 TEXT IS 'Address Line' ,
  DALIN2 TEXT IS 'Address Line' ,
  DALIN3 TEXT IS 'Address Line' ,
  DALIN4 TEXT IS 'Address Line' ,
  DALIN5 TEXT IS 'Address Line' ,
  DALIN6 TEXT IS 'Address Line' ,
  DAPSTCD TEXT IS 'Post code' ) ;
