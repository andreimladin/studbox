create table UserLimit (
	UserId INTEGER NOT NULL,
	LimitName VARCHAR(25) NOT NULL,
	LimitValue VARCHAR(25) NOT NULL,
	PRIMARY KEY  (UserId, LimitName)
);

ALTER TABLE UserLimit ADD FOREIGN KEY (UserId) REFERENCES Users (UserId);