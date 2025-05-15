<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
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
</body> --%>

<head>
    <meta charset="UTF-8">
    <title>${recipe.name} Details</title>
    <jsp:include page="bootstrapHead.jsp" />
</head>
<body>
    <jsp:include page="nav.jsp" />
    <div class="container mt-4">
        <c:choose>
            <c:when test="${not empty recipe}">
                <div class="row">
                    <!-- Left Column: Image + Buttons -->
                    <div class="col-md-5 d-flex flex-column align-items-stretch">
                        <img src="${recipe.imageURL}" alt="Photo of ${recipe.name}" class="w-100 rounded shadow mb-3">

                        <c:if test="${not empty sessionScope.loggedInUser }">
                            <div class="d-grid gap-2">
                                <form action="deleteRecipe.do" method="GET" class="mb-2">
                                    <input type="hidden" name="recipeId" value="${recipe.id}">
                                    <button type="submit" class="btn btn-danger w-100">Delete Recipe</button>
                                </form>
                                <form action="updateRecipe.do" method="GET" class="mb-2">
                                    <input type="hidden" name="recipeId" value="${recipe.id}">
                                    <button type="submit" class="btn btn-primary w-100">Edit Recipe</button>
                                </form>
                                <form action="saveRecipe.do" method="GET" class="mb-2">
                                    <input type="hidden" name="recipeId" value="${recipe.id}">
                                    <button type="submit" class="btn btn-success w-100">Save Recipe</button>
                                </form>
                                <form action="addRecipeToMealPlan.do" method="POST" class="mb-0">
                                    <input type="hidden" name="recipeId" value="${recipe.id}">
                                    <select class="form-select mb-2" name="mealPlanId" required>
                                        <c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
                                            <option value="${mealPlan.id}">${mealPlan.name}</option>
                                        </c:forEach>
                                    </select>
                                    <button type="submit" class="btn btn-warning w-100">Add to Meal Plan</button>
                                </form>
                            </div>
                        </c:if>
                    </div>

                    <!-- Right Column: Recipe Details -->
                    <div class="col-md-7">
                        <h1>${recipe.name}</h1>
                        <p><strong>Date Published:</strong> ${recipe.dateCreated}</p>
                        <p><strong>Last Updated:</strong> ${recipe.dateUpdated}</p>

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
                        <pre class="bg-light p-3 rounded border">${recipe.ingredients}</pre>

                        <h3>Directions</h3>
                        <pre class="bg-light p-3 rounded border">${recipe.directions}</pre>

                        <h3>Notes</h3>
                        <p>${recipe.notes}</p>
                    </div>
                </div>
            </c:when>
            <c:otherwise>
                <h2 class="text-danger">Error: Recipe not found in the database</h2>
            </c:otherwise>
        </c:choose>
    </div>
    <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>