package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.University;

public interface UniversityDao extends GenericDao<Long, University> {
		
	List<University> getAll();
	boolean existsUniversity(long universityId);
	void increaseViewNo(long universityId);
	
}
