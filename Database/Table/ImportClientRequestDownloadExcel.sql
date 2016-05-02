
-------------------------------------------------------------------------------
--THis sql script is for importing the Customer Download request Imported Sheet 2 table
--Imported the Excell into a new table and used this table to import the data into the other tables
-------------------------------------------------------------------------------


--------------------------------------------
--Import all Customers from Excel
--------------------------------------------
    BEGIN TRY
		INSERT INTO Customer(CustomerFirstName,CustomerLastName) SELECT DISTINCT FirstName,LastName FROM [ImportedSheet2]
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH

--------------------------------------------
--Import all Company from Excel
--------------------------------------------

    BEGIN TRY
		INSERT INTO Company(P_CustomerNumber,CompanyName,CompanyAddress) 
		SELECT DISTINCT Customer.P_CustomerNumber,Company ,[company address]
		FROM [ImportedSheet2]
		JOIN Customer ON CustomerFirstName = [ImportedSheet2].FirstName AND CustomerLastName = [ImportedSheet2].LastName
    END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH


--------------------------------------------
--Import all Email from Excel
--------------------------------------------

    BEGIN TRY
		INSERT INTO Email(P_CustomerNumber,Email) 
		SELECT DISTINCT Customer.P_CustomerNumber, Email
		 FROM [ImportedSheet2]
		 JOIN Customer ON CustomerFirstName = [ImportedSheet2].FirstName AND CustomerLastName = [ImportedSheet2].LastName
    END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH

--------------------------------------------
--Import all Phone Number from Excel
--------------------------------------------

    BEGIN TRY
		INSERT INTO PhoneNumber(P_CustomerNumber,PhoneNumber,PhoneType) 
		SELECT DISTINCT Customer.P_CustomerNumber,[phone],[type]
		FROM [ImportedSheet2]
		JOIN Customer ON CustomerFirstName = [ImportedSheet2].FirstName AND CustomerLastName = [ImportedSheet2].LastName
    END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH

--------------------------------------------
--Import all CustomerDownloads from Excel
--------------------------------------------

 BEGIN TRY
		INSERT INTO CustomerDownload(P_CustomerNumber,ReleaseVersion.P_ProductNumber,
		                             ReleaseVersion.P_ProductVersionNumber,ReleaseVersion.P_ReleaseNumber,
		                             ReleaseVersion.P_SoftwarePlatformNumber,DownloadCount,DownloadDate) 
		SELECT DISTINCT Customer.P_CustomerNumber,ReleaseVersion.P_ProductNumber,ReleaseVersion.P_ProductVersionNumber,
					    ReleaseVersion.P_ReleaseNumber, ReleaseVersion.P_SoftwarePlatformNumber, 1,ImportedSheet2.[date]
		FROM [ImportedSheet2]
		JOIN Customer ON CustomerFirstName = [ImportedSheet2].FirstName AND CustomerLastName = [ImportedSheet2].LastName
		Join ReleaseVersion ON P_ProductVersionNumber = [ImportedSheet2].[request for download of version]
		
	
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Importing Products from Excel file',10, 1); -- Second substitution argument.
	END CATCH
