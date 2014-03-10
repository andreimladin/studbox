package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ro.studbox.mvc.forms.CourseForm;
import ro.studbox.service.CourseService;
import ro.studbox.service.ProfileService;

@Component
public class CourseValidation {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private ProfileService profileService;
	
	public void validate(Object target, Errors errors) {
		CourseForm courseForm = (CourseForm)target;

		// Ensure the profile exists
		if(!errors.hasFieldErrors("profileId")){
			System.out.println("ProfileId : " +  courseForm.getProfileId());
			boolean existsProfile = profileService.existsProfile(courseForm.getProfileId());
	        
			System.out.println("Exists profile : " + existsProfile);
			if(!existsProfile) {
	        	errors.rejectValue("profileId", "NotExists.newCourse.profileId");	      
	        	return;
	        }
		}
		
		if(!errors.hasFieldErrors("name")) {
			System.out.println("Course Name : " + courseForm.getName());
			boolean existsCourse = courseService.existsCourse(courseForm.getProfileId(), courseForm.getName());
			System.out.println("Exists Course : " + existsCourse);
			if(existsCourse) {
	        	errors.rejectValue("name", "Exists.newCourse.name");	        	
	        }
		}
	}

}
