DROP TABLE UserDownloads;

CREATE TABLE UserDownloads (
  UserId INTEGER NOT NULL,
  TodayNo INTEGER NOT NULL DEFAULT 0,
  ThisWeekNo INTEGER NOT NULL DEFAULT 0,
  ThisMonthNo INTEGER NOT NULL DEFAULT 0,
  TotalNo INTEGER NOT NULL DEFAULT 0,  
  LastDownloadDate DATETIME,
  PRIMARY KEY (UserId)
);

ALTER TABLE UserDownloads ADD FOREIGN KEY (UserId) REFERENCES Users (UserId);