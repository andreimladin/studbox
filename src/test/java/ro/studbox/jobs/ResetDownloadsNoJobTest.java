package ro.studbox.jobs;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class ResetDownloadsNoJobTest {
	
	public static void main(String[] args) {
		String[] springConfig  = {	
				"studbox-data.xml", 
				"studbox-services.xml",
				"studbox-jobs.xml"
		};
	 
		ApplicationContext context = 
			new ClassPathXmlApplicationContext(springConfig);
		

		
	 
//		ResetDownloadsNoScheduler jobScheduler = (ResetDownloadsNoScheduler) context.getBean("runScheduler");
//		Job job = (Job) context.getBean("resetUserDownloadsJob");
//		
//		// AIM - prepare params for the job
//		Map<String, JobParameter> mapParams = new HashMap<String, JobParameter>();
//		mapParams.put("startDate", new JobParameter(new Date()));
//		JobParameters jobParams = new JobParameters(mapParams);
//		jobScheduler.run();
//		try {
	 
//			JobExecution execution = jobLauncher.run(job, jobParams);
//			System.out.println("Exit Status : " + execution.getStatus());
	 
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
	 
		System.out.println("Done");
	}

}
