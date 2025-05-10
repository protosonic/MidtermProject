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

class AllergenTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private Allergen allergen;

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
		allergen = em.find(Allergen.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		allergen = null;
	}

	@Test
	void test_User_entity_mapping() {
		assertNotNull(allergen);
		assertNotNull(allergen.getName());
	}
	@Test
	void test_Allergen_Recipe_ManyToMany_mapping() {
		assertNotNull(allergen);
		assertNotNull(allergen.getAllergenRecipes());
	}

}
