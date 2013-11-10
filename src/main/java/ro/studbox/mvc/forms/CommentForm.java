package ro.studbox.mvc.forms;

import javax.validation.constraints.Min;
import javax.validation.constraints.Size;

public class CommentForm {
	
	@Min(value=1)
	private long subjectId;
	
	@Size(min=1, max = 250)
	private String text;

	public long getSubjectId() {
		return subjectId;
	}

	public void setSubjectId(long subjectId) {
		this.subjectId = subjectId;
	}

	public String getText() {
		return text;
	}

	public void setText(String text) {
		this.text = text;
	}

}
