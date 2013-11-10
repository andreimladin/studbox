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