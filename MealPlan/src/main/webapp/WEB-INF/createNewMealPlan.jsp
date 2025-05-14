<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create New Meal Plan</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h1>Create New Meal Plan</h1>
	<form action="createMealPlan.do" method=POST>
		<input type="text" name="name" placeholder="Meal Plan Title"> <input
			type="text" name="imageURL" placeholder="Image URL">
		<div>
			<h3>Description</h3>
			<textarea name="description" placeholder="Description of Meal Plan"></textarea>
		</div>
		<div>
			<h3>Notes</h3>
			<textarea name="notes" placeholder="Meal Plan Notes"></textarea>
		</div>
		<input type="submit" value="Create New Meal Plan">
	</form>

	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>