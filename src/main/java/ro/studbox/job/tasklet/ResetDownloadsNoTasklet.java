package ro.studbox.job.tasklet;

import org.joda.time.DateTime;
import org.joda.time.DateTimeConstants;
import org.joda.time.DateTimeZone;
import org.springframework.batch.core.StepContribution;
import org.springframework.batch.core.scope.context.ChunkContext;
import org.springframework.batch.core.step.tasklet.Tasklet;
import org.springframework.batch.repeat.RepeatStatus;
import org.springframework.beans.factory.annotation.Autowired;

import ro.studbox.data.dao.UserDownloadsDao;
import ro.studbox.data.dao.bean.ResetDownloadsBean;

public class ResetDownloadsNoTasklet implements Tasklet {
		
	@Autowired
	private DateTimeZone dtZone;
	
	@Autowired
	private UserDownloadsDao userDownloadsDao;

	@Override
	public RepeatStatus execute(StepContribution contribution,
			ChunkContext chunkContext) throws Exception {
		DateTime dt = DateTime.now(dtZone);
		
		int hourOfDay = dt.getHourOfDay();
		int dayOfWeek = dt.getDayOfWeek();
		int dayOfMonth = dt.getDayOfMonth();
		int dayOfYear = dt.getDayOfYear();
		
		ResetDownloadsBean bean =  new ResetDownloadsBean();
		
		bean.setResetTodayNo(hourOfDay == 0);
		bean.setResetThisWeekNo(dayOfWeek == DateTimeConstants.MONDAY);
		bean.setResetThisMonthNo(dayOfMonth == 1);
		bean.setResetThisYearNo(dayOfYear == 1);	
		
		userDownloadsDao.resetDownloads(bean);
		
		return RepeatStatus.FINISHED;
	}

}
