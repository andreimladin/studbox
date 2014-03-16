package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.ObjectDao;
import ro.studbox.data.dao.UniversityDao;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;
import ro.studbox.entities.University;

@Repository
public class UniversityDaoImpl extends GenericDaoImpl<Long, University> implements UniversityDao {
	
	@Autowired
	private ObjectDao objectDao;
	
	public UniversityDaoImpl() {
		super(University.class);
	}
	
	@Override
	@Transactional
	public University create(University university) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.UNIVERSITY_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the university
		university.setObjectId(superTypeObj.getObjectId());
		return super.create(university);
	}
	
	@Override
	@Transactional
    public University find(Long key){
        Criteria criteria = sessionFactory.getCurrentSession().createCriteria(University.class)
        		.add(Restrictions.idEq(key))
        		.setFetchMode("faculties", FetchMode.JOIN)
        		.setFetchMode("faculties.profiles", FetchMode.JOIN)
        		.setFetchMode("comments", FetchMode.JOIN);
        return (University)criteria.uniqueResult();
    }

	@Override
	@Transactional
	public void delete(University university) {
		// Delete the university
		super.delete(university);
		
		// Delete the object
		objectDao.deleteByKey(university.getObjectId());
	}

	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the university
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}

	@SuppressWarnings("unchecked")
	@Transactional(readOnly=true)
	public List<University> getAll() {				
		return (List<University>) sessionFactory.getCurrentSession().createQuery("from University order by ViewNo desc").list();
		
	}

	@Transactional
	public void increaseViewNo(long universityId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update University Set ViewNo = ViewNo + 1 where ObjectId=:universityId");
		updateQuery.setParameter("universityId", universityId);
		updateQuery.executeUpdate();
	}

}
