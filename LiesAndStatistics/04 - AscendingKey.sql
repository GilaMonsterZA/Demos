USE InterStellarTransport;
GO

DBCC SHOW_STATISTICS (Transactions, idx_Transactions_TransactionDate)

SELECT MAX(TransactionDate) FROM Transactions

INSERT INTO Transactions (ReferenceShipmentID, TransactionDate, TransactionType, Amount, InvoiceNumber)
SELECT TOP (50) ReferenceShipmentID, DATEADD(mm,2,TransactionDate), TransactionType, Amount, InvoiceNumber 
FROM Transactions
order by TransactionDate desc

SELECT MAX(TransactionDate) FROM Transactions

SELECT * FROM Transactions WHERE TransactionDate > '2410-03-01'
SELECT * FROM Transactions WHERE TransactionDate > '2410-03-01'
OPTION(USE HINT('FORCE_LEGACY_CARDINALITY_ESTIMATION'))

