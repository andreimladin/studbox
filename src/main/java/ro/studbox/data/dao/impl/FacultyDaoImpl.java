package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.FacultyDao;
import ro.studbox.data.dao.ObjectDao;
import ro.studbox.entities.Faculty;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;

/**
 * @author andreim
 **/

@Repository
public class FacultyDaoImpl extends GenericDaoImpl<Long, Faculty> implements FacultyDao{

	@Autowired
	private ObjectDao objectDao;
	
	public FacultyDaoImpl() {
		super(Faculty.class);
	}
	
	@Override
	@Transactional
	public Faculty create(Faculty faculty) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.FACULTY_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the faculty
		faculty.setObjectId(superTypeObj.getObjectId());
		return super.create(faculty);
	}

	@Override
	@Transactional
	public void delete(Faculty faculty) {
		// Delete the faculty
		super.delete(faculty);
		
		// Delete the object
		objectDao.deleteByKey(faculty.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the faculty
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}
	

	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<Faculty> getAllByUniversityId(long universityId) {
		Session session = sessionFactory.getCurrentSession();
		
		return (List<Faculty>) session.createQuery("from Faculty where UniversityId = " + universityId + " order by ViewNo desc").list();		
	}
	
	public void increaseViewNo(long facultyId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update Faculty Set ViewNo = ViewNo + 1 where ObjectId=:facultyId");
		updateQuery.setParameter("facultyId", facultyId);
		updateQuery.executeUpdate();
	}

	@Transactional
	public void increaseViewNoByProfileId(long profileId) {
		Query updateQuery = sessionFactory.getCurrentSession().createSQLQuery(
						"Update Faculty Set ViewNo = ViewNo + 1 " +
						"where ObjectId in (select FacultyId from Profile where ObjectId=:profileId)");
		updateQuery.setParameter("profileId", profileId);
		updateQuery.executeUpdate();
		
	}
	
	

}


