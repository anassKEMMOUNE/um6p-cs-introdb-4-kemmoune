

USE invoiceDb;

DROP PROCEDURE IF EXISTS GetInvoiceCountByEntite;
DELIMITER $$
CREATE PROCEDURE GetInvoiceCountByEntite()
BEGIN
    SELECT nomEntite, COUNT(nomEntite)
    FROM entite
    NATURAL JOIN facture
    GROUP BY nomEntite;
END $$
DELIMITER ;

CALL GetInvoiceCountByEntite();



