ALTER TABLE [Sheet1$] ALTER COLUMN [Product] varchar(25) NOT NULL

-------------------------------------------------------------------------------
--THis sql script is for importing the ProductVersionReleaseExcel sheet1$ table
-------------------------------------------------------------------------------

--------------------------------------------
--Import all Products from Excel
--------------------------------------------

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

    BEGIN TRY
		INSERT INTO Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) 
		SELECT Distinct Release.P_ReleaseNumber,Product.P_ProductNumber, SoftwarePlatform.P_SoftwarePlatformNumber
		FROM Sheet1$
		JOIN Release ON Release.P_ReleaseNumber = Sheet1$.Release
		JOIN Product ON Product.ProductName=Sheet1$.Product
		JOIN SoftwarePlatform ON SoftwarePlatform.PlatformName = Sheet1$.Platform
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
   BEGIN TRY
		
		INSERT INTO ReleaseVersion(P_ProductVersionNumber,P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) 
		SELECT Distinct ProductVersion.P_ProductVersionNumber,Release.P_ReleaseNumber,Product.P_ProductNumber, SoftwarePlatform.P_SoftwarePlatformNumber
		FROM Sheet1$
		JOIN Release ON Release.P_ReleaseNumber = Sheet1$.Release
		JOIN Product ON Product.ProductName=Sheet1$.Product
		JOIN SoftwarePlatform ON SoftwarePlatform.PlatformName = Sheet1$.Platform
		JOIN ProductVersion ON ProductVersion.P_ProductVersionNumber = Sheet1$.Version

	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH

--------------------------------------------
--Import all Features from Excel
--------------------------------------------

    BEGIN TRY
		INSERT INTO Feature(FeatureDesciption) SELECT Distinct Sheet1$.[New Features]FROM Sheet1$
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH


--------------------------------------------
--Import all FeatureSets from Excel
--------------------------------------------
    BEGIN TRY
		INSERT INTO FeatureSet(P_FeatureNumber,P_ProductVersionNumber) 
		SELECT Distinct Feature.P_FeatureNumber,ProductVersion.P_ProductVersionNumber
		FROM Sheet1$
		JOIN Feature ON Feature.FeatureDesciption = Sheet1$.[New Features]
		JOIN ProductVersion ON ProductVersion.P_ProductVersionNumber = Sheet1$.Version
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH


