-- ----------------------------
-- Table structure for "profil"
-- ---------------------------- 
CREATE TABLE profil(
idPompier NUMBER(19,0) NOT NULL ENABLE PRIMARY KEY,
email VARCHAR(50) NOT NULL,
mdp VARCHAR(30) NOT NULL,
nom VARCHAR(30) NOT NULL ENABLE,
prenom VARCHAR(30) NOT NULL ENABLE,
numero_de_telephone VARCHAR(10) NOT NULL ENABLE,
date_de_naissance VARCHAR(30) NOT NULL ENABLE,
matricule VARCHAR(15),
administrateur NUMBER (1,0)
);

-- ----------------------------
-- Table structure for "mission"
-- ---------------------------- 
CREATE TABLE mission(
idMission NUMBER(19,0) NOT NULL ENABLE PRIMARY KEY,
lieu VARCHAR(30) NOT NULL ENABLE,
debut VARCHAR(30) NOT NULL ENABLE,
fin VARCHAR(30) NOT NULL ENABLE,
nb_de_places NUMBER(3,0) NOT NULL ENABLE,
flag_fin NUMBER(1) DEFAULT 0
);

-- ----------------------------
-- Table structure for "role"
-- ---------------------------- 
CREATE TABLE rolesPompier(
idRole NUMBER(19,0) NOT NULL PRIMARY KEY,
nom VARCHAR (30) NOT NULL
);

CREATE TABLE affecter(
idRole NUMBER(19,0) NOT NULL,
idPompier NUMBER (19,0) NOT NULL,
FOREIGN KEY (idRole) REFERENCES rolesPompier(idRole),
FOREIGN KEY (idPompier) REFERENCES profil(idPompier)
);

CREATE SEQUENCE profil_seq
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
