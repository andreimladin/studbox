package ro.studbox.data.dao.impl;

import org.springframework.stereotype.Repository;

import ro.studbox.data.dao.UserDownloadsDao;
import ro.studbox.entities.UserDownloads;

@Repository
public class UserDownloadsDaoImpl extends GenericDaoImpl<Long, UserDownloads> implements
		UserDownloadsDao {

	public UserDownloadsDaoImpl() {
		super(UserDownloads.class);
	}


}
