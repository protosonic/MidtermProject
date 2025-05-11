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

class UserTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private User user;

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
		user = em.find(User.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		user = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(user);
		assertEquals("admin", user.getUsername());
		assertEquals("test", user.getPassword());
	}
	
	@Test
	void test_User_RecipeRating_OneToMany_mapping() {
		assertNotNull(user);
		assertNotNull(user.getRecipeRatings());
		assertTrue(user.getRecipeRatings().size() > 0);
	}
	
	@Test
	void test_User_MealPlan_OneToMany_mapping() {
		assertNotNull(user);
		assertNotNull(user.getMealPlans());
		assertTrue(user.getMealPlans().size() > 0);
	}
	
	@Test
	void test_User_RecipeComment_OTM_mapping() {
//		assertNotNull(user);
//		assertNotNull(user.getRecipeComments());
//		assertTrue(user.getRecipeComments().size() > 0);

	}
	
	@Test
	void test_User_Recipe_OTM_mapping() {
		assertNotNull(user);
		assertNotNull(user.getRecipes());
		assertTrue(user.getRecipes().size() > 0);
	}

}
