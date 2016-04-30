INSERT INTO SoftwarePlatform
VALUES (1,'Windows') ,
       (2,'Linux')


INSERT INTO Product
VALUES (1,'MediSoft') ,
       (2,'MediSoft+'), 
	   (3,'SuperMediSoft'),
	   (4,'MediSoftUltra'),
	   (5,'MediSoftDeluxe')

INSERT INTO Release
VALUES(1.1,1,1),
      (1.1,1,2),
	  (2.1,1,1),
	  (2.2,1,1),
	  (2.2,1,2)


INSERT INTO CustomerRelease
VALUES(1.1,1,1,'https://www.mediHealth.com/downloads/MediSoftInstaller.exe', '2006-07-30')


INSERT INTO ProductVersion
VALUES (1.1), (1.2), (2.1),(2.2)

INSERT INTO Feature
VALUES (1, 'database module'),
       (2, 'gui modlue'),
	   (3, 'speech recognition module'),
	   (4, 'integration of datbase 1')

INSERT INTO FeatureSet
VALUES (1.1,1),
	   (1.1,2),
       (1.2,2),
       (2.1,1),
	   (2.2,2)

INSERT INTO ReleaseVersion
VALUES (1.1,1.1,1,1),
       (1.2,1.1,1,2),
       (2.1,2.1,1,1),
	   (2.2,2.1,1,1)

INSERT INTO SourceRoot
VALUES (1),
       (2)


INSERT INTO DownloadFile
VALUES (1, 'MediSoftInstaller.exe'),
	   (2,'MediSoft+Installer.exe'), 
	   (3,'SuperMediSoftInstaller.exe'),
	   (4,'MediSoftUltraInstaller.exe'),
	   (5,'MediSoftDeluxeInstaller.exe')

INSERT INTO Customer
VALUES (1,'Joe'),(2, 'George')


INSERT INTO PhoneNumber
VALUES (1, '1(818)678-9876', 'work') ,
       (2, '1(323)527-3456', 'mobile')

INSERT INTO Company
VALUES (1, 'Physician inc', '546 YorkShire St. 90023 CA') ,
       (2, 'Medihelp inc.', '1111 Florida Rd. 912034 CA')

INSERT INTO Email
VALUES (1, 'doctor@hotmail.com') ,
       (2, 'nurse@gmail.com')

INSERT INTO Subscription
VALUES (1,1,1,1,'Docotr23','password') ,
       (2,1,2,2,'Nurse66', 'Luckey')






