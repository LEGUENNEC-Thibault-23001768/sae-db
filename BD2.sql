drop table lieu cascade constraints;
drop table alerte cascade constraints;
drop table station cascade constraints;
drop table releve cascade constraints;
drop table mesure cascade constraints;

CREATE TABLE LIEU (
  IdL NUMBER(6, 0),
  NomL VARCHAR2(20),
  IdLPere NUMBER(6, 0),
  CONSTRAINT PK_LIEU PRIMARY KEY(IdL),
  CONSTRAINT FK_LIEU FOREIGN KEY(IdLPere)
  REFERENCES LIEU(IdL)
);

CREATE TABLE STATION (
    IdS NUMBER(6, 0),
    IdL NUMBER(6, 0),
    Tel NUMBER(15, 0),
    Latitude NUMBER(12, 8),
    Longitude NUMBER(12, 8),
    CONSTRAINT PK_STATION PRIMARY KEY(IdS),
    CONSTRAINT FK_STATION FOREIGN KEY(IdL)
    REFERENCES LIEU(IdL)
);

CREATE TABLE RELEVE (
    IdR NUMBER(6, 0),
    DateRel DATE,
    IdS NUMBER(6, 0),
    CONSTRAINT PK_RELEVE PRIMARY KEY(IdR),
    CONSTRAINT FK_RELEVE FOREIGN KEY(IdS)
    REFERENCES STATION(IdS)
);

CREATE TABLE MESURE (
    IdM NUMBER(6, 0),
    NomM VARCHAR2(20),
    Mesure NUMBER(8, 3),
    IdR NUMBER(6, 0),
    CONSTRAINT PK_MESURE PRIMARY KEY(IdM),
    CONSTRAINT FK_MESURE FOREIGN KEY(IdR)
    REFERENCES RELEVE(IdR)
);

CREATE TABLE ALERTE (
    IdA NUMBER(6, 0),
    Categorie VARCHAR2(20),
    IdL NUMBER(6, 0),
    DateDeb DATE,
    DateFin DATE,
    Niveau NUMBER(1),
    CONSTRAINT PK_ALERTE PRIMARY KEY(IdA),
    CONSTRAINT FK_ALERTE FOREIGN KEY(IdL)
    REFERENCES LIEU(IdL)
);

-- Insertion de données pour la table LIEU
INSERT ALL
INTO LIEU VALUES (1, 'Ile-De-France', NULL)
INTO LIEU VALUES (2, 'Departement-de-Paris', 1)
INTO LIEU VALUES (3, 'Paris', 2)
INTO LIEU VALUES (4, 'PACA', NULL)
INTO LIEU VALUES (5, 'Bouches-du-Rhone', 4)
INTO LIEU VALUES (16, 'Var', 5)
INTO LIEU VALUES (6, 'Marseille', 5)
INTO LIEU VALUES (17, 'Aix-en-Provence', 5)
INTO LIEU VALUES (18, 'Toulon', 16)
INTO LIEU VALUES (7, 'Auvergne', NULL)
INTO LIEU VALUES (8, 'Puy-de-Dome', 7)
INTO LIEU VALUES (9, 'Issoire', 8)
INTO LIEU VALUES (10, 'Auvergne-Rhone-Alpes', NULL)
INTO LIEU VALUES (11, 'Rhone', 10)
INTO LIEU VALUES (12, 'Lyon', 11)
INTO LIEU VALUES (13, 'Grand-Est', NULL)
INTO LIEU VALUES (14, 'Ardennes', 13)
INTO LIEU VALUES (15, 'Deville', 14)
INTO LIEU VALUES (19, 'Bretagne', NULL)
INTO LIEU VALUES (20, 'Morbihan', 19)
INTO LIEU VALUES (21, 'Vannes', 20)
SELECT * FROM dual;


-- STATION
INSERT ALL
INTO STATION VALUES (1, 3, 0123456789, 48.8566, 2.3522)
INTO STATION VALUES (2, 3, 0234567891, 48.8534, 2.3488)
INTO STATION VALUES (3, 3, 0345678912, 48.8503, 2.3481)
SELECT * FROM dual;


INSERT ALL
INTO STATION VALUES (4, 17, 0456789123, 43.5325, 5.4456)
INTO STATION VALUES (5, 17, 0567891234, 43.5342, 5.4427)
SELECT * FROM dual;

INSERT ALL
INTO STATION VALUES (6, 9, 0678912345, 45.5412, 3.2458)
INTO STATION VALUES (7, 9, 0789123456, 45.5478, 3.2491)
INTO STATION VALUES (8, 9, 0891234567, 45.5396, 3.2482)
INTO STATION VALUES (9, 12, 0900000000, 45.75, 4.85)
INTO STATION VALUES (10, 12, 0911111111, 45.7523, 4.8489)
INTO STATION VALUES (11, 12, 0922222222, 45.7497, 4.8463)
INTO STATION VALUES (12, 15, 0933333333, 49.8094, 4.736)
INTO STATION VALUES (13, 15, 0944444444, 49.8127, 4.7376)
INTO STATION VALUES (14, 18, 0955555555, 49.8079, 4.7352)
INTO STATION VALUES (18, 21, 0123456789, 48.8566, 2.3522)
INTO STATION VALUES (19, 21, 0234567891, 48.8534, 2.3488)
INTO STATION VALUES (20, 21, 0345678912, 48.8503, 2.3481)
INTO STATION VALUES (21, 21, 0456789123, 48.8472, 2.3456)
INTO STATION VALUES (22, 21, 0567891234, 48.8439, 2.3423)
INTO STATION VALUES (23, 21, 0678912345, 48.8407, 2.3391)
SELECT * FROM dual;

INSERT ALL
INTO RELEVE VALUES (1, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 1)
INTO RELEVE VALUES (2, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 2)
INTO RELEVE VALUES (3, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 3)
INTO RELEVE VALUES (4, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 4)
INTO RELEVE VALUES (5, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 5)
INTO RELEVE VALUES (6, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 6)
INTO RELEVE VALUES (7, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 7)
INTO RELEVE VALUES (8, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 8)
INTO RELEVE VALUES (9, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 9)
INTO RELEVE VALUES (10, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 10)
INTO RELEVE VALUES (11, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 11)
INTO RELEVE VALUES (12, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 12)
INTO RELEVE VALUES (13, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 13)
INTO RELEVE VALUES (14, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 14)
INTO RELEVE VALUES (15, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 18)
INTO RELEVE VALUES (16, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 19)
INTO RELEVE VALUES (17, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 20)
INTO RELEVE VALUES (18, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 21)
INTO RELEVE VALUES (19, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 22)
INTO RELEVE VALUES (20, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 23)
SELECT * FROM dual;

INSERT ALL
INTO MESURE VALUES (1, 'Temperature', 20.5, 1)
INTO MESURE VALUES (2, 'Humidite', 60.2, 2)
INTO MESURE VALUES (3, 'Pression', 1013.25, 3)
INTO MESURE VALUES (4, 'Temperature', 22.3, 4)
INTO MESURE VALUES (5, 'Humidite', 55.8, 5)
INTO MESURE VALUES (6, 'Pression', 1012.8, 6)
INTO MESURE VALUES (7, 'Temperature', 19.8, 7)
INTO MESURE VALUES (8, 'Humidite', 63.5, 8)
INTO MESURE VALUES (9, 'Pression', 1012.3, 9)
INTO MESURE VALUES (10, 'Temperature', 21.2, 10)
INTO MESURE VALUES (11, 'Humidite', 58.6, 11)
INTO MESURE VALUES (12, 'Pression', 1013.1, 12)
INTO MESURE VALUES (13, 'Temperature', 20.1, 13)
INTO MESURE VALUES (14, 'Humidite', 61.3, 14)
INTO MESURE VALUES (15, 'Pression', 1013.5, 15)
INTO MESURE VALUES (16, 'Temperature', 23.4, 16)
INTO MESURE VALUES (17, 'Humidite', 57.2, 17)
INTO MESURE VALUES (18, 'Pression', 1011.9, 18)
INTO MESURE VALUES (19, 'Temperature', 24.7, 19)
INTO MESURE VALUES (20, 'Humidite', 53.8, 20)
SELECT * FROM dual;

INSERT ALL
INTO ALERTE VALUES (1, 'Incendie', 1, TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (2, 'Inondation', 1, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (3, 'Tempête', 1, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (4, 'Pollution', 4, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (5, 'Incendie', 4, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (6, 'Inondation', 4, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (7, 'Tempête', 4, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (8, 'Pollution', 1, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (9, 'Incendie', 1, TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (10, 'Inondation', 4, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (11, 'Tempête', 4, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (12, 'Pollution', 7, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (13, 'Incendie', 7, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (14, 'Inondation', 10, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (15, 'Tempête', 10, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (16, 'Pollution', 10, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (17, 'Incendie', 10, TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (18, 'Inondation', 10, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (19, 'Tempête', 10, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (20, 'Pollution', 10, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (21, 'Incendie', 7, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (22, 'Inondation', 7, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (23, 'Tempête', 7, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (24, 'Pollution', 13, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (25, 'Incendie', 13, TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (26, 'Inondation', 13, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (27, 'Tempête', 13, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (28, 'Pollution', 13, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (29, 'Incendie', 13, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (30, 'Inondation', 13, TO_DATE('2024-03-21', 'YYYY-MM-DD'), TO_DATE('2024-03-22', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (31, 'Tempête', 13, TO_DATE('2024-03-19', 'YYYY-MM-DD'), TO_DATE('2024-03-20', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (32, 'Pollution', 11, TO_DATE('2024-03-24', 'YYYY-MM-DD'), TO_DATE('2024-03-25', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (33, 'Incendie', 11, TO_DATE('2024-03-20', 'YYYY-MM-DD'), TO_DATE('2024-03-21', 'YYYY-MM-DD'), 3)
INTO ALERTE VALUES (34, 'Inondation', 19, TO_DATE('2024-03-18', 'YYYY-MM-DD'), TO_DATE('2024-03-19', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (35, 'Tempête', 19, TO_DATE('2024-03-22', 'YYYY-MM-DD'), TO_DATE('2024-03-23', 'YYYY-MM-DD'), 1)
INTO ALERTE VALUES (36, 'Pollution', 19, TO_DATE('2024-03-23', 'YYYY-MM-DD'), TO_DATE('2024-03-24', 'YYYY-MM-DD'), 2)
INTO ALERTE VALUES (37, 'Incendie', 19, TO_DATE('2024-03-25', 'YYYY-MM-DD'), TO_DATE('2024-03-26', 'YYYY-MM-DD'), 3)
SELECT * FROM dual;







