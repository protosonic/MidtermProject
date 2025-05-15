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
	<div class="row">
	<label for="name" class="col">Name</label>
	<input type="text" name="name" value="${recipe.name}" id="name" class="col">
	</div>
	<input type="text" name="imageURL" value="${recipe.imageURL}">
	<img src="${recipe.imageURL}" alt="Photo of ${recipe.name} " />
	<div class="row">
	<label for="isPublished" class="col">Allow Others to View Recipe?</label>
	<input type="checkbox" name="isPublished" value="true" id="isPublished" class="col" <c:if test='${recipe.published}'>checked</c:if>>
	<c:choose>
	<c:when test="${recipe.published }">
	</c:when>
	<c:otherwise>
	<!-- <input type="checkbox" name="published" value="false" id="published" class="col"> -->
	
	</c:otherwise>
	</c:choose>
	</div>
	<%-- <form action="publishedRecipe.do">
		<label ${recipe.published }> <input type="radio"
			name="published" value="true">Public <img
			src="images/publicIcon.png" alt="public Icon"> <input
			type="radio" name="published" value="false">Private <img
			src="images/privateIcon.png" alt="private Icon">
		</label>
	</form> --%>
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