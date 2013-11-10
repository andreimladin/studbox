package ro.studbox.data.dao;

import ro.studbox.entities.Year;

public interface YearDao extends GenericDao<Long, Year>{

	void increaseViewNo(long yearId);
	
	void increaseViewNoByCourseId(long courseId);

}
