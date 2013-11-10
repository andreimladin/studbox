package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ro.studbox.entities.User;
import ro.studbox.mvc.forms.RegistrationForm;
import ro.studbox.service.UserService;

@Component
public class RegistrationValidation {
	
	@Autowired
	private UserService userService;
	
	public final static String AGREED_TERMS = "Checked.registrationForm.agreeTerms";	
	public final static String EXISTS_USERNAME = "Exists.registrationForm.username";
	public final static String EXISTS_EMAIL = "Exists.registrationForm.email";
	public final static String MATCHING_PASSWORD = "Matching.registrationForm.password";
	
	public void validate(Object target, Errors errors){
		RegistrationForm regForm = (RegistrationForm) target;
		
		if (!regForm.isAgreedTerms()){
			errors.rejectValue("agreedTerms", AGREED_TERMS);
			return;
		}
			
		if (!errors.hasFieldErrors("username")){
			String username = regForm.getUsername();
			User user = userService.getUserByUsername(username);		
			if (user != null) {			
				errors.rejectValue("username", EXISTS_USERNAME);
			}
		}
		
		if (!errors.hasFieldErrors("email")){
			String email = regForm.getEmail();
			User user = userService.getUserByEmail(email);			
			if (user != null) {			
				errors.rejectValue("email", EXISTS_EMAIL);
			}
		}
	
		if (!errors.hasFieldErrors("confirmPassword")){
			String password =  regForm.getPassword();
			String confirmPassword = regForm.getConfirmPassword();			
			if (!password.equals(confirmPassword)) {
				errors.rejectValue("confirmPassword", MATCHING_PASSWORD);
			}
		}
				
	}

}
