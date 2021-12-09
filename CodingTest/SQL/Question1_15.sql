SELECT * FROM ANIMAL_INS ORDER BY ANIMAL_ID ASC;
SELECT NAME,DATETIME FROM ANIMAL_INS ORDER BY ANIMAL_ID DESC;
SELECT ANIMAL_ID,NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION='SICK' ORDER BY ANIMAL_ID ASC;
SELECT ANIMAL_ID, NAME FROM ANIMAL_INS WHERE INTAKE_CONDITION != 'Aged' ORDER BY ANIMAL_ID ASC;
SELECT ANIMAL_ID , NAME FROM ANIMAL_INS ORDER BY ANIMAL_ID ASC;
SELECT ANIMAL_ID, NAME, DATETIME FROM ANIMAL_INS ORDER BY NAME ASC ,DATETIME DESC;
SELECT NAME FROM ANIMAL_INS ORDER BY DATETIME ASC LIMIT 1;
SELECT DATETIME FROM ANIMAL_INS ORDER BY DATETIME DESC LIMIT 1;
SELECT MIN(DATETIME) FROM ANIMAL_INS;
SELECT COUNT(*) FROM ANIMAL_INS;
SELECT COUNT(DISTINCT NAME) FROM ANIMAL_INS;
SELECT ANIMAL_TYPE, COUNT(*) FROM ANIMAL_INS
GROUP BY ANIMAL_TYPE ORDER BY ANIMAL_TYPE;
SELECT NAME, COUNT(NAME) FROM ANIMAL_INS 
GROUP BY NAME HAVING COUNT(NAME)>1 ORDER BY NAME;