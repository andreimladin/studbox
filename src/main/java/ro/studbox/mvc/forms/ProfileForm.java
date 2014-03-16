package ro.studbox.mvc.forms;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class ProfileForm {

	@NotNull
	@Min(0)
	private long facultyId;
	
	@NotNull
	@Size(min=2, max=150)
	private String name;
	
	@NotNull
	@Size(min=2, max=30)
	private String shortName;
	
	@NotNull
	@Size(min=2, max=30)
	private String section;

	@NotNull
	@Size(min=5, max=8)
	private String type;
	
	public long getFacultyId() {
		return facultyId;
	}

	public void setFacultyId(long facultyId) {
		this.facultyId = facultyId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getShortName() {
		return shortName;
	}

	public void setShortName(String shortName) {
		this.shortName = shortName;
	}	
	
	public String getSection() {
		return section;
	}

	public void setSection(String section) {
		this.section = section;
	}	
	
	public String getType() {
		return type;
	}
	
	public void setType(String type) {
		this.type = type;
	}
	
}

