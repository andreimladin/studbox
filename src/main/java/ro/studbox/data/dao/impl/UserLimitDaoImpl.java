package ro.studbox.data.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.UserLimitDao;
import ro.studbox.entities.UserLimit;

@Repository
public class UserLimitDaoImpl extends GenericDaoImpl<Long, UserLimit> implements
		UserLimitDao {

	public UserLimitDaoImpl() {
		super(UserLimit.class);
	}

	@SuppressWarnings("unchecked")
	@Transactional
	@Override
	public List<UserLimit> getUserLimit(long userId) {
		Query userLimitQuery = sessionFactory.getCurrentSession().createQuery("from UserLimit where UserId =:userId");
		userLimitQuery.setParameter("userId", userId);	
		
		return (List<UserLimit>) userLimitQuery.list();

	}
	
	
}
