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
			<c:forEach var="recipe" items="${list}">
				<h1>${recipe.name }</h1>
				<p>${recipe.imageURL }</p>

				<h3>Ingredients</h3>
				<ul>
					<li>${recipe.ingredients }</li>
				</ul>
			</c:forEach>
		</c:when>
		<c:otherwise>
			<h2>Error: User input not found in the database</h2>
		</c:otherwise>
	</c:choose>
</body>
</html>