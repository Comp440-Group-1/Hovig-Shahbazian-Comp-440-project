
INSERT INTO SoftwarePlatform 
VALUES ('Windows'),
       ('Linux')


INSERT INTO Product
VALUES ('MediSoft', 'does something') ,
       ('MediSoft+', 'does something'), 
	   ('SuperMediSoft', 'does something'),
	   ('MediSoftUltra', 'does something'),
	   ('MediSoftDeluxe', 'does something')

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
VALUES ('database module'),
       ('gui modlue'),
	   ('speech recognition module'),
	   ('integration of datbase 1')

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
VALUES ('Medihelp Source Root'),
       ('SuperMediHelp Source Root')


INSERT INTO DownloadFile
VALUES ('MediSoftInstaller.exe'),
	   ('MediSoft+Installer.exe'), 
	   ('SuperMediSoftInstaller.exe'),
	   ('MediSoftUltraInstaller.exe'),
	   ('MediSoftDeluxeInstaller.exe')

INSERT INTO Customer
VALUES ('Joe','Showmaucher'),('George', 'Monroe')


INSERT INTO PhoneNumber
VALUES ('1(818)678-9876', 'work') ,
       ('1(323)527-3456', 'mobile')

INSERT INTO Company
VALUES ('Physician inc', '546 YorkShire St. 90023 CA') ,
       ('Medihelp inc.', '1111 Florida Rd. 912034 CA')

INSERT INTO Email
VALUES ('doctor@hotmail.com') ,
       ('nurse@gmail.com')

INSERT INTO Subscription
VALUES (1,1,1,1,'Docotr23','password') ,
       (2,1,2,2,'Nurse66', 'Luckey')






