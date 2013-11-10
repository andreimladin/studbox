package ro.studbox.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.FolderDao;
import ro.studbox.entities.Folder;
import ro.studbox.service.FolderService;

@Service
public class FolderServiceImpl implements FolderService {
	
	@Autowired
	private FolderDao folderDao;
	
    public boolean existsFolder(long folderId) {
        return folderDao.existsFolder(folderId);
    }

    public boolean existsFolder(long parentFolderId, String folderName) {
        return folderDao.existsFolder(parentFolderId, folderName);
    }
    
    public List<String> getDistinctNames() {
        return folderDao.getDistinctFolderNames();
    }
		
	@Transactional	
	public Folder getFolder(long folderId) {
		folderDao.increaseViewNo(folderId);
		return folderDao.find(folderId);
	}

	public Folder createFolder(long parentFolderId, String name, long ownerId,
			boolean isCourse) {
		Date creationDate = new Date();
		
        Folder newFolder = new Folder(parentFolderId, name, ownerId, creationDate, creationDate, isCourse);
        
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
        String lastModifiedDateString = format.format(newFolder.getLastModifiedDate());
        newFolder.setLastModifiedDateString(lastModifiedDateString);
        
        return folderDao.create(newFolder);
	}

	public void deleteFolder(long folderId) {
		folderDao.deleteByKey(folderId);		
	}	
	
}
