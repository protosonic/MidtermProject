<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<jsp:include page="bootstrapHead.jsp" />
<meta charset="UTF-8">
<title>Edit Meal Plan</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
		<form action="updateMealPlan.do" method=POST>
			<input type="hidden" name="mealPlanId" value="${mealPlan.id }"/>
			<input type="text" name="name" value="${mealPlan.name}">
			<input type="text" name="imageURL" value="${mealPlan.imageURL}">
				<img src="${mealPlan.imageURL}"  alt="Photo of ${mealPlan.name} "/>
			
			<div>
				<h3>Description</h3>
				<textarea name="directions">${mealPlan.description}</textarea>
			</div>
		
			<div>
				<h3>Notes</h3>
				<textarea name="notes">${mealPlan.notes}</textarea>
			</div>
		
			<input type="submit" value="Update Edited Recipe">
		
		</form>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>