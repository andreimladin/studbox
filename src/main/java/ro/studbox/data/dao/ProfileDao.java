package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.Profile;

public interface ProfileDao extends GenericDao<Long, Profile> {
	
	List<Profile> getAllByFacultyId(long facultyId);
	boolean existsProfile(long facultyId, String name);
	void increaseViewNo(long profileId);
	boolean existsProfile(long profileId);

}
