package ro.studbox.data.dao.impl;

import java.util.Date;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.UserDownloadsDao;
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

	
	

}
