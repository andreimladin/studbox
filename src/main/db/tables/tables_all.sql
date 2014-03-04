USE studbox;

-- Users --

DROP TABLE IF EXISTS Users;
		
CREATE TABLE Users (
  UserId INTEGER NOT NULL AUTO_INCREMENT,
  Username VARCHAR(20) NOT NULL,
  Password VARCHAR(50) NOT NULL,
  FirstName VARCHAR(25) NOT NULL,
  LastName VARCHAR(25) NOT NULL,
  Email VARCHAR(50) NOT NULL,
  Sex CHAR NOT NULL,
  Birthdate DATE NOT NULL,
  CreationDate DATETIME NOT NULL,
  LockDate DATETIME NULL DEFAULT NULL,
  Status TINYINT NOT NULL DEFAULT 0,
  UseNotifications bit(1) NOT NULL DEFAULT 0,
  PRIMARY KEY (UserId), 
  UNIQUE KEY(Username),
  UNIQUE KEY(Email)
);

-- Roles --

DROP TABLE IF EXISTS Role;
		
CREATE TABLE Role (
  RoleName VARCHAR(25) NOT NULL,
  Description VARCHAR(50) NOT NULL,
  PRIMARY KEY (RoleName)
);

-- Permissions --

DROP TABLE IF EXISTS Permission;
		
CREATE TABLE Permission (
  PermissionName VARCHAR(25) NOT NULL,
  Description VARCHAR(50) NOT NULL,
  PRIMARY KEY (PermissionName)
);

-- UserRoles --

DROP TABLE IF EXISTS UserRoles;
		
CREATE TABLE UserRoles (
  UserId INTEGER NOT NULL,
  RoleName VARCHAR(25) NOT NULL,
  PRIMARY KEY (UserId, RoleName)
);

ALTER TABLE UserRoles ADD FOREIGN KEY (UserId) REFERENCES Users (UserId);
ALTER TABLE UserRoles ADD FOREIGN KEY (RoleName) REFERENCES Role (RoleName);

-- RolePermissions --

DROP TABLE IF EXISTS RolePermissions;
		
CREATE TABLE RolePermissions (
  RoleName VARCHAR(25) NOT NULL,
  PermissionName VARCHAR(25) NOT NULL,
  PRIMARY KEY (RoleName, PermissionName)
);

ALTER TABLE RolePermissions ADD FOREIGN KEY (RoleName) REFERENCES Role (RoleName);
ALTER TABLE RolePermissions ADD FOREIGN KEY (PermissionName) REFERENCES Permission (PermissionName);


-- ObjectType -- 

DROP TABLE IF EXISTS ObjectType;
		
CREATE TABLE ObjectType (
  ObjectTypeId INTEGER NOT NULL AUTO_INCREMENT,
  ObjectTypeName VARCHAR(25) NOT NULL,
  PRIMARY KEY (ObjectTypeId),
  UNIQUE KEY (ObjectTypeName)
);

-- Object -- 

DROP TABLE IF EXISTS Object;
		
CREATE TABLE Object (
  ObjectId INTEGER NOT NULL AUTO_INCREMENT,
  ObjectTypeId INTEGER NOT NULL,
  PRIMARY KEY (ObjectId)
);

ALTER TABLE Object ADD FOREIGN KEY (ObjectTypeId) REFERENCES ObjectType(ObjectTypeId);

-- University --

DROP TABLE IF EXISTS University;
		
CREATE TABLE University (
  ObjectId INTEGER NOT NULL,
  Name VARCHAR(100) NOT NULL,
  ShortName VARCHAR(30) NOT NULL,
  Location VARCHAR(20) NOT NULL,
  Logo VARCHAR(50) NOT NULL,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY (Name)
);

ALTER TABLE University ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE University ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Faculty --

DROP TABLE IF EXISTS Faculty;
		
CREATE TABLE Faculty (
  ObjectId INTEGER NOT NULL,
  UniversityId INTEGER NOT NULL,
  Name VARCHAR(150) NOT NULL,
  ShortName VARCHAR(30) NOT NULL,
  Location VARCHAR(30) NOT NULL,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY (UniversityId, Name)
);

ALTER TABLE Faculty ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Faculty ADD FOREIGN KEY (UniversityId) REFERENCES University(ObjectId);
ALTER TABLE Faculty ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Profile --

DROP TABLE IF EXISTS Profile;
		
CREATE TABLE Profile (
  ObjectId INTEGER NOT NULL,
  FacultyId INTEGER NOT NULL,
  Name VARCHAR(150) NOT NULL,
  ShortName VARCHAR(30) NOT NULL,
  Section VARCHAR(15) NOT NULL,
  Type VARCHAR(10) NOT NULL, 
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY (FacultyId, Name, Section)
);

ALTER TABLE Profile ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Profile ADD FOREIGN KEY (FacultyId) REFERENCES Faculty(ObjectId);
ALTER TABLE Profile ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Year -- 

DROP TABLE IF EXISTS Year;
		
CREATE TABLE Year (
  ObjectId INTEGER NOT NULL,
  ProfileId INTEGER NOT NULL,
  Name VARCHAR(150) NOT NULL,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY (ProfileId, Name)
);

ALTER TABLE Year ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Year ADD FOREIGN KEY (ProfileId) REFERENCES Profile(ObjectId);
ALTER TABLE Year ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Folder -- 

DROP TABLE IF EXISTS Folder;

CREATE TABLE Folder (
  ObjectId INTEGER NOT NULL,
  ParentFolderId INTEGER NULL,
  Name VARCHAR(30) NOT NULL,
  IsCourse bit(1) NOT NULL DEFAULT 0,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,    
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,  
  PRIMARY KEY (ObjectId)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

ALTER TABLE Folder ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Folder ADD FOREIGN KEY (ParentFolderId) REFERENCES Folder(ObjectId);
ALTER TABLE Folder ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Course -- 

DROP TABLE IF EXISTS Course;
			
CREATE TABLE Course (
  ObjectId INTEGER NOT NULL,
  YearId INTEGER NOT NULL,
  DefaultFolderId INTEGER NOT NULL,
  Name VARCHAR(150) NOT NULL,
  ShortName VARCHAR(30) NOT NULL, 
  Semester TINYINT NOT NULL,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  OwnerId INTEGER NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY (YearId, Name, Semester)
) DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;

ALTER TABLE Course ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Course ADD FOREIGN KEY (YearId) REFERENCES Year(ObjectId);
ALTER TABLE Course ADD FOREIGN KEY (DefaultFolderId) REFERENCES Folder(ObjectId);
ALTER TABLE Course ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- File -- 

DROP TABLE IF EXISTS File;
		
CREATE TABLE File (
  ObjectId INTEGER NOT NULL,
  FolderId INTEGER NOT NULL,
  Name VARCHAR(50) NOT NULL,
  ContentType VARCHAR(100) NOT NULL,
  ContentLength INTEGER NOT NULL,
  OwnerId INTEGER NOT NULL,
  Path VARCHAR(200) NOT NULL,
  CreationDate DATETIME NOT NULL,
  LastModifiedDate DATETIME NULL DEFAULT NULL,
  ViewNo INTEGER NOT NULL DEFAULT 0,
  PRIMARY KEY (ObjectId),
  UNIQUE KEY(FolderId, Name)
);

ALTER TABLE File ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE File ADD FOREIGN KEY (FolderId) REFERENCES Folder(ObjectId);
ALTER TABLE File ADD FOREIGN KEY (OwnerId) REFERENCES Users(UserId);

-- Comment --
		
DROP TABLE IF EXISTS Comment;		
		
CREATE TABLE Comment (
  ObjectId INTEGER NOT NULL,
  SubjectId INTEGER NOT NULL,
  UserId INTEGER NOT NULL,
  Text VARCHAR(250) NOT NULL,
  CreationDate DATE NOT NULL,
  PRIMARY KEY (ObjectId)
);

ALTER TABLE Comment ADD FOREIGN KEY (ObjectId) REFERENCES Object(ObjectId);
ALTER TABLE Comment ADD FOREIGN KEY (SubjectId) REFERENCES Object(ObjectId);
ALTER TABLE Comment ADD FOREIGN KEY (UserId) REFERENCES Users(UserId);

-- AccountConfirmation -- 

DROP TABLE IF EXISTS AccountConfirmation;
		
CREATE TABLE AccountConfirmation (
  UserId INTEGER NOT NULL,
  Status INTEGER NOT NULL Default 0,
  Timestamp DATETIME NOT NULL,
  ConfirmationKey VARCHAR(150) NOT NULL,
  PRIMARY KEY (UserId),
  UNIQUE KEY (ConfirmationKey)
);

ALTER TABLE AccountConfirmation ADD FOREIGN KEY (UserId) REFERENCES Users(UserId);

DROP TABLE IF EXISTS UserDownloads;

CREATE TABLE UserDownloads (
  UserId INTEGER NOT NULL,
  TodayNo INTEGER NOT NULL DEFAULT 0,
  ThisWeekNo INTEGER NOT NULL DEFAULT 0,
  ThisMonthNo INTEGER NOT NULL DEFAULT 0,
  ThisYearNo INTEGER NOT NULL DEFAULT 0,
  TotalNo INTEGER NOT NULL DEFAULT 0,  
  LastDownloadDate DATETIME,
  PRIMARY KEY (UserId)
);

ALTER TABLE UserDownloads ADD FOREIGN KEY (UserId) REFERENCES Users (UserId);

create table UserLimit (
	UserId INTEGER NOT NULL,
	LimitName VARCHAR(25) NOT NULL,
	LimitValue VARCHAR(25) NOT NULL,
	PRIMARY KEY  (UserId, LimitName)
);

ALTER TABLE UserLimit ADD FOREIGN KEY (UserId) REFERENCES Users (UserId);