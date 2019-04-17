SELECT TransactionID, ClientID, InvoiceNumber, TransactionDate FROM dbo.Transactions
	WHERE ClientID = 2868 AND Amount < 750
