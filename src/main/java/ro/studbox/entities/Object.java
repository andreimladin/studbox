package ro.studbox.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Object")
public class Object implements Serializable {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="ObjectId", unique = true, nullable = false)
	private long objectId;	
	
	@Column(name = "ObjectTypeId", nullable = false)	
	private long objectTypeId;
	
	public Object() {
	}

	public Object(long objectId, long objectTypeId) {
		this.objectId = objectId;
		this.objectTypeId = objectTypeId;
	}

	public long getObjectId() {
		return objectId;
	}
	
	public void setObjectId(long objectId) {
		this.objectId = objectId;
	}
	
	public long getObjectTypeId() {
		return objectTypeId;
	}
	
	public void setObjectTypeId(long objectTypeId) {
		this.objectTypeId = objectTypeId;
	}
	
}
