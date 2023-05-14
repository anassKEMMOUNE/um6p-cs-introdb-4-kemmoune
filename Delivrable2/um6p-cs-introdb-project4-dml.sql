-- 1) Des factures selon leurs types de blocage 
SELECT blocage, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Facture) AS pourcentage
FROM Facture
GROUP BY blocage;

-- 2) Des factures selon leurs types d'achat
SELECT typeDAchatPO, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Commande) AS pourcentage
FROM Commande
GROUP BY typeDAchatPO;

-- 3) Taux de factures critiques par Entité
SELECT e.nomEntite, 
       COUNT(f.identifiantGED) AS nbreFacturesCritiques, 
       COUNT(f.identifiantGED) / COUNT(*) * 100 AS tauxFacturesCritiques
FROM Facture f
JOIN Entite e ON f.idE = e.idE
WHERE f.nombreDeJoursAEcheance < 0
GROUP BY e.nomEntite;

-- 4) Identifier le montant des factures critiques (Somme attribut « montant facture » selon condition Echéance)
SELECT e.nomEntite, 
       SUM(f.montantdesFactures) AS montantFacturesCritiques
FROM Facture f
JOIN Entite e ON f.idE = e.idE
WHERE f.nombreDeJoursAEcheance < 0
GROUP BY e.nomEntite;

-- 5) categorie
SELECT identifiantGED, numeroFacture, blocage,
  CASE 
    WHEN blocage LIKE 'Manque réception%' THEN 'réception'
    WHEN blocage = 'Manque confirmation' THEN 'confirmation'
    WHEN blocage = 'Accord sur quantité' THEN 'Accord sur quantité'
    WHEN blocage = 'Manque confirmation assurance' THEN 'confirmation CP'
    ELSE NULL
  END AS categorie
FROM Facture;

-- 6) des factures selon leurs blocages
SELECT blocage, COUNT(*) * 100.0 / (SELECT COUNT(*) FROM Facture) AS pourcentage FROM facture GROUP BY blocage;

-- 7) Identifier le fournisseur avec le plus grand nombre de factures.
SELECT F.nomFournisseur, COUNT(*) AS NumFactures 
FROM Facture AS FA
JOIN Commande AS C ON FA.numCommande = C.numCommande
JOIN Fournisseur AS F ON C.codeFournisseur = F.codeFournisseur
GROUP BY F.nomFournisseur 
ORDER BY NumFactures DESC
LIMIT 1;

-- 8) Identifier le fournisseur avec le plus grand nombre de factures critiques en utilisant distinct
SELECT F.nomFournisseur, COUNT(DISTINCT FA.identifiantGED) AS NumFacturesCritiques
FROM Facture AS FA
JOIN Commande AS C ON FA.numCommande = C.numCommande
JOIN Fournisseur AS F ON C.codeFournisseur = F.codeFournisseur
WHERE FA.nombreDeJoursAEcheance < 0
GROUP BY F.nomFournisseur
ORDER BY NumFacturesCritiques DESC
LIMIT 1;

-- 9) Union between 2 distnict tables using order by 
SELECT nomFournisseur, codeFournisseur FROM Fournisseur 
UNION 
SELECT nomFournisseur, codeFournisseur FROM Fournisseur 
ORDER BY nomFournisseur; 
-- 10) Union of tables

SELECT idE, nomEntite FROM Entite 
UNION 
SELECT idCDP, nomCDP FROM ChefDeProjet;

-- 11) Update table
UPDATE Facture 
SET nombreDeJoursAEcheance = 0 
WHERE nombreDeJoursAEcheance < 0;

-- 12) Update table
UPDATE Commande 
SET montantCommande = 5000 
WHERE numCommande = 'CMD001';

-- 13) Delete from table
DELETE FROM Facture
WHERE numeroFacture = 'FA001';

-- 14) Delete from table

DELETE FROM Facture WHERE intervenant = 'intervenant A';

-- 15) Insertion

INSERT INTO Commande (numCommande, service, typeDAchatPO, uniteOperationelle, montantCommande, montantReceptionne, acheteur, codeFournisseur, idCDP) 
VALUES ('CMD101', 'Service 1', 'S-Stocks', 'Unité 1', 5000.0, 0.0, 'Acheteur 1', 101, 1);
-- 16) Insertion

INSERT INTO Commande (numCommande, service, typeDAchatPO, uniteOperationelle, montantCommande, montantReceptionne, acheteur, codeFournisseur, idCDP) 
VALUES ('CMD102', 'Service 2', 'M-Marché', 'Unité 2', 8000.0, 0.0, 'Acheteur 2', 102, 2);

