package ro.studbox.entities;

import java.io.Serializable;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.annotations.OrderBy;

@SuppressWarnings("serial")
@Entity
@Table(name="File", uniqueConstraints = {
		@UniqueConstraint(columnNames = {"FolderId", "Name"})}
)
public class File implements Serializable {
	
	@Id
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;

	@ManyToOne(fetch=FetchType.EAGER, cascade=CascadeType.DETACH)
	@JoinColumn(name="FolderId")
	private Folder folder;
	
	@Column(name="Name")
	private String name;
	
	@Column(name="ContentType")
	private String contentType;
	
	@Column(name="ContentLength")
	private long contentLength;

	@ManyToOne(fetch = FetchType.EAGER, cascade=CascadeType.DETACH)
	@JoinColumn(name = "OwnerId", nullable = false)	
	private User owner;
	
	@Column(name="Path")
	private String path;
	
	@Column(name="CreationDate")
	private Date creationDate;
	
	@Column(name="LastModifiedDate")
	private Date lastModifiedDate;
	
	@Transient
	private String lastModifiedDateString;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate asc")
	private Set<Comment> comments;
	
	@Column(name="ViewNo")
	private int viewNo;
	
	public File() {			
	}
	
	public File(long folderId, String name, String contentType, long contentLength, long ownerId, String path,
			Date creationDate, Date lastModifiedDate) {	
		this.name = name;
		this.contentType = contentType;
		this.contentLength = contentLength;
		this.owner = new User();
		this.owner.setUserId(ownerId);
		this.path = path;
		this.creationDate = creationDate;
		this.lastModifiedDate = lastModifiedDate;
		this.folder = new Folder();
		this.folder.setObjectId(folderId);		
	}

	public Folder getFolder() {
		return folder;
	}

	public void setFolder(Folder folder) {
		this.folder = folder;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContentType() {
		return contentType;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}

	public long getContentLength() {
		return contentLength;
	}

	public void setContentLength(long contentLength) {
		this.contentLength = contentLength;
	}

	public long getObjectId() {
		return objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
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
	
	public String getLastModifiedDateString(){				
		SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
		lastModifiedDateString = format.format(lastModifiedDate);	
		
		return lastModifiedDateString;
	}
	
	public void setLastModifiedDateString(String lastModifiedDateString){
		this.lastModifiedDateString = lastModifiedDateString;
	}

	public void setLastModifiedDate(Date lastModifiedDate) {
		this.lastModifiedDate = lastModifiedDate;
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

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
}
