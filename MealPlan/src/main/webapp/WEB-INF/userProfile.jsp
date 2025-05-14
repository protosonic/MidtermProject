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
		<div>
			<h3>My Saved Recipes</h3>
			<c:forEach var="recipe" items="${loggedInUser.recipes}">
				<div class="recipeListItem">
					<img class="recipeListImage" src="${recipe.imageURL}"
						alt="Photo of ${recipe.name } "> <a
						href="viewrecipe.do?recipeId=${recipe.id}"> ${recipe.name}</a>
					<c:if test="${not recipe.enabled}">
						<a class="btn btn-success"
							href="enableRecipe.do?recipeId=${recipe.id}">Enable</a>
					</c:if>
				</div>
			</c:forEach>
		</div>
		<div>
			<form action="createNewRecipe.do" method="GET">
				<input type="submit" value="Add New Recipe">
			</form>
		</div>
		<div>
			<form action="createMealPlan.do" method="GET">
				<input type="submit" value="Create New Meal Plan">
			</form>

		</div>
		<div>
			<h3>My Saved Meal Plans</h3>
			<c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
				<div class="mealPlanListItem">
					<img class="mealPlanListImage" src="${mealPlan.imageURL}"
						alt="Photo of ${mealPlan.name } "> <a
						href="viewMealPlan.do?mealPlanId=${mealPlan.id}"> ${mealPlan.name}</a>
					<c:if test="${not mealPlan.enabled}">
						<a class="btn btn-success"
							href="enableMealPlan.do?recipeId=${mealPlan.id}">Enable</a>
					</c:if>
				</div>
			</c:forEach>
		</div>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>