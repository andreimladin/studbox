alter table Course
add column ProfileId INTEGER NOT NULL;

delimiter //
create procedure copy_profile_id()
begin
	DECLARE v_course_id, v_year_id, v_profile_id INTEGER;
    DECLARE done INT DEFAULT FALSE;
	
	DECLARE courseCur CURSOR FOR SELECT  c.ObjectId, c.YearId, y.ProfileId from Course c inner join Year y on c.YearId = y.ObjectId;
    DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
	
	
	OPEN courseCur;
	
	read_loop: LOOP
    	FETCH courseCur INTO v_course_id, v_year_id, v_profile_id;
		if done then 
			leave read_loop;
		end if;
		
    	update Course set ProfileId = v_profile_id where ObjectId = v_course_id;   		
  	END LOOP;	
	close courseCur;
end; //
delimiter ;

## execute the procedure
call copy_profile_id();

## ensure all data is copied right
SELECT  c.ObjectId, c.YearId, c.ProfileId, y.ProfileId from Course c inner join Year y on c.YearId = y.ObjectId 
where c.ProfileId <> y.ProfileId

## drop the procedure
drop procedure copy_profile_id;

## Add the constraint to profile
ALTER TABLE Course 
ADD CONSTRAINT FK_C_P FOREIGN KEY (ProfileId) REFERENCES Profile(ObjectId);

## remove the foreign key to yearId
ALTER TABLE Course
DROP FOREIGN KEY course_ibfk_2;

## remove the index
ALTER TABLE Course
DROP INDEX YearId;

## remove the yearId column
ALTER TABLE Course
DROP COLUMN YearId;

## remove the Semester column
alter table Course
drop column Semester;