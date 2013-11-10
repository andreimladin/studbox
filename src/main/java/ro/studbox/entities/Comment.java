package ro.studbox.entities;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@SuppressWarnings("serial")
@Entity
@Table(name="Comment")
public class Comment implements Serializable {
	
	@Id
	@Column(name="ObjectId", unique=true, nullable=false)
	private long objectId;

	@Column(name="SubjectId", nullable=false)
	private long subjectId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "UserId", nullable = false)	
	private User user;
	
	@Column(name="Text", nullable=false)
	private String text;
	
	@Column(name="CreationDate", nullable=false)
	private Date creationDate;
	
	@Transient
	private String creationDateString;
	
	public Comment() {		
	}

	public Comment(long subjectId,
			long userId, String text, Date creationDate) {		
		this.subjectId = subjectId;
		this.user = new User();
		this.user.setUserId(userId);
		this.text = text;
		this.creationDate = creationDate;		
	}

	public long getObjectId() {
		return objectId;
	}
	
	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}
	
	public long getSubjectId() {
		return subjectId;
	}
	
	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}
	
	public String getText() {
		return text;
	}
	
	public void setText(String text) {
		this.text = text;
	}
	
	public Date getCreationDate() {
		return creationDate;
	}
	
	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public String getCreationDateString() {
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
		creationDateString = format.format(creationDate);	
		return creationDateString;
	}

	public void setCreationDateString(String creationDateString) {
		this.creationDateString = creationDateString;
	}	
	
	
}
