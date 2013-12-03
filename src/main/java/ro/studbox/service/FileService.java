package ro.studbox.service;

import java.io.IOException;
import java.net.MalformedURLException;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import ro.studbox.entities.File;

import com.lowagie.text.BadElementException;
import com.lowagie.text.DocumentException;

public interface FileService {
	
	static final String ROOT_FILE_SYSTEM = "/root/studbox/files";
//	static final String ROOT_FILE_SYSTEM = "c:\\Users\\andrei\\studbox\\files";
	
	List<File> getFilesByFolderId(long folderId);
	
	boolean existsFile(long folderId, String name);
	
	File createFile(long folderId, String name, String contentType, long contentLength, long ownerId, MultipartFile multipartFile) throws IllegalStateException, IOException ;
	
	File getFile(long fileId);
	
	void deleteFile(long fileId);
	
	void convertImageToPdf(String imageFilePath, String pdfFilePath) throws BadElementException, MalformedURLException, IOException, DocumentException;

}
