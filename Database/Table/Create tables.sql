CREATE TABLE Product
(
P_ProductNumber int NOT NULL PRIMARY KEY,
ProductName varchar(255) NOT NULL UNIQUE,

)

CREATE TABLE Customer
(
P_CustomerNumber int NOT NULL PRIMARY KEY,


)

CREATE TABLE Subscription
(
P_SubscriptionNumber int NOT NULL PRIMARY KEY,
DownloadDate date NOT NULL,

P_CustomerNumber int FOREIGN KEY REFERENCES Customer(P_CustomerNumber),
)



CREATE TABLE SourceControl
(
P_SourceControlNumber int NOT NULL PRIMARY KEY,

)


CREATE TABLE SourceRoot
(
P_SourceRootNumber int NOT NULL PRIMARY KEY,

P_SourceControlNumber int FOREIGN KEY REFERENCES SourceControl(P_SourceControlNumber),
)

CREATE TABLE StabilityLabel
(
P_StabilityNumber int NOT NULL PRIMARY KEY,
StabilityText nchar(10) NOT NULL UNIQUE,



)
CREATE TABLE FeatureDescription
(
P_FeatureDescriptionNumber int NOT NULL PRIMARY KEY,


)

CREATE TABLE FeatureState
(
P_FeatureStateNumber int NOT NULL PRIMARY KEY,


)

CREATE TABLE Feature
(
P_FeatureSNumber int NOT NULL PRIMARY KEY,

P_FeatureStateNumber int FOREIGN KEY REFERENCES FeatureState(P_FeatureStateNumber)
)


CREATE TABLE FileExtension
(
P_FileExentionNumber int NOT NULL PRIMARY KEY,
Name int NOT NULL,

)

CREATE TABLE DownloadFile
(
P_DownloadFileNumber int NOT NULL PRIMARY KEY,
Name int NOT NULL,

P_FileExtensionNumber int FOREIGN KEY REFERENCES FileExtension(P_FileExentionNumber)
)

CREATE TABLE ProductVersion
(
P_ProductVersionNumber int NOT NULL PRIMARY KEY,

P_ProductNumber int FOREIGN KEY REFERENCES Product(P_ProductNumber)
)


CREATE TABLE CustomerRelease
(
P_CustomerReleaseNumber int NOT NULL  PRIMARY KEY,
URL nchar(10) NULL UNIQUE,
CustomerReleaseDate date NOT NULL,

P_FeatureDescriptionNumber int FOREIGN KEY REFERENCES FeatureDescription(P_FeatureDescriptionNumber),
P_ProductVersionNumber int FOREIGN KEY REFERENCES ProductVersion(P_ProductVersionNumber),
P_ProductNumber int FOREIGN KEY REFERENCES Product(P_ProductNumber),
P_DownloadFileNumber int FOREIGN KEY REFERENCES DownloadFile(P_DownloadFileNumber),

)


CREATE TABLE DevelopmentRelease
(
P_DevelopmentReleaseNumber int NOT NULL PRIMARY KEY,
StartDate date NOT NULL,
EndDate date NOT NULL,
Iteration int NOT NULL,
Sprint int NOT NULL,
Commits int NOT NULL,

P_StabilityNumber int FOREIGN KEY REFERENCES StabilityLabel(P_StabilityNumber),
P_FeatureDescriptionNumber int FOREIGN KEY REFERENCES FeatureDescription(P_FeatureDescriptionNumber)
)


CREATE TABLE Branch
(
P_BranchNumber int NOT NULL PRIMARY KEY,


P_FeatureDescriptionNumber int FOREIGN KEY REFERENCES FeatureDescription(P_FeatureDescriptionNumber),
P_ProductVersionNumber int FOREIGN KEY REFERENCES ProductVersion(P_ProductVersionNumber),
P_ProductNumber int FOREIGN KEY REFERENCES Product(P_ProductNumber),
P_DownloadFileNumber int FOREIGN KEY REFERENCES DownloadFile(P_DownloadFileNumber),
P_StabilityNumber int FOREIGN KEY REFERENCES StabilityLabel(P_StabilityNumber),
P_DevelopmentReleaseNumber int FOREIGN KEY REFERENCES DevelopmentRelease(P_DevelopmentReleaseNumber),
P_CustomerReleaseNumber int FOREIGN KEY REFERENCES CustomerRelease(P_CustomerReleaseNumber),
P_SourceControlNumber int FOREIGN KEY REFERENCES SourceControl(P_SourceControlNumber),
P_SourceRootNumber int FOREIGN KEY REFERENCES SourceRoot(P_SourceRootNumber),

)

CREATE TABLE CustomerDownload
(
P_CustomerDownloadNumber int NOT NULL PRIMARY KEY,

P_CustomerNumber int FOREIGN KEY REFERENCES Customer(P_CustomerNumber),
P_SubscriptionNumber int FOREIGN KEY REFERENCES Subscription(P_SubscriptionNumber),
P_CustomerReleaseNumber int FOREIGN KEY REFERENCES CustomerRelease(P_CustomerReleaseNumber),
P_ProductNumber int FOREIGN KEY REFERENCES Product(P_ProductNumber),
P_ProductVersionNumber int FOREIGN KEY REFERENCES ProductVersion(P_ProductVersionNumber),
P_DownloadFileNumber int FOREIGN KEY REFERENCES DownloadFile(P_DownloadFileNumber),
P_FeatureDescriptionNumber int FOREIGN KEY REFERENCES FeatureDescription(P_FeatureDescriptionNumber),
)







