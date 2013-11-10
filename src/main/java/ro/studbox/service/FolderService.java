package ro.studbox.service;

import java.util.List;

import ro.studbox.entities.Folder;

public interface FolderService {
	
	boolean existsFolder(long folderId);

	boolean existsFolder(long parentFolderId, String folderName);
	
	List<String> getDistinctNames();
	
	Folder getFolder(long folderId);

	Folder createFolder(long parentFolderId, String name, long ownerId, boolean isCourse);
	
	void deleteFolder(long folderId);
	
}
