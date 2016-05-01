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
	 --THe version Number we will chn age the product to
	 @ProductVersionNumber decimal(2,1)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		Select  @ProductVersionNumber = P_ProductVersionNumber FROM ReleaseVersion WHERE P_ProductNumber = 1 AND P_ReleaseNumber = 1.1 AND P_SoftwarePlatformNumber = 1
		SELECT P_FeatureNumber FROM FeatureSet WHERE P_ProductVersionNumber = @ProductVersionNumber                             
	END TRY
	BEGIN CATCH
     PRINT 'THere was an error in Generating the report'
	END CATCH
END
GO


EXECUTE UpdateProductVersion 1,1,1.1,1.2