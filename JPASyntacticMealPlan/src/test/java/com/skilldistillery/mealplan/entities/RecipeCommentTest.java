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

class RecipeCommentTest {
	
	private static EntityManagerFactory emf;
	private EntityManager em;
	private RecipeComment recipeComment;

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
		recipeComment = em.find(RecipeComment.class, 1);
	}

	@AfterEach
	void tearDown() throws Exception {
		em.close();
		recipeComment = null;
	}

	@Test
	void test_RecipeComment_entity_mapping() {
		assertNotNull(recipeComment);
	}
	
	@Test
	void test_RecipeComment_MTO_self_join_reply_mapping() {
//		assertNotNull(recipeComment.getReply());
	}
	
	@Test
	void test_RecipeComment_OTM_self_join__replies_mapping() {
		assertNotNull(recipeComment);
		assertNotNull(recipeComment.getReplies());
	}
	
	@Test
	void test_RecipeComment_Recipe_MTO_mapping() {
		assertNotNull(recipeComment.getRecipe());
	}
	
	@Test
	void test_RecipeComment_User_MTO_mapping() {
		assertNotNull(recipeComment.getUser());
	}
	

}
