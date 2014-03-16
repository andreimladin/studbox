package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ro.studbox.mvc.forms.ProfileForm;
import ro.studbox.service.FacultyService;
import ro.studbox.service.ProfileService;

@Component
public class ProfileValidation {
		
	@Autowired
	private ProfileService profileService;
		
	@Autowired
	private FacultyService facultyService;
		
	public void validate(Object target, Errors errors) {
		ProfileForm profileForm = (ProfileForm)target;
		// Ensure the faculty exists
			if(!errors.hasFieldErrors("facultyId")){
				System.out.println("FacultyId : " +  profileForm.getFacultyId());
				boolean existsFaculty = facultyService.existsFaculty(profileForm.getFacultyId());
		        
				System.out.println("Exists faculty : " + existsFaculty);
				if(!existsFaculty) {
		        	errors.rejectValue("facultyId", "NotExists.newProfile.facultyId");	      
		        	return;
		        }
			}
			
			if(!errors.hasFieldErrors("name")) {
				System.out.println("Profile Name : " + profileForm.getName());
				boolean existsProfile = profileService.existsProfile(profileForm.getFacultyId(), profileForm.getName());
				System.out.println("Exists Profile : " + existsProfile);
				if(existsProfile) {
		        	errors.rejectValue("name", "Exists.newProfile.name");	        	
		        }
			}
		}

	}
