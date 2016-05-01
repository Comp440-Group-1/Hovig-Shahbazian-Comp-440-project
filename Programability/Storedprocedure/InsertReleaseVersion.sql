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
CREATE PROCEDURE InsertReleaseVersion
	-- Add the parameters for the stored procedure here
	@ProductVersion decimal(2,1),
	@ReleaseNumber  decimal(2,1), 
	@ProductNumber  int,
	@SoftwarePlatform int

AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO ReleaseVersion VALUES(@ProductVersion,@ReleaseNumber, @ProductNumber ,@SoftwarePlatform)
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Inserting a Release Version Entry',10, 1); 
	END CATCH
END
GO
