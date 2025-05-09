package com.skilldistillery.mealplan.entities;

import java.time.LocalDateTime;
import java.util.Objects;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Recipe {
 @Id
 @GeneratedValue(strategy = GenerationType.IDENTITY)
 private int id;
 
 private String name;
 
 private String ingredients;
 
 @Column(name="image_url")
 private String imageURL;
 
 @Column(name="date_created")
 private LocalDateTime dateCreated;
 
 private String directions;
 
 @Column(name="date_updated")
 private LocalDateTime dateUpdated;
 
 private Boolean enabled;
 
 @Column(name="user_id")
 private int userId;
 
 private String notes;
 
 private Boolean published;

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

@Override
public String toString() {
	return "Recipe [id=" + id + ", name=" + name + ", ingredients=" + ingredients + ", imageURL=" + imageURL
			+ ", dateCreated=" + dateCreated + ", directions=" + directions + ", dateUpdated=" + dateUpdated
			+ ", enabled=" + enabled + ", userId=" + userId + ", notes=" + notes + ", published=" + published + "]";
}
 
 
}
