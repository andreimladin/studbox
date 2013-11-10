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