package ro.studbox.service;

import ro.studbox.entities.Profile;

public interface ProfileService {
	
	Profile getProfile(long profileId);
	boolean existsProfile(long facultyId, String name);
	boolean existsProfile(long profileId);
	Profile createProfile(long facultyId, String name, String shortName, String section, String type, long ownerId);
	void increaseViewNo(long profileId);

}
