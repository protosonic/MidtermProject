<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Meal Plan</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h1>View ${mealPlan.name }</h1>
	<pre>${mealPlan.description }</pre>
	<pre>${mealPlan.notes }</pre>
	<div>
		<ol>
			<%-- <c:forEach var="recipe" items="${listOfRecipes}"> --%>
			<c:forEach var="recipe" items="${mealPlan.recipes}">
				<li><a href="viewrecipe.do?recipeId=${recipe.id}">
						${recipe.name}</a></li>
			</c:forEach>
		</ol>
	</div>
	<div>
		<form action="deleteMealPlan.do" method="GET">
			<input type="hidden" name="mealPlanId" value="${mealPlan.id}">
			<input type="submit" name="id" value="Delete Meal Plan">
		</form>
	</div>
		<div>
		<form action="updateMealPlan.do" method="GET">
			<input type="hidden" name="mealPlanId" value="${mealPlan.id}">
			<input type="submit" name="id" value="Update Meal Plan">
		</form>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>