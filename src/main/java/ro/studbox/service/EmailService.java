package ro.studbox.service;

import ro.studbox.entities.AccountConfirmation;
import ro.studbox.entities.User;

public interface EmailService {
	
	void sendConfirmationMail(AccountConfirmation accConfirmation, User user);
	
	void sendWelcomeMail(User user);
	
	void sendEmailWithUsername(User user);
	
	void sendEmailWithPasswordReset(User user, String newPassword);
	
	void sendEmailFeedback(String email, String subject, String text);

}
