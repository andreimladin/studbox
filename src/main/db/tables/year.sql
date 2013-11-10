USE studbox;

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