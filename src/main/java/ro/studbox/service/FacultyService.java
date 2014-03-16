package ro.studbox.service;

import ro.studbox.entities.Faculty;

/**
 * @author andreim
 **/

public interface FacultyService {
	
	Faculty getFaculty(long facultyId);
	void increaseViewNo(long facultyId);
	boolean existsFaculty(long facultyId);
}


