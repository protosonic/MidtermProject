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

class MealPlanTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private MealPlan mealPlan;

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
		mealPlan = em.find(MealPlan.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		mealPlan = null;
	}

	@Test
	void test_MealPlan_entity_mapping() {
		assertNotNull(mealPlan);
		assertNotNull(mealPlan.getName());
	}
	
	@Test
	void test_MealPlan_Recipe_ManyToMany_mapping() {
		assertNotNull(mealPlan);
		assertNotNull(mealPlan.getRecipes());
		assertTrue(mealPlan.getRecipes().size() > 0);
	}
	
	@Test
	void test_MealPlan_User_MTO_mapping() {
		assertNotNull(mealPlan);
		assertNotNull(mealPlan.getUser());
	}

}
