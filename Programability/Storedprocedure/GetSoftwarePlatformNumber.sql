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
CREATE PROCEDURE GetSoftwarePlatformNumber
	-- Add the parameters for the stored procedure here
	@PlatformName varchar(255)
	
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		SELECT P_SoftwarePlatformNumber FROM SoftwarePlatform WHERE @PlatformName = PlatformName
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error Inserting a SiftwarePlatform',10, 1); -- Second substitution argument.
	END CATCH
END
GO
