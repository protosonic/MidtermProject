<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
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
 --%>
<head>
	<jsp:include page="bootstrapHead.jsp" />
	<meta charset="UTF-8">
	<title>Edit Meal Plan</title>
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div class="container mt-5">
		<h2 class="mb-4">Edit Meal Plan: <strong>${mealPlan.name}</strong></h2>

		<form action="updateMealPlan.do" method="POST" class="needs-validation">
			<input type="hidden" name="mealPlanId" value="${mealPlan.id}" />

			<div class="mb-3">
				<label for="name" class="form-label">Meal Plan Name</label>
				<input type="text" class="form-control" name="name" id="name" value="${mealPlan.name}" required>
			</div>

			<div class="mb-3">
				<label for="imageURL" class="form-label">Image URL</label>
				<input type="text" class="form-control" name="imageURL" id="imageURL" value="${mealPlan.imageURL}">
				<c:if test="${not empty mealPlan.imageURL}">
					<div class="mt-2">
						<img src="${mealPlan.imageURL}" alt="Photo of ${mealPlan.name}" class="img-fluid rounded" style="max-width: 300px;">
					</div>
				</c:if>
			</div>

			<div class="mb-3">
				<label for="description" class="form-label">Description</label>
				<textarea class="form-control" name="description" id="description" rows="4">${mealPlan.description}</textarea>
			</div>

			<div class="mb-3">
				<label for="notes" class="form-label">Notes</label>
				<textarea class="form-control" name="notes" id="notes" rows="3">${mealPlan.notes}</textarea>
			</div>

			<div class="d-grid gap-2 mt-4">
				<button type="submit" class="btn btn-primary">Update Meal Plan</button>
			</div>
		</form>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
</body>