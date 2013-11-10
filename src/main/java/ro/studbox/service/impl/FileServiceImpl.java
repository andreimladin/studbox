package ro.studbox.service.impl;

import java.io.FileOutputStream;
import java.io.IOException;
import java.net.MalformedURLException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import ro.studbox.data.dao.FileDao;
import ro.studbox.entities.File;
import ro.studbox.service.FileService;

import com.lowagie.text.Document;
import com.lowagie.text.DocumentException;
import com.lowagie.text.Image;
import com.lowagie.text.Rectangle;
import com.lowagie.text.pdf.PdfWriter;

@Service
public class FileServiceImpl implements FileService {	

	private Logger logger = Logger.getLogger(FileServiceImpl.class);
	
	@Autowired
	private FileDao fileDao;

	public List<File> getFilesByFolderId(long folderId) {		
		return fileDao.getAllByFolderId(folderId);
	}

	public boolean existsFile(long folderId, String name) {
		return fileDao.existsFile(folderId, name);
	}

	public File createFile(long folderId, String name, String contentType, long contentLength, long ownerId,
			MultipartFile multipartFile) throws IllegalStateException, IOException {
		// AIM - prepare destination path
		String folderPath = ROOT_FILE_SYSTEM + "/" + folderId;
		
		java.io.File folder = new java.io.File(folderPath);
		
		if (!folder.exists()) {
			folder.mkdir();
		}
		
		String filePath = folderPath + "/" + name;
		
		// AIM - copy to disk 
		java.io.File diskFile = new java.io.File(filePath);
		multipartFile.transferTo(diskFile);
		
		// AIM - creation date
		Date creationDate = new Date();
		
		// AIM - save the file in DB
		File newFile = new File(folderId, name, contentType, contentLength, ownerId, filePath, creationDate, creationDate);
		
		newFile = fileDao.create(newFile);
		
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
		String lastModifiedDateString = format.format(newFile.getLastModifiedDate());	

		newFile.setLastModifiedDateString(lastModifiedDateString);		
		
		return newFile;		
	}

	@Transactional
	public File getFile(long fileId) {
		fileDao.increaseViewNo(fileId);
		
		return fileDao.find(fileId);
	}

	public void deleteFile(long fileId) {
		fileDao.deleteByKey(fileId);
	}

	public void convertImageToPdf(String imageFilePath, String pdfFilePath) throws MalformedURLException, IOException, DocumentException {
		java.io.File pdfFile = new java.io.File(pdfFilePath);
		logger.debug("Image " + imageFilePath);
		logger.debug("File " + pdfFilePath + " exists : " + pdfFile.exists());
		if (!pdfFile.exists()) {
			Image image = Image.getInstance(imageFilePath);
			Rectangle pageSize = new Rectangle(image.getWidth() + 20, image.getHeight() + 20);		
			Document pdfDocument = new Document();
			FileOutputStream fos = new FileOutputStream(pdfFilePath);
			PdfWriter.getInstance(pdfDocument, fos);
			pdfDocument.setPageSize(pageSize);
			pdfDocument.setMargins(10, 10, 10, 10);
			pdfDocument.open();
			pdfDocument.add(image);
			pdfDocument.close();	
		}		
	}

	

}
