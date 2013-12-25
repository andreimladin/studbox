package ro.studbox.data.dao.bean;

public class ResetDownloadsBean {
	
	private boolean resetTodayNo;
	private boolean	resetThisWeekNo;
	private boolean resetThisMonthNo;
	private boolean resetThisYearNo;

	public boolean resetTodayNo() {
		return resetTodayNo;
	}

	public void setResetTodayNo(boolean resetTodayNo) {
		this.resetTodayNo = resetTodayNo;
	}

	public boolean resetThisWeekNo() {
		return resetThisWeekNo;
	}

	public void setResetThisWeekNo(boolean resetThisWeekNo) {
		this.resetThisWeekNo = resetThisWeekNo;
	}

	public boolean resetThisMonthNo() {
		return resetThisMonthNo;
	}

	public void setResetThisMonthNo(boolean resetThisMonthNo) {
		this.resetThisMonthNo = resetThisMonthNo;
	}

	public boolean resetThisYearNo() {
		return resetThisYearNo;
	}

	public void setResetThisYearNo(boolean resetThisYearNo) {
		this.resetThisYearNo = resetThisYearNo;
	}


}
