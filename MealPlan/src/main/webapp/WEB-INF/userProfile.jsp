<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Account Details</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	

	<div class="container mt-5">
		<h1 class="mb-4">My Profile</h1>
		
	<div class="d-flex gap-3 mb-5">
		<form action="createNewRecipe.do" method="GET">
			<input type="submit" class="btn btn-primary" value="Add New Recipe">
		</form>
		<form action="createMealPlan.do" method="GET">
			<input type="submit" class="btn btn-secondary"
				value="Create New Meal Plan">
		</form>
	</div>

		<!-- Saved Recipes -->
				<div class="mb-5">
				  <h3 class="mb-3">My Saved Recipes</h3>
				  <div class="scrolling-recipes">
				    <c:forEach var="recipe" items="${loggedInUser.recipes}">
				      <c:if test="${recipe.enabled}">
				        <div class="scroll-card">
				          <div class="card h-100">
				            <img src="${recipe.imageURL}" class="card-img-top" alt="Photo of ${recipe.name}">
				            <div class="card-body">
				              <h5 class="card-title">
				                <a href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a>
				              </h5>
				            </div>
				          </div>
				        </div>
				      </c:if>
				    </c:forEach>
				  </div>
				</div>
				
					<!-- Saved Meal Plans -->
			<div class="mb-5">
			  <h3 class="mb-3">My Saved Meal Plans</h3>
			  <div class="scrolling-mealplans">
			    <c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
			      <c:if test="${mealPlan.enabled}">
			        <div class="scroll-card">
			          <div class="card h-100">
			            <c:choose>
			              <c:when test="${not empty mealPlan.imageURL}">
			                <img src="${mealPlan.imageURL}" class="card-img-top" alt="Photo of ${mealPlan.name}">
			              </c:when>
			              <c:otherwise>
			                <img src="images/MealPlanStock.jpg" class="card-img-top" alt="Stock Meal Plan Image">
			              </c:otherwise>
			            </c:choose>
			            <div class="card-body">
			              <a href="viewMealPlan.do?mealPlanId=${mealPlan.id}" class="card-title">${mealPlan.name}</a>
			            </div>
			          </div>
			        </div>
			      </c:if>
			    </c:forEach>
			  </div>
			</div>

				
			<!-- My Deleted Recipes -->
		<c:if test="${!recipe.enabled }">
			<div class="mb-5">
			  <h3 class="mb-3">My Deleted Recipes</h3>
			  <div class="scrolling-recipes">
			    <c:forEach var="recipe" items="${loggedInUser.recipes}">
			      <c:if test="${not recipe.enabled}">
			        <div class="scroll-card">
			          <div class="card h-100">
			            <img src="${recipe.imageURL}" class="card-img-top" alt="Photo of ${recipe.name}">
			            <div class="card-body">
			              <h5 class="card-title">
			                <a href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a>
			                <a class="btn btn-success" href="enableRecipe.do?recipeId=${recipe.id}">Enable</a>
			              </h5>
			            </div>
			          </div>
			        </div>
			      </c:if>
			    </c:forEach>
			  </div>
			</div>
		</c:if>
			
			<!-- My Deleted Meal Plans -->
		<c:if test="${!mealPlan.enabled }">
			<div class="mb-5">
			  <h3 class="mb-3">My Deleted Meal Plans</h3>
			  <div class="scrolling-mealplans">
			    <c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
			      <c:if test="${not mealPlan.enabled}">
			        <div class="scroll-card">
			          <div class="card h-100">
			            <c:choose>
			              <c:when test="${not empty mealPlan.imageURL}">
			                <img src="${mealPlan.imageURL}" class="card-img-top" alt="Photo of ${mealPlan.name}">
			              </c:when>
			              <c:otherwise>
			                <img src="images/MealPlanStock.jpg" class="card-img-top" alt="Stock Meal Plan Image">
			              </c:otherwise>
			            </c:choose>
			            <div class="card-body">
			              <a href="viewMealPlan.do?mealPlanId=${mealPlan.id}" class="card-title">${mealPlan.name}</a>
			              <a class="btn btn-success" href="enableMealPlan.do?mealPlanId=${mealPlan.id}">Enable</a>
			            </div>
			          </div>
			        </div>
			      </c:if>
			    </c:forEach>
			  </div>
			</div>
		</c:if>
	<!-- Add Recipe & Meal Plan Buttons -->

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>