package ro.studbox.data.dao.impl;

import org.hibernate.Criteria;
import org.hibernate.FetchMode;
import org.hibernate.Query;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.UserDao;
import ro.studbox.entities.User;


@Repository
public class UserDaoImpl extends GenericDaoImpl<Long, User> implements UserDao {

	public UserDaoImpl() {
		super(User.class);		
	}

	@Transactional
	public User getUserByEmail(String email) {
		Query query = sessionFactory.getCurrentSession().createQuery("from User where Email=:email");
		query.setParameter("email", email);		
		
		return (User) query.uniqueResult();
	}

	@Transactional
	public User getUserByUsername(String username) {
		Criteria criteria = sessionFactory.getCurrentSession().createCriteria(User.class)
        		.add(Restrictions.eq("username", username))
        		.setFetchMode("roles", FetchMode.JOIN);
        return (User) criteria.uniqueResult();
	}

}
