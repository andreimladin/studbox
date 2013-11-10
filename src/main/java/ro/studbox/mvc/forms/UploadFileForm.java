package ro.studbox.mvc.forms;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class UploadFileForm {

	@NotNull
	@Min(0)
	private long folderId;
	
	@NotNull
	private CommonsMultipartFile fileData;
	
	public long getFolderId() {
		return folderId;
	}

	public void setFolderId(long folderId) {
		this.folderId = folderId;
	}
		
	public CommonsMultipartFile getFileData() {
		return fileData;
	}
	
	public void setFileData(CommonsMultipartFile fileData) {
		this.fileData = fileData;
	}

}
