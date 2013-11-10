package ro.studbox.mvc.forms;

import java.util.Calendar;
import java.util.Date;

import javax.validation.constraints.Size;

import org.hibernate.validator.constraints.Email;

public class RegistrationForm {
	
	@Size(min=4, max=20)
	private String username;
	
	@Size(min=6, max=10)
	private String password;
	
	@Size(min=6, max=10)
	private String confirmPassword;
	
	@Email
	@Size(min=6, max=50)
	private String email;

	@Size(min=1, max=25)
	private String firstName;
	
	@Size(min=1, max=25)
	private String lastName;
		
	private String sex = "M";
	
	private String bDay = "01";
	
	private String bMonth = "01";
	
	private String bYear = "2010";
	
	private Calendar calendar = Calendar.getInstance();
	
	private boolean useNotifications = true;
	
	private boolean agreedTerms;

	public String getUsername() {		
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getConfirmPassword() {
		return confirmPassword;
	}

	public void setConfirmPassword(String confirmPassword) {
		this.confirmPassword = confirmPassword;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getbDay() {
		return bDay;
	}

	public void setbDay(String bDay) {
		this.bDay = bDay;
		this.calendar.set(Calendar.DAY_OF_MONTH, Integer.parseInt(bDay));
	}

	public String getbMonth() {
		return bMonth;
	}

	public void setbMonth(String bMonth) {
		this.bMonth = bMonth;
		int month = Integer.parseInt(bMonth) - 1;
		this.calendar.set(Calendar.MONTH, month);
	}

	public String getbYear() {
		return bYear;
	}

	public void setbYear(String bYear) {
		this.bYear = bYear;
		this.calendar.set(Calendar.YEAR, Integer.parseInt(bYear));
	}

	public Date getBirthdate() {
		return this.calendar.getTime();
	}

	public boolean isUseNotifications() {
		return useNotifications;
	}

	public void setUseNotifications(boolean useNotifications) {
		this.useNotifications = useNotifications;
	}

	public boolean isAgreedTerms() {
		return agreedTerms;
	}

	public void setAgreedTerms(boolean agreedTerms) {
		this.agreedTerms = agreedTerms;
	}
	
	

}
