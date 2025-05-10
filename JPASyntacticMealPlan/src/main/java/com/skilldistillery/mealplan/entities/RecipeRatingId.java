package com.skilldistillery.mealplan.entities;

import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;

@Embeddable
public class RecipeRatingId {
	private static final long serialVersionUID = 1L;

	@Column(name = "recipe_id")
	private int recipeId;

	@Column(name = "user_id")
	private int userId;

	public RecipeRatingId() {
		super();
	}
	public RecipeRatingId(int recipeId, int userId) {
		super();
		this.recipeId = recipeId;
		this.userId = userId;
	}
	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}


	@Override
	public int hashCode() {
		return Objects.hash(recipeId, userId);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		RecipeRatingId other = (RecipeRatingId) obj;
		return recipeId == other.recipeId && userId == other.userId;
	}

	@Override
	public String toString() {
		return "RecipeRating [recipeId=" + recipeId + ", userId=" + userId + "]";
	}
	
	
	// Getters/setters, ctors, toString, equals/hashCode

}
