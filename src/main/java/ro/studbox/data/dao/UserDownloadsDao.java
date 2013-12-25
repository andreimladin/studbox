package ro.studbox.data.dao;

import ro.studbox.data.dao.bean.ResetDownloadsBean;
import ro.studbox.entities.UserDownloads;

public interface UserDownloadsDao extends GenericDao<Long, UserDownloads> {
	
	void incrementDownloadsNo(long userId);
	
	void resetDownloads(ResetDownloadsBean bean);

}
