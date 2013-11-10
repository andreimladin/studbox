package ro.studbox.mvc.forms;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

public class FolderForm {
	
	@Min(value=1)
    private long parentFolderId;
	
	@Size(min=1, max=255)
    private String name;

	public long getParentFolderId() {
		return parentFolderId;
	}

	public void setParentFolderId(long parentFolderId) {
		this.parentFolderId = parentFolderId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	

}
