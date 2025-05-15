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
	<h1>My Profile</h1>

	<div>
		<h3>My Saved Recipes</h3>
		<c:forEach var="recipe" items="${loggedInUser.recipes}">
			<c:if test="${recipe.enabled}">
				<div class="recipeListItem">
					<img class="recipeListImage" src="${recipe.imageURL}"
						alt="Photo of ${recipe.name}" /> <a
						href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a>
				</div>
			</c:if>
		</c:forEach>

		<h3>My Deleted Recipes</h3>
		<c:forEach var="recipe" items="${loggedInUser.recipes}">
			<c:if test="${not recipe.enabled}">
				<div class="recipeListItem">
					<img class="recipeListImage" src="${recipe.imageURL}"
						alt="Photo of ${recipe.name}" /> <a
						href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a> <a
						class="btn btn-success"
						href="enableRecipe.do?recipeId=${recipe.id}">Enable</a>
				</div>
			</c:if>
		</c:forEach>

		<form action="createNewRecipe.do" method="GET">
			<input type="submit" value="Add New Recipe" />
		</form>
	</div>

	<div>
		<h3>My Meal Plans</h3>
		<c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
			<c:if test="${mealPlan.enabled}">
				<div class="mealPlanListItem">
					<img class="mealPlanListImage"
						src="<c:choose>
								<c:when test='${not empty mealPlan.imageURL}'>
									${mealPlan.imageURL}
								</c:when>
								<c:otherwise>
									images/MealPlanStock.jpg
								</c:otherwise>
							  </c:choose>"
						alt="Photo of ${mealPlan.name}" /> <a
						href="viewMealPlan.do?mealPlanId=${mealPlan.id}">${mealPlan.name}</a>
				</div>
			</c:if>
		</c:forEach>

		<h3>My Deleted Meal Plans</h3>
		<c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
			<c:if test="${not mealPlan.enabled}">
				<div class="mealPlanListItem">
					<img class="mealPlanListImage"
						src="<c:choose>
								<c:when test='${not empty mealPlan.imageURL}'>
									${mealPlan.imageURL}
								</c:when>
								<c:otherwise>
									images/MealPlanStock.jpg
								</c:otherwise>
							  </c:choose>"
						alt="Photo of ${mealPlan.name}" /> <a
						href="viewMealPlan.do?mealPlanId=${mealPlan.id}">${mealPlan.name}</a>
					<a class="btn btn-success"
						href="enableMealPlan.do?recipeId=${mealPlan.id}">Enable</a>
				</div>
			</c:if>
		</c:forEach>

		<form action="createMealPlan.do" method="GET">
			<input type="submit" value="Create New Meal Plan" />
		</form>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>