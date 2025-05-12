package com.skilldistillery.mealplan.data;

import java.util.List;

import org.springframework.stereotype.Service;

import com.skilldistillery.mealplan.entities.Recipe;
import com.skilldistillery.mealplan.entities.User;

import jakarta.persistence.EntityManager;
import jakarta.persistence.PersistenceContext;
import jakarta.transaction.Transactional;

@Service
@Transactional
public class RecipeDAOImpl implements RecipeDAO{
	@PersistenceContext
	private EntityManager em;

	@Override
	public List<Recipe> getRecipesList() {
		String jpql = "SELECT r FROM Recipe r WHERE r.enabled = true";
		return em.createQuery(jpql, Recipe.class).getResultList();
	}

	@Override
	public Recipe getRecipeDetails(int recipeId) {
//		String jpql = "SELECT r FROM Recipe r WHERE r.id = :recipeId AND r.enabled = true";
		return em.find(Recipe.class, recipeId);
//		return em.createQuery(jpql, Recipe.class).setParameter("recipeId", recipeId).getResultList();
	}

	@Override
	public boolean deleteRecipe(int recipeId, User user) {
		boolean deleted = false;
		Recipe deletedRecipe= em.find(Recipe.class, recipeId);
		if(deletedRecipe != null && deletedRecipe.getUser().getId() == user.getId()) {
			deletedRecipe.setEnabled(false);
			deleted = true;
		}
		return deleted;
	} 

}
