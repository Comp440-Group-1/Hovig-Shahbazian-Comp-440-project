--Check for existence of object before we add them.
CREATE TABLE SoftwarePlatform
(
P_SoftwarePlatformNumber int IDENTITY(1,1) NOT NULL PRIMARY KEY,

PlatformName varchar(255) NOT NULL UNIQUE,
)

CREATE TABLE Product
(
P_ProductNumber int IDENTITY(1,1) NOT NULL PRIMARY KEY,

ProductName varchar(255) NOT NULL UNIQUE,
ProductDescription varchar(255),
)

CREATE TABLE Release
(
P_ReleaseNumber decimal(2,1),
P_ProductNumber int,
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

FOREIGN KEY(P_ProductNumber) REFERENCES Product(P_ProductNumber),
FOREIGN KEY(P_SoftwarePlatformNumber ) REFERENCES SoftwarePlatform(P_SoftwarePlatformNumber),
)

CREATE TABLE CustomerRelease
(
P_ReleaseNumber decimal(2,1),
P_ProductNumber int,
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),
FOREIGN KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) REFERENCES Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

URL nchar(255) NULL UNIQUE,
CustomerReleaseDate date NOT NULL,
)

CREATE TABLE DevelopmentRelease
(
P_ReleaseNumber decimal(2,1),
P_ProductNumber int,
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),
FOREIGN KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) REFERENCES Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

P_Iteration int NOT NULL,
StartDate date NOT NULL,
EndDate date NOT NULL,
Sprint int NOT NULL,
Commits int NOT NULL,
)

CREATE TABLE ProductVersion
(
P_ProductVersionNumber decimal(2,1) NOT NULL PRIMARY KEY,
)


CREATE TABLE Feature
(
P_FeatureNumber int IDENTITY(1,1) NOT NULL PRIMARY KEY,
FeatureDesciption varchar(255) NOT NULL UNIQUE,
)

CREATE TABLE FeatureSet(

P_ProductVersionNumber decimal(2,1),
P_FeatureNumber int,

PRIMARY KEY(P_ProductVersionNumber,P_FeatureNumber),

FOREIGN KEY(P_ProductVersionNumber) REFERENCES ProductVersion(P_ProductVersionNumber),
FOREIGN KEY(P_FeatureNumber) REFERENCES Feature(P_FeatureNumber),

)



CREATE TABLE ReleaseVersion(

P_ProductVersionNumber decimal(2,1),

P_ReleaseNumber decimal(2,1),
P_ProductNumber int,
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_ProductVersionNumber,P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

FOREIGN KEY(P_ProductVersionNumber) REFERENCES ProductVersion(P_ProductVersionNumber),

FOREIGN KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) 
REFERENCES Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

)

CREATE TABLE SourceRoot
(
P_SourceRootNumber int IDENTITY(1,1) NOT NULL PRIMARY KEY,
SourceRootName varchar(255) UNIQUE
)

CREATE TABLE Branch
(
P_SourceRootNumber int,
P_ReleaseNumber decimal(2,1),
P_ProductNumber int,
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_SourceRootNumber,P_ProductNumber,P_ReleaseNumber, P_SoftwarePlatformNumber),

FOREIGN KEY(P_SourceRootNumber) REFERENCES SourceRoot(P_SourceRootNumber),
FOREIGN KEY(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) 
REFERENCES Release(P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),

BranchNumber int NOT NULL UNIQUE,
)


CREATE TABLE Customer
(
P_CustomerNumber int IDENTITY(1,1) NOT NULL PRIMARY KEY,

CustomerFirstName varchar(255) NOT NULL,
CustomerLastName varchar (255) NOT NULL,

UNIQUE(CustomerFirstName,CustomerLastName)
)

CREATE TABLE PhoneNumber
(
P_PhoneNumberID int IDENTITY(1,1) PRIMARY KEY,
P_CustomerNumber int ,

FOREIGN KEY(P_CustomerNumber) REFERENCES Customer(P_CustomerNumber),
PhoneNumber varchar(15) NOT NULL,
PhoneType varchar(10) NOT NULL,
)

CREATE TABLE Company
(
P_CompanyNumber int IDENTITY(1,1) PRIMARY KEY,
P_CustomerNumber int ,

FOREIGN KEY(P_CustomerNumber) REFERENCES Customer(P_CustomerNumber),
CompanyName varchar(50),
CompanyAddress varchar(50),
)

CREATE TABLE Email
(
P_EmailNumber int IDENTITY(1,1) PRIMARY KEY,
P_CustomerNumber int ,

FOREIGN KEY(P_CustomerNumber) REFERENCES Customer(P_CustomerNumber),

Email varchar(50),
)

CREATE TABLE Subscription
(
P_CustomerNumber int,

PRIMARY KEY(P_CustomerNumber),

FOREIGN KEY(P_CustomerNumber) REFERENCES Customer(P_CustomerNumber),

CustomerLogin varchar(25) NOT NULL UNIQUE,
CustomerPassword varchar(25) NOT NULL UNIQUE,

)

CREATE TABLE CustomerDownload
(
P_CustomerNumber int ,
P_ProductNumber int ,
P_ProductVersionNumber decimal(2,1),
P_ReleaseNumber decimal(2,1),
P_SoftwarePlatformNumber int,

PRIMARY KEY(P_CustomerNumber,P_ProductNumber, P_ProductVersionNumber,P_ReleaseNumber, P_SoftwarePlatformNumber),

FOREIGN KEY(P_CustomerNumber) 
REFERENCES Customer(P_CustomerNumber),


FOREIGN KEY(P_ProductVersionNumber, P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber) 
REFERENCES ReleaseVersion(P_ProductVersionNumber,P_ReleaseNumber,P_ProductNumber,P_SoftwarePlatformNumber),


DownloadCount int NOT NULL,
DownloadDate date NOT NULL,
)







