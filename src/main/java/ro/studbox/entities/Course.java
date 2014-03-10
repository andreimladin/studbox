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
@Table(name="Course", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"ProfileId", "Name"})}
)
public class Course implements Serializable {

	@Id
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;
	
	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "ProfileId", nullable = false)
	private Profile profile;
	
	@Column(name="Name", nullable = false)
	private String name;
	
	@Column(name="ShortName", nullable = false)
	private String shortName;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "DefaultFolderId", nullable = false)
	private Folder defaultFolder;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate asc")
	private Set<Comment> comments;
	
	@Column(name="ViewNo")
	private int viewNo;
	
	@Column(name="creationDate")
    private Date creationDate;
	
	@Column(name="lastModifiedDate")
    private Date lastModifiedDate;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "OwnerId", nullable = false)	
    private User owner;
	
	public Course(){		
	}
	
	public Course(long profileId, String name, String shortName, long ownerId, Date creationDate, Date lastModifiedDate){
		this.profile = new Profile(profileId);
		this.name = name;
		this.shortName = shortName;
		this.owner = new User(ownerId);
		this.creationDate = creationDate;
		this.lastModifiedDate = lastModifiedDate;
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

	public Profile getProfile() {
		return profile;
	}

	public void setProfile(Profile profile) {
		this.profile = profile;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Folder getDefaultFolder() {
		return defaultFolder;
	}

	public void setDefaultFolder(Folder defaultFolder) {
		this.defaultFolder = defaultFolder;
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
