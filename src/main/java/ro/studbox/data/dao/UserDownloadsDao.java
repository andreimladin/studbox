package ro.studbox.data.dao;

import ro.studbox.entities.UserDownloads;

public interface UserDownloadsDao extends GenericDao<Long, UserDownloads> {
	
	void incrementDownloadsNo(long userId);

}
