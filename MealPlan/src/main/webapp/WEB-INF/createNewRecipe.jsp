<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="UTF-8">
<title>Create New Recipe</title>
<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h1>Create New Recipe</h1>
	<form action="createNewRecipe.do" method=POST>
		<input type="text" name="name" placeholder="Recipe Name"> 
		<input type="text" name="imageURL" placeholder="Image URL">
		<p>${recipe.published }</p>
		<div>
			<h3>Ingredients</h3>
			<textarea name="ingredients" placeholder="Recipe Ingredients"></textarea>
		</div>
		<div>
			<h3>Directions</h3>
			<textarea name="directions" placeholder="Recipe Directions"></textarea>
		</div>
		<div>
			<h3>Notes</h3>
			<textarea name="notes" placeholder="Recipe Notes"></textarea>
		</div>
		<input type="submit" value="Create New Recipe">
	</form>
	<jsp:include page="bootstrapFoot.jsp" />
</body> --%>
<head>
    <meta charset="UTF-8">
    <title>Create New Recipe</title>
    <jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="container mt-5">
        <h1 class="mb-4">Create New Recipe</h1>

        <form action="createNewRecipe.do" method="POST">
            <!-- Recipe Name -->
            <div class="mb-3">
                <label for="name" class="form-label">Recipe Name</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Enter recipe name" required>
            </div>

            <!-- Image URL -->
            <div class="mb-3">
                <label for="imageURL" class="form-label">Image URL</label>
                <input type="text" class="form-control" name="imageURL" id="imageURL" placeholder="Enter image URL">
            </div>

            <!-- Ingredients -->
            <div class="mb-3">
                <label for="ingredients" class="form-label">Ingredients</label>
                <textarea class="form-control" name="ingredients" id="ingredients" rows="4" placeholder="List ingredients here"></textarea>
            </div>

            <!-- Directions -->
            <div class="mb-3">
                <label for="directions" class="form-label">Directions</label>
                <textarea class="form-control" name="directions" id="directions" rows="4" placeholder="Enter cooking directions here"></textarea>
            </div>

            <!-- Notes -->
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <textarea class="form-control" name="notes" id="notes" rows="3" placeholder="Any notes or tips?"></textarea>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn btn-primary">Create New Recipe</button>
        </form>
    </div>

    <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>