package ro.studbox.data.dao;

import ro.studbox.entities.AccountConfirmation;

public interface AccountConfirmationDao extends GenericDao<Long, AccountConfirmation> {
	
	public AccountConfirmation getByConfirmationKey(String confirmationKey);

}
