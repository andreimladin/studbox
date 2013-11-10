package ro.studbox.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.CourseDao;
import ro.studbox.data.dao.YearDao;
import ro.studbox.entities.Course;
import ro.studbox.service.CourseService;

@Service
public class CourseServiceImpl implements CourseService {
	
	@Autowired
	private CourseDao courseDao;

	@Autowired
	private YearDao yearDao;
	
	@Transactional
	public Course getCourse(long courseId) {
		yearDao.increaseViewNoByCourseId(courseId);
		courseDao.increaseViewNo(courseId);
		return courseDao.find(courseId);
	}

	public Course getCourseByFolderId(long folderId) {
		return courseDao.getCourseByFolderId(folderId);
	}
	
	

}
