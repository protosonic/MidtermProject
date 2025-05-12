<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.name }Details</title>
<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<c:choose>
		<c:when test="${not empty recipe}">
			<h1>${recipe.name}</h1>
			<p><img src ="${recipe.imageURL}"alt = "Photo of ${recipe.name } "></p>
			<p>Date Published: ${recipe.dateCreated}</p>
			<p>Last Updated: ${recipe.dateUpdated}</p>
			<%-- <p>${recipe.published }</p> --%>
			
			<h3>Ingredients</h3>
			<!-- We need to add multiple ingredients and see hwo they populate -->
			<pre>
${recipe.ingredients}
			</pre>
			
			<div>
			<h3>Directions</h3>
			<pre>
${recipe.directions}
			</pre>
			</div>
			
			
			<div>
			<h3>Notes</h3>
			<p>${recipe.notes}</p>
			</div>
			
			<div>
				<form action="deleteRecipe.do" method="GET">
					<input type="hidden" name="id" value="${recipe.id }">
					<input type="submit" name="recipeId" value="Delete Recipe">
				</form>
			</div>
			
			

		</c:when>
		<c:otherwise>
			<h2>Error: User input not found in the database</h2>
		</c:otherwise>
	</c:choose>
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>