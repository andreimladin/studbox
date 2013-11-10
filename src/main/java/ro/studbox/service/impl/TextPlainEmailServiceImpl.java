package ro.studbox.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import ro.studbox.entities.AccountConfirmation;
import ro.studbox.entities.User;
import ro.studbox.service.EmailService;

@Service("TextPlainEmailSerivce")
public class TextPlainEmailServiceImpl implements EmailService {

	@Autowired
	private MailSender mailSender;
		
	// AIM - send emails asynchronous
	@Async
	public void sendConfirmationMail(AccountConfirmation accConfirmation, User user) {
		// AIM - message preparing
		SimpleMailMessage message = new SimpleMailMessage();	    
		message.setFrom("andrei.mladin@gmail.com");
		message.setTo(user.getEmail());
		message.setSubject("Confirmare cont Studbox");
		
		StringBuilder text = new StringBuilder();
		text.append("Buna ").append(user.getFirstName()).append(",");
		text.append("\n\n");
		text.append("Iti multumim pentru increderea si atentia acordata.");
		text.append("\n");
		text.append("Pentru activarea contului te rugam sa accesezi urmatorul link : ");
		text.append("\n");
		text.append("www.studbox.ro/accountConfirmation.htm?confirmationKey=" + accConfirmation.getKey());
		text.append("\n\n");
		text.append("O zi buna in continuare,");
		text.append("\n");
		text.append("Andrei Mladin - Studbox CEO :)");		
		
		message.setText(text.toString());
				
		// AIM - send the message
		mailSender.send(message);		
	}

	@Async
	public void sendWelcomeMail(User user) {
		// AIM - message preparing
		SimpleMailMessage message = new SimpleMailMessage();	    
		message.setFrom("andrei.mladin@gmail.com");
		message.setTo(user.getEmail());
		message.setSubject("Bine ai venit in lumea Studbox");
				
		StringBuilder text = new StringBuilder();
		text.append("Buna ").append(user.getFirstName()).append(",");
		text.append("\n\n");
		text.append("Accesare placuta");
		text.append("\n\n");
		text.append("O zi buna in continuare,");
		text.append("\n");
		text.append("Andrei Mladin - Studbox CEO :)");		
				
		message.setText(text.toString());
						
		// AIM - send the message
		mailSender.send(message);		
	}

	public void sendEmailWithUsername(User user) {
		// TODO Auto-generated method stub
		
	}

	public void sendEmailWithPasswordReset(User user, String newPassword) {
		// TODO Auto-generated method stub
		
	}

	public void sendEmailFeedback(String email, String subject, String text) {
		// TODO Auto-generated method stub
		
	}
	
}
