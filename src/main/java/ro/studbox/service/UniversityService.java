package ro.studbox.service;

import java.util.List;

import ro.studbox.entities.University;

public interface UniversityService {

	List<University> getAll();	
	University getUniversity(long universityId);
	void increaseViewNo(long universityId);
	
}
