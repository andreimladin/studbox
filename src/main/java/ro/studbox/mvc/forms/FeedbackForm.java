package ro.studbox.mvc.forms;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class FeedbackForm {
	
	@Email
    private String email;
	
	@Size(min=1, max = 250)
    private String subject;
	
	@Size(min=1, max = 250)
    private String text;
    
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getSubject() {
		return subject;
	}
	
	public void setSubject(String subject) {
		this.subject = subject;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}

}
