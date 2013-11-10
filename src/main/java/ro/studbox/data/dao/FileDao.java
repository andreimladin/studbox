package ro.studbox.data.dao;

import java.util.List;

import ro.studbox.entities.File;

public interface FileDao extends GenericDao<Long, File> {
	
	List<File> getAllByFolderId(long folderId);
	
	public boolean existsFile(long folderId, String name);
	
	void increaseViewNo(long fileId);

}
