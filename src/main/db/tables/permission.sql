DROP TABLE IF EXISTS Permission;
		
CREATE TABLE Permission (
  PermissionName VARCHAR(25) NOT NULL,
  Description VARCHAR(50) NOT NULL,
  PRIMARY KEY (PermissionName)
);