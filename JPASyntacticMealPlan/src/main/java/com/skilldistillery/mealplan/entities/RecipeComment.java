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
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "recipe_comment")
public class RecipeComment {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(name = "recipe_id")
	private int recipeId;

	private String comment;

	private Boolean enabled;

	@Column(name = "date_created")
	@CreationTimestamp
	private LocalDateTime dateCreated;

	@Column(name = "user_id")
	private int userId;

	@ManyToOne
	@JoinColumn(name = "in_reply_to_id")
	private RecipeComment reply;

	@OneToMany(mappedBy = "reply")
	private List<RecipeComment> replies;
	
	@ManyToOne
	@JoinColumn(name = "RecipeComment")
	private Recipe recipe;

	public RecipeComment() {
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
		RecipeComment other = (RecipeComment) obj;
		return id == other.id;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRecipeId() {
		return recipeId;
	}

	public void setRecipeId(int recipeId) {
		this.recipeId = recipeId;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public Boolean getEnabled() {
		return enabled;
	}

	public void setEnabled(Boolean enabled) {
		this.enabled = enabled;
	}

	public LocalDateTime getDateCreated() {
		return dateCreated;
	}

	public void setDateCreated(LocalDateTime dateCreated) {
		this.dateCreated = dateCreated;
	}

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public RecipeComment getReply() {
		return reply;
	}

	public void setReply(RecipeComment reply) {
		this.reply = reply;
	}

	public List<RecipeComment> getReplies() {
		return replies;
	}

	public void setReplies(List<RecipeComment> replies) {
		this.replies = replies;
	}

	public Recipe getRecipe() {
		return recipe;
	}

	public void setRecipe(Recipe recipe) {
		this.recipe = recipe;
	}

}
