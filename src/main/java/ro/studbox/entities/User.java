package ro.studbox.entities;

import java.util.ArrayList;
import java.util.Collection;
import java.util.Date;
import java.util.List;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.apache.log4j.Logger;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@SuppressWarnings("serial")
@Entity
@Table(name="Users", uniqueConstraints = {
			@UniqueConstraint(columnNames = "Username"),
			@UniqueConstraint(columnNames = "Email")			
})
public class User implements UserDetails {
	
	private static final Logger logger = Logger.getLogger(User.class);
	
	public static final int STATUS_INACTIVE = 0;
	public static final int STATUS_ACTIVE = 1;
	public static final int STATUS_LOCKED = 2;
	public static final int STATUS_CLOSED = 3;
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="UserId", unique = true, nullable = false)
	private long userId;
	
	@Column(name="Username", unique=true, nullable = false, length=20)
	private String username;
	
	@Column(name="Password", nullable = false, length=50)
	private String password;
	
	@Column(name="FirstName", nullable = false, length=25)
	private String firstName;
	
	@Column(name="LastName", nullable = false, length=25)
	private String lastName;
	
	@Column(name="Email", unique=true, nullable = false, length=50)
	private String email;
	
	// AIM - 'M' | 'F'
	@Column(name="Sex", nullable = false, length=1)
	private String sex;
	
	@Column(name="Birthdate", nullable = false)
	private Date birthdate;	
		
	@Column(name="CreationDate", nullable = false)
	private Date creationDate;
	
	@Column(name="LockDate", nullable = true)
	private Date lockDate;
	
	// AIM - 0 - INACTIVE, 1-ACTIVE, 2-LOCKED, 3-DISABLED
	@Column(name="Status", nullable = false)
	private int status;
	
	@Column(name = "UseNotifications", columnDefinition = "BIT", length = 1)
	private boolean useNotifications;
	
	// AIM - EAGER means that roles are loaded at the same time 
	// with the user
	@ManyToMany(fetch = FetchType.LAZY, cascade = {CascadeType.MERGE})
	@JoinTable(name="UserRoles", 
		joinColumns = {@JoinColumn(name="UserId", nullable = false, updatable = false)},
		inverseJoinColumns = {@JoinColumn(name="RoleName", nullable = false, updatable = false)}	
	)	
	private Set<Role> roles;
	
	@OneToMany(fetch = FetchType.LAZY, cascade={CascadeType.ALL}, mappedBy="user")	
	private Set<UserLimit> limits;
	
	@OneToOne(fetch = FetchType.LAZY, cascade={CascadeType.ALL}, mappedBy="user")
	private UserDownloads downloads;
	
	@Transient
	private List<GrantedAuthority> authorityList;
		
	public User() {
	}
	
	public User(long userId){
		this.userId = userId;
	}

	public User(String username, String password, String firstName,
			String lastName, String email, String sex, Date birthdate,
			Date creationDate, Date lockDate, int status, boolean useNotifications, Set<Role> roles, Set<UserLimit> limits, UserDownloads downloads) {
		this.username = username;
		this.password = password;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.sex = sex;
		this.birthdate = birthdate;
		this.creationDate = creationDate;
		this.lockDate = lockDate;
		this.status = status;
		this.useNotifications = useNotifications;
		this.roles = roles;
		this.limits = limits;
		this.downloads = downloads;
	}	
	
	public long getUserId() {
		return userId;
	}

	public void setUserId(long userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Date getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(Date birthdate) {
		this.birthdate = birthdate;
	}

	public Date getCreationDate() {
		return creationDate;
	}

	public void setCreationDate(Date creationDate) {
		this.creationDate = creationDate;
	}

	public Date getLockDate() {
		return lockDate;
	}

	public void setLockDate(Date lockDate) {
		this.lockDate = lockDate;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}
	
	public boolean isUseNotifications() {
		return useNotifications;
	}

	public void setUseNotifications(boolean useNotifications) {
		this.useNotifications = useNotifications;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}

	public Collection<? extends GrantedAuthority> getAuthorities() {		
		if (authorityList == null){
			authorityList = new ArrayList<GrantedAuthority>();
			for(Role role: roles){
				GrantedAuthority roleAuthority = new SimpleGrantedAuthority(role.getRoleName());
				authorityList.add(roleAuthority);
				for (Permission permission:role.getPermissions()){
					GrantedAuthority permissionAuthority = new SimpleGrantedAuthority(permission.getPermissionName());
					authorityList.add(permissionAuthority);
				}
			}
		}
		
		return authorityList;
	}	

	public Set<UserLimit> getLimits() {
		return limits;
	}

	public void setLimits(Set<UserLimit> limits) {
		this.limits = limits;
	}

	public UserDownloads getDownloads() {
		return downloads;
	}

	public void setDownloads(UserDownloads downloads) {
		this.downloads = downloads;
	}

	// AIM - Out of scope
	public boolean isAccountNonExpired() {
		return true;
	}

	public boolean isAccountNonLocked() {
		logger.debug("isAccountNonLocked : " + (this.status != STATUS_LOCKED));
		return this.status != STATUS_LOCKED;
	}

	public boolean isCredentialsNonExpired() {
		return true;
	}

	public boolean isEnabled() {
		logger.debug("isAccountNonLocked : " + (this.status == STATUS_ACTIVE));
		return this.status == STATUS_ACTIVE;
	}	

}
