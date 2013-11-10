package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.Faculty;

/**
 * @author andreim
 **/

public interface FacultyDao extends GenericDao<Long, Faculty> {
	
	List<Faculty> getAllByUniversityId(long universityId);

	void increaseViewNo(long facultyId);
	
	void increaseViewNoByProfileId(long profileId);
	
}


