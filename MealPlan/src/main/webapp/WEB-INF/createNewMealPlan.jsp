<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
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
</body> --%>
<head>
    <meta charset="UTF-8">
    <title>Create New Meal Plan</title>
    <jsp:include page="bootstrapHead.jsp" />
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="container mt-5">
        <h1 class="mb-4">Create New Meal Plan</h1>

        <form action="createMealPlan.do" method="POST">
            <!-- Title -->
            <div class="mb-3">
                <label for="name" class="form-label">Meal Plan Title</label>
                <input type="text" class="form-control" name="name" id="name" placeholder="Enter meal plan title" required>
            </div>

            <!-- Image URL -->
            <div class="mb-3">
                <label for="imageURL" class="form-label">Image URL</label>
                <input type="text" class="form-control" name="imageURL" id="imageURL" placeholder="Enter image URL">
            </div>

            <!-- Description -->
            <div class="mb-3">
                <label for="description" class="form-label">Description</label>
                <textarea class="form-control" name="description" id="description" rows="4" placeholder="Describe this meal plan"></textarea>
            </div>

            <!-- Notes -->
            <div class="mb-3">
                <label for="notes" class="form-label">Notes</label>
                <textarea class="form-control" name="notes" id="notes" rows="4" placeholder="Any additional notes?"></textarea>
            </div>

            <!-- Submit -->
            <button type="submit" class="btn btn-success">Create Meal Plan</button>
        </form>
    </div>

    <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>