package ro.studbox.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.University;
import ro.studbox.service.UniversityService;

/**
 * @author andreim
 **/

@Controller
@RequestMapping("/")
public class UniversitiesController {
	
	@Autowired
	private UniversityService universityService;
	
	@RequestMapping(value="/", method = RequestMethod.GET)
	public ModelAndView showAll(){
 
		ModelAndView model = new ModelAndView();
		model.setViewName("/home");
		model.addObject("universityList", universityService.getAll());
		
		return model;
	}
	
	@RequestMapping(value="main/universities/{universityId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long universityId){
 
		// AIM - retrieve and increase the viewNo of university
		University university = universityService.getUniversity(universityId);
		universityService.increaseViewNo(universityId);
		
		ModelAndView model = new ModelAndView();		
		model.addObject("objectId", universityId);		
		model.addObject("university", university);
		model.addObject("comments", university.getComments());
		model.setViewName("/universities/home");
		
		return model;
	}
	
}


