package ro.studbox.entities;

import java.io.Serializable;
import java.util.Date;
import java.util.Set;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.OrderBy;

@SuppressWarnings("serial")
@Entity
@Table(name="Year", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"ProfileId", "Name"})}
)
public class Year implements Serializable {
	
	@Id
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ProfileId", nullable = false)
	private Profile profile;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate")
	private Set<Comment> comments;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="YearId")
	@OrderBy(clause="Semester, ViewNo desc, Name")
	private Set<Course> courses;
	
	@Column(name="Name", nullable = false)
	private String name;
	
	@Column(name="ViewNo")
	private int viewNo;
	
	@Column(name="CreationDate")
    private Date creationDate;
	
	@Column(name="LastModifiedDate")
    private Date lastModifiedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OwnerId", nullable = false)	
    private User owner;
	
	public long getObjectId() {
		return objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}	

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
	}

	public int getViewNo() {
		return viewNo;
	}

	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getLastModifiedDate() {
		return lastModifiedDate;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
}
