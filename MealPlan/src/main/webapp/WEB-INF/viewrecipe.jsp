<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.name }Details</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	<c:choose>
		<c:when test="${not empty recipe}">
			<h1>${recipe.name}</h1>
			<p>
				<img src="${recipe.imageURL}" alt="Photo of ${recipe.name } ">
			</p>
			<p>Date Published: ${recipe.dateCreated}</p>
			<p>Last Updated: ${recipe.dateUpdated}</p>
			<c:choose>
				<c:when test="${not recipe.published }">
					<p>
						<img src="images/privateIcon.png" alt="Private Icon" class="published-icon"><span>Private</span>
					</p>
				</c:when>
				<c:otherwise>
					<p>
						<img src="images/publicIcon.png" alt="Public Icon" class="published-icon"><span>Public</span>
					</p>
				</c:otherwise>
			</c:choose>

			<h3>Ingredients</h3>
			<!-- We need to add multiple ingredients and see hwo they populate -->
			<pre>${recipe.ingredients}</pre>

			<div>
				<h3>Directions</h3>
				<pre>${recipe.directions}</pre>
			</div>


			<div>
				<h3>Notes</h3>
				<p>${recipe.notes}</p>
			</div>

			<c:if test="${not empty sessionScope.loggedInUser }">
				<div>
					<form action="deleteRecipe.do" method="GET">
						<input type="hidden" name="recipeId" value="${recipe.id}">
						<input type="submit" name="id" value="Delete Recipe">
					</form>
				</div>
				<div>
					<form action="updateRecipe.do" method="GET">
						<input type="hidden" name="recipeId" value="${recipe.id}">
						<input type="submit" name="id" value="Edit Recipe">
					</form>
				</div>
				<div>
					<form action="saveRecipe.do" method="GET">
						<input type="hidden" name="recipeId" value="${recipe.id}">
						<input type="submit" value="Save Recipe">
					</form>
				</div>
				<div>
					<form action="addRecipeToMealPlan.do" method="POST">
						<input type="hidden" name="recipeId" value="${recipe.id}">

						<select name="mealPlanId">
							<c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
								<option value="${mealPlan.id}">${mealPlan.name}</option>
							</c:forEach>
						</select> <input type="submit" value="Add Recipe to an Existing Meal Plan">
					</form>


					<div class="dropdown"></div>
				</div>
			</c:if>

		</c:when>
		<c:otherwise>
			<h2>Error: User input not found in the database</h2>
		</c:otherwise>
	</c:choose>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>