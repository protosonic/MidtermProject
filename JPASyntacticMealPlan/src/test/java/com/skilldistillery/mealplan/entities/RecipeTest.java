package com.skilldistillery.mealplan.entities;

import static org.junit.jupiter.api.Assertions.*;

import org.junit.jupiter.api.AfterAll;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeAll;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

class RecipeTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Recipe recipe;

	@BeforeAll
	static void setUpBeforeClass() throws Exception {
		emf = Persistence.createEntityManagerFactory("JPASyntacticMealPlan");
	}

	@AfterAll
	static void tearDownAfterClass() throws Exception {
		emf.close();
	}

	@BeforeEach
	void setUp() throws Exception {
		em = emf.createEntityManager();
		recipe = em.find(Recipe.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipe = null;
	}

	@Test
	void test_Recipe_entity_mapping() {
		assertNotNull(recipe);
		assertNotNull(recipe.getName());
	}
	
	@Test
	void test_Recipe_MealTime_ManyToMany_mapping() {
		assertNotNull(recipe);
		assertNotNull(recipe.getRecipeMealTimes());
	}
	
	@Test
	void test_Recipe_Diet_ManyToMany_mapping() {
		assertNotNull(recipe);
		assertNotNull(recipe.getRecipeDiets());
	}
	
	@Test
	void test_Recipe_Allergen_ManyToMany_mapping() {
		assertNotNull(recipe);
		assertNotNull(recipe.getRecipeAllergens());
	}
	
	@Test
	void test_Recipe_RecipeRating_OneToMany_mapping() {
		assertNotNull(recipe);
	}
	
	
	

}
