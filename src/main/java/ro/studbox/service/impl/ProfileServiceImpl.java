package ro.studbox.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import ro.studbox.data.dao.FacultyDao;
import ro.studbox.data.dao.ProfileDao;
import ro.studbox.entities.Profile;
import ro.studbox.service.ProfileService;

@Service
public class ProfileServiceImpl implements ProfileService {
	
	@Autowired
	private ProfileDao profileDao;
	
	@Autowired
	private FacultyDao facultyDao;

	@Cacheable(value="profile")
	public Profile getProfile(long profileId) {		
		return profileDao.find(profileId);
	}

	public void increaseViewNo(long profileId) {
		facultyDao.increaseViewNoByProfileId(profileId);
		profileDao.increaseViewNo(profileId);
	}
	
	
	
}
