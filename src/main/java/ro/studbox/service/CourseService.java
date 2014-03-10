package ro.studbox.service;

import ro.studbox.entities.Course;

public interface CourseService {
	
	Course createCourse(long profileId, String name, String shortName, long ownerId);
	boolean existsCourse(long profileId, String name);
	Course getCourse(long courseId);
	Course getCourseByFolderId(long folderId);
	
}
