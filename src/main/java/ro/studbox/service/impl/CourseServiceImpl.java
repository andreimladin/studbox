package ro.studbox.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.CourseDao;
import ro.studbox.entities.Course;
import ro.studbox.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	@Override
	public Course createCourse(long profileId, String name, String shortName,
			long ownerId) {
		// creation date
		Date now = new Date();
		
		// New course object
		Course course = new Course(profileId, name, shortName, ownerId, now, now);
				
		// Persist the course
		courseDao.create(course);
		
		return course;
	}
	
	

	@Override
	public boolean existsCourse(long profileId, String name) {
		return courseDao.existsCourse(profileId, name);
	}



	@Transactional
	public Course getCourse(long courseId) {
		courseDao.increaseViewNo(courseId);
		return courseDao.find(courseId);
	}

	public Course getCourseByFolderId(long folderId) {
		return courseDao.getCourseByFolderId(folderId);
	}
	
	

}
