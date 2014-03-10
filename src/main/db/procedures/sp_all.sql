delimiter //
create procedure object_type_insert(IN object_type_name varchar(25),
							   OUT object_type_id_o integer)
begin
	insert into ObjectType(ObjectTypeName) values (object_type_name);
	select last_insert_id() into object_type_id_o;
end; //
delimiter ;

delimiter //
create procedure object_insert(IN object_type_id_i integer,
							   OUT object_id_o integer)
begin
	insert into Object(ObjectTypeId) values (object_type_id_i);
	select last_insert_id() into object_id_o;
end; //
delimiter ;

delimiter //
create procedure university_insert(IN name_i varchar(150),
								   IN short_name_i varchar(30),
								   IN location_i varchar(20),
                                   IN logo_i varchar(50),                                   
                                   IN owner_id_i integer,
								   OUT object_id_o integer)
begin
	declare v_object_type_id int;
	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'UNIVERSITY_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into University
	values(object_id_o,
		   name_i,
		   short_name_i,
		   location_i,
           logo_i,
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;

delimiter //
create procedure faculty_insert(IN university_id_i integer,
								IN name_i varchar(150),
							    IN short_name_i varchar(30),
								IN location_i varchar(20),                                                           
								IN owner_id_i integer,
								OUT object_id_o integer)
begin
	declare v_object_type_id int;
	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'FACULTY_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into Faculty
	values(object_id_o,
           university_id_i,
		   name_i,
		   short_name_i,
		   location_i,
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;

delimiter //
create procedure profile_insert(IN faculty_id_i integer,
							    IN name_i varchar(150),
							    IN short_name_i varchar(30),								
								IN section_i varchar(15),
								IN type_i varchar(10),
								IN owner_id_i integer,
								OUT object_id_o integer)
begin
	declare v_object_type_id int;
	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'PROFILE_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into Profile
	values(object_id_o,
           faculty_id_i,
		   name_i,
		   short_name_i,	
           section_i,
           type_i,	   
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;

delimiter //
create procedure folder_insert(IN parent_folder_id_i integer,
							   IN name_i varchar(150),
                               IN is_course_i bit(1),
							   IN owner_id_i integer,
					           OUT object_id_o integer)
begin
	declare v_object_type_id int;
	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'FOLDER_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into Folder
	values(object_id_o,
           parent_folder_id_i,
		   name_i,
           is_course_i,
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;

delimiter //
create procedure course_insert(IN profile_id_i integer,
							   IN name_i varchar(150),
							   IN short_name_i varchar(30),                               
							   IN owner_id_i integer,
							   OUT object_id_o integer,
							   OUT default_folder_id_o integer)
begin
	declare v_object_type_id int;    
	call folder_insert(null, name_i, 1, owner_id_i, default_folder_id_o);

	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'COURSE_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into Course
	values(object_id_o,
           profile_id_i,
		   default_folder_id_o,
		   name_i,
		   short_name_i,          
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;