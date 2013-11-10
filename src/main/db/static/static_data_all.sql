USE studbox;

-- Roles --
insert into Role values ('ADMIN', 'Administrator');
insert into Role values ('TODO', 'Todo');
insert into Role values ('COORDINATOR', 'Coordonator grup/arie');
insert into Role values ('CONTRIBUTOR', 'Contribuitor resurse');
insert into Role values ('CONSUMER', 'Consumator resurse');

-- Users --
insert into Users(Username, Password, FirstName, LastName, Email, Sex, Birthdate, CreationDate, Status, UseNotifications)
values('SYSADMIN', '24bcfe0ad7c8e4ef28e12f084bf97e07', 'ADMIN','Studbox','admin@studbox.ro', 'M', '1987-03-26', '2013-07-28', 1, 1);

insert into Users(Username, Password, FirstName, LastName, Email, Sex, Birthdate, CreationDate, Status, UseNotifications)
values('SUPPORT', '24bcfe0ad7c8e4ef28e12f084bf97e07', 'SUPPORT','Studbox','support@studbox.ro', 'M', '1987-03-26', '2013-07-28', 1, 1);


-- UserRoles --
insert into UserRoles values (1, 'ADMIN');
insert into UserRoles values (2, 'ADMIN');


-- ObjectType --

call object_type_insert("UNIVERSITY_TYPE", @object_type_id);
call object_type_insert("FACULTY_TYPE", @object_type_id);
call object_type_insert("PROFILE_TYPE", @object_type_id);
call object_type_insert("YEAR_TYPE", @object_type_id);
call object_type_insert("COURSE_TYPE", @object_type_id);
call object_type_insert("FOLDER_TYPE", @object_type_id);
call object_type_insert("FILE_TYPE", @object_type_id);
call object_type_insert("COMMENT_TYPE", @object_type_id);