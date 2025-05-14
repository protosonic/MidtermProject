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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.JoinTable;
import jakarta.persistence.ManyToMany;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="meal_plan")
public class MealPlan {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
//	@Column(name="user_id")
//	private int userId;
	
	private String name;
	
	private Boolean enabled;
	
	private String description;
	
	private String notes;
	
	@Column(name="image_url")
	private String imageURL;
	
	@Column(name="date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;
	
	@Column(name="date_updated")
	@UpdateTimestamp
	private LocalDateTime dateUpdated;
	
	private Boolean published;
	
	@ManyToMany
	@JoinTable(name = "recipe_has_meal_plan", joinColumns = @JoinColumn(name = "meal_plan_id"), 
	inverseJoinColumns = @JoinColumn(name = "recipe_id"))
	private List<Recipe> recipes;
	
	@ManyToOne
	@JoinColumn(name = "user_id")
	private User user;

	public MealPlan() {
		super();
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
		MealPlan other = (MealPlan) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

//	public int getUserId() {
//		return userId;
//	}
//
//	public void setUserId(int userId) {
//		this.userId = userId;
//	}

	public String getName() {
		return name;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getNotes() {
		return notes;
	}

	public void setNotes(String notes) {
		this.notes = notes;
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

	public LocalDateTime getDateUpdated() {
		return dateUpdated;
	}

	public void setDateUpdated(LocalDateTime dateUpdated) {
		this.dateUpdated = dateUpdated;
	}

	public Boolean getPublished() {
		return published;
	}

	public void setPublished(Boolean published) {
		this.published = published;
	}

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
	}
	
	public void addRecipe(Recipe recipe) {
		if (recipes == null) {
			recipes = new ArrayList<>();
		}
		if (!recipes.contains(recipe)) {
			recipes.add(recipe);
			recipe.addMealPlan(this);
		}
	}

	public void removeRecipe(Recipe recipe) {
		if (recipes != null && recipes.contains(recipe)) {
			recipes.remove(recipe);
			recipe.removeMealPlan(this);
		}
	}

	@Override
	public String toString() {
		return "MealPlan [id=" + id + ", name=" + name + ", enabled=" + enabled
				+ ", description=" + description + ", notes=" + notes + ", imageUrl=" + imageURL + ", dateCreated="
				+ dateCreated + ", dateUpdated=" + dateUpdated + ", published=" + published + "]";
	}
	
	
	
	
	

	
	

}
