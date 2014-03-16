package ro.studbox.mvc.controllers;

import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import ro.studbox.entities.Course;
import ro.studbox.entities.Profile;
import ro.studbox.entities.User;
import ro.studbox.service.ProfileService;
import ro.studbox.service.FileService;
import ro.studbox.service.UserService;
import ro.studbox.mvc.forms.CourseForm;
import ro.studbox.mvc.validators.ProfileValidation;
import ro.studbox.mvc.forms.ProfileForm;

@Controller
@RequestMapping("/main/profiles")
public class ProfilesController {
	
	private Logger logger = Logger.getLogger(FilesController.class);
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private MessageSource messageSource;
	
	@Autowired
	private ProfileValidation validation;
	
	@Autowired
	private Gson gson;	
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
	public @ResponseBody String addAction(@Valid ProfileForm profileForm, BindingResult result) {
		boolean errorOccurred = false;
		Profile profile = null;
		
		 // AIM - Check the user on the session
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if (principal instanceof User){
        	validation.validate(profileForm, result);
			
        	if(result.hasErrors()) {
                errorOccurred = true;
            } else {
            	profile = profileService.createProfile(profileForm.getFacultyId(),
						profileForm.getName(), profileForm.getShortName(), profileForm.getSection(),
						profileForm.getType(),((User) principal).getUserId());
            }
        } else {
        	errorOccurred = true;
        	result.rejectValue("facultyId", "error.authNeed");
        }
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if(!errorOccurred) {
            resultMap.put("status", "success");
            resultMap.put("profile", profile);
        } else {
            resultMap.put("status", "error");
            resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
        }
        return gson.toJson(resultMap);
	}

	@RequestMapping(value="/{objectId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long objectId){
		Profile profile = profileService.getProfile(objectId);
		profileService.increaseViewNo(objectId);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/profiles/home");
		model.addObject("objectId", objectId);
		model.addObject("profile", profile);
		model.addObject("comments", profile.getComments());
		
		return model;
	}
	

}
