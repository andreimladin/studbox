package ro.studbox.mvc.controllers;

import java.util.Map;
import java.util.TreeMap;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.mvc.forms.RegistrationForm;
import ro.studbox.mvc.forms.RememberForm;
import ro.studbox.mvc.validators.RegistrationValidation;
import ro.studbox.mvc.validators.RememberValidation;
import ro.studbox.service.UserService;

@Controller
@RequestMapping("/auth")
public class UsersController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private RegistrationValidation regValidation;
	
	@Autowired
	private RememberValidation rememberValidation;
						   
	@RequestMapping(value="/accountConfirmation", method = RequestMethod.GET)
	public String confirm(@RequestParam(required=true, value="confirmationKey") String confirmationKey){
		userService.confirmAccount(confirmationKey);
		
		return "users/accountConfirmed";
	}	

	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/login", method = RequestMethod.GET)
	public String displayLoginForm() {	
 		return "users/login";
 	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/loginFailed", method = RequestMethod.GET)
	public String loginFailed(ModelMap model) {
 		model.addAttribute("error", "true");
 		
		return "users/login";
	}

	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/registration", method = RequestMethod.GET)
	public ModelAndView showRegistration() {
		ModelAndView model = new ModelAndView();
		model.addObject("registrationForm", new RegistrationForm());
		model.setViewName("users/register");		
		 
		return model;
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/register", method = RequestMethod.POST)
	public String register(@Valid RegistrationForm regForm, BindingResult result){
		regValidation.validate(regForm, result);
		
		if (result.hasErrors()) {
			return "users/register";
		} else { 
			userService.createUser(regForm.getUsername(), regForm.getPassword(), regForm.getFirstName(), 
					regForm.getLastName(), regForm.getEmail(), regForm.getSex(), regForm.getLocation(), regForm.getBirthdate(), regForm.isUseNotifications());
			
			return "users/registered";
		}
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/remember/{what}", method = RequestMethod.GET)
	public ModelAndView showRemember(@PathVariable String what) {
		ModelAndView model = new ModelAndView();
		model.addObject("rememberForm", new RememberForm());
		model.addObject("what", what);
		model.setViewName("users/remember");
		
		return model;
	}
	
	@PreAuthorize("isAnonymous()")
	@RequestMapping(value="/processRemember/{what}", method = RequestMethod.POST)
	public ModelAndView doRemember(@PathVariable String what, @Valid RememberForm rememberForm, BindingResult result) {		
		
		rememberValidation.validate(rememberForm, result);
		
		ModelAndView model = new ModelAndView();
		model.addObject("what", what);
				
		if (result.hasErrors()) {
			model.setViewName("users/remember");			
		} else {
			if ("username".equals(what)) {
				userService.rememberUsername(rememberForm.getEmail());
			} else if ("password".equals(what)) {
				userService.resetPassword(rememberForm.getEmail());
			}
			
			model.setViewName("users/remembered");
		}
		
		return model;
	}

	
	@ModelAttribute("bDays")
	public Map<String, String> populateBirthdateDays() {
 		Map<String, String> daysMap = new TreeMap<String, String>();
		
		for (int i = 1; i<= 31; i++){
			String day = i < 10 ? "0" + i : String.valueOf(i);
			daysMap.put(day, day);	
		}
			
		return daysMap;
	}
	
	@ModelAttribute("bMonths")
	public Map<String, String> populateBirthdateMonths() {
		Map<String, String> monthsMap = new TreeMap<String, String>();			
		
		for (int i = 1; i<= 12; i++){
			String month = i< 10 ? "0" + i : String.valueOf(i);
			monthsMap.put(month, month);
		}	
		
		return monthsMap;
	}
	
	@ModelAttribute("bYears")
	public Map<String, String> populateBirthdateYears() {
		Map<String, String> yearsMap = new TreeMap<String, String>();
				
		for (int i = 2010; i>= 1960; i--){
			String year = String.valueOf(i);
			yearsMap.put(year, year);
		}
 
		return yearsMap;
	}

}
