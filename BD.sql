-- Q1

SELECT DISTINCT COUNT(IDA) AS NBR_ALERTE_REGION
FROM ALERTE A
JOIN LIEU L ON A.IDL = L.IDL
GROUP BY L.NOML;

-- Q2

SELECT A.Categorie, AVG(A.DateFin - A.DateDeb) AS DureeMoyenne
FROM ALERTE A
JOIN LIEU L ON A.IdL = L.IdL
WHERE L.NomL = 'PACA'
GROUP BY A.Categorie;
    
-- Q3

SELECT L.NomL AS Ville, COUNT(S.IdS) AS NombreDeStations
FROM LIEU L
JOIN STATION S ON L.IdL = S.IdL
GROUP BY L.NomL
HAVING 
COUNT(S.IdS) > 5;

-- Q4

SELECT L.NomL AS Ville, MAX(M.Mesure) AS Temperature_Maximale, MIN(M.Mesure) AS Temperature_Minimale
FROM LIEU L
JOIN STATION S ON L.IdL = S.IdL
JOIN RELEVE R ON S.IdS = R.IdS
JOIN MESURE M ON R.IdR = M.IdR
WHERE M.NomM = 'Temperature'
GROUP BY L.NomL;

select * from alerte

