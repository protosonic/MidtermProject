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
		assertNotNull(recipe.getRecipeMealTimes());
		assertTrue(recipe.getRecipeMealTimes().size() > 0);
	}
	
	@Test
	void test_Recipe_Diet_ManyToMany_mapping() {
		assertNotNull(recipe.getRecipeDiets());
		assertNotNull(recipe.getRecipeDiets().size() > 0);
	}
	
	@Test
	void test_Recipe_Allergen_ManyToMany_mapping() {
		assertNotNull(recipe.getRecipeAllergens());
		assertTrue(recipe.getRecipeAllergens().size() > 0);
	}
	
	@Test
	void test_Recipe_RecipeRating_OneToMany_mapping() {
		assertNotNull(recipe.getRecipeRatings());
		assertTrue(recipe.getRecipeRatings().size() > 0);
	}
	
	@Test
	void test_Recipe_RecipeComment_OTM_mapping() {
		assertNotNull(recipe.getRecipeComments());
		assertTrue(recipe.getRecipeComments().size() > 0);
	}
	
	@Test
	void test_Recipe_RecipeImage_OTM_mapping() {
		assertNotNull(recipe.getRecipeImages());
		assertTrue(recipe.getRecipeImages().size() > 0);
	}
	
	@Test
	void test_Recipe_User_MTO_mapping() {
		assertNotNull(recipe.getUser());
	}
	
	@Test
	void test_Recipe_MealPlan_ManyToMany_mapping() {
		assertNotNull(recipe.getMealPlans());
		assertTrue(recipe.getMealPlans().size() > 0);
	}
	
	

}
