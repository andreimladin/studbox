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