package com.skilldistillery.mealplan.data;

import com.skilldistillery.mealplan.entities.User;

public interface UserDAO {
	User authenticateUser(String username, String password);
	
	User createAccountForUser(String usesrName, String passWord, 
			String firstName, String lastName);
	

}
