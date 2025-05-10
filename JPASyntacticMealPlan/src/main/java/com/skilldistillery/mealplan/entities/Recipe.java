package com.skilldistillery.mealplan.entities;

import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.OneToMany;

@Entity
public class Recipe {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	private String name;

	private String ingredients;

	@Column(name = "image_url")
	private String imageURL;

	@Column(name = "date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;

	private String directions;

	@Column(name = "date_updated")
	@UpdateTimestamp
	private LocalDateTime dateUpdated;

	private Boolean enabled;

	@Column(name = "user_id")
	private int userId;

	private String notes;

	private Boolean published;

	@ManyToMany(mappedBy = "recipes")
	private List<MealPlan> mealPlans;

	@ManyToMany(mappedBy = "mealTimeRecipes")
	private List<MealTime> recipeMealTimes;

	@ManyToMany(mappedBy = "dietRecipes")
	private List<Diet> recipeDiets;

	@ManyToMany(mappedBy = "allergenRecipes")
	private List<Allergen> recipeAllergens;
	
	@OneToMany(mappedBy="recipe")
	private List<RecipeRating> recipeRatings;
	
	@OneToMany(mappedBy="recipe")
	private List<RecipeComment> recipeComments;
	
	public Recipe() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getIngredients() {
		return ingredients;
	}

	public void setIngredients(String ingredients) {
		this.ingredients = ingredients;
	}

	public String getImageURL() {
		return imageURL;
	}

	public void setImageURL(String imageURL) {
		this.imageURL = imageURL;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getDirections() {
		return directions;
	}

	public void setDirections(String directions) {
		this.directions = directions;
	}

	public LocalDateTime getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(LocalDateTime dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
	}

	public Boolean getPublished() {
		return published;
	}

	public void setPublished(Boolean published) {
		this.published = published;
	}

	public List<Diet> getRecipeDiets() {
		return recipeDiets;
	}

	public void setRecipeDiets(List<Diet> recipeDiets) {
		this.recipeDiets = recipeDiets;
	}

	public List<MealPlan> getMealPlans() {
		return mealPlans;
	}

	public void setMealPlans(List<MealPlan> mealPlans) {
		this.mealPlans = mealPlans;
	}

	public List<MealTime> getRecipeMealTimes() {
		return recipeMealTimes;
	}

	public void setRecipeMealTimes(List<MealTime> recipeMealTimes) {
		this.recipeMealTimes = recipeMealTimes;
	}
	
	public List<Allergen> getRecipeAllergens() {
		return recipeAllergens;
	}
	
	public void setRecipeAllergens(List<Allergen> recipeAllergens) {
		this.recipeAllergens = recipeAllergens;
	}

	public List<RecipeRating> getRecipeRatings() {
		return recipeRatings;
	}

	public void setRecipeRatings(List<RecipeRating> recipeRatings) {
		this.recipeRatings = recipeRatings;
	}

	public List<RecipeComment> getRecipeComments() {
		return recipeComments;
	}

	public void setRecipeComments(List<RecipeComment> recipeComments) {
		this.recipeComments = recipeComments;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		Recipe other = (Recipe) obj;
		return id == other.id;
	}

	public void addMealPlan(MealPlan mealPlan) {
		if (mealPlans == null) {
			mealPlans = new ArrayList<>();
		}
		if (!mealPlans.contains(mealPlan)) {
			mealPlans.add(mealPlan);
			mealPlan.addRecipe(this);
		}
	}

	public void removeMealPlan(MealPlan mealPlan) {
		if (mealPlans != null && mealPlans.contains(mealPlan)) {
			mealPlans.remove(mealPlan);
			mealPlan.removeRecipe(this);
		}
	}

	@Override
	public String toString() {
		return "Recipe [id=" + id + ", name=" + name + ", ingredients=" + ingredients + ", imageURL=" + imageURL
				+ ", dateCreated=" + dateCreated + ", directions=" + directions + ", dateUpdated=" + dateUpdated
				+ ", enabled=" + enabled + ", userId=" + userId + ", notes=" + notes + ", published=" + published + "]";
	}

}
