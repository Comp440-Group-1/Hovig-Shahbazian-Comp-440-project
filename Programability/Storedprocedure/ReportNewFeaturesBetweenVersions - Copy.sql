-- ================================================
-- Update Product Version Procedure
-- Takes a Product by it number and change its version to
--@Parm Product  Number 
-- Also
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
CREATE PROCEDURE UpdateProductVersion
	
	 --THe Product Number of which Version we will change
	 @ProductNumber int,
	 @SoftwarePlatformNumber int,
	 @ReleaseNumber decimal(2,1),
	 --THe version Number we will chn age the produt to
	 @ProductVersionNumber decimal(2,1)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		UPDATE ReleaseVersion SET P_ProductVersionNumber = @ProductVersionNumber
		WHERE P_ProductNumber = @ProductNumber AND P_ReleaseNumber = @ReleaseNumber AND P_SoftwarePlatformNumber = @SoftwarePlatformNumber
	END TRY
	BEGIN CATCH
     PRINT 'The given version number does not exist for this product'
	END CATCH
END
GO


EXECUTE UpdateProductVersion 1,1,1.1,1.2