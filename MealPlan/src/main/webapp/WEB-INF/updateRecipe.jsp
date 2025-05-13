<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Edit Recipe</title>
</head>
<body>
	<jsp:include page="nav.jsp" />

	<c:choose>
		<c:when test="${not empty cloningRecipe }">
			<h3>Cloning Recipe ${cloningRecipe.name}</h3>
			<c:set var="recipe" value="${cloningRecipe}" scope="page" />
			<form action="saveRecipe.do" method=POST>
		</c:when>
		<c:otherwise>
			<form action="updateRecipe.do" method=POST>
		</c:otherwise>
	</c:choose>
	<input type="hidden" name="recipeId" value="${recipe.id }" />
	<input type="text" name="name" value="${recipe.name}">
	<input type="text" name="imageURL" value="${recipe.imageURL}"
		<img src="${recipe.imageURL}" alt="Photo of ${recipe.name} "/>>
	<!-- How will it atuomatically update the date? -->

	<%-- <p>${recipe.published }</p> --%>
	<div>
		<h3>Ingredients</h3>
		<textarea name="ingredients">${recipe.ingredients}</textarea>
	</div>

	<div>
		<h3>Directions</h3>
		<textarea name="directions">${recipe.directions}</textarea>
	</div>


	<div>
		<h3>Notes</h3>
		<textarea name="notes">${recipe.notes}</textarea>
	</div>
	<c:choose>
		<c:when test="${not empty cloningRecipe }">
			<input type="submit" value="Save Recipe">
		</c:when>
		<c:otherwise>

	<input type="submit" value="Update Edited Recipe">
		</c:otherwise>
	</c:choose>
	</form>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>