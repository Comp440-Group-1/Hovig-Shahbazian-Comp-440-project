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
CREATE PROCEDURE ReportNewFeatures
	
	 --THe Product Number of which Version we will change
	 --@ProductNumber int,
	 --@SoftwarePlatformNumber int,
	 --@ReleaseNumber decimal(2,1),
	 --THe version Number we will chn age the produt to
	 @ProductVersionNumber1 decimal(2,1),
	 @ProductVersionNumber2 decimal(2,1)
AS
BEGIN
	SET NOCOUNT ON;

	BEGIN TRY
		Select P_FeatureNumber FROM FeatureSet WHERE @ProductVersionNumber1 = P_ProductVersionNumber
		INTERSECT
		Select P_FeatureNumber FROM FeatureSet WHERE @ProductVersionNumber2 = P_ProductVersionNumber
	END TRY
	BEGIN CATCH
     PRINT 'There was an error in generating this report
	 '
	END CATCH
END
GO


EXECUTE UpdateProductVersion 1,1,1.1,1.2