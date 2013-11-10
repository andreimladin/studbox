package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.CourseDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Course;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

@Repository
public class CourseDaoImpl extends GenericDaoImpl<Long, Course> implements CourseDao {
	
	@Autowired
	private ObjectDao objectDao;

	public CourseDaoImpl() {
		super(Course.class);
	}
	
	@Override
	@Transactional
	public Course create(Course course) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.COURSE_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the course
		course.setObjectId(superTypeObj.getObjectId());
		return super.create(course);
	}
	
	@Override
	@Transactional
	public Course find(Long key) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Course.class)
        		.add(Restrictions.idEq(key))
        		.setFetchMode("defaultFolder", FetchMode.JOIN)
        		.setFetchMode("defaultFolder.folders", FetchMode.JOIN)
        		.setFetchMode("defaultFolder.files", FetchMode.JOIN)
        		.setFetchMode("defaultFolder.comments", FetchMode.JOIN)
        		.setFetchMode("comments", FetchMode.JOIN);
        
        return (Course)criteria.uniqueResult();
    }

	@Override
	@Transactional
	public void delete(Course course) {
		// Delete the course
		super.delete(course);
		
		// Delete the object
		objectDao.deleteByKey(course.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the course
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	public List<Course> getAllByYearId(long yearId) {
		Query getCoursesQuery = sessionFactory.getCurrentSession().createQuery("from Course where YearId =:yearId order by ViewNo desc");
		getCoursesQuery.setParameter("yearId", yearId);	
		
		return (List<Course>) getCoursesQuery.list();
	}

	public void increaseViewNo(long courseId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update Course Set ViewNo = ViewNo + 1 where ObjectId=:courseId");
		updateQuery.setParameter("courseId", courseId);
		updateQuery.executeUpdate();
	}

	@Transactional
	public Course getCourseByFolderId(long folderId) {
		Query query = sessionFactory.getCurrentSession().createQuery("from Course where DefaultFolderId =:defaultFolderId");
		query.setParameter("defaultFolderId", folderId);	
		
		return (Course) query.uniqueResult();
	}	
	
	

}
