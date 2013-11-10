package ro.studbox.service;

import ro.studbox.entities.Course;

public interface CourseService {
	
	Course getCourse(long courseId);
	Course getCourseByFolderId(long folderId);
	
}
