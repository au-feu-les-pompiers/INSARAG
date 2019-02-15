DROP TABLE mission;
DROP TABLE rolesPompier;
DROP TABLE utilisateur;


DROP SEQUENCE mission_seq;
DROP SEQUENCE role_seq;
DROP SEQUENCE utilisateur_seq;



-- ----------------------------
-- Table structure for "utilisateur"
-- ---------------------------- 
CREATE TABLE utilisateur(
idUtilisateur NUMBER(19,0) NOT NULL ENABLE PRIMARY KEY,
email VARCHAR(50),
mdp VARCHAR(30),
nom VARCHAR(30),
prenom VARCHAR(30),
numero_de_telephone VARCHAR(15),
date_de_naissance VARCHAR(30),
matricule VARCHAR(15),
administrateur NUMBER (1,0),
enMission NUMBER(1) DEFAULT 0
);

-- ----------------------------
-- Table structure for "mission"
-- ---------------------------- 
CREATE TABLE mission(
idMission NUMBER(19,0) NOT NULL ENABLE PRIMARY KEY,
lieu VARCHAR(30),
debut VARCHAR(30),
fin VARCHAR(30),
nb_de_places NUMBER(3,0),
flag_fin NUMBER(1) DEFAULT 0
);

-- ----------------------------
-- Table structure for "role"
-- ---------------------------- 
CREATE TABLE rolesPompier(
idRole NUMBER(19,0) NOT NULL PRIMARY KEY,
nom VARCHAR (30) NOT NULL
);


CREATE SEQUENCE utilisateur_seq
minvalue 1
maxvalue 9999999999999999999999999999
start with 1 -- Dernier ID des insertions 
increment by 1;
/

CREATE SEQUENCE mission_seq
minvalue 1
maxvalue 9999999999999999999999999999
start with 1 -- Dernier ID des insertions 
increment by 1;
/

CREATE SEQUENCE role_seq
minvalue 1
maxvalue 9999999999999999999999999999
start with 1 -- Dernier ID des insertions 
increment by 1;
/
