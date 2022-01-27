--------------------------------------------------------
--  File created - Thursday-December-16-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CUSTOMERS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."CUSTOMERS" 
   (	"ID" NUMBER(5,0) GENERATED ALWAYS AS IDENTITY, 
	"EMAIL" VARCHAR2(50)
   )  DEFAULT COLLATION "USING_NLS_COMP"
--------------------------------------------------------
--  DDL for Table DISCOUNTS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."DISCOUNTS" 
   (	"ID" CHAR(5),
	"DESCRIPTION" NVARCHAR2(100), 
	"PERCENT_OFF" NUMBER(2,2)
   )  DEFAULT COLLATION "USING_NLS_COMP"
--------------------------------------------------------
--  DDL for Table FILMS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."FILMS" 
   (	"ID" NUMBER(6,0) GENERATED ALWAYS AS IDENTITY, 
	"TITLE" NVARCHAR2(200) COLLATE "USING_NLS_COMP", 
	"DIRECTOR" NVARCHAR2(50) COLLATE "USING_NLS_COMP", 
	"RELEASE_DATE" DATE
   )  DEFAULT COLLATION "USING_NLS_COMP"
--------------------------------------------------------
--  DDL for Table ROOMS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."ROOMS" 
   (	"ID" NUMBER(3,0) GENERATED ALWAYS AS IDENTITY, 
	"CAPACITY" NUMBER(3,0), 
	"SCREENING_TYPE" CHAR(4)
   )  DEFAULT COLLATION "USING_NLS_COMP"
--------------------------------------------------------
--  DDL for Table SCREENINGS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."SCREENINGS" 
   (	"ID" NUMBER(6,0) GENERATED ALWAYS AS IDENTITY, 
	"FILM" NUMBER(6,0), 
	"ROOM" NUMBER(3,0), 
	"SCREENING_TIME" DATETIME
   )  DEFAULT COLLATION "USING_NLS_COMP"
--------------------------------------------------------
--  DDL for Table SCREENING_TYPES
--------------------------------------------------------

  CREATE TABLE "CINEMA"."SCREENING_TYPES" 
   (	"ID" CHAR(4), 
	"TYPE_NAME" NVARCHAR2(20), 
	"PRICE" NUMBER(3,0)
   )  DEFAULT COLLATION "USING_NLS_COMP" 

   COMMENT ON COLUMN "CINEMA"."SCREENING_TYPES"."TYPE_NAME" IS 'ex. 2D, 3D, IMAX'
--------------------------------------------------------
--  DDL for Table SOLD_TICKETS
--------------------------------------------------------

  CREATE TABLE "CINEMA"."SOLD_TICKETS" 
   (	"ID" NUMBER(6,0) GENERATED ALWAYS AS IDENTITY, 
	"CUSTOMER_ID" NUMBER(5,0), 
	"SCREENING_ID" NUMBER(6,0), 
	"DISCOUNT_ID" CHAR(5),
	"PRICE" NUMBER(6,2), 
	"TICKET_ORDER_TIME" TIMESTAMP (3)
   )  DEFAULT COLLATION "USING_NLS_COMP"

--------------------------------------------------------
--  DDL for Index SCREENINGS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."SCREENINGS_PK" ON "CINEMA"."SCREENINGS" ("ID")
--------------------------------------------------------
--  DDL for Index ROOMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."ROOMS_PK" ON "CINEMA"."ROOMS" ("ID")
--------------------------------------------------------
--  DDL for Index CUSTOMERS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."CUSTOMERS_PK" ON "CINEMA"."CUSTOMERS" ("ID")
--------------------------------------------------------
--  DDL for Index CUSTOMERS_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."CUSTOMERS_UK1" ON "CINEMA"."CUSTOMERS" ("EMAIL")
--------------------------------------------------------
--  DDL for Index FILMS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."FILMS_PK" ON "CINEMA"."FILMS" ("ID")
--------------------------------------------------------
--  DDL for Index SCREENING_TYPES_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."SCREENING_TYPES_PK" ON "CINEMA"."SCREENING_TYPES" ("ID")
--------------------------------------------------------
--  DDL for Index SOLD_TICKETS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."SOLD_TICKETS_PK" ON "CINEMA"."SOLD_TICKETS" ("ID")
--------------------------------------------------------
--  DDL for Index DISCOUNTS_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "CINEMA"."DISCOUNTS_PK" ON "CINEMA"."DISCOUNTS" ("ID")
--------------------------------------------------------
--  Constraints for Table DISCOUNTS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."DISCOUNTS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."DISCOUNTS" MODIFY ("PERCENT_OFF" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."DISCOUNTS" ADD CONSTRAINT "DISCOUNTS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table ROOMS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."ROOMS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."ROOMS" MODIFY ("CAPACITY" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."ROOMS" MODIFY ("SCREENING_TYPE" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."ROOMS" ADD CONSTRAINT "ROOMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table SCREENING_TYPES
--------------------------------------------------------

  ALTER TABLE "CINEMA"."SCREENING_TYPES" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SCREENING_TYPES" MODIFY ("PRICE" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SCREENING_TYPES" ADD CONSTRAINT "SCREENING_TYPES_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table CUSTOMERS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."CUSTOMERS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."CUSTOMERS" MODIFY ("EMAIL" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
  ALTER TABLE "CINEMA"."CUSTOMERS" ADD CONSTRAINT "CUSTOMERS_UK1" UNIQUE ("EMAIL")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table SOLD_TICKETS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."SOLD_TICKETS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SOLD_TICKETS" MODIFY ("SCREENING_ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SOLD_TICKETS" MODIFY ("TICKET_ORDER_TIME" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SOLD_TICKETS" ADD CONSTRAINT "SOLD_TICKETS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table FILMS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."FILMS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."FILMS" MODIFY ("TITLE" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."FILMS" ADD CONSTRAINT "FILMS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
--------------------------------------------------------
--  Constraints for Table SCREENINGS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."SCREENINGS" MODIFY ("ID" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SCREENINGS" MODIFY ("FILM" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SCREENINGS" MODIFY ("ROOM" NOT NULL ENABLE)
  ALTER TABLE "CINEMA"."SCREENINGS" ADD CONSTRAINT "SCREENINGS_PK" PRIMARY KEY ("ID")
  USING INDEX  ENABLE
  ALTER TABLE "CINEMA"."SCREENINGS" MODIFY ("SCREENING_TIME" NOT NULL ENABLE)
--------------------------------------------------------
--  Ref Constraints for Table ROOMS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."ROOMS" ADD CONSTRAINT "ROOMS_FK1" FOREIGN KEY ("SCREENING_TYPE")
	  REFERENCES "CINEMA"."SCREENING_TYPES" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table SCREENINGS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."SCREENINGS" ADD CONSTRAINT "SCREENINGS_FK1" FOREIGN KEY ("FILM")
	  REFERENCES "CINEMA"."FILMS" ("ID") ENABLE
  ALTER TABLE "CINEMA"."SCREENINGS" ADD CONSTRAINT "SCREENINGS_FK2" FOREIGN KEY ("ROOM")
	  REFERENCES "CINEMA"."ROOMS" ("ID") ENABLE
--------------------------------------------------------
--  Ref Constraints for Table SOLD_TICKETS
--------------------------------------------------------

  ALTER TABLE "CINEMA"."SOLD_TICKETS" ADD CONSTRAINT "SOLD_TICKETS_FK_SCREENING" FOREIGN KEY ("SCREENING_ID")
	  REFERENCES "CINEMA"."SCREENINGS" ("ID") ENABLE
  ALTER TABLE "CINEMA"."SOLD_TICKETS" ADD CONSTRAINT "SOLD_TICKETS_FK_CUSTOMER" FOREIGN KEY ("CUSTOMER_ID")
	  REFERENCES "CINEMA"."CUSTOMERS" ("ID") ENABLE
  ALTER TABLE "CINEMA"."SOLD_TICKETS" ADD CONSTRAINT "SOLD_TICKETS_FK_DISCOUNT" FOREIGN KEY ("DISCOUNT_ID")
	  REFERENCES "CINEMA"."DISCOUNTS" ("ID") ENABLE
