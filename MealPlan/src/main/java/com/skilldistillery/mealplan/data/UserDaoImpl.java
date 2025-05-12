package com.skilldistillery.mealplan.data;

import java.util.List;

import org.springframework.stereotype.Service;
import com.skilldistillery.mealplan.controllers.UserController;
import com.skilldistillery.mealplan.entities.Recipe;
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

	@Override
	public Recipe findbyId(int recipeId) {
		return em.find(Recipe.class, recipeId);
	}

	@Override
	public List<Recipe> getList() {
		String jpql = "SELECT r FROM Recipe r";
		return em.createQuery(jpql, Recipe.class).getResultList();
	}


}
