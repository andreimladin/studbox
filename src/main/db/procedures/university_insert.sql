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