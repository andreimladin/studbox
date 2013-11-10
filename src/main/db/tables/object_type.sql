USE studbox;

DROP TABLE IF EXISTS ObjectType;
		
CREATE TABLE ObjectType (
  ObjectTypeId INTEGER NOT NULL AUTO_INCREMENT,
  ObjectTypeName VARCHAR(25) NOT NULL,
  PRIMARY KEY (ObjectTypeId),
  UNIQUE KEY (ObjectTypeName)
);