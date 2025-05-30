package com.skilldistillery.mealplan.entities;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class User {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	private String username;
	
	private String password;
	
	private Boolean enabled;
	
	private String role;
	
	@Column(name="first_name")
	private String firstName;
	
	@Column(name="last_name")
	private String lastName;
	
	private String biography;
	
	@Column(name="date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;
	
	@Column(name="profile_image_url")
	private String profileImageURL;
	
	@OneToMany(mappedBy="user")
	private List<RecipeRating> recipeRatings;
	
	@OneToMany(mappedBy="user")
	private List<MealPlan> mealPlans;
	
	@OneToMany(mappedBy="user")
	private List<RecipeComment> recipeComments;
	
	@OneToMany(mappedBy="user")
	private List<Recipe> recipes;
	
	public User() {
		super();
	}
	
	public List<RecipeComment> getRecipeComments() {
		return recipeComments;
	}

	public void setRecipeComments(List<RecipeComment> recipeComments) {
		this.recipeComments = recipeComments;
	}

	public List<MealPlan> getMealPlans() {
		return mealPlans;
	}

	public void setMealPlans(List<MealPlan> mealPlans) {
		this.mealPlans = mealPlans;
	}


	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getBiography() {
		return biography;
	}

	public void setBiography(String biography) {
		this.biography = biography;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getProfileImageURL() {
		return profileImageURL;
	}

	public void setProfileImageURL(String profileImageURL) {
		this.profileImageURL = profileImageURL;
	}

	public List<RecipeRating> getRecipeRatings() {
		return recipeRatings;
	}

	public void setRecipeRatings(List<RecipeRating> recipeRatings) {
		this.recipeRatings = recipeRatings;
	}

	public List<Recipe> getRecipes() {
		return recipes;
	}

	public void setRecipes(List<Recipe> recipes) {
		this.recipes = recipes;
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
		User other = (User) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", username=" + username + ", password=" + password + ", enabled=" + enabled
				+ ", role=" + role + "]";
	}
	
	

}
