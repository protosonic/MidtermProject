package com.skilldistillery.mealplan.data;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealplan.entities.MealPlan;
import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class MealPlanDAOImpl implements MealPlanDAO {

	@PersistenceContext
	private EntityManager em;

	@Override
	public MealPlan addToMealPlan(int recipeId, int userId, int mealPlanId) {
		MealPlan savedMealPlan = em.find(MealPlan.class, mealPlanId);
		Recipe savedRecipe = em.find(Recipe.class, recipeId);
		User newOwner = em.find(User.class, userId);
		if (savedRecipe != null && newOwner != null && savedMealPlan != null) {
			savedMealPlan.addRecipe(savedRecipe);
		}
		return savedMealPlan;
	}

	@Override
	public MealPlan createNewMealPlan(MealPlan newMealPlan, int userId) {
		User foundOwner = em.find(User.class, userId);
		if (foundOwner != null && newMealPlan != null) {
			newMealPlan.setEnabled(true);
			newMealPlan.setUser(foundOwner);
			em.persist(newMealPlan);
		}
		return newMealPlan;
	}

	@Override
	public MealPlan findMealPlanById(int userId, int mealPlanId) {
		String jpql = "SELECT mp FROM MealPlan mp WHERE mp.user.id = :userId AND mp.id = :planId";
		MealPlan plan = null;
		try {
			plan = em.createQuery(jpql, MealPlan.class).setParameter("userId", userId).setParameter("planId", mealPlanId).getSingleResult();
		} catch (Exception e) {
//			e.printStackTrace();
			System.err.println("Meal Plan Not Found For ID:" + mealPlanId);
		}
		return plan;
	}

}
