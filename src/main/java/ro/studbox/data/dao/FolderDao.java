package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.Folder;

public interface FolderDao extends GenericDao<Long, Folder> {
	
    boolean existsFolder(long folderId);

    boolean existsFolder(long parentFolderId, String folderName);
	
	List<Folder> getAllByFolderId(long folderId);

	void increaseViewNo(long folderId);
	
    List<String> getDistinctFolderNames();
}
