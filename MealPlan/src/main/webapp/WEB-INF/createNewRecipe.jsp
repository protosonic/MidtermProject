<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Recipe</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h1>Create New Recipe</h1>
	<form action="createNewRecipe.do" method=POST>
		<input type="text" name="name" placeholder="Recipe Name"> 
		<input type="text" name="imageURL" placeholder="Image URL">
		<%-- <p>${recipe.published }</p> --%>
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
</body>
</html>