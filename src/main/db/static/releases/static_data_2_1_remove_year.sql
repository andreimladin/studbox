# Remove the Year table
drop table Year;

# Remove the Year object ids
delete from Object where ObjectTypeId in (select ObjectTypeId from ObjectType where ObjectTypeName = 'YEAR_TYPE');

# Remove the Year type
delete from ObjectType where ObjectTypeName= 'YEAR_TYPE';

# 
insert ObjectType values(4, 'AUX');

# Decrease the object type ids of objects
update Object set ObjectTypeId = 4 where ObjectTypeId in (select ObjectTypeId from ObjectType where ObjectTypeName = 'COURSE_TYPE');
update Object set ObjectTypeId = 5 where ObjectTypeId in (select ObjectTypeId from ObjectType where ObjectTypeName = 'FOLDER_TYPE');
update Object set ObjectTypeId = 6 where ObjectTypeId in (select ObjectTypeId from ObjectType where ObjectTypeName = 'FILE_TYPE');
update Object set ObjectTypeId = 7 where ObjectTypeId in (select ObjectTypeId from ObjectType where ObjectTypeName = 'COMMENT_TYPE');

# Decrease the ids of object types
delete from ObjectType where ObjectTypeName = 'COMMENT_TYPE';
update ObjectType set ObjectTypeName = 'COMMENT_TYPE' where ObjectTypeId = 7;
update ObjectType set ObjectTypeName = 'FILE_TYPE' where ObjectTypeId = 6;
update ObjectType set ObjectTypeName = 'FOLDER_TYPE' where ObjectTypeId = 5;
update ObjectType set ObjectTypeName = 'COURSE_TYPE' where ObjectTypeId = 4;