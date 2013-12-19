package ro.studbox.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

import org.apache.velocity.app.VelocityEngine;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.scheduling.annotation.Async;
import org.springframework.stereotype.Service;
import org.springframework.ui.velocity.VelocityEngineUtils;

import ro.studbox.entities.AccountConfirmation;
import ro.studbox.entities.User;
import ro.studbox.service.EmailService;

@Service("HtmlEmailService")
public class HtmlEmailServiceImpl implements EmailService {
			
	@Autowired
	@Qualifier("supportMailSender")
	private JavaMailSender supportMailSender;
	
	@Autowired
	private VelocityEngine velocityEngine;	
	
	@Async
	public void sendConfirmationMail(final AccountConfirmation accConfirmation, final User user) {
		// AIM - message preparing
		MimeMessagePreparator preparator = new MimeMessagePreparator() {
				
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);	    
				message.setFrom("support@studbox.ro");
				message.setTo(user.getEmail());
				message.setSubject("Confirmare cont - Studbox");				
					
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("user", user);
				data.put("accConfirmation", accConfirmation);
				
				String body = VelocityEngineUtils.mergeTemplateIntoString(
		                velocityEngine, "templates/emails/confirmationEmail.vm", "UTF-8", data);
						
				message.setText(body, true);
				
						
			}
		};
								
		// AIM - send the message
		supportMailSender.send(preparator);		
	}
	
	@Async
	public void sendWelcomeMail(final User user) {
		// AIM - message preparing
		MimeMessagePreparator preparator = new MimeMessagePreparator() {						
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);	    
				message.setFrom("support@studbox.ro");
				message.setTo(user.getEmail());
				message.setSubject("Bun venit in lumea Studbox");				
							
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("user", user);
						
				String body = VelocityEngineUtils.mergeTemplateIntoString(
		               velocityEngine, "templates/emails/welcomeEmail.vm", "UTF-8", data);
							
				message.setText(body, true);	
			}
		};
										
		// AIM - send the message
		supportMailSender.send(preparator);	
	}

	@Async
	public void sendEmailWithUsername(final User user) {
		// AIM - message preparing
		MimeMessagePreparator preparator = new MimeMessagePreparator() {						
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);	    
				message.setFrom("support@studbox.ro");
				message.setTo(user.getEmail());
				message.setSubject("Reamintire user");				
							
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("user", user);
						
				String body = VelocityEngineUtils.mergeTemplateIntoString(
		               velocityEngine, "templates/emails/rememberUsername.vm", "UTF-8", data);
							
				message.setText(body, true);	
			}
		};
										
		// AIM - send the message
		supportMailSender.send(preparator);		
	}

	@Async
	public void sendEmailWithPasswordReset(final User user, final String newPassword) {
		// AIM - message preparing
		MimeMessagePreparator preparator = new MimeMessagePreparator() {						
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);	    
				message.setFrom("support@studbox.ro");
				message.setTo(user.getEmail());
				message.setSubject("Parola resetata");				
							
				Map<String, Object> data = new HashMap<String, Object>();
				data.put("user", user);
				data.put("newPassword", newPassword);
						
				String body = VelocityEngineUtils.mergeTemplateIntoString(
		               velocityEngine, "templates/emails/resetPassword.vm", "UTF-8", data);
							
				message.setText(body, true);	
			}
		};
										
		// AIM - send the message
		supportMailSender.send(preparator);
	}
	
	@Async
    public void sendEmailFeedback(final String email, final String subject, final String text) {
    	MimeMessagePreparator preparator = new MimeMessagePreparator() {
    		public void prepare(MimeMessage mimeMessage) throws Exception {
    			MimeMessageHelper message = new MimeMessageHelper(mimeMessage, true);
                message.setFrom("support@studbox.ro");
                message.setTo("feedback@studbox.ro");
                message.setSubject(subject);
                Map<String, Object> data = new HashMap<String, Object>();
                data.put("email", email);
                data.put("text", text);                
                String body = VelocityEngineUtils.mergeTemplateIntoString(velocityEngine, "templates/emails/feedback.vm", "UTF-8", data);
                message.setText(body, true);
            }
        };
        supportMailSender.send(preparator);
    }
    
    @Override
	public void sendEmailJobReport(String jobName, String status,
			String details, Date startDate, Date endDate) {
		// TODO Auto-generated method stub		
	}

	public static void main(String[] args) throws AddressException, MessagingException{
    	String host = "smtp.live.com";
    	String from = "support@studbox.ro";
    	Properties props = System.getProperties();
    	props.put("mail.smtp.host", host);
    	props.put("mail.smtp.user", from);
    	props.put("mail.smtp.password", "Studbox9*");
    	props.put("mail.smtp.port", "587"); // 587 is the port number of yahoo mail
    	props.put("mail.smtp.auth", "true");
    	props.put("mail.smtp.starttls.enable", "true");
    	
    	Session session = Session.getDefaultInstance(props, null);
    	MimeMessage message = new MimeMessage(session);
    	message.setFrom(new InternetAddress(from));

   	    message.addRecipient(Message.RecipientType.TO, new InternetAddress("feedback@studbox.ro"));
    	message.setSubject("sending in a group");
    	message.setText("Welcome to JavaMail");
    	// alternately, to send HTML mail:
    	// message.setContent("<p>Welcome to JavaMail</p>", "text/html");
    	Transport transport = session.getTransport("smtp");
    	transport.connect("smtp.live.com", "support@studbox.ro", "Studbox9*");
    	transport.sendMessage(message, message.getAllRecipients());
    	transport.close();
    }

}
