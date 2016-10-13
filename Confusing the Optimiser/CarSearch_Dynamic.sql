CREATE PROCEDURE dbo.CarSearch_Dynamic (
	@Make VARCHAR(50) = NULL,
	@MinimumPrice NUMERIC(12,4) = NULL,
	@MaximumPrice NUMERIC(12,4) = NULL,
	@MinimumKM NUMERIC(12,4) = NULL,
	@MaximumKM NUMERIC(12,4) = NULL
 )
 AS
 
 DECLARE @sSQL NVARCHAR(2000), 
	@Where NVARCHAR(1000) = '';

SET @sSQL = 'SELECT Make,
       Model,
       ManufacturingYear,
       Price,
       Kilometers
	FROM dbo.SecondHandCars ';
 
IF @Make IS NOT NULL
	SET @Where = @Where + 'AND Make LIKE @InnerMake ';

IF @MinimumPrice IS NOT NULL
	SET @Where = @Where + 'AND Price >= @InnerMinPrice ';

IF @MaximumPrice IS NOT NULL
	SET @Where = @Where + 'AND Price <= @InnerMaxPrice ';

IF @MinimumKM IS NOT NULL
	SET @Where = @Where + 'AND Kilometers >= @InnerMinKM ';

IF @MaximumKM IS NOT NULL
	SET @Where = @Where + 'AND Kilometers <= @InnerMaxKM ';

IF LEN(@Where) > 0
	SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where)-3);
 
EXEC sp_executesql @sSQL,
	N'@InnerMake VARCHAR(50), @InnerMinPrice NUMERIC(12,4), @InnerMaxPrice NUMERIC(12,4), @InnerMinKM NUMERIC(12,4), @InnerMaxKMNUMERIC(12,4)',
	@InnerMake = @Make,
	@InnerMinPrice = @MinimumPrice,
	@InnerMaxPrice = @MaximumPrice,
	@InnerMinKM = @MinimumKM,
	@InnerMaxKM = @MaximumKM;

GO

/*
DECLARE @sSQL NVARCHAR(2000), 
	@Where NVARCHAR(1000) = '';

SET @sSQL = 'SELECT ProductID, TransactionType, Quantity
		FROM Production.TransactionHistory ';
 
IF @Product IS NOT NULL
	SET @Where = @Where + 'AND ProductID = @InnerProduct ';
IF @TransactionType IS NOT NULL
	SET @Where = @Where + 'AND TransactionType = @InnerTransactionType ';
IF @Qty IS NOT NULL
	SET @Where = @Where + 'AND Quantity = @InnerQty ';
 
IF LEN(@Where) > 0
	SET @sSQL = @sSQL + 'WHERE ' + RIGHT(@Where, LEN(@Where)-3);
 
EXEC sp_executesql @sSQL,
	N'@InnerProduct int, @InnerTransactionType nchar(1), @InnerQty int',
	@InnerProduct = @Product, 
@InnerTransactionType = @TransactionType, 
@InnerQty = @Qty;
*/