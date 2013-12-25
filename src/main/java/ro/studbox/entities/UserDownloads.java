package ro.studbox.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;
import org.hibernate.annotations.Parameter;

@SuppressWarnings("serial")
@Entity
@Table(name="UserDownloads")
public class UserDownloads implements Serializable {

	@GenericGenerator(name = "generator", strategy = "foreign", 
			parameters = @Parameter(name = "property", value = "user"))
	@Id
	@GeneratedValue(generator="generator")
	@Column(name="UserId", unique=true, nullable=false)
	private long userId;
	
	@OneToOne(fetch = FetchType.LAZY)
	@PrimaryKeyJoinColumn
	private User user;
	
	@Column(name="TodayNo")
	private long todayNo;
	
	@Column(name="ThisWeekNo")
	private long thisWeekNo;
	
	@Column(name="ThisMonthNo")
	private long thisMonthNo;
	
	@Column(name="ThisYearNo")
	private long thisYearNo;
		
	@Column(name="TotalNo")
	private long totalNo;
	
	@Column(name="LastDownloadDate")
	private Date lastDownloadDate;

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public long getTodayNo() {
		return todayNo;
	}

	public void setTodayNo(long todayNo) {
		this.todayNo = todayNo;
	}

	public long getThisWeekNo() {
		return thisWeekNo;
	}

	public void setThisWeekNo(long thisWeekNo) {
		this.thisWeekNo = thisWeekNo;
	}

	public long getThisMonthNo() {
		return thisMonthNo;
	}

	public void setThisMonthNo(long thisMonthNo) {
		this.thisMonthNo = thisMonthNo;
	}
	
	public long getThisYearNo() {
		return thisYearNo;
	}

	public void setThisYearNo(long thisYearNo) {
		this.thisYearNo = thisYearNo;
	}

	public long getTotalNo() {
		return totalNo;
	}

	public void setTotalNo(long totalNo) {
		this.totalNo = totalNo;
	}

	public Date getLastDownloadDate() {
		return lastDownloadDate;
	}

	public void setLastDownloadDate(Date lastDownloadDate) {
		this.lastDownloadDate = lastDownloadDate;
	}	
}
