DECLARE
    @sSQL NVARCHAR(2000) ,
    @Where NVARCHAR(1000) = ''

    SET @sSQL = 'SELECT ProductID, TransactionType, Quantity
		FROM Production.TransactionHistory ';
 
    IF (@ProductID IS NOT NULL )
        SET @Where = @Where + 'AND ProductID = @InnerProduct ';

    IF (@TransactionType IS NOT NULL)
        SET @Where = @Where + 'AND TransactionType = @InnerTransactionType ';

    IF (@Qty IS NOT NULL)
        SET @Where = @Where + 'AND Quantity = @InnerQty ';
 
    IF (LEN(@Where) > 0)
        SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where) - 3);
 
    EXEC sp_executesql @sSQL,
        N'@InnerProduct int, @InnerTransactionType nchar(1), @InnerQty int',
        @InnerProduct = @ProductID, @InnerTransactionType = @TransactionType,
        @InnerQty = @Qty;