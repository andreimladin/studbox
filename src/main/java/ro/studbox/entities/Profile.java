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
@Table(name="Profile", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"FacultyId", "Name", "Section"})}
)
public class Profile implements Serializable {
	@Id	
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "FacultyId", nullable = false)	
	private Faculty faculty;
	
	@Column(name="Name", nullable = false)
	private String name;
	
	@Column(name="Section")
	private String section;
	
	// AIM - licenta sau master
	@Column(name="Type", nullable=false)
	private String type;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate asc")
	private Set<Comment> comments;
	
	@Column(name="ViewNo")
	private int viewNo;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="ProfileId")
	@OrderBy(clause="ViewNo desc, Name")
	private Set<Course> courses;	
	
	@Column(name="ShortName", nullable = false)
	private String shortName;
	
	@Column(name="CreationDate")
    private Date creationDate;
	
	@Column(name="LastModifiedDate")
    private Date lastModifiedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OwnerId", nullable = false)	
    private User owner;
	
	public Profile(){
	}
	
	public Profile(long facultyId, String name, String shortName, String section, String type, long ownerId, Date creationDate, Date lastModifiedDate){		
		this.faculty=new Faculty(facultyId);
		this.name=name;
		this.shortName=shortName;
		this.section=section;
		this.type=type;
		this.owner=new User(ownerId);
		this.creationDate=creationDate;
		this.lastModifiedDate=lastModifiedDate;
	}
	
	public Profile(long profileId){
		this.objectId = profileId;
	}

	public Faculty getFaculty() {
		return faculty;
	}

	public void setFaculty(Faculty faculty) {
		this.faculty = faculty;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}

	public long getObjectId() {
		return objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public Set<Course> getCourses() {
		return courses;
	}

	public void setCourses(Set<Course> courses) {
		this.courses = courses;
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
