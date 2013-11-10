package ro.studbox.data.dao.impl;

import org.hibernate.Query;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.AccountConfirmationDao;
import ro.studbox.entities.AccountConfirmation;

@Repository
public class AccountConfirmationDaoImpl extends GenericDaoImpl<Long, AccountConfirmation> implements AccountConfirmationDao{

	public AccountConfirmationDaoImpl() {
		super(AccountConfirmation.class);
	}

	@Transactional
	public AccountConfirmation getByConfirmationKey(String confirmationKey) {
		Query query = sessionFactory.getCurrentSession().createQuery("from AccountConfirmation where ConfirmationKey = :confirmationKey");
		query.setParameter("confirmationKey", confirmationKey);
		
		return (AccountConfirmation) query.uniqueResult();
	}
	
}
