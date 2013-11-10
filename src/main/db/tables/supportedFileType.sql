DROP TABLE IF EXISTS Comment;		
		
CREATE TABLE SupportedFileType (
  MimeType VARCHAR(100) NOT NULL,
  Extensions VARCHAR(100) NOT NULL,
  PRIMARY KEY (MimeType)
);