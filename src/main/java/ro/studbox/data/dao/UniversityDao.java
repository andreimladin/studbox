package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.University;

public interface UniversityDao extends GenericDao<Long, University> {
		
	List<University> getAll();

	void increaseViewNo(long universityId);
	
}
