
--1
SELECT  SUBSTR(typeDAchatPO, 1, 1) AS typedachatpo, COUNT(*) AS commande_count 
FROM commande GROUP BY SUBSTR(typeDAchatPO, 1, 1);

--2
SELECT echeance, COUNT(echeance) FROM facture_view GROUP BY echeance;

--3
SELECT nomEntite, COUNT(nomEntite) FROM entite NATURAL JOIN facture GROUP BY nomEntite;