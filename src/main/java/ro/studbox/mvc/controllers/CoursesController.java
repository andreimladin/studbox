package ro.studbox.mvc.controllers;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.Arrays;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.Course;
import ro.studbox.entities.File;
import ro.studbox.entities.Folder;
import ro.studbox.entities.User;
import ro.studbox.entities.UserLimit;
import ro.studbox.service.CourseService;
import ro.studbox.service.FileService;
import ro.studbox.service.FolderService;
import ro.studbox.service.UserService;

import com.lowagie.text.BadElementException;
import com.lowagie.text.DocumentException;

@Controller
@RequestMapping("/main/courses")
public class CoursesController {
	
	private static final List<String> IMAGES_CONTENT_TYPES = Arrays.asList(new String[]{"image/jpeg","image/png","image/gif","image/bmp"});
	private static final List<String> TEXT_PLAIN_CONTENT_TYPES = Arrays.asList(new String[]{"application/octet-stream"});
	private static final List<String> UNSUPPORTED_CONTENT_TYPES = Arrays.asList(new String[]{"application/zip","application/x-gzip","application/x-gtar","multipart/x-gzip","multipart/x-zip","application/x-rar-compressed"});
	private static final String URL_GOOGLE_DOCS_VIEWER = "https://docs.google.com/viewer?url=";
	
	private Logger logger = Logger.getLogger(FilesController.class);
	
	@Autowired
	private CourseService courseService;
	
	@Autowired
	private FolderService folderService;
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private UserService userService;
	
	@Autowired
    private MessageSource messageSource;
	
	@RequestMapping(value="/{courseId}/home", method = RequestMethod.GET)
	public ModelAndView showHome(@PathVariable long courseId){
 
		ModelAndView model = new ModelAndView();
		model.setViewName("/folders/home");		
				
		Course course = courseService.getCourse(courseId);
		Folder folder = course.getDefaultFolder();
		List<String> existingFolderNames = folderService.getDistinctNames();
		
		model.addObject("objectId", folder.getObjectId());
		model.addObject("course", course);
		model.addObject("folder", folder);
		model.addObject("comments", folder.getComments());
		model.addObject("existingFolderNames", existingFolderNames);
			
		return model;
	}
	
	@RequestMapping(value="/{courseId}/folders/{folderId}/home", method = RequestMethod.GET)
	public ModelAndView showCourseFolder(@PathVariable long courseId, @PathVariable long folderId){
		ModelAndView model = new ModelAndView();
		model.setViewName("/folders/home");		
				
		Folder folder = folderService.getFolder(folderId);
		Course course = courseService.getCourse(courseId);		
		List<String> existingFolderNames = folderService.getDistinctNames();
		
		model.addObject("objectId", folder.getObjectId());
		model.addObject("course", course);
		model.addObject("folder", folder);
		model.addObject("comments", folder.getComments());		
		model.addObject("existingFolderNames", existingFolderNames);
		
		return model;
	}	
	
	@RequestMapping(value="/{courseId}/folders/{folderId}/files/{fileId}/download/google", method = RequestMethod.GET)
	public void downloadGoogle(HttpServletResponse response, @PathVariable long courseId, @PathVariable long folderId, @PathVariable long fileId){
		logger.debug(".downloadGoogle CourseId[" + courseId + "] FolderId[" + folderId + "] FileId[" + fileId + "]");
		doDownload(response, fileId, true);
	}
	
	@PreAuthorize("hasRole('CONTRIBUTOR')")
	@RequestMapping(value="/{fileId}/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response,@PathVariable long fileId){
		doDownload(response, fileId, false);
	}
	
	@PreAuthorize("hasRole('CONSUMER')")
	@RequestMapping(value="/{courseId}/folders/{folderId}/files/{fileId}/view")
	public ModelAndView view(HttpServletResponse response, @PathVariable long courseId, @PathVariable long folderId, @PathVariable long fileId){
		logger.debug(".view CourseId[" + courseId + "] FolderId[" + folderId + "] FileId[" + fileId + "]");
		ModelAndView model = new ModelAndView();
		model.setViewName("/files/view");
		
		Course course = courseService.getCourse(courseId);
		Folder folder = folderService.getFolder(folderId);
		File file = fileService.getFile(fileId);
		
		model.addObject("course", course);
		model.addObject("folder", folder);
		
		logger.debug(".view CourseObj[" + course + "] FolderObj[" + folder + "] FileObj[" + file + "]");
			
        // AIM - Check the user on the session
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        if(principal instanceof User) {   
        	User userLogged = (User) principal;	

        	UserLimit exceededLimit = userService.exceededLimit(userLogged.getUserId());
        	if (exceededLimit != null) {
        		model.addObject("file", file);
        		model.addObject("errorMessage", messageSource.getMessage("User.exceededDownloadLimit." + exceededLimit.getLimitName(), new String[]{exceededLimit.getLimitValue()}, Locale.ENGLISH));
        	} else {	
	        	// AIM - increment downloads number
        		userService.incrementDownloadsNo(userLogged.getUserId());
	
	        	if (UNSUPPORTED_CONTENT_TYPES.contains(file.getContentType()) || (file.getName().indexOf(".zip") == file.getName().length()-4) 
						|| (file.getName().indexOf(".rar") == file.getName().length()-4)) {
					doDownload(response, fileId, false);
					
					return null;
				} else {				
					model.addObject("file", file);
					String studboxDocUrl = "http://www.studbox.ro/main/courses/" + courseId + "/folders/" + folderId + "/files/" + fileId + "/download/google";
					
					String content = URL_GOOGLE_DOCS_VIEWER + URLEncoder.encode(studboxDocUrl) + "&embedded=true";  
//					String content = "https://docs.google.com/viewer?url=http://www.studbox.ro/main/courses/" + courseId + "/folders/" + folderId + "/files/" + fileId + "/download/google?embedded%3Dtrue&embedded=true";
					model.addObject("content", content);
				}
        	}
		} else {			
			model.addObject("file", file);
	       	model.addObject("errorMessage", messageSource.getMessage("error.authNeed", null, Locale.ENGLISH));
		}
		
        return model;
	}
	
	private void doDownload(HttpServletResponse response,@PathVariable long fileId, boolean isGoogle){
		File file = fileService.getFile(fileId);
		try {
			FileInputStream fis = null;
			if (isGoogle && TEXT_PLAIN_CONTENT_TYPES.contains(file.getContentType())) {
				fis = new FileInputStream(file.getPath());
				response.setContentType("text/plain");
				response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
				response.setContentLength((int) file.getContentLength());
			} else if (isGoogle && IMAGES_CONTENT_TYPES.contains(file.getContentType())){
				String pdfFilePath = file.getPath().substring(0, file.getPath().lastIndexOf(".")) + ".pdf";
				fileService.convertImageToPdf(file.getPath(), pdfFilePath);
				String pdfFileName = file.getName().substring(0, file.getName().lastIndexOf(".")) + ".pdf";
				logger.debug("File " + file.getPath() + "converted : " + pdfFilePath + " with name : " + pdfFileName);
				
				fis = new FileInputStream(pdfFilePath);			
				response.setContentType("application/pdf");
				response.setHeader("Content-Disposition", "attachment; filename=" + pdfFileName);
				response.setContentLength((int) new java.io.File(pdfFilePath).length());
			} else {
				fis = new FileInputStream(file.getPath());
				response.setContentType(file.getContentType());
				response.setHeader("Content-Disposition", "attachment; filename=" + file.getName());
				response.setContentLength((int) file.getContentLength());
			}
			FileCopyUtils.copy(fis, response.getOutputStream());
		} catch (FileNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (BadElementException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
	public static void main(String[] args){
		String studboxDocUrl = "http://www.studbox.ro/main/courses/321321/folders/312321/files/21312/download/google";
		
		String content = URL_GOOGLE_DOCS_VIEWER + URLEncoder.encode(studboxDocUrl) + "&embedded=true";
		System.out.println(content);

	}
	
}
