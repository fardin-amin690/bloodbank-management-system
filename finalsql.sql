CREATE USER centralbloodbank
   IDENTIFIED BY blood;
GRANT UNLIMITED TABLESPACE TO centralbloodbank;
GRANT CREATE TABLE, CREATE VIEW, CREATE SEQUENCE TO centralbloodbank;
GRANT CREATE PROCEDURE, CREATE TRIGGER TO centralbloodbank;

CREATE TABLE PHONE  (
    PH_ID NUMBER (10) PRIMARY KEY,
    PHONE VARCHAR2(255) NOT NULL
);

CREATE TABLE PATIENT (
    P_ID INT PRIMARY KEY,
    P_NAME VARCHAR2 (255) NOT NULL,
    P_EMAIL VARCHAR2 (255) NOT NULL,
    P_GENDER VARCHAR2 (255) NOT NULL,
    P_ADDRESS VARCHAR2 (255) NOT NULL,
    P_BLOODGROUP VARCHAR2 (255) NOT NULL,
    PH_ID NUMBER(10),
    FOREIGN KEY (PH_ID) REFERENCES PHONE(PH_ID)
);

CREATE TABLE BLOODBANK (
    BB_EMAIL VARCHAR2 (255),
    BB_NAME VARCHAR2 (255) NOT NULL,
    BB_ADDRESS VARCHAR2 (255) NOT NULL,
    PH_ID NUMBER (10),
    FOREIGN KEY (PH_ID) REFERENCES PHONE(PH_ID)
);

CREATE TABLE INVENTORY (
    I_ID INT PRIMARY KEY,
    I_NAME VARCHAR2(255) NOT NULL,
    I_ADDRESS VARCHAR2(255) NOT NULL,
    I_BLOODGROUP VARCHAR2(255) NOT NULL, 
    I_AMOUNT VARCHAR2(255) NOT NULL,
    PH_ID NUMBER (10),
    FOREIGN KEY (PH_ID) REFERENCES PHONE(PH_ID)
  
);

CREATE TABLE DONOR(
    D_ID INT PRIMARY KEY,
    D_NAME VARCHAR2(255) NOT NULL,
    D_EMAIL VARCHAR2(255) NOT NULL,
    D_GENDER VARCHAR2(255) NOT NULL,
    D_AGE NUMBER(10) NOT NULL,
    D_BLOODGROUP VARCHAR2(255) NOT NULL,
    D_ADDRESS VARCHAR2(255) NOT NULL,
    PH_ID NUMBER(10),
    FOREIGN KEY (PH_ID) REFERENCES PHONE(PH_ID)
);

CREATE TABLE EXECUTIVE (
    E_EMAIL VARCHAR2(255) PRIMARY KEY,
    E_NAME VARCHAR2(255) NOT NULL
);


CREATE TABLE NEEDER (
    N_ID NUMBER(10) PRIMARY KEY,
    N_BLOODBANK_ID NUMBER(10),
    FOREIGN KEY (N_BLOODBANK_ID) REFERENCES BLOOD_BANK(BB_ID),
    N_P_ID NUMBER(10),
    FOREIGN KEY (N_P_ID) REFERENCES PATIENT(P_ID)
);
CREATE TABLE  BLOODREQUEST(
  BR_ID NUMBER(10,0), 
	BR_NAME VARCHAR2(255) NOT NULL, 
	BR_EMAIL VARCHAR2(255) NOT NULL, 
	BR_BLOODGROUP VARCHAR2(255) NOT NULL, 
	BR_AMOUNT NUMBER(10,0) NOT NULL, 
	 PRIMARY KEY (BR_ID)
	 
   )
/


CREATE TABLE PATIENTREQUEST(
    PR_ID NUMBER(10) PRIMARY KEY,
    PR_P_ID NUMBER(10),
    FOREIGN KEY (PR_P_ID) REFERENCES PATIENT(P_ID),
    PR_BR_ID NUMBER(10),
    FOREIGN KEY (PR_BR_ID) REFERENCES BLOODREQUEST(BR_ID)
);

CREATE TABLE MANAGE(
    M_ID NUMBER(10) PRIMARY KEY,
    M_I_ID NUMBER(10) NOT NULL,
    FOREIGN KEY (M_I_ID) REFERENCES INVENTORY(I_ID),
    M_BB_ID NUMBER(10),
    FOREIGN KEY (M_BB_ID) REFERENCES BLOOD_BANK(BB_ID)
);

CREATE TABLE SOURCE(
    S_ID NUMBER(10) PRIMARY KEY,
    S_D_ID NUMBER(10) NOT NULL,
    FOREIGN KEY (S_D_ID) REFERENCES DONER(D_ID),
    S_BB_ID NUMBER(10),
    FOREIGN KEY (S_BB_ID) REFERENCES BLOOD_BANK(BB_ID)
);

CREATE TABLE BLOODDONATE(
    BD_ID NUMBER(10) PRIMARY KEY,
    BD_BLOODGROUP VARCHAR2(255) NOT NULL,
    BD_AMOUNT NUMBER(10) NOT NULL
);

CREATE TABLE GIFT(
    G_ID NUMBER(10) PRIMARY KEY,
    G_D_ID NUMBER(10) NOT NULL,
    FOREIGN KEY (G_D_ID) REFERENCES DONER(D_ID),
    G_BD_ID NUMBER(10),
    FOREIGN KEY (G_BD_ID) REFERENCES BLOODDONATE(BD_ID)
);

CREATE SEQUENCE SEQ_PHONE_ID
  START WITH 1000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for PATIENT table starting at 2000
CREATE SEQUENCE SEQ_PATIENT_ID
  START WITH 2000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for BLOODBANK table starting at 3000
CREATE SEQUENCE SEQ_BLOODBANK_ID
  START WITH 3000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for INVENTORY table starting at 4000
CREATE SEQUENCE SEQ_INVENTORY_ID
  START WITH 4000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for DONER table starting at 5000
CREATE SEQUENCE SEQ_DONOR_ID
  START WITH 5000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for NEEDER table starting at 6000
CREATE SEQUENCE SEQ_NEEDER_ID
  START WITH 6000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for BLOODREQUEST table starting at 7000
CREATE SEQUENCE SEQ_BLOODREQUEST_ID
  START WITH 7000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for PATIENTREQUEST table starting at 8000
CREATE SEQUENCE SEQ_PATIENTREQUEST_ID
  START WITH 8000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for MANAGE table starting at 9000
CREATE SEQUENCE SEQ_MANAGE_ID
  START WITH 9000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for SOURCE table starting at 10000
CREATE SEQUENCE SEQ_SOURCE_ID
  START WITH 10000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for BLOODDONATE table starting at 11000
CREATE SEQUENCE SEQ_BLOODDONATE_ID
  START WITH 11000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;

-- Create sequence for GIFT table starting at 12000
CREATE SEQUENCE SEQ_GIFT_ID
  START WITH 12000
  INCREMENT BY 1
  NOCACHE
  NOCYCLE;


-- Inserting data into PHONE table with auto-generated ID
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7890');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7891');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7892');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7893');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7894');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7895');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7896');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7897');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7898');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7899');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-7990');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6890');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6891');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6892');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6893');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6894');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6895');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6896');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6897');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6898');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-6899');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5990');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5890');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5891');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5892');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5893');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5894');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5895');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5896');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5897');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5898');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5899');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-5990');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0098');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0099');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0090');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0090');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0091');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0092');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0093');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0094');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0095');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0096');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0097');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0098');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0099');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '123-456-0090');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-6896');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-6897');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-6898');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-6899');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5990');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5890');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5891');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5892');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5893');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5894');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5895');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5896');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5897');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5898');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5899');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '023-456-5990');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0098');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0099');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0090');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0090');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0091');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0092');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0093');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0094');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0095');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0096');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0097');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0098');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0099');
INSERT INTO PHONE VALUES (SEQ_PHONE_ID.NEXTVAL, '000-456-0090');

-- Inserting data into PATIENT table with auto-generated ID
INSERT INTO PATIENT VALUES (SEQ_PATIENT_ID.NEXTVAL, 'Jahid','jahid@gmail.com', 'Male', 'Joypurhat', 'A+', 1000);
INSERT INTO PATIENT VALUES (SEQ_PATIENT_ID.NEXTVAL, 'Fardin','fardin@gmail.com','Male', 'Dhaka', 'AB+', 1001);
INSERT INTO PATIENT VALUES (SEQ_PATIENT_ID.NEXTVAL, 'Rahim','rahim@gmail.com', 'Male', 'Rajshahi', 'O+', 1002);
INSERT INTO PATIENT VALUES (SEQ_PATIENT_ID.NEXTVAL, 'Karim', 'karim@gmail.com','Male', 'Bogura', 'B+', 1003);
INSERT INTO PATIENT VALUES (SEQ_PATIENT_ID.NEXTVAL, 'Nusrat', 'nusrat@gmail.com','Female', 'Rangpur', 'O-', 1004);
		

-- Inserting data into BLOODBANK table with auto-generated ID
INSERT INTO BLOODBANK VALUES ('bb@gmail.com', 'Central Blood Bank', 'Dhaka', 1010);




INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'City Inventory', 'Dhaka', 'B-', '10 units', 1020);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'City Inventory', 'Dhaka', 'AB+', '10 units', 1021);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'West Inventory', 'Dhaka', 'O-', '10 units', 1022);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'North Inventory', 'Dhaka', 'O+', '10 units', 1023);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'East Inventory', 'Dhaka', 'A+', '10 units', 1024);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'City Inventory', 'Dhaka', 'B+', '10 units', 1025);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'West Inventory', 'Dhaka', '+', '10 units', 1026);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'North Inventory', 'Dhaka', 'B+', '10 units', 1027);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'West Inventory', 'Dhaka', 'B+', '10 units', 1028);
INSERT INTO INVENTORY VALUES (SEQ_INVENTORY_ID.NEXTVAL, 'City Inventory', 'Dhaka', 'B-', '10 units', 1029);



-- Inserting data into DONOR table with auto-generated ID

INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Riad','riad@gmail.com', 'Male', 25, 'O+', 'Dhaka', 1040);
INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Hassan','hassan@gmail.com', 'Male', 28, 'O-', 'Rajshahi', 1041);
INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Mostak', 'mostak@gmail.com','Male', 30, 'B+', 'Bogura', 1042);
INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Rakib','rakib@gmail.com', 'Male', 45, 'A+', 'Rongpur', 1043);
INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Riyan', 'riyan@gmail.com','Male', 35, 'AB+', 'Dhaka', 1044);
INSERT INTO DONOR VALUES (SEQ_DONOR_ID.NEXTVAL, 'Meherun', 'meherun@gmail.com','Female', 20, 'B-', 'Dhaka', 1045);


-- Inserting data into NEEDER table with auto-generated ID
INSERT INTO NEEDER VALUES (SEQ_NEEDER_ID.NEXTVAL, 3000, 2020);
INSERT INTO NEEDER VALUES (SEQ_NEEDER_ID.NEXTVAL, 3001, 2021);
INSERT INTO NEEDER VALUES (SEQ_NEEDER_ID.NEXTVAL, 3002, 2022);
INSERT INTO NEEDER VALUES (SEQ_NEEDER_ID.NEXTVAL, 3003, 2023);
INSERT INTO NEEDER VALUES (SEQ_NEEDER_ID.NEXTVAL, 3004, 2024);


-- Inserting data into BLOODREQUEST table with auto-generated ID

INSERT INTO BLOODREQUEST VALUES (SEQ_BLOODREQUEST_ID.NEXTVAL,'RUHUL','r@gmail.com', 'AB+', 2);
-- INSERT INTO BLOODREQUEST VALUES (SEQ_BLOODREQUEST_ID.NEXTVAL,2036, 'O-', 1);
-- INSERT INTO BLOODREQUEST VALUES (SEQ_BLOODREQUEST_ID.NEXTVAL,2037, 'O+', 5);
-- INSERT INTO BLOODREQUEST VALUES (SEQ_BLOODREQUEST_ID.NEXTVAL,2038, 'A+', 4);
-- INSERT INTO BLOODREQUEST VALUES (SEQ_BLOODREQUEST_ID.NEXTVAL,2039, 'B+', 2);


-- Inserting data into PATIENTREQUEST table with auto-generated ID
INSERT INTO PATIENTREQUEST VALUES (SEQ_PATIENTREQUEST_ID.NEXTVAL, 3000, 7000);
INSERT INTO PATIENTREQUEST VALUES (SEQ_PATIENTREQUEST_ID.NEXTVAL, 3001, 7001);
INSERT INTO PATIENTREQUEST VALUES (SEQ_PATIENTREQUEST_ID.NEXTVAL, 3002, 7002);
INSERT INTO PATIENTREQUEST VALUES (SEQ_PATIENTREQUEST_ID.NEXTVAL, 3003, 7003);
INSERT INTO PATIENTREQUEST VALUES (SEQ_PATIENTREQUEST_ID.NEXTVAL, 3004, 7004);


-- Inserting data into MANAGE table with auto-generated ID
INSERT INTO MANAGE VALUES (SEQ_MANAGE_ID.NEXTVAL, 4000, 3000);
INSERT INTO MANAGE VALUES (SEQ_MANAGE_ID.NEXTVAL, 4001, 3001);
INSERT INTO MANAGE VALUES (SEQ_MANAGE_ID.NEXTVAL, 4002, 3002);
INSERT INTO MANAGE VALUES (SEQ_MANAGE_ID.NEXTVAL, 4003, 3003);
INSERT INTO MANAGE VALUES (SEQ_MANAGE_ID.NEXTVAL, 4004, 3004);


-- Inserting data into SOURCE table with auto-generated ID
INSERT INTO SOURCE VALUES (SEQ_SOURCE_ID.NEXTVAL, 5000, 3000);
INSERT INTO SOURCE VALUES (SEQ_SOURCE_ID.NEXTVAL, 5001, 3001);
INSERT INTO SOURCE VALUES (SEQ_SOURCE_ID.NEXTVAL, 5002, 3002);
INSERT INTO SOURCE VALUES (SEQ_SOURCE_ID.NEXTVAL, 5003, 3003);
INSERT INTO SOURCE VALUES (SEQ_SOURCE_ID.NEXTVAL, 5004, 3004);


-- Inserting data into BLOODDONATE table with auto-generated ID
INSERT INTO BLOODDONATE VALUES (SEQ_BLOODDONATE_ID.NEXTVAL, 'O-', 3);
INSERT INTO BLOODDONATE VALUES (SEQ_BLOODDONATE_ID.NEXTVAL, 'A+', 2);
INSERT INTO BLOODDONATE VALUES (SEQ_BLOODDONATE_ID.NEXTVAL, 'B-', 1);
INSERT INTO BLOODDONATE VALUES (SEQ_BLOODDONATE_ID.NEXTVAL, 'AB+', 4);
INSERT INTO BLOODDONATE VALUES (SEQ_BLOODDONATE_ID.NEXTVAL, 'B+', 5);


-- Inserting data into GIFT table with auto-generated ID
INSERT INTO GIFT VALUES (SEQ_GIFT_ID.NEXTVAL, 5000, 11000);
INSERT INTO GIFT VALUES (SEQ_GIFT_ID.NEXTVAL, 5001, 11001);
INSERT INTO GIFT VALUES (SEQ_GIFT_ID.NEXTVAL, 5002, 11002);
INSERT INTO GIFT VALUES (SEQ_GIFT_ID.NEXTVAL, 5003, 11003);
INSERT INTO GIFT VALUES (SEQ_GIFT_ID.NEXTVAL, 5004, 11004);

-- Inserting data into EXECUTIVE table 
INSERT INTO EXECUTIVE VALUES ('exe@gmail.com', 'EXECUTIVE');



Create role admin;
GRANT admin TO centralbloodbank;
Create role bloodbank_role;
GRANT bloodbank_role TO centralbloodbank;

GRANT CREATE SESSION TO admin;
GRANT SELECT, INSERT, UPDATE, DELETE 



GRANT CREATE SESSION TO bloodbank;
GRANT SELECT, INSERT, UPDATE



-- Patient

CREATE OR REPLACE PROCEDURE INSERT_PATIENT(
  P_NAME_PARAM IN VARCHAR2,
  P_EMAIL_PARAM IN VARCHAR2,
  P_GENDER_PARAM IN VARCHAR2,
  P_ADDRESS_PARAM IN VARCHAR2,
  P_BLOODGROUP_PARAM IN VARCHAR2,
  PH_NUMBER_PARAM IN VARCHAR2
)
AS
BEGIN
  DECLARE
      P_ID_PARAM INT;
      PH_ID_PARAM INT;
  BEGIN
    SELECT SEQ_PATIENT_ID.NEXTVAL INTO P_ID_PARAM FROM dual;
    SELECT SEQ_PHONE_ID.NEXTVAL INTO PH_ID_PARAM FROM dual;

    INSERT INTO PHONE (
      PH_ID,
      PHONE
    ) 
    VALUES (
      PH_ID_PARAM,
      PH_NUMBER_PARAM
    );

    INSERT INTO PATIENT (
      P_ID,
      P_NAME,
      P_EMAIL,
      P_GENDER,
      P_ADDRESS, 
      P_BLOODGROUP,
      PH_ID
    ) 
    VALUES (
      P_ID_PARAM,
      P_NAME_PARAM,
      P_EMAIL_PARAM,
      P_GENDER_PARAM, 
      P_ADDRESS_PARAM,
      P_BLOODGROUP_PARAM, 
      PH_ID_PARAM
    );
    COMMIT;
  END;
END INSERT_PATIENT;

-- Donor


CREATE OR REPLACE PROCEDURE INSERT_DONOR(
  D_NAME_PARAM IN VARCHAR2,
  D_EMAIL_PARAM IN VARCHAR2,
  D_GENDER_PARAM IN VARCHAR2,
  D_AGE_PARAM IN VARCHAR2,
  D_BLOODGROUP_PARAM IN VARCHAR2,
  D_ADDRESS_PARAM IN VARCHAR2,
  D_PH_NUMBER_PARAM IN VARCHAR2
)
AS
BEGIN
  DECLARE
      D_ID_PARAM INT;
      PH_ID_PARAM INT;
  BEGIN
    SELECT SEQ_DONOR_ID.NEXTVAL INTO D_ID_PARAM FROM dual;
    SELECT SEQ_PHONE_ID.NEXTVAL INTO PH_ID_PARAM FROM dual;

    INSERT INTO PHONE (
      PH_ID,
      PHONE
    ) 
    VALUES (
      PH_ID_PARAM,
      D_PH_NUMBER_PARAM
    );

    INSERT INTO DONOR (
      D_ID,
      D_NAME,
      D_EMAIL,
      D_GENDER,
      D_AGE,
      D_BLOODGROUP,
      D_ADDRESS,   
      PH_ID
    ) 
    VALUES (
      D_ID_PARAM,
      D_NAME_PARAM,
      D_EMAIL_PARAM,
      D_GENDER_PARAM, 
      D_AGE_PARAM,
      D_BLOODGROUP_PARAM, 
      D_ADDRESS_PARAM,      
      PH_ID_PARAM
    );
    COMMIT;
  END;
END INSERT_DONOR;


-- Inventory

CREATE OR REPLACE PROCEDURE INSERT_INVENTORY(
  I_NAME_PARAM IN VARCHAR2,
  I_ADDRESS_PARAM IN VARCHAR2,
  I_BLOODGROUP_PARAM IN VARCHAR2,
  I_AMOUNT_PARAM IN VARCHAR2, 
  I_PH_NUMBER_PARAM IN VARCHAR2
)
AS
BEGIN
  DECLARE
      I_ID_PARAM INT;
      PH_ID_PARAM INT;
  BEGIN
    SELECT SEQ_INVENTORY_ID.NEXTVAL INTO I_ID_PARAM FROM dual;
    SELECT SEQ_PHONE_ID.NEXTVAL INTO PH_ID_PARAM FROM dual;

    INSERT INTO PHONE (
      PH_ID,
      PHONE
    ) 
    VALUES (
      PH_ID_PARAM,
      I_PH_NUMBER_PARAM
    );

    INSERT INTO INVENTORY (
      I_ID,
      I_NAME,
      I_ADDRESS,  
      I_BLOODGROUP,
      I_AMOUNT,       
      PH_ID
    ) 
    VALUES (
      I_ID_PARAM,
      I_NAME_PARAM,
      I_ADDRESS_PARAM, 
      I_BLOODGROUP_PARAM, 
      I_AMOUNT_PARAM,            
      PH_ID_PARAM
    );
    COMMIT;
  END;
END INSERT_INVENTORY;

-- Update Inventory

CREATE OR REPLACE PROCEDURE UPDATE_INVENTORY(
    I_ID_PARAM IN INT,
    I_NAME_PARAM IN VARCHAR2,
    I_ADDRESS_PARAM IN VARCHAR2,
    I_BLOODGROUP_PARAM IN VARCHAR2,
    I_AMOUNT_PARAM IN VARCHAR2,
    I_PH_NUMBER_PARAM IN VARCHAR2
)
AS
    PH_ID_PARAM INT;
BEGIN
    SELECT PH_ID INTO PH_ID_PARAM
    FROM INVENTORY
    WHERE I_ID = I_ID_PARAM;

    UPDATE PHONE
    SET PHONE = I_PH_NUMBER_PARAM
    WHERE PH_ID = PH_ID_PARAM;

    UPDATE INVENTORY
    SET
        I_NAME = I_NAME_PARAM,
        I_ADDRESS = I_ADDRESS_PARAM,
        I_BLOODGROUP = I_BLOODGROUP_PARAM,
        I_AMOUNT = I_AMOUNT_PARAM
    WHERE
        I_ID = I_ID_PARAM;

    COMMIT;
END UPDATE_INVENTORY;
/


-- Bloodrequest


create 
or replace PROCEDURE INSERT_BLOODREQUEST(
  BR_NAME_PARAM IN VARCHAR2,
  BR_EMAIL_PARAM IN VARCHAR2, 
  BR_BLOODGROUP_PARAM IN VARCHAR2, 
  BR_AMOUNT_PARAM IN VARCHAR2
) AS BEGIN DECLARE BR_ID_PARAM INT;
BEGIN 
SELECT 
  SEQ_BLOODREQUEST_ID.NEXTVAL INTO BR_ID_PARAM 
FROM 
  dual;
INSERT INTO BLOODREQUEST (
  BR_ID, BR_NAME, BR_EMAIL, BR_BLOODGROUP, 
  BR_AMOUNT
) 
VALUES 
  (
    BR_ID_PARAM, BR_NAME_PARAM, BR_EMAIL_PARAM, 
    BR_BLOODGROUP_PARAM, BR_AMOUNT_PARAM
  );
COMMIT;
END;
END INSERT_BLOODREQUEST;


