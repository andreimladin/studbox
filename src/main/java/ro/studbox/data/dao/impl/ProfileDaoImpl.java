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

import ro.studbox.data.dao.ObjectDao;
import ro.studbox.data.dao.ProfileDao;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;
import ro.studbox.entities.Profile;

@Repository
public class ProfileDaoImpl extends GenericDaoImpl<Long, Profile> implements ProfileDao {
	
	@Autowired
	private ObjectDao objectDao;
	
	public ProfileDaoImpl() {
		super(Profile.class);
	}
	
	@Override
	@Transactional
	public Profile create(Profile profile) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.PROFILE_TYPE_ID);
		objectDao.create(superTypeObj);
		
		//
		
		// Create the profile
		profile.setObjectId(superTypeObj.getObjectId());
		return super.create(profile);
	}
	
	@Override
	@Transactional
    public Profile find(Long key) {
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(Profile.class)
        		.add(Restrictions.idEq(key))
        		.setFetchMode("faculty", FetchMode.JOIN)
        		.setFetchMode("courses", FetchMode.JOIN)
        		.setFetchMode("comments", FetchMode.JOIN);
        return (Profile)criteria.uniqueResult();
    }
	
	@Override
	@Transactional
	public boolean existsProfile(long facultyId, String name) {
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select 1 from Profile where FacultyId=:facultyId and Name=:name");
		query.setParameter("facultyId", Long.valueOf(facultyId));
		query.setParameter("name", name);
		
		return query.uniqueResult() != null;
	}

	@Override
	@Transactional
	public boolean existsProfile(long profileId){
		Session session = sessionFactory.getCurrentSession();
		Query query = session.createQuery("select 1 from Profile where ObjectId=:profileId");
		query.setParameter("profileId", Long.valueOf(profileId));
		
		return query.uniqueResult() != null;
	}
	
	@Override
	@Transactional
	public void delete(Profile profile) {
		// Delete the profile
		super.delete(profile);
		
		// Delete the object
		objectDao.deleteByKey(profile.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the folder
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}
	
	@SuppressWarnings("unchecked")
	@Transactional
	public List<Profile> getAllByFacultyId(long facultyId){
		Session session = sessionFactory.getCurrentSession();
		
		return (List<Profile>) session.createQuery("from Profile where FacultyId = " + facultyId + " order by ViewNo desc").list();
	}
	
	@Transactional
	public void increaseViewNo(long profileId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update Profile Set ViewNo = ViewNo + 1 where ObjectId=:profileId");
		updateQuery.setParameter("profileId", profileId);
		updateQuery.executeUpdate();
	}
		
}
