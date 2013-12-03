package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.UserLimit;

public interface UserLimitDao extends GenericDao<Long, UserLimit> {
	
	List<UserLimit> getUserLimit(long userId);

}
