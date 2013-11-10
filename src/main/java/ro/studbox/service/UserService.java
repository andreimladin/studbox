package ro.studbox.service;

import java.util.Date;

import org.springframework.security.core.userdetails.UserDetailsService;

import ro.studbox.entities.User;


public interface UserService extends UserDetailsService {
	
	User createUser(String username, String password, String firstName, 
			String lastName, String email, String sex, 
			Date birthdate, boolean useNotifications);

	void confirmAccount(String confirmationKey);

	User getUserByEmail(String email);
	
	User getUserByUsername(String username);
	
	void rememberUsername(String email);
	
	void resetPassword(String email);
	
}
