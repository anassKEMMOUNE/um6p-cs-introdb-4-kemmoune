
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE;

-- Justification: In our database, we are dealing with financial data related to invoices, orders, and suppliers.
--Ensuring data integrity and consistency is crucial in such scenarios. By setting the isolation level to SERIALIZABLE,
-- we can achieve the highest level of isolation and guarantee that concurrent transactions do not interfere with each other,
-- preventing issues such as dirty reads, non-repeatable reads, and phantom reads.
-- in this context here is the example of The tables   Facture (Invoice) and Commande (Order), as they store crucial financial information.
-- Maintaining the integrity of this data is paramount to ensure accurate financial records and calculations.
-- By using SERIALIZABLE transactions, concurrent updates and modifications to these tables are controlled,
-- preventing data inconsistencies that could arise from concurrent access.