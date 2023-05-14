DROP DATABASE IF EXISTS invoiceDb;

CREATE DATABASE invoiceDb;

USE invoiceDb;

DROP TABLE IF EXISTS Fournisseur;

CREATE TABLE Fournisseur (
  codeFournisseur INTEGER PRIMARY KEY NOT NULL,
  nomFournisseur VARCHAR(255) NOT NULL,
  siteFournisseur VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS Entite;

CREATE TABLE Entite (
  idE INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  nomEntite VARCHAR(255) NOT NULL
);

DROP TABLE IF EXISTS ChefDeProjet;

CREATE TABLE ChefDeProjet (
  idCDP INTEGER PRIMARY KEY NOT NULL AUTO_INCREMENT,
  idE INTEGER NOT NULL,
  nomCDP VARCHAR(255) NOT NULL,
  FOREIGN KEY (idE) REFERENCES Entite(idE)
);

DROP TABLE IF EXISTS Commande;

CREATE TABLE Commande (
  numCommande VARCHAR(55) PRIMARY KEY NOT NULL,
  service VARCHAR(255) NOT NULL,
  typeDAchatPO VARCHAR(255) NOT NULL,
  uniteOperationelle VARCHAR(255) NOT NULL,
  montantCommande FLOAT NOT NULL,
  montantReceptionne FLOAT NOT NULL,
  acheteur VARCHAR(255) NOT NULL,
  codeFournisseur INTEGER NOT NULL,
  idCDP INTEGER NOT NULL,
  FOREIGN KEY (codeFournisseur) REFERENCES Fournisseur(codeFournisseur),
  FOREIGN KEY (idCDP) REFERENCES ChefDeProjet(idCDP)
);

DROP TABLE IF EXISTS Facture;

CREATE TABLE Facture (
  identifiantGED VARCHAR(55) PRIMARY KEY NOT NULL,
  numeroFacture VARCHAR(255) NOT NULL,
  montantDesFactures FLOAT NOT NULL,
  montantFactureTTCDevise FLOAT NOT NULL,
  montantMiseADisposition FLOAT NOT NULL,
  intervenant VARCHAR(255) NOT NULL,
  nombreDeJoursAEcheance INTEGER NOT NULL,
  cA VARCHAR(255) NOT NULL,
  blocage VARCHAR(255) NOT NULL,
  numCommande VARCHAR(55) NOT NULL,
  idE INTEGER NOT NULL,
  FOREIGN KEY (numCommande) REFERENCES Commande(numCommande),
  FOREIGN KEY (idE) REFERENCES Entite(idE)
);

-- Indexes
CREATE INDEX idx_Facture_NombreDeJours ON invoiceDb.Facture(nombreDeJoursAEcheance);
CREATE INDEX idx_Facture_ContractAdmin ON Facture(cA);

-- Explanation
-- The attributes ‘cA’ and ‘nombreDeJoursAEcheance’ are the most used attributes to determine some other derived attributes like ‘EntiteG’ and ‘echeance’.

-- trigger
DELIMITER //

CREATE TRIGGER commande_before_insert
  BEFORE INSERT ON Commande
  FOR EACH ROW
  BEGIN
    IF NEW.montantCommande < NEW.montantReceptionne THEN
      SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Error: montantCommande must be greater than or equal to montantReceptionne';
    END IF;
  END //

DELIMITER ;


-- trigger 
DELIMITER //

CREATE TRIGGER update_commande_trigger
BEFORE UPDATE ON Commande
FOR EACH ROW
BEGIN
  IF NEW.montantReceptionne > NEW.montantCommande THEN
    SIGNAL SQLSTATE '45000'
      SET MESSAGE_TEXT = 'Montant receptionne must be less than or equal to Montant commande';
  END IF;
END //
DELIMITER ;


-- Explanation
-- For the first trigger, the attributes ‘montantCommande’ and ‘montantReceptionne’ must satisfy the condition expressed in the trigger before inserting the rows in the database. 
-- For the second trigger, the attributes ‘montantCommande’ and ‘montantReceptionne’ must satisfy the condition expressed in the trigger before updated the rows in the database.

