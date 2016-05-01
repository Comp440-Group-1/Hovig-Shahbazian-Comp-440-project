-------------------------------------------------------------------------------
--THis sql script is for importing the ProductVersionReleaseExcel sheet1$ table
-------------------------------------------------------------------------------

    BEGIN TRY
		INSERT INTO Product(ProductName,ProductDescription) SELECT DISTINCT Product, Description FROM Sheet1$;
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH


--------------------------------------------
--Import all software platfroms from Excel
--------------------------------------------

   BEGIN TRY
		INSERT INTO SoftwarePlatform(PlatformName) SELECT DISTINCT(Platform) FROM Sheet1$;
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH

--------------------------------------------
--Import all Releases from Excel
--------------------------------------------

  --SELECT Release.P_ReleaseNumber,Product.ProductName,SoftwarePlatform.PlatformName
  SELECT Release.P_ReleaseNumber,Product.P_ProductNumber,Product.ProductName, SoftwarePlatform.P_SoftwarePlatformNumber
  FROM Release
  JOIN Product ON Product.P_ProductNumber=Release.P_ProductNumber
  JOIN SoftwarePlatform ON SoftwarePlatform.P_SoftwarePlatformNumber=Release.P_SoftwarePlatformNumber

  SELECT Product.P_ProductNumber
  FROM Sheet1$
  JOIN Product ON Product=Sheet1$

  
  
    BEGIN TRY
		INSERT INTO Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber)

	    SELECT Product FROM Sheet1$ 


	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH


--------------------------------------------
--Import all Versions from Excel
--------------------------------------------

    BEGIN TRY
		INSERT INTO ProductVersion(P_ProductVersionNumber) SELECT Version FROM Sheet1$ 
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Versions from Excel file',10, 1); -- Second substitution argument.
	END CATCH

	
--------------------------------------------
--Import all ReleaseVersions from Excel
--------------------------------------------

  SELECT Product.ProductName,SoftwarePlatform.PlatformName,ProductVersion.P_ProductVersionNumber,ReleaseVersion.P_ReleaseNumber
  FROM ReleaseVersion
  JOIN Product ON Product.P_ProductNumber=ReleaseVersion.P_ProductNumber
  JOIN SoftwarePlatform ON SoftwarePlatform.P_SoftwarePlatformNumber=ReleaseVersion.P_SoftwarePlatformNumber
  JOIN ProductVersion ON ProductVersion.P_ProductVersionNumber = ReleaseVersion.P_ProductVersionNumber


   BEGIN TRY
		INSERT INTO Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber)SELECT Release FROM Sheet1$ 

	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH