DROP DATABASE IF EXISTS ECOLE;

CREATE DATABASE IF NOT EXISTS ECOLE;
USE ECOLE;
# -----------------------------------------------------------------------------
#       TABLE : CLASSE_ECOLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLASSE_ECOLE
 (
   CODE_CLASSE CHAR(32) NOT NULL  ,
   CODE_ECOLE CHAR(5) NOT NULL  
   , PRIMARY KEY (CODE_CLASSE,CODE_ECOLE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : COMMUNE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS COMMUNE
 (
   NUM_COMMUNE BIGINT(4) NOT NULL  ,
   NOM__COMMUNE CHAR(32) NULL  
   , PRIMARY KEY (NUM_COMMUNE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ENFANT
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ENFANT
 (
   NUM_ENFANT CHAR(10) NOT NULL  ,
   CODE_CLASSE CHAR(32) NOT NULL  ,
   CODE_ECOLE CHAR(5) NOT NULL  ,
   NUM_COMMUNE BIGINT(4) NOT NULL  ,
   NOM_ENFANT CHAR(32) NULL  ,
   PRENOM_ENFANT CHAR(32) NULL  
   , PRIMARY KEY (NUM_ENFANT) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : CLASSE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS CLASSE
 (
   CODE_CLASSE CHAR(32) NOT NULL  ,
   NOM_CLASSE CHAR(32) NULL  
   , PRIMARY KEY (CODE_CLASSE) 
 ) 
 comment = "";

# -----------------------------------------------------------------------------
#       TABLE : ECOLE
# -----------------------------------------------------------------------------

CREATE TABLE IF NOT EXISTS ECOLE
 (
   CODE_ECOLE CHAR(5) NOT NULL  ,
   NUM_COMMUNE BIGINT(4) NOT NULL  ,
   NOM_ECOLE CHAR(32) NULL  
   , PRIMARY KEY (CODE_ECOLE) 
 ) 
 comment = "";


# -----------------------------------------------------------------------------
#       CREATION DES REFERENCES DE TABLE
# -----------------------------------------------------------------------------


ALTER TABLE CLASSE_ECOLE 
  ADD FOREIGN KEY FK_CLASSE_ECOLE_ECOLE (CODE_ECOLE)
      REFERENCES ECOLE (CODE_ECOLE) ;


ALTER TABLE CLASSE_ECOLE 
  ADD FOREIGN KEY FK_CLASSE_ECOLE_CLASSE (CODE_CLASSE)
      REFERENCES CLASSE (CODE_CLASSE) ;


ALTER TABLE ENFANT 
  ADD FOREIGN KEY FK_ENFANT_CLASSE_ECOLE (CODE_CLASSE,CODE_ECOLE)
      REFERENCES CLASSE_ECOLE (CODE_CLASSE,CODE_ECOLE) ;


ALTER TABLE ENFANT 
  ADD FOREIGN KEY FK_ENFANT_COMMUNE (NUM_COMMUNE)
      REFERENCES COMMUNE (NUM_COMMUNE) ;


ALTER TABLE ECOLE 
  ADD FOREIGN KEY FK_ECOLE_COMMUNE (NUM_COMMUNE)
      REFERENCES COMMUNE (NUM_COMMUNE) ;

