CREATE PROCEDURE dbo.TransactionDetails
    @ProductID INT = NULL,
    @TransactionType NCHAR(1) = NULL ,
    @Qty INT = NULL
AS
    SELECT  
            ProductID ,
            TransactionType ,
            Quantity 
    FROM    Production.TransactionHistoryArchive
    WHERE   ( ProductID = @ProductID
              OR @ProductID IS NULL
            )
            AND ( TransactionType = @TransactionType
                  OR @TransactionType IS NULL
                )
            AND ( Quantity = @Qty
                  OR @Qty IS NULL
                )
;
GO
