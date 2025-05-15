<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
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

		<c:forEach var="recipe" items="${mealPlan.recipes}">
			<img class="recipeListImage" src="${recipe.imageURL}"
				alt="Photo of ${recipe.name } ">
			<a href="viewrecipe.do?recipeId=${recipe.id}"> ${recipe.name}</a>
			<div>
				<form action="deleteRecipeFromMealPlan.do" method="GET">
					<input type="hidden" name="recipeId" value="${recipe.id}">
					<input type="hidden" name="mealPlanId" value="${mealPlan.id}">
					<input type="submit" name="id" value="Delete Recipe From Meal Plan">
				</form>
			</div>
		</c:forEach>

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
 --%>
<head>
    <meta charset="UTF-8">
    <title>View Meal Plan</title>
    <jsp:include page="bootstrapHead.jsp" />
</head>
<body>
    <jsp:include page="nav.jsp" />
    <div class="container mt-4">
        <h1 class="mb-3">${mealPlan.name}</h1>
        <img src="${mealPlan.imageURL}" alt="Photo of ${mealPlan.name}" class="img-fluid rounded shadow">
        <p><strong>Description:</strong></p>
        <pre class="bg-light p-3 rounded border">${mealPlan.description}</pre>

        <p><strong>Notes:</strong></p>
        <pre class="bg-light p-3 rounded border">${mealPlan.notes}</pre>

        <hr>

        <h3 class="mt-4">Recipes in this Meal Plan:</h3>

        <c:forEach var="recipe" items="${mealPlan.recipes}">
            <div class="row align-items-center my-4">
                <!-- Left: Image -->
                <div class="col-md-4">
                    <img src="${recipe.imageURL}" alt="Photo of ${recipe.name}" class="img-fluid rounded shadow">
                </div>

                <!-- Right: Info + Button -->
                <div class="col-md-8">
                    <h4>
                        <a href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a>
                    </h4>
                    <form action="deleteRecipeFromMealPlan.do" method="GET" class="mt-2">
                        <input type="hidden" name="recipeId" value="${recipe.id}">
                        <input type="hidden" name="mealPlanId" value="${mealPlan.id}">
                        <button type="submit" class="btn btn-outline-danger">Delete Recipe From Meal Plan</button>
                    </form>
                </div>
            </div>
            <hr>
        </c:forEach>

        <!-- Meal Plan Management Buttons -->
        <div class="mt-4">
            <form action="deleteMealPlan.do" method="GET" class="d-inline">
                <input type="hidden" name="mealPlanId" value="${mealPlan.id}">
                <button type="submit" class="btn btn-danger">Delete Meal Plan</button>
            </form>

            <form action="updateMealPlan.do" method="GET" class="d-inline ms-2">
                <input type="hidden" name="mealPlanId" value="${mealPlan.id}">
                <button type="submit" class="btn btn-primary">Update Meal Plan</button>
            </form>
        </div>
    </div>
    <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>