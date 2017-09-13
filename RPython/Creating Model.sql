
EXEC sp_execute_external_script  
      @language = N'R',  
      @script = N'library("e1071");  
					modelNB <- naiveBayes(iris[,1:4], iris[,5])
					saveRDS(modelNB, "C:\\Temp\\ModelNB.rds")					
					', 
     @input_data_1 = N'SELECT SepalLength, SepalWidth, PetalLength, PetalWidth, Species FROM iris',  
     @input_data_1_name = N'iris',  
     @output_data_1_name = N'trained_model' 
