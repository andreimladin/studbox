package ro.studbox.mvc.validators;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.web.multipart.MultipartFile;

import ro.studbox.mvc.forms.UploadFileForm;
import ro.studbox.service.FileService;

@Component
public class UploadFileValidation {

	@Autowired
	private FileService fileService;
	
	public final static String FILE_EXISTS = "Exist.uploadForm.fileData";
	public final static String FILE_REQUIRED = "Required.uploadForm.fileData";
	
	public void validate(Object target, Errors errors){
		UploadFileForm uploadForm = (UploadFileForm) target;
	
		long folderId = 0;
		
		if (!errors.hasFieldErrors("folderId")) {
			folderId = uploadForm.getFolderId();
		}
		
		if (!errors.hasFieldErrors("fileData")) {
			String name = uploadForm.getFileData().getOriginalFilename();
			boolean existsFile = fileService.existsFile(folderId, name);
			
			if (existsFile) {
				errors.rejectValue("fileData", FILE_EXISTS);
				return;
			}
			
			MultipartFile file = uploadForm.getFileData();
			
			if(file.getSize()==0){
				errors.rejectValue("fileData", FILE_REQUIRED);
			}
		}
	}
	
}
