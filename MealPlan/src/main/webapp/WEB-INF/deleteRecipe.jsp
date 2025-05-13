<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete Recipe</title>
<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
<jsp:include page="nav.jsp"/>
<h2>Are you sure you want to delete ${recipe.name}?</h2>
<div>
					<form action="deleteRecipe.do" method="POST">
						<input type="hidden" name="recipeId" value="${recipe.id}">
						<input type="submit" name="id" value="Yes">
					</form>
				</div>
				<div>
					<form action="viewrecipe.do" method="GET">
						<input type="submit" name="id" value="No">
					</form>
				</div>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>