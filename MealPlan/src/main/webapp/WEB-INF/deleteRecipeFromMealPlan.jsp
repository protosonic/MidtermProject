<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="UTF-8">
<title>Delete Recipe From Meal Plan</title>
<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
<jsp:include page="nav.jsp"/>
<h2>Are you sure you want to delete ${recipe.name} from  ${mealPlan.name}?</h2>
<div>
					<form action="deleteRecipeFromMealPlan.do" method="POST">
						<input type="hidden" name="recipeId" value="${recipe.id}">
						<input type="hidden" name="mealPlanId" value="${mealPlan.id}">
						<input type="submit" name="id" value="Yes">
					</form>
				</div>
				<div>
					<form action="viewMealPlan.do" method="GET">
						<input type="submit" name="id" value="No">
					</form>
				</div>
<jsp:include page="bootstrapFoot.jsp"/>
</body> --%>
<head>
    <meta charset="UTF-8">
    <title>Delete Recipe From Meal Plan</title>
    <jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
    <jsp:include page="nav.jsp"/>

    <div class="container mt-5 text-center">
        <h2 class="mb-4">
            Are you sure you want to delete <strong>${recipe.name}</strong> from <strong>${mealPlan.name}</strong>?
        </h2>

        <div class="d-flex justify-content-center gap-3">
            <!-- YES Button -->
            <form action="deleteRecipeFromMealPlan.do" method="POST">
                <input type="hidden" name="recipeId" value="${recipe.id}">
                <input type="hidden" name="mealPlanId" value="${mealPlan.id}">
                <button type="submit" class="btn btn-danger">Yes, Delete</button>
            </form>

            <!-- NO Button -->
            <form action="viewMealPlan.do" method="GET">
                <input type="hidden" name="mealPlanId" value="${mealPlan.id}">
                <button type="submit" class="btn btn-secondary">No, Go Back</button>
            </form>
        </div>
    </div>

    <jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>