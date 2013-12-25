package ro.studbox.data.dao.impl;

import java.util.Date;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.UserDownloadsDao;
import ro.studbox.data.dao.bean.ResetDownloadsBean;
import ro.studbox.entities.UserDownloads;

@Repository
public class UserDownloadsDaoImpl extends GenericDaoImpl<Long, UserDownloads> implements
		UserDownloadsDao {

	public UserDownloadsDaoImpl() {
		super(UserDownloads.class);
	}

	@Override
	@Transactional
	public void incrementDownloadsNo(long userId) {
		Query incrQuery = sessionFactory
				.getCurrentSession()
				.createQuery(
						"Update UserDownloads Set TodayNo=TodayNo+1,"
												+ "ThisWeekNo=ThisWeekNo+1, "
												+ "ThisMonthNo=ThisMonthNo+1,"
												+ "ThisYearNo=ThisYearNo+1,"
												+ "TotalNo=TotalNo+1,"
												+ "LastDownloadDate=:lastDownloadDate where UserId=:userId");
		incrQuery.setParameter("userId", userId);
		incrQuery.setParameter("lastDownloadDate", new Date());
		incrQuery.executeUpdate();		
	}

	@Override
	@Transactional
	public void resetDownloads(ResetDownloadsBean bean) {
		StringBuilder sql = new StringBuilder("Update UserDownloads ");
		sql.append("Set ");
		
		boolean needsReset = false;
		
		if (bean.resetTodayNo()) {
			sql.append("TodayNo=0");
			needsReset = true;				
		}
		
		if (bean.resetThisWeekNo()) {
			sql.append((needsReset ? "," : "") + "ThisWeekNo=0");
			needsReset = true;
		}
		
		if (bean.resetThisMonthNo()) {
			sql.append((needsReset ? "," : "") + "ThisMonthNo=0");
			needsReset = true;
		}
		
		if (bean.resetThisYearNo()) {
			sql.append((needsReset ? "," : "") + "ThisYearNo=0");
			needsReset = true;
		}
		
		if (needsReset) {
			Query incrQuery = sessionFactory
					.getCurrentSession()
					.createQuery(sql.toString());
			incrQuery.executeUpdate();		
		}				
	}	
	

}
