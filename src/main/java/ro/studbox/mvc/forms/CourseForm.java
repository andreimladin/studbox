package ro.studbox.mvc.forms;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class CourseForm {
	
	@NotNull
	@Min(0)
	private long profileId;
	
	@NotNull
	@Size(min=2, max=150)
	private String name;
	
	@NotNull
	@Size(min=2, max=30)
	private String shortName;
	
	public long getProfileId() {
		return profileId;
	}

	public void setProfileId(long profileId) {
		this.profileId = profileId;
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

}
