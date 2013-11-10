package ro.studbox.entities;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@SuppressWarnings("serial")
@Entity
@Table(name="Role")
public class Role implements Serializable {
	
	public final static String ROLE_CONSUMER = "CONSUMER";
	public final static String ROLE_CONTRIBUTOR = "CONTRIBUTOR";
	public final static String ROLE_COORDINATOR = "COORDINATOR";
	public final static String ROLE_ADMIN = "ADMIN";
	
	@Id	
	@Column(name="RoleName", unique = true, nullable = false, length=25)
	private String roleName;
	
	@Column(name="Description", nullable=false, length = 50)
	private String description;
	
	// AIM - EAGER means that roles are loaded at the same time 
	// with the user
	@ManyToMany(fetch = FetchType.EAGER, cascade = CascadeType.DETACH)
	@JoinTable(name="RolePermissions", /*catalog="studbox",*/ 
		joinColumns = {@JoinColumn(name="RoleName", nullable = false, updatable = false)},
		inverseJoinColumns = {@JoinColumn(name="PermissionName", nullable = false, updatable = false)}	
	)	
	private Set<Permission> permissions;
	
	public Role(){		
	}

	public Role(String roleName, String description,
			Set<Permission> permissions) {
		this.roleName = roleName;
		this.description = description;
		this.permissions = permissions;
	}
	
	public String getRoleName() {
		return roleName;
	}

	public void setRoleName(String roleName) {
		this.roleName = roleName;
	}

	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}

	public Set<Permission> getPermissions() {
		return permissions;
	}

	public void setPermissions(Set<Permission> permissions) {
		this.permissions = permissions;
	}	
	
}
