package ro.studbox.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="ObjectType")
public class ObjectType implements Serializable {
	
	public final static int UNKNOWN_TYPE_ID = -1;
	public final static int UNIVERSITY_TYPE_ID = 1;
	public final static int FACULTY_TYPE_ID = 2;
	public final static int PROFILE_TYPE_ID = 3;
	public final static int COURSE_TYPE_ID = 4;
	public final static int FOLDER_TYPE_ID = 5;
	public final static int FILE_TYPE_ID = 6;
	public final static int COMMENT_TYPE_ID = 7;
	
	@Id
	@Column(name="ObjectTypeId", unique = true, nullable = false)
	private long objectTypeId;
	
	@Column(name="ObjectTypeName", unique = true, nullable = false)
	private String objectTypeName;
	
	public long getObjectTypeId() {
		return objectTypeId;
	}
	
	public void setObjectTypeId(long objectTypeId) {
		this.objectTypeId = objectTypeId;
	}
	
	public String getObjectTypeName() {
		return objectTypeName;
	}
	
	public void setObjectTypeName(String objectTypeName) {
		this.objectTypeName = objectTypeName;
	}
	
	public static long getObjectTypeId(java.lang.Object object) {
		if (object instanceof File) {
			return FILE_TYPE_ID;
		} else if (object instanceof Folder) {
			return FOLDER_TYPE_ID;
		} else if (object instanceof Course) {
			return COURSE_TYPE_ID;
		} else if (object instanceof Profile) {
			return PROFILE_TYPE_ID;
		} else if (object instanceof Faculty) {
			return FACULTY_TYPE_ID;
		} else if (object instanceof University) {
			return UNIVERSITY_TYPE_ID;
		} else if (object instanceof Comment) {
			return COMMENT_TYPE_ID;
		} else {
			return UNKNOWN_TYPE_ID;
		}
	}

}
