package ro.studbox.service;

import ro.studbox.entities.Profile;

public interface ProfileService {
	
	Profile getProfile(long profileId);
	void increaseViewNo(long profileId);

}
