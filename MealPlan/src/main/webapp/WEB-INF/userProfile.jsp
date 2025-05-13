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
				<img class="recipeListImage" src="${recipe.imageURL}" alt="Photo of ${recipe.name } ">
				<a href="viewrecipe.do?recipeId=${recipe.id}"> ${recipe.name}</a>
				<c:if test="${not recipe.enabled}">
				<a class="btn btn-success" href="enableRecipe.do?recipeId=${recipe.id}">Enable</a>
				</c:if>
				</div>
			</c:forEach>
		</div>
		<div>
			<form action="createNewRecipe.do" method="GET">
				<input type="submit" value="Add New Recipe">
			</form>
		</div>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>