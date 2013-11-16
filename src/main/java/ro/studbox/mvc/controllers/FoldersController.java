package ro.studbox.mvc.controllers;

import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

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

import ro.studbox.entities.Course;
import ro.studbox.entities.Folder;
import ro.studbox.entities.User;
import ro.studbox.mvc.forms.FolderForm;
import ro.studbox.mvc.validators.FolderValidation;
import ro.studbox.service.CourseService;
import ro.studbox.service.FolderService;

import com.google.gson.Gson;

@Controller
@RequestMapping("/main/folders")
public class FoldersController {
	
	@Autowired
	private FolderService folderService;
	
	@Autowired
	private CourseService courseService;

	@Autowired
    private FolderValidation folderValidation;
	
	@Autowired
    private MessageSource messageSource;
	
	@Autowired
    private Gson gson;
	
	@RequestMapping(value="/{folderId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long folderId){
 
		ModelAndView model = new ModelAndView();
		model.setViewName("/folders/home");		
				
		Folder folder = folderService.getFolder(folderId);
		Course course = null;
		
		if (folder.isCourse()){
			course = courseService.getCourseByFolderId(folderId);					
		} else {
			course = courseService.getCourseByFolderId(folder.getParentFolder().getObjectId());
		}
		
		model.addObject("course", course);
		
		List<String> existingFolderNames = folderService.getDistinctNames();
		
		model.addObject("objectId", folder.getObjectId());		
		model.addObject("folder", folder);
		model.addObject("comments", folder.getComments());		
		model.addObject("existingFolderNames", existingFolderNames);		
		
		return model;
	}
	
	@RequestMapping(value="/add", method = RequestMethod.POST)
    public @ResponseBody String addFolder(@Valid FolderForm folderForm, BindingResult result) {        
        boolean errorOccurred = false;
        Folder folder = null;

        // AIM - Check the user on the session
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof User) {
            folderValidation.validate(folderForm, result);
            if(result.hasErrors()) {
                errorOccurred = true;
            } else {
                folder = folderService.createFolder(folderForm.getParentFolderId(), folderForm.getName(), ((User)principal).getUserId(), false);
                folder.setOwner((User)principal);
            }
        } else {
            errorOccurred = true;
            result.rejectValue("parentFolderId", "error.authNeed");
        }
        
        Map<String, Object> resultMap = new HashMap<String, Object>();
        if(!errorOccurred) {
            resultMap.put("status", "success");
            resultMap.put("folder", folder);
        } else {
            resultMap.put("status", "error");
            resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
        }
        
        return gson.toJson(resultMap);
    }


}
