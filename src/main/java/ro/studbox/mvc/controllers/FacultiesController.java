package ro.studbox.mvc.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.Faculty;
import ro.studbox.service.FacultyService;

@Controller
@RequestMapping("/main/faculties")
public class FacultiesController {
	
	@Autowired
	private FacultyService facultyService;
	
	@RequestMapping(value="/{facultyId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long facultyId){
 
		// AIM - retrieve and increase the viewNo of faculty
		Faculty faculty = facultyService.getFaculty(facultyId);
		facultyService.increaseViewNo(facultyId);
		
		ModelAndView model = new ModelAndView();		
		model.addObject("objectId", facultyId);		
		model.addObject("faculty", faculty);
		model.addObject("comments", faculty.getComments());
		model.setViewName("/faculties/home");
		
		return model;
	}

}
