package ro.studbox.data.dao;

import ro.studbox.entities.Course;

public interface CourseDao extends GenericDao<Long, Course> {
	
	boolean existsCourse(long profileId, String name);
	void increaseViewNo(long courseId);	
	Course getCourseByFolderId(long folderId);

}
