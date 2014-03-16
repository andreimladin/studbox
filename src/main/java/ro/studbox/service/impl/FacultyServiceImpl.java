package ro.studbox.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.FacultyDao;
import ro.studbox.entities.Faculty;
import ro.studbox.service.FacultyService;

/**
 * @author andreim
 **/

@Service
public class FacultyServiceImpl implements FacultyService {
	
	@Autowired
	private FacultyDao facultyDao;
	
	@Transactional
	public Faculty getFaculty(long facultyId) {
		facultyDao.increaseViewNo(facultyId);
		return facultyDao.find(facultyId);
	}

	@Override
	public void increaseViewNo(long facultyId) {
		facultyDao.increaseViewNo(facultyId);		
	}
	
	@Override
	public boolean existsFaculty(long facultyId) {		
		return facultyDao.existsFaculty(facultyId);
	}

	
	
}


