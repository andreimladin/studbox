package ro.studbox.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cache.annotation.Cacheable;
import org.springframework.stereotype.Service;

import ro.studbox.data.dao.FacultyDao;
import ro.studbox.data.dao.ProfileDao;
import ro.studbox.entities.Course;
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
	
	@Override
	public Profile createProfile(long facultyId, String name, String shortName, String section, String type, long ownerId){
		// creation date
		Date now = new Date();
		// New profile object
		Profile profile = new Profile(facultyId, name, shortName, section, type, ownerId, now, now);
		// Persist the profile
		profileDao.create(profile);
		return profile;
	}

	@Override
	public boolean existsProfile(long facultyId, String name) {		
		return profileDao.existsProfile(facultyId, name);
	}

	@Override
	public boolean existsProfile(long profileId){
		return profileDao.existsProfile(profileId);
	}
	
	public void increaseViewNo(long profileId) {
		profileDao.increaseViewNo(profileId);
	}
}
