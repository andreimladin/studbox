package ro.studbox.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;

import ro.studbox.entities.AccountConfirmation;
import ro.studbox.entities.User;
import ro.studbox.service.EmailService;

@Service("TextPlainEmailService")
public class TextPlainEmailServiceImpl implements EmailService {

	@Autowired
	@Qualifier("adminMailSender")	
	private MailSender adminMailSender;
	
	@Autowired
	@Qualifier("supportMailSender")
	private MailSender supportMailSender;
	
		
	// AIM - send emails asynchronous
	@Async
	public void sendConfirmationMail(AccountConfirmation accConfirmation, User user) {
		// TODO Auto-generated method stub
	}

	@Async
	public void sendWelcomeMail(User user) {
		// TODO Auto-generated method stub	
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

	@Override
	public void sendEmailJobReport(String jobName, String status,
			String details, Date startDate, Date endDate) {
		// AIM - message preparing
		SimpleMailMessage message = new SimpleMailMessage();	    
		message.setFrom("admin@studbox.ro");
		message.setTo(new String[]{"admin@studbox.ro", "andrei.mladin@gmail.com"});
		message.setSubject("JOBS - " + jobName + " - " + status);
		
		StringBuilder text = new StringBuilder();
		text.append("The " + jobName + " job has " + status);
		text.append("\n Details : " + details);
		
		message.setText(text.toString());
				
		// AIM - send the message
		adminMailSender.send(message);			
	}
	
	
	
}
