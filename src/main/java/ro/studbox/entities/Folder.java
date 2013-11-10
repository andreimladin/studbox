package ro.studbox.entities;

import java.io.Serializable;
import java.text.SimpleDateFormat;
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
import javax.persistence.Transient;

import org.hibernate.annotations.OrderBy;
import org.hibernate.annotations.Type;

@SuppressWarnings("serial")
@Entity
@Table(name="Folder")
public class Folder implements Serializable {
	
	@Id
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ParentFolderId")	
	private Folder parentFolder;	
	
	@Column(name="Name", nullable = false)
	private String name;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "OwnerId", nullable = false)	
	private User owner;
	
	@Column(name="CreationDate")
	private Date creationDate;
	
	@Column(name="LastModifiedDate")	
	private Date lastModifiedDate;
	
	@Transient
	private String lastModifiedDateString;
	
	@Column(name="IsCourse")
	@Type(type = "org.hibernate.type.NumericBooleanType")
	private boolean course;	
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="SubjectId")
	@OrderBy(clause="CreationDate asc")
	private Set<Comment> comments;
	
	@Column(name="ViewNo")
	private int viewNo;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="ParentFolderId")
	@OrderBy(clause="ViewNo desc, Name")
	private Set<Folder> folders;
	
	@OneToMany(fetch=FetchType.LAZY)
	@JoinColumn(name="FolderId")
	@OrderBy(clause="ViewNo desc, Name")
	private Set<File> files;
	
	public Folder(){
		
	}

	public Folder(long parentFolderId, String name, long ownerId, Date creationDate, Date lastModifiedDate, 
	            boolean course) {
		this.parentFolder = new Folder();
		this.parentFolder.setObjectId(parentFolderId);
		this.name = name;
		this.owner = new User();
		this.owner.setUserId(ownerId);
		this.creationDate = creationDate;
		this.lastModifiedDate = lastModifiedDate;
		this.course = course;
	}
	
	public long getObjectId() {
		return objectId;
	}

	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}	

	public Folder getParentFolder() {
		return parentFolder;
	}

	public void setParentFolder(Folder parentFolder) {
		this.parentFolder = parentFolder;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public boolean isCourse() {
		return course;
	}

	public void setCourse(boolean course) {
		this.course = course;
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
	
    public String getLastModifiedDateString() {
        SimpleDateFormat format = new SimpleDateFormat("dd/MM/yy hh:mm");
        lastModifiedDateString = format.format(lastModifiedDate);
        return lastModifiedDateString;
    }

    public void setLastModifiedDateString(String lastModifiedDateString){
        this.lastModifiedDateString = lastModifiedDateString;
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

	public Set<Folder> getFolders() {
		return folders;
	}

	public void setFolders(Set<Folder> folders) {
		this.folders = folders;
	}

	public Set<File> getFiles() {
		return files;
	}

	public void setFiles(Set<File> files) {
		this.files = files;
	}

	public User getOwner() {
		return owner;
	}

	public void setOwner(User owner) {
		this.owner = owner;
	}
	
	
	
}
