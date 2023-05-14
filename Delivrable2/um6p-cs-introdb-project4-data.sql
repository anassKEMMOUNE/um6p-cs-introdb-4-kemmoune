INSERT INTO `fournisseur` (`codeFournisseur`, `nomFournisseur`, `siteFournisseur`) VALUES ('5526', 'Fournisseur X', 'France');
INSERT INTO `entite` (`nomEntite`) VALUES ('ASSURANCE');
INSERT INTO `chefdeprojet` (`idE`, `nomCDP`) VALUES ('1', 'ALAMI');
INSERT INTO `commande` (`numCommande`, `service`, `typeDAchatPO`, `uniteOperationelle`, `montantCommande`, `montantReceptionne`, `acheteur`, `codeFournisseur`, `idCDP`) VALUES ('6525', 'JORF MARITIME', 'S - stocks', 'OCP_41: OCP', '56595', '15000', 'KANFAOUI.55', '5526', '1');
INSERT INTO `facture` (`identifiantGED`, `numeroFacture`, `montantDesFactures`, `montantFactureTTCDevise`, `montantMiseADisposition`, `intervenant`, `nombreDeJoursAEcheance`, `cA`, `blocage`, `numCommande`, `idE`) VALUES ('PRO30403_0210_5668652', 'DFV8D59', '15000', '15000', '15000', 'Litige', '30', 'DARIH', 'Manque réception', '6525', '1');

INSERT INTO `fournisseur` (`codeFournisseur`, `nomFournisseur`, `siteFournisseur`) VALUES ('5527', 'Fournisseur Y', 'Agadir');
INSERT INTO `entite` (`nomEntite`) VALUES ('MEDICAL');
INSERT INTO `chefdeprojet` (`idE`, `nomCDP`) VALUES ('2', 'ATTAQI');
INSERT INTO `commande` (`numCommande`, `service`, `typeDAchatPO`, `uniteOperationelle`, `montantCommande`, `montantReceptionne`, `acheteur`, `codeFournisseur`, `idCDP`) VALUES ('6526', 'JORF MARITIME', 'M - marché', 'OCP_42: OCP', '56595', '15000', 'KANFAOUI.55', '5527', '2');
INSERT INTO `facture` (`identifiantGED`, `numeroFacture`, `montantDesFactures`, `montantFactureTTCDevise`, `montantMiseADisposition`, `intervenant`, `nombreDeJoursAEcheance`, `cA`, `blocage`, `numCommande`, `idE`) VALUES ('PRO30403_0123_1111129', 'DFZ8D79', '17000', '17000', '17000', 'SPOC', '17', 'DARIH2', 'Manque réception', '6526', '2');


INSERT INTO `fournisseur` (`codeFournisseur`, `nomFournisseur`, `siteFournisseur`) VALUES ('5528', 'Fournisseur Z', 'Italie');
INSERT INTO `entite` (`nomEntite`) VALUES ('MEDICAL');
INSERT INTO `chefdeprojet` (`idE`, `nomCDP`) VALUES ('3', 'BOUTTIN');
INSERT INTO `commande` (`numCommande`, `service`, `typeDAchatPO`, `uniteOperationelle`, `montantCommande`, `montantReceptionne`, `acheteur`, `codeFournisseur`, `idCDP`) VALUES ('6527', 'JORF MARITIME', 'S - stocks', 'OCP_43: OCP', '56595', '15000', 'NFAOUI.75', '5528', '3');
INSERT INTO `facture` (`identifiantGED`, `numeroFacture`, `montantDesFactures`, `montantFactureTTCDevise`, `montantMiseADisposition`, `intervenant`, `nombreDeJoursAEcheance`, `cA`, `blocage`, `numCommande`, `idE`) VALUES ('DRO30502_0210_5668652', 'DFV8C59', '15000', '15000', '15000', 'Litige', '30', 'DARIH', 'Manque réception', '6527', '3');

INSERT INTO `fournisseur` (`codeFournisseur`, `nomFournisseur`, `siteFournisseur`) VALUES ('5529', 'Fournisseur Z', 'Italie');
INSERT INTO `entite` (`nomEntite`) VALUES ('ASSURANCE');
INSERT INTO `chefdeprojet` (`idE`, `nomCDP`) VALUES ('4', 'SALIMI');
INSERT INTO `commande` (`numCommande`, `service`, `typeDAchatPO`, `uniteOperationelle`, `montantCommande`, `montantReceptionne`, `acheteur`, `codeFournisseur`, `idCDP`) VALUES ('6528', 'JFC -OI', 'S - stocks', 'OCP_44: OCP', '36595', '17299', 'NFAOUI.75', '5529', '4');
INSERT INTO `facture` (`identifiantGED`, `numeroFacture`, `montantDesFactures`, `montantFactureTTCDevise`, `montantMiseADisposition`, `intervenant`, `nombreDeJoursAEcheance`, `cA`, `blocage`, `numCommande`, `idE`) VALUES ('SRO30502_4567_5648652', 'DGV1D59', '17299', '17299', '17299', 'Litige', '62', 'RATIB', 'Manque réception', '6528', '4');
--data Import
use invoiceDb;
DROP TABLE if EXISTS FinalBase;
CREATE TABLE FinalBase AS
SELECT BaseTable.rank_ , BaseTable.uniteOperationnelle,BaseTable.identifiantGED,BaseTable.siteCEC,BaseTable.service, BaseTable.nomFournisseur,BaseTable.codeFournisseur,BaseTable.siteFournisseur,BaseTable2.blocage,BaseTable2.categorie,BaseTable2.nomCDP,BaseTable2.nomEntite,BaseTable2.entiteSite,BaseTable2.entiteG,BaseTable2.cA,BaseTable.numCommande,BaseTable.montantCommande,BaseTable.montantReceptionne,BaseTable.montantDesFactures,BaseTable.montantMiseADisposition,BaseTable.numeroFacture,BaseTable.montantFactureTTCDevise,BaseTable.deviseFacture,BaseTable.type_,BaseTable.acheteur,BaseTable.typeDAchatPO,BaseTable.intervenant,BaseTable.nombreDeJoursAEcheance
FROM BaseTable INNER JOIN BaseTable2 on BaseTable.numeroFacture = BaseTable2.numeroFacture;