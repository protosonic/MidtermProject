package com.skilldistillery.mealplan.data;

import java.util.Map;
import java.util.Set;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealplan.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class UserDaoImpl implements UserDAO {

	@PersistenceContext
	private EntityManager em;
	

	@Override
	public User authenticateUser(String username, String password) {
		User user = null;
		try {
			String jpql = "SELECT u FROM User u WHERE u.username = :username "
					+ "AND u.password = :password AND u.enabled = true";
			user = em.createQuery(jpql, User.class).setParameter("username", username)
					.setParameter("password", password).getSingleResult();
		} catch (Exception e) {
			System.err.println("Invalid login: + username");
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public User createAccountForUser(User user) {
		
		try {
			user.setEnabled(true);

			em.persist(user);
		} catch (Exception e) {
			System.err.println("invalid input");
			e.printStackTrace();
		}

		return user;
	}


}
