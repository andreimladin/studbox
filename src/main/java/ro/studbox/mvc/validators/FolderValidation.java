package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;

import ro.studbox.mvc.forms.FolderForm;
import ro.studbox.service.FolderService;

@Component
public class FolderValidation {
	 
	public static final String PARENT_FOLDER_DOESNT_EXIST = "NotExist.newFolderName.parentFolderId";
	public static final String FOLDER_EXISTS = "Exist.newFolderForm.name";
	
	@Autowired
	private FolderService folderService;

	public void validate(Object target, Errors errors) {
		FolderForm folderForm = (FolderForm)target;

		if(!errors.hasFieldErrors("parentFolderId")) {
			boolean existsParentFolder = folderService.existsFolder(folderForm.getParentFolderId());
	        
			if(!existsParentFolder) {
	        	errors.rejectValue("parentFolderId", "NotExist.newFolderName.parentFolderId");
	        	return;
	        }
		}
		
		if(!errors.hasFieldErrors("name")) {
			boolean existsFolder = folderService.existsFolder(folderForm.getParentFolderId(), folderForm.getName());
			if(existsFolder) {
				errors.rejectValue("name", "Exist.newFolderForm.name");
				return;
			}
		}
	}	   

}
