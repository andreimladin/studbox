package ro.studbox.entities;

import java.io.Serializable;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="AccountConfirmation")
public class AccountConfirmation implements Serializable {
	
	public static final int STATUS_UNCONFIRMED = 0;
	public static final int STATUS_CONFIRMED =  1;
	

	@Id
	@Column(name="UserId", unique=true, nullable = false)
	private long userId;
	
	@Column(name="Status", nullable = false)
	private int status;
	
	@Column(name="Timestamp", nullable = false)
	private Date timestamp;
	
	@Column(name="ConfirmationKey", unique = true, nullable = false)
	private String confirmationKey;	
	
	public AccountConfirmation() {		
	}

	public AccountConfirmation(long userId, int status, Date timestamp,
			String confirmationKey) {
		this.userId = userId;
		this.status = status;
		this.timestamp = timestamp;
		this.confirmationKey = confirmationKey;
	}

	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Date getTimestamp() {
		return timestamp;
	}

	public void setTimestamp(Date timestamp) {
		this.timestamp = timestamp;
	}

	public String getKey() {
		return confirmationKey;
	}

	public void setKey(String key) {
		this.confirmationKey = key;
	}
		
}
