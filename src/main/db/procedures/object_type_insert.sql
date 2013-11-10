delimiter //
create procedure object_type_insert(IN object_type_name varchar(25),
							   OUT object_type_id_o integer)
begin
	insert into ObjectType(ObjectTypeName) values (object_type_name);
	select last_insert_id() into object_type_id_o;
end; //
delimiter ;