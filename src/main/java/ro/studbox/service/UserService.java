package ro.studbox.service;

import java.util.Date;

import org.springframework.security.core.userdetails.UserDetailsService;

import ro.studbox.entities.User;
import ro.studbox.entities.UserLimit;


public interface UserService extends UserDetailsService {
	
	User createUser(String username, String password, String firstName, 
			String lastName, String email, String sex, String location,
			Date birthdate, boolean useNotifications);

	void confirmAccount(String confirmationKey);

	User getUserByEmail(String email);
	
	User getUserByUsername(String username);
	
	void rememberUsername(String email);
	
	void resetPassword(String email);
	
	void incrementDownloadsNo(long userId);
	
	UserLimit exceededLimit(long userId);
	
}
