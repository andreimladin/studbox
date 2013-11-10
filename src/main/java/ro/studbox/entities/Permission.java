package ro.studbox.entities;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Permission")
public class Permission implements Serializable{	
	
	@Id
	@Column(name="PermissionName", unique=true, nullable=false, length=25)
	private String permissionName;
	
	@Column(name="Description", nullable=false, length=50)
	private String description;
	
	public String getPermissionName() {
		return permissionName;
	}
	
	public void setPermissionName(String permissionName) {
		this.permissionName = permissionName;
	}
	
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
}
