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
		<h3>My Saved Recipes</h3>
		<ol>
			<c:forEach var="recipe" items="${loggedInUser.recipes}">
				<li><a href="viewrecipe.do?recipeId=${recipe.id}">
						${recipe.name}</a></li>
			</c:forEach>
		</ol>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>