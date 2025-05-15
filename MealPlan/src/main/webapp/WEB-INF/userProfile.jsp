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
<%-- <body>
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
</html> --%>

<body>
  <jsp:include page="nav.jsp" />
  
  <div class="container mt-5">
    <h1 class="mb-4">My Profile</h1>

    <!-- Saved Recipes -->
    <div class="mb-5">
      <h3 class="mb-3">My Saved Recipes</h3>
      <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach var="recipe" items="${loggedInUser.recipes}">
          <div class="col">
            <div class="card h-100">
              <img src="${recipe.imageURL}" class="card-img-top" alt="Photo of ${recipe.name}">
              <div class="card-body">
                <h5 class="card-title">
                  <a href="viewrecipe.do?recipeId=${recipe.id}">${recipe.name}</a>
                </h5>
                <c:if test="${not recipe.enabled}">
                  <a class="btn btn-sm btn-success" href="enableRecipe.do?recipeId=${recipe.id}">Enable</a>
                </c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>

    <!-- Add Recipe & Meal Plan Buttons -->
    <div class="d-flex gap-3 mb-5">
      <form action="createNewRecipe.do" method="GET">
        <input type="submit" class="btn btn-primary" value="Add New Recipe">
      </form>
      <form action="createMealPlan.do" method="GET">
        <input type="submit" class="btn btn-secondary" value="Create New Meal Plan">
      </form>
    </div>

    <!-- Saved Meal Plans -->
    <div>
      <h3 class="mb-3">My Saved Meal Plans</h3>
      <div class="row row-cols-1 row-cols-md-2 g-4">
        <c:forEach var="mealPlan" items="${loggedInUser.mealPlans}">
          <div class="col">
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
                <h5 class="card-title">
                  <a href="viewMealPlan.do?mealPlanId=${mealPlan.id}">${mealPlan.name}</a>
                </h5>
                <c:if test="${not mealPlan.enabled}">
                  <a class="btn btn-sm btn-success" href="enableMealPlan.do?recipeId=${mealPlan.id}">Enable</a>
                </c:if>
              </div>
            </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>

  <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>