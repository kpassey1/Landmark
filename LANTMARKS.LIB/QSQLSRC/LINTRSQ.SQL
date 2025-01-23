--  Generate SQL
--  Version:                   V7R5M0 220415
--  Generated on:              22/11/23 15:59:36
--  Relational Database:       SEAWOLF
--  Standards Option:          Db2 for i

CREATE TABLE LINTRSQ (
--  SQL150B   10   REUSEDLT(*NO) in table LINTR in KEV ignored.
  LICOYN CHAR(3) NOT NULL DEFAULT '' ,
  LIINVN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  LIINVL DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
  LIACNO CHAR(6) NOT NULL DEFAULT '' ,
  LIBRAN CHAR(3) NOT NULL DEFAULT '' ,
  LICORD CHAR(15) NOT NULL DEFAULT '' ,
  LISLSM CHAR(3) NOT NULL DEFAULT '' ,
  LIORDS CHAR(3) NOT NULL DEFAULT '' ,
  LIIDTE NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column LIIDTE ignored.
  LISDPC DECIMAL(5, 2) NOT NULL DEFAULT 0 ,
  LINETT DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LINETT ignored.
  LICOST DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LICOST ignored.
  LITXAM DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LITXAM ignored.
  LISDAM DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
  LIWHSE CHAR(3) NOT NULL DEFAULT '' ,
  LIITEM CHAR(20) NOT NULL DEFAULT '' ,
  LIIDSC CHAR(40) NOT NULL DEFAULT '' ,
  LILOCN CHAR(10) NOT NULL DEFAULT '' ,
  LIIUOM CHAR(5) NOT NULL DEFAULT '' ,
  LIINVQ DECIMAL(9, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LIINVQ ignored.
  LIPRCE DECIMAL(11, 4) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LIPRCE ignored.
  LIINVV DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LIINVV ignored.
  LITDSC DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
  LIVATD DECIMAL(13, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LIVATD ignored.
  LINLAC CHAR(15) NOT NULL DEFAULT '' ,
  LINLAS CHAR(15) NOT NULL DEFAULT '' ,
  LINLST CHAR(15) NOT NULL DEFAULT '' ,
  LIPERD DECIMAL(5, 0) NOT NULL DEFAULT 0 ,
  LIFINY DECIMAL(4, 0) NOT NULL DEFAULT 0 ,
  LIORDN DECIMAL(7, 0) NOT NULL DEFAULT 0 ,
  LIPDAT NUMERIC(8, 0) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTWRD in column LIPDAT ignored.
  LIFCMT DECIMAL(11, 2) NOT NULL DEFAULT 0 ,
--  SQL150D   10   EDTCDE in column LIFCMT ignored.
  LIBSC2 CHAR(3) NOT NULL DEFAULT '' ,
  LITAXC CHAR(2) NOT NULL DEFAULT '' ,
  LIFLAG CHAR(1) NOT NULL DEFAULT '' ,
  LICONT CHAR(10) NOT NULL DEFAULT '' ,
  LIJOBN CHAR(10) NOT NULL DEFAULT '' ,
  LIPROC CHAR(1) NOT NULL DEFAULT '' ,
  PRIMARY KEY( LICOYN , LIINVN , LIINVL ) )

  RCDFMT LINTRF     ;

LABEL ON TABLE LINTRSQ
  IS 'SOP General Interface' ;

LABEL ON COLUMN LINTRSQ
( LICOYN IS 'Cpy.' ,
  LIACNO IS 'Customer|Number' ,
  LIBRAN IS 'Br' ,
  LISLSM IS '_' ,
  LIIDTE IS 'Date|Invoiced' ,
  LINETT IS 'Value' ,
  LICOST IS 'Cost Value' ,
  LITXAM IS 'Tax Value' ,
  LIWHSE IS 'Whse|No.' ,
  LIITEM IS 'Item Number' ,
  LIIDSC IS 'Item Description' ,
  LILOCN IS 'Location' ,
  LIIUOM IS 'UOM' ,
  LIINVQ IS 'Quantity|Invoiced' ,
  LIPRCE IS 'Price' ,
  LIINVV IS 'Line Value' ,
  LIVATD IS 'Tax Value' ,
  LINLAC IS 'Sales Account' ,
  LINLAS IS 'Cost of Sales' ,
  LINLST IS 'Stock Account' ,
  LIFCMT IS 'Foreign|Currency|Amo' ) ;

LABEL ON COLUMN LINTRSQ
( LICOYN TEXT IS 'Company number' ,
  LIINVN TEXT IS 'Invoice Number' ,
  LIINVL TEXT IS 'Line Number' ,
  LIACNO TEXT IS 'Customer Account Number' ,
  LIBRAN TEXT IS 'Branch Number' ,
  LICORD TEXT IS 'Customer Order Number' ,
  LISLSM TEXT IS 'Salesperson code' ,
  LIORDS TEXT IS 'Order Description Code' ,
  LIIDTE TEXT IS 'Date invoiced''Tax point date.' ,
  LISDPC TEXT IS 'Settlement discount %' ,
  LINETT TEXT IS 'Taxable amount.' ,
  LICOST TEXT IS 'Cost of Sale' ,
  LITXAM TEXT IS 'Tax amount' ,
  LISDAM TEXT IS 'Settlement discount amount' ,
  LIWHSE TEXT IS 'Warehouse Number' ,
  LIITEM TEXT IS 'Item Number' ,
  LIIDSC TEXT IS 'Item Description' ,
  LILOCN TEXT IS 'Location' ,
  LIIUOM TEXT IS 'Unit of Measure' ,
  LIINVQ TEXT IS 'Quantity Invoiced' ,
  LIPRCE TEXT IS 'Price' ,
  LIINVV TEXT IS 'Line Value' ,
  LITDSC TEXT IS 'Discount %' ,
  LIVATD TEXT IS 'Tax amount' ,
  LINLAC TEXT IS 'N/L Sales Account' ,
  LINLAS TEXT IS 'N/L Cost of Sales Account' ,
  LINLST TEXT IS 'N/L Stock Account' ,
  LIPERD TEXT IS 'Period Number' ,
  LIFINY TEXT IS 'Financial Year' ,
  LIORDN TEXT IS 'Order Number' ,
  LIPDAT TEXT IS 'Payment Date' ,
  LIFCMT TEXT IS 'Foreign Currency Amount' ,
  LIBSC2 TEXT IS 'Original Currency Code' ,
  LITAXC TEXT IS 'Tax Code' ,
  LIFLAG TEXT IS 'Special Charge Flag' ,
  LICONT TEXT IS 'Contract Number' ,
  LIJOBN TEXT IS 'Job Number' ,
  LIPROC TEXT IS 'Processed Record Flag' ) ;
