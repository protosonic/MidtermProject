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

	@Override
	public Recipe updateRecipe(int recipeId, User user, Recipe recipe) {
		Recipe updatedRecipe= em.find(Recipe.class, recipeId);
		if(updatedRecipe != null && updatedRecipe.getUser().getId() == user.getId()) {
		updatedRecipe.setName(recipe.getName());
		updatedRecipe.setIngredients(recipe.getIngredients());
		updatedRecipe.setDirections(recipe.getDirections());
		updatedRecipe.setImageURL(recipe.getImageURL());
		updatedRecipe.setNotes(recipe.getNotes());
		updatedRecipe.setPublished(recipe.getPublished());
		}
		return updatedRecipe;
	}

	@Override
	public Recipe saveRecipe(int recipeId, int userId) {
		Recipe savedRecipe = em.find(Recipe.class, recipeId);
		User newOwner = em.find(User.class, userId);
		if(savedRecipe != null && newOwner != null) {
			Recipe clonedRecipe = cloneRecipe(savedRecipe);
			clonedRecipe.setUser(newOwner);
			em.persist(clonedRecipe);
			
		}
		return savedRecipe;
	}
	private Recipe cloneRecipe(Recipe recipe) {
		Recipe clone = new Recipe();
		clone.setName(recipe.getName());
		clone.setIngredients(recipe.getIngredients());
		clone.setImageURL(recipe.getImageURL());
		clone.setDirections(recipe.getDirections());
		clone.setDateUpdated(null);
		clone.setEnabled(true);
		clone.setNotes(recipe.getNotes());
		clone.setPublished(true);
		return clone;
	}
	
}
