package com.skilldistillery.mealplan.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name = "recipe_image")
public class RecipeImage {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "image_url")
	private String imageUrl;

	@Column(name = "date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;

	private String caption;

//	@Column(name = "recipe_id")
//	private int recipeId;

	@ManyToOne
	@JoinColumn(name = "recipe_id")
	private Recipe recipe;

	public RecipeImage() {
		super();
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getImageUrl() {
		return imageUrl;
	}

	public void setImageUrl(String imageUrl) {
		this.imageUrl = imageUrl;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public String getCaption() {
		return caption;
	}

	public void setCaption(String caption) {
		this.caption = caption;
	}

//	public int getRecipeId() {
//		return recipeId;
//	}
//
//	public void setRecipeId(int recipeId) {
//		this.recipeId = recipeId;
//	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
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
		RecipeImage other = (RecipeImage) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return "RecipeImage [id=" + id + ", imageUrl=" + imageUrl + ", dateCreated=" + dateCreated + ", caption="
				+ caption + "]";
	}

}
