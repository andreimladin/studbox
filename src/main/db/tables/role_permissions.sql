DROP TABLE IF EXISTS RolePermissions;
		
CREATE TABLE RolePermissions (
  RoleName VARCHAR(25) NOT NULL,
  PermissionName VARCHAR(25) NOT NULL,
  PRIMARY KEY (RoleName, PermissionName)
);

ALTER TABLE RolePermissions ADD FOREIGN KEY (RoleName) REFERENCES Role (RoleName);
ALTER TABLE RolePermissions ADD FOREIGN KEY (PermissionName) REFERENCES Permission (PermissionName);
