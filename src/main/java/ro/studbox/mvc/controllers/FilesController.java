package ro.studbox.mvc.controllers;

import java.io.IOException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;

import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import ro.studbox.entities.File;
import ro.studbox.entities.User;
import ro.studbox.mvc.forms.UploadFileForm;
import ro.studbox.mvc.validators.UploadFileValidation;
import ro.studbox.service.FileService;
import ro.studbox.service.UserService;

import com.google.gson.Gson;

@Controller
@RequestMapping(value="/main/files")
public class FilesController {
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private Gson gson;
	
	@Autowired
	private UploadFileValidation uploadValidation;
	
	@Autowired
	private RestTemplate restTemplate;	
	
	@Autowired
    private MessageSource messageSource;
	
	private Logger logger = Logger.getLogger(FilesController.class);
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public @ResponseBody String upload(@Valid UploadFileForm uploadForm, BindingResult result){
		uploadValidation.validate(uploadForm, result);
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
	
		File file = null;
        boolean errorOccurred = false;
        
        // AIM - get the user from session
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        if(principal instanceof User) {
            if(result.hasErrors()) {
                errorOccurred = true;
            } else {
                long ownerId = ((User)principal).getUserId();
                try {
                    file = fileService.createFile(uploadForm.getFolderId(), uploadForm.getFileData().getOriginalFilename(), uploadForm.getFileData().getContentType(), uploadForm.getFileData().getSize(), ownerId, uploadForm.getFileData());
                    file.setOwner((User)principal);
                } catch(IllegalStateException e) {
                    errorOccurred = true;
                    result.rejectValue("fileData", "error.savingToDisk");
                    logger.error(e);
                } catch(IOException e) {
                    errorOccurred = true;
                    result.rejectValue("fileData", "error.savingToDisk");
                    logger.error(e);
                }
            	
            }
        } else {
            result.rejectValue("fileData", "error.authNeed");
        }
        
        if(!errorOccurred) {
            resultMap.put("status", "success");
//            file = HibernateProxyHelper.initializeAndUnproxy(file);
            resultMap.put("file", file);
        } else {
            resultMap.put("status", "error");
            resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
        }
		
		return gson.toJson(resultMap);
	}	
}
