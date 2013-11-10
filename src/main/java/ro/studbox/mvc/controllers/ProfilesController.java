package ro.studbox.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.Profile;
import ro.studbox.service.ProfileService;

@Controller
@RequestMapping("/main/profiles")
public class ProfilesController {
	
	@Autowired
	private ProfileService profileService;
	
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
