package ro.studbox.mvc.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.Course;
import ro.studbox.entities.Folder;
import ro.studbox.service.CourseService;
import ro.studbox.service.FolderService;

@Controller
@RequestMapping("/main/courses")
public class CoursesController {
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private FolderService folderService;
	
	@RequestMapping(value="/{courseId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long courseId){
 
		ModelAndView model = new ModelAndView();
		model.setViewName("/folders/home");		
				
		Course course = courseService.getCourse(courseId);
		Folder folder = course.getDefaultFolder();
		List<String> existingFolderNames = folderService.getDistinctNames();
		
		model.addObject("objectId", folder.getObjectId());
		model.addObject("course", course);
		model.addObject("folder", folder);
		model.addObject("comments", folder.getComments());
		model.addObject("existingFolderNames", existingFolderNames);
			
		return model;
	}	

}
