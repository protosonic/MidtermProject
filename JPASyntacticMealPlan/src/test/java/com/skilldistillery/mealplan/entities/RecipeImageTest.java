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

class RecipeImageTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeImage recipeImage;

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
		recipeImage = em.find(RecipeImage.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipeImage = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(recipeImage);
	}
	

}
