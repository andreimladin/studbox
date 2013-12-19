package ro.studbox.mvc.controllers;

import java.util.List;

//import org.springframework.batch.core.Job;
//import org.springframework.batch.core.JobParameters;
//import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.core.session.SessionRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping(value="/admin")
public class AdminController{
	
	@Autowired
	@Qualifier("sessionRegistry")
	private SessionRegistry sessionRegistry;	
	
//	@Autowired
//    private JobLauncher jobLauncher;

//    @Autowired
//    @Qualifier("resetUserDownloadsJob")
//    private Job resetDownloadsJob;
	
	@RequestMapping(value="/users/online", method = RequestMethod.GET)
	public ModelAndView showOnlineUsers() {
		ModelAndView model = new ModelAndView();
		List<Object> principalList = sessionRegistry.getAllPrincipals();
		model.addObject("principalList", principalList);
		model.setViewName("users/online");
		
		return model;
	}	
	 

//	@RequestMapping("/jobs/ResetDownloadsNo")
//	public void handle() throws Exception{
//		jobLauncher.run(resetDownloadsJob, new JobParameters());
//	}

}
