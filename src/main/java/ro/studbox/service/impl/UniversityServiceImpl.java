package ro.studbox.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import ro.studbox.data.dao.UniversityDao;
import ro.studbox.entities.University;
import ro.studbox.service.UniversityService;

@Service
public class UniversityServiceImpl implements UniversityService {
	
	@Autowired
	private UniversityDao universityDao;
	
	@Cacheable(value="universityList")
	public List<University> getAll(){
		return universityDao.getAll();
	}

	@Cacheable(value="university")
	public University getUniversity(long universityId) {		
		return universityDao.find(universityId);
	}

	public void increaseViewNo(long universityId) {
		universityDao.increaseViewNo(universityId);
	}
	
	
	

}
