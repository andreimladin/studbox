package ro.studbox.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.Faculty;
import ro.studbox.service.FacultyService;

/**
 * @author andreim
 **/
@Controller
@RequestMapping("/main/faculties")
public class FacultiesController {
	
	@Autowired
	private FacultyService facultyService;
	
	@RequestMapping(value="/{objectId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long objectId){
 
		Faculty faculty = facultyService.getFaculty(objectId);
		
		ModelAndView model = new ModelAndView();
		model.setViewName("/faculties/home");		
		model.addObject("objectId", objectId);
		model.addObject("faculty", faculty);		
		model.addObject("comments", faculty.getComments());
		
		return model;
	}	
}


