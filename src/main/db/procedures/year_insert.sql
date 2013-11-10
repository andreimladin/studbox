delimiter //
create procedure year_insert(IN profile_id_i integer,
								IN name_i varchar(150),
							    IN owner_id_i integer,
								OUT object_id_o integer)
begin
	declare v_object_type_id int;
	select ObjectTypeId into v_object_type_id from ObjectType where ObjectTypeName = 'YEAR_TYPE';

	call object_insert(v_object_type_id, object_id_o);

	insert into Year
	values(object_id_o,
           profile_id_i,
		   name_i,
           0,
           owner_id_i,
           NOW(),
           NOW());
end; //
delimiter ;