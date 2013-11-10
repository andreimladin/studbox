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