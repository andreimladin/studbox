package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ro.studbox.entities.User;
import ro.studbox.mvc.forms.RememberForm;
import ro.studbox.service.UserService;

@Component
public class RememberValidation {
	
	@Autowired
	private UserService userService;
	
	public final static String DOESNT_EXIST_EMAIL = "NotExist.rememberForm.email";
	
	public void validate(Object target, Errors errors){
		RememberForm remForm = (RememberForm) target;
	
		String email =  remForm.getEmail();
		
		User user = userService.getUserByEmail(email);
		
		if (user == null) {
			errors.rejectValue("email", DOESNT_EXIST_EMAIL);
		}
	}

}
