package ro.studbox.mvc.controllers;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.MessageSource;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;

import ro.studbox.entities.File;
import ro.studbox.entities.User;
import ro.studbox.mvc.forms.UploadFileForm;
import ro.studbox.mvc.validators.UploadFileValidation;
import ro.studbox.service.FileService;

import com.google.gson.Gson;
import com.lowagie.text.BadElementException;
import com.lowagie.text.DocumentException;

@Controller
@RequestMapping(value="/main/files")
public class FilesController {
	
	@Autowired
	private FileService fileService;
	
	@Autowired
	private Gson gson;
	
	@Autowired
	private UploadFileValidation uploadValidation;
	
	@Autowired
	private RestTemplate restTemplate;	
	
	@Autowired
    private MessageSource messageSource;
	
	private static final List<String> UNSUPPORTED_FORMATS_BY_GOOGLE = Arrays.asList(new String[]{"image/jpeg","image/png","image/gif","image/bmp"});
	
	private Logger logger = Logger.getLogger(FilesController.class);
	
	@RequestMapping(value="/{fileId}/download/google", method = RequestMethod.GET)
	public void downloadGoogle(HttpServletResponse response,@PathVariable long fileId){
		doDownload(response, fileId, true);
	}
	
	@PreAuthorize("hasRole('CONTRIBUTOR')")
	@RequestMapping(value="/{fileId}/download", method = RequestMethod.GET)
	public void download(HttpServletResponse response,@PathVariable long fileId){
		doDownload(response, fileId, false);
	}
	
	@PreAuthorize("isAuthenticated()")
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public @ResponseBody String upload(@Valid UploadFileForm uploadForm, BindingResult result){
		uploadValidation.validate(uploadForm, result);
				
		Map<String, Object> resultMap = new HashMap<String, Object>();
	
		File file = null;
        boolean errorOccurred = false;
        
        // AIM - get the user from session
        Object principal = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
        
        if(principal instanceof User) {
            if(result.hasErrors()) {
                errorOccurred = true;
            } else {
                long ownerId = ((User)principal).getUserId();
                try {
                    file = fileService.createFile(uploadForm.getFolderId(), uploadForm.getFileData().getOriginalFilename(), uploadForm.getFileData().getContentType(), uploadForm.getFileData().getSize(), ownerId, uploadForm.getFileData());
                    file.setOwner((User)principal);
                } catch(IllegalStateException e) {
                    errorOccurred = true;
                    result.rejectValue("fileData", "error.savingToDisk");
                } catch(IOException e) {
                    errorOccurred = true;
                    result.rejectValue("fileData", "error.savingToDisk");
                }
            	
            }
        } else {
            result.rejectValue("fileData", "error.authNeed");
        }
        
        if(!errorOccurred) {
            resultMap.put("status", "success");
            resultMap.put("file", file);
        } else {
            resultMap.put("status", "error");
            resultMap.put("errorMessage", messageSource.getMessage(result.getFieldError().getCode(), null, Locale.ENGLISH));
        }
		
		return gson.toJson(resultMap);
	}
	
	@PreAuthorize("hasRole('CONSUMER')")
	@RequestMapping(value="/{fileId}/view")
	public ModelAndView view(@PathVariable long fileId){
		ModelAndView model = new ModelAndView();
		model.setViewName("/files/view");		
		
		File file = fileService.getFile(fileId);
		model.addObject("file", file);
		
		String content = "https://docs.google.com/viewer?url=http://www.studbox.ro/main/files/" + fileId + "/download/google?embedded%3Dtrue&embedded=true";
//		Document doc;
//		try {
//			doc = Jsoup.connect("https://docs.google.com/viewer?url=http://www.studbox.ro/main/files/" + fileId + "/download/google?embedded%3Dtrue&embedded=true").get();
//			Elements headScripts = doc.select(".head > script");
//			for (Element script : headScripts) {
//				content +=  " " + script.html();
//			}
////			Elements 
//			
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
		
		//
		model.addObject("content", content);
		//
		
		return model;
	}
	
	private void doDownload(HttpServletResponse response,@PathVariable long fileId, boolean isGoogle){
		File file = fileService.getFile(fileId);
		try {
			FileInputStream fis = null;
			if (isGoogle && UNSUPPORTED_FORMATS_BY_GOOGLE.contains(file.getContentType())){
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
}
