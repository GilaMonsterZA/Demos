-- Stored procedure to return predictions for new data


CREATE PROCEDURE PredictIrisNaiveBayes (@SepalLength numeric(4, 1), @SepalWidth numeric(4, 1), @PetalLength numeric(4, 1), @PetalWidth numeric(4, 1))
AS

SELECT @SepalLength AS SepalLength, @SepalWidth AS SepalWidth, @PetalLength AS PetalLength, @PetalWidth AS PetalWidth
INTO #newData

EXEC sp_execute_external_script  
      @language = N'R',  
      @script = N'library("e1071")  
					modelNB <- readRDS("C:\\Temp\\ModelNB.rds")

					predictions <- as.data.frame(predict(modelNB, newData))
					',
     @input_data_1 = N'SELECT SepalLength, SepalWidth, PetalLength, PetalWidth FROM #newData',  
     @input_data_1_name = N'newData',
	 @output_data_1_name = N'predictions'
	 WITH RESULT SETS ((Class VARCHAR(100)));


GO


EXEC dbo.PredictIrisNaiveBayes 6.6,2.1,5,2.7
