package ro.studbox.data.dao;

import ro.studbox.entities.User;


public interface UserDao extends GenericDao<Long, User> {
	
	User getUserByEmail(String email);
	
	User getUserByUsername(String username);
	
}
