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
CREATE PROCEDURE InsertDownloadFile
	-- Add the parameters for the stored procedure here
	@DownloadFileNumber int,
	@FileName varchar(255)
AS
BEGIN
	SET NOCOUNT ON;
	
	BEGIN TRY
		INSERT INTO DownloadFile VALUES(@DownloadFileNumber,@FileName)
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in inserting a Download File',10, 1); 
	END CATCH
END
GO
