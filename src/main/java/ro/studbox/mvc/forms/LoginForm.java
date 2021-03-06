package ro.studbox.mvc.forms;

import org.hibernate.validator.constraints.NotEmpty;

public class LoginForm {

	@NotEmpty
	private String j_username;
	
	@NotEmpty
	private String j_password;

	public String getJ_username() {
		return j_username;
	}

	public void setJ_username(String j_username) {
		this.j_username = j_username;
	}

	public String getJ_password() {
		return j_password;
	}

	public void setJ_password(String j_password) {
		this.j_password = j_password;
	}
	
}
