package ro.studbox.data.dao.impl;

import org.hibernate.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.ObjectDao;
import ro.studbox.data.dao.YearDao;
import ro.studbox.entities.Object;
import ro.studbox.entities.ObjectType;
import ro.studbox.entities.Year;

@Repository
public class YearDaoImpl extends GenericDaoImpl<Long, Year> implements YearDao {
	
	@Autowired
	private ObjectDao objectDao;

	public YearDaoImpl() {
		super(Year.class);		
	}
	
	@Override
	@Transactional
	public Year create(Year year) {
		// Create first the object id
		Object superTypeObj = new Object();
		superTypeObj.setObjectTypeId(ObjectType.YEAR_TYPE_ID);
		objectDao.create(superTypeObj);
		
		// Create the year
		year.setObjectId(superTypeObj.getObjectId());
		return super.create(year);
	}

	@Override
	@Transactional
	public void delete(Year year) {
		// Delete the year
		super.delete(year);
		
		// Delete the object
		objectDao.deleteByKey(year.getObjectId());
	}
	
	@Override
	@Transactional
	public void deleteByKey(Long key) {
		// Delete the year
		super.deleteByKey(key);
		
		// Delete the object
		objectDao.deleteByKey(key);
	}
	
	public void increaseViewNo(long yearId) {
		Query updateQuery = sessionFactory.getCurrentSession().createQuery("Update Year Set ViewNo = ViewNo + 1 where ObjectId=:yearId");
		updateQuery.setParameter("yearId", yearId);
		updateQuery.executeUpdate();
	}

	public void increaseViewNoByCourseId(long courseId) {
		Query updateQuery = sessionFactory.getCurrentSession().createSQLQuery(
					"Update Year Set ViewNo = ViewNo + 1 " +
					"	where ObjectId in (Select YearId from Course where ObjectId=:objectId)");
		updateQuery.setParameter("objectId", courseId);
		updateQuery.executeUpdate();
	}
	
	

}
