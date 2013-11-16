package ro.studbox.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity 
@Table(name="UserLimit")
public class UserLimit implements Serializable {
	
	@Id
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "UserId", nullable = false)
	private User user;
	
	@Id
	@Column(name="LimitName")
	private String limitName;
	
	@Column(name="LimitValue")
	private String limitValue;	
	
	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getLimitName() {
		return limitName;
	}

	public void setLimitName(String limitName) {
		this.limitName = limitName;
	}

	public String getLimitValue() {
		return limitValue;
	}

	public void setLimitValue(String limitValue) {
		this.limitValue = limitValue;
	}
	
}
