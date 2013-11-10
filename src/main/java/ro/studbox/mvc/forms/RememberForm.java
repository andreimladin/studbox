package ro.studbox.mvc.forms;

import org.hibernate.validator.constraints.Email;

public class RememberForm {
	
	@Email	
	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
}
