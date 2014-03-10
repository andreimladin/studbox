package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.CourseDao;
import ro.studbox.data.dao.FolderDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Course;
import ro.studbox.entities.Folder;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

@Repository
public class CourseDaoImpl extends GenericDaoImpl<Long, Course> implements CourseDao {
	
	@Autowired
	private ObjectDao objectDao;
	
	@Autowired
	private FolderDao folderDao;

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
		
		// Create the default folder
		Folder courseFolder = new Folder();
		courseFolder.setName(course.getName());
		courseFolder.setCourse(true);
		courseFolder.setOwner(course.getOwner());
		courseFolder.setCreationDate(course.getCreationDate());
		courseFolder.setLastModifiedDate(course.getLastModifiedDate());
		folderDao.create(courseFolder);
		
		// Create the course
		course.setObjectId(superTypeObj.getObjectId());
		course.setDefaultFolder(courseFolder);
		return super.create(course);
	}
	
	
	
	@Override	
	@Transactional
	public boolean existsCourse(long profileId, String name) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select 1 from Course where ProfileId=:profileId and Name=:name");
		query.setParameter("profileId", Long.valueOf(profileId));
		query.setParameter("name", name);
		
		return query.uniqueResult() != null;		
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
