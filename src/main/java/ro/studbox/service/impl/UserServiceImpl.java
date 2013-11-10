package ro.studbox.service.impl;

import java.util.Date;
import java.util.HashSet;
import java.util.Random;
import java.util.Set;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import ro.studbox.data.dao.AccountConfirmationDao;
import ro.studbox.data.dao.RoleDao;
import ro.studbox.data.dao.UserDao;
import ro.studbox.entities.AccountConfirmation;
import ro.studbox.entities.Role;
import ro.studbox.entities.User;
import ro.studbox.service.EmailService;
import ro.studbox.service.UserService;

@Service(value = "userService")
public class UserServiceImpl implements UserService {

	private final static Logger logger = Logger.getLogger(UserServiceImpl.class);
	
	@Autowired
	private UserDao userDao;
	
	@Autowired
	private RoleDao roleDao;
	
	@Autowired
	private AccountConfirmationDao confirmationDao;
	
	@Autowired
	@Qualifier("HtmlEmailService")
	private EmailService emailService;
	
	public UserDetails loadUserByUsername(String username)
			throws UsernameNotFoundException {
		logger.debug(".loadUserByUsername - username : " + username);
		User user = userDao.getUserByUsername(username);
		logger.debug(".loadUserByUsername - user.username=" + user.getUsername());
		return user;		
	}

	@Transactional
	public User createUser(String username, String password, String firstName, 
			String lastName, String email, String sex, Date birthdate, boolean useNotifications) {		
		
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		
		// AIM - encode the password 
		password = encoder.encodePassword(password, null);
		
		// AIM - prepare the default ROLE
		// TODO - to be extracted from a cache
		// Set<Role> roles = new HashSet<Role>()
		Set<Role> roles = new HashSet<Role>();
		Role consumerRole = roleDao.find("CONSUMER");
		roles.add(consumerRole);
		
		User newUser = new User(username, password, firstName, lastName, email, sex, birthdate, new Date(), null, 0, useNotifications, roles);		
		newUser = userDao.create(newUser);

		// AIM - encode the ConfirmationKey		
		String confirmationKey = encoder.encodePassword(newUser.getUserId() + newUser.getUsername() + newUser.getEmail(), null);		

		// AIM - create a UserAccountConfirmation
		AccountConfirmation confirmation = new AccountConfirmation(newUser.getUserId(), 0, new Date(), confirmationKey);
		confirmationDao.create(confirmation);	
		
		// AIM - send email confirmation
		emailService.sendConfirmationMail(confirmation, newUser);		
		
		return newUser;
	}

	public void confirmAccount(String confirmationKey) {
		AccountConfirmation confirmation = confirmationDao.getByConfirmationKey(confirmationKey);
		
		// AIM - retrieve the user by id
		User user = userDao.find(confirmation.getUserId());
		
		// AIM - activate the user
		user.setStatus(User.STATUS_ACTIVE);		
		userDao.update(user);
		
		// AIM - update confirmation
		confirmation.setStatus(AccountConfirmation.STATUS_CONFIRMED);		
		confirmationDao.update(confirmation);		
		
		emailService.sendWelcomeMail(user);
	}

	public User getUserByEmail(String email) {
		return userDao.getUserByEmail(email);
	}

	public User getUserByUsername(String username) {
		return userDao.getUserByUsername(username);
	}

	public void rememberUsername(String email) {
		User user = userDao.getUserByEmail(email);
		
		emailService.sendEmailWithUsername(user);
	}

	public void resetPassword(String email) {
		User user = userDao.getUserByEmail(email);
			
		String newPassword = "";
		Random rand = new Random();
		for (int i = 0; i < 8; i++) {
			char rChar = (char) (rand.nextInt(25) + 97);
			newPassword = newPassword + rChar;
		}
		
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		String encPassword = encoder.encodePassword(newPassword, null);
		user.setPassword(encPassword);
		
		userDao.update(user);
		
		emailService.sendEmailWithPasswordReset(user, newPassword);
		
	}
	
	
	public static void main(String[] args){
		Md5PasswordEncoder encoder = new Md5PasswordEncoder();
		System.out.println(encoder.encodePassword("Pascal9*", null));
	}

}
