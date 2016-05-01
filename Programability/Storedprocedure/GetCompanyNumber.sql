-- ================================================
-- Template generated from Template Explorer using:
-- Create Procedure (New Menu).SQL
--
-- Use the Specify Values for Template Parameters 
-- command (Ctrl-Shift-M) to fill in the parameter 
-- values below.
--
-- This block of comments will not be included in
-- the definition of the procedure.
-- ================================================
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE InsertCompany
	-- Add the parameters for the stored procedure here
	@CompanyName varchar(50)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		--INSERT INTO Company VALUES(@CompanyNumber,@CompanyName,@CompanyAddress)
		SELECT P_CompanyNumber FROM Company WHERE @CompanyName = CompanyName

	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error Retrieveing Company Number',10, 1); -- Second substitution argument.
	END CATCH
END
GO
