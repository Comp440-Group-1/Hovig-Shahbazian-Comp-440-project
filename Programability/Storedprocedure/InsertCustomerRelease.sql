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
CREATE PROCEDURE InsertCustomerRelease
	-- Add the parameters for the stored procedure here
	@ReleaseNumber  decimal(2,1), 
	@ProductNumber  int,
	@SoftwarePlatform int,
	@URL varchar(255),
	@CutomerReleaseDate date
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY
		INSERT INTO CustomerRelease VALUES(@ReleaseNumber,@ProductNumber,@SoftwarePlatform,@URL,@CutomerReleaseDate)
	END TRY
	BEGIN CATCH
		RAISERROR(N'THere was an error in Inserting a Customer Release',10, 1); -- Second substitution argument.
	END CATCH
END
GO
