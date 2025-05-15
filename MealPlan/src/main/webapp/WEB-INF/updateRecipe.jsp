<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
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
	
	<form action="publishedRecipe.do">
		<label ${recipe.published }> <input type="radio"
			name="published" value="true">Public <img
			src="images/publicIcon.png" alt="public Icon"> <input
			type="radio" name="published" value="false">Private <img
			src="images/privateIcon.png" alt="private Icon">
		</label>
	</form>
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
</html> --%>

<head>
	<jsp:include page="bootstrapHead.jsp" />
	<meta charset="UTF-8">
	<title>Edit Recipe</title>
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div class="container mt-5">
		<c:choose>
			<c:when test="${not empty cloningRecipe}">
				<h3 class="mb-4">Cloning Recipe: <strong>${cloningRecipe.name}</strong></h3>
				<c:set var="recipe" value="${cloningRecipe}" scope="page" />
				<form action="saveRecipe.do" method="POST" class="needs-validation">
			</c:when>
			<c:otherwise>
				<h3 class="mb-4">Editing Recipe: <strong>${recipe.name}</strong></h3>
				<form action="updateRecipe.do" method="POST" class="needs-validation">
			</c:otherwise>
		</c:choose>

			<input type="hidden" name="recipeId" value="${recipe.id}" />

			<div class="mb-3">
				<label for="name" class="form-label">Recipe Name</label>
				<input type="text" class="form-control" name="name" id="name" value="${recipe.name}" required>
			</div>

			<div class="mb-3">
				<label for="imageURL" class="form-label">Image URL</label>
				<input type="text" class="form-control" name="imageURL" id="imageURL" value="${recipe.imageURL}">
				<%-- <c:if test="${not empty recipe.imageURL}">
					<div class="mt-2">
						<img src="${recipe.imageURL}" alt="Photo of ${recipe.name}" class="img-fluid rounded" style="max-width: 300px;">
					</div>
				</c:if> --%>
			</div>
		<div class="row">
			<label for="isPublished" class="col">Make this recipe public</label> 
				<input type="checkbox" name="isPublished" value="true"
				id="isPublished" class="col"
				<c:if test='${recipe.published}'>checked</c:if>>
			<c:choose>
				<c:when test="${recipe.published }"></c:when>
				
				<c:otherwise>
					<!-- <input type="checkbox" name="published" value="false" id="published" class="col"> -->
				</c:otherwise>
			</c:choose>
		</div>

		<div class="mb-3">
				<label for="ingredients" class="form-label">Ingredients</label>
				<textarea class="form-control" name="ingredients" id="ingredients" rows="4">${recipe.ingredients}</textarea>
			</div>

			<div class="mb-3">
				<label for="directions" class="form-label">Directions</label>
				<textarea class="form-control" name="directions" id="directions" rows="4">${recipe.directions}</textarea>
			</div>

			<div class="mb-3">
				<label for="notes" class="form-label">Notes</label>
				<textarea class="form-control" name="notes" id="notes" rows="3">${recipe.notes}</textarea>
			</div>

			<div class="d-grid gap-2 mt-4">
				<c:choose>
					<c:when test="${not empty cloningRecipe}">
						<button type="submit" class="btn btn-success">Save Cloned Recipe</button>
					</c:when>
					<c:otherwise>
						<button type="submit" class="btn btn-primary">Update Recipe</button>
					</c:otherwise>
				</c:choose>
			</div>
		</form>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
</body>