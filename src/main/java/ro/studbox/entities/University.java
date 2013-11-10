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

import org.hibernate.annotations.OrderBy;

@SuppressWarnings("serial")
@Entity
@Table(name="University")
public class University implements Serializable{
	
	@Id
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;
		
	@Column(name="Name", unique = true, nullable = false)
	private String name;
	
	@Column(name="ShortName", nullable = false)
	private String shortName;
	
	@Column(name="Location", nullable=false)
	private String location;
	
	@Column(name="Logo", nullable=false)
	private String logo;	
	
	@Column(name="ViewNo")
	private int viewNo;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="UniversityId")
	@OrderBy(clause="ViewNo desc")
	private Set<Faculty> faculties;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate asc")
	private Set<Comment> comments;	
	
	@Column(name="CreationDate")
    private Date creationDate;
	
	@Column(name="LastModifiedDate")
    private Date lastModifiedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OwnerId", nullable = false)	
    private User owner;
		
	public University() {
		// AIM - just for Hibernate
	}
	
	public University(String name, String location,
			String logo) {	
		this.name = name;
		this.location = location;
		this.logo = logo;
	}

	public long getObjectId() {
		return objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}

	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
		
	public String getLocation() {
		return location;
	}
	
	public void setLocation(String location) {
		this.location = location;
	}

	public String getLogo() {
		return logo;
	}
	
	public void setLogo(String logo) {
		this.logo = logo;
	}

	public Set<Comment> getComments() {
		return comments;
	}

	public void setComments(Set<Comment> comments) {
		this.comments = comments;
	}

	public int getViewNo() {
		return viewNo;
	}

	public void setViewNo(int viewNo) {
		this.viewNo = viewNo;
	}

	public Set<Faculty> getFaculties() {
		return faculties;
	}

	public void setFaculties(Set<Faculty> faculties) {
		this.faculties = faculties;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
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
