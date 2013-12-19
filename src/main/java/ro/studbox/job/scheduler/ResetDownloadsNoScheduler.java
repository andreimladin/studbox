package ro.studbox.job.scheduler;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.batch.core.Job;
import org.springframework.batch.core.JobExecution;
import org.springframework.batch.core.JobParameter;
import org.springframework.batch.core.JobParameters;
import org.springframework.batch.core.launch.JobLauncher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;

import ro.studbox.service.EmailService;

@Component
public class ResetDownloadsNoScheduler {

	@Autowired
	private JobLauncher jobLauncher;

	@Autowired
	@Qualifier("resetDownloadsNoJob")
	private Job job;
	
	@Autowired
	@Qualifier("TextPlainEmailService")
	private EmailService emailService;	

	public void run() {	
		// AIM - prepare params for the job
		
		Map<String, JobParameter> mapParams  = new HashMap<String, JobParameter>();
		Date startDate = new Date();
		mapParams.put("startDate", new JobParameter(startDate));			
		JobParameters jobParams = new JobParameters(mapParams);		
			
		try {
			JobExecution jobExecution = jobLauncher.run(job, jobParams);
			List<Throwable> exceptions = jobExecution.getAllFailureExceptions();
			emailService.sendEmailJobReport(job.getName(), jobExecution.getExitStatus().getExitCode(), exceptions.size() != 0 ? exceptions.get(0).getMessage() : null, jobExecution.getStartTime(), jobExecution.getEndTime());
		} catch (Exception e) {
			emailService.sendEmailJobReport(job.getName(), "FAILED", e.getMessage(), startDate, new Date());		
		}
	}

}
