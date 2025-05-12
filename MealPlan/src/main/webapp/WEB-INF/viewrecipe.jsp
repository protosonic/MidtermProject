<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${recipe.name }Details</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<c:choose>
		<c:when test="${not empty recipe}">
			<h1>${recipe.name}</h1>
			<p>${recipe.imageURL}</p>
			<p>${recipe.dateCreated}</p>
			<p>${recipe.dateUpdated}</p>
			<%-- <p>${recipe.published }</p> --%>

			<h3>Ingredients</h3>
			<!-- We need to add multiple ingredients and see hwo they populate -->
			<ul>
				<li>${recipe.ingredients}</li>
			</ul>
			
			<div>
			<h3>Directions</h3>
			<p>${recipe.directions}</p>
			</div>
			
			<div>
			<h3>Notes</h3>
			<p>${recipe.notes}</p>
			</div>

		</c:when>
		<c:otherwise>
			<h2>Error: User input not found in the database</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>