<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta charset="UTF-8">
<title>View All Recipes</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div>
		
			<c:forEach var="recipe" items="${listOfRecipes}">
			<img class="recipeListImage" src="${recipe.imageURL}"
						alt="Photo of ${recipe.name } "> <a
						href="viewrecipe.do?recipeId=${recipe.id}"> ${recipe.name}</a>
				<a href="viewrecipe.do?recipeId=${recipe.id}">
						${recipe.name}</a>
			
			</c:forEach>

	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html> --%>
<head>
<meta charset="UTF-8">
<title>View All Recipes</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div class="container mt-4">
		<div class="row">
			<c:forEach var="recipe" items="${listOfRecipes}">
				<div class="col-md-4 recipe-card">
					<div class="card h-100">
						<img src="${recipe.imageURL}" class="card-img-top recipe-image" alt="Photo of ${recipe.name}">
						<div class="card-body">
							<h5 class="card-title">
								<a href="viewrecipe.do?recipeId=${recipe.id}" class="text-decoration-none">
									${recipe.name}
								</a>
							</h5>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>