delimiter //
create procedure course_insert(IN year_id_i integer,
							   IN name_i varchar(150),
							   IN short_name_i varchar(30),
                               IN semester_i TINYINT,
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
           year_id_i,
		   default_folder_id_o,
		   name_i,
		   short_name_i,
           semester_i,
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;