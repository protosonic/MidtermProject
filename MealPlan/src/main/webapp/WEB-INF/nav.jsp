<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="home.do">StackPlates</a>
	

	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
		<ul class="navbar-nav mr-auto"
			style="display: flex; flex-wrap: wrap; justify-content: space-between;">

			<li class="nav-item"><a class="nav-link" href="userProfile.do">My Account</a></li>
			<c:if test="${empty sessionScope.loggedInUser }">
				<li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
			</c:if>
			<c:if test="${not empty sessionScope.loggedInUser }">
				<li class="nav-item"><a class="nav-link" href="logout.do">Logout</a></li>
			</c:if>

		</ul>
		<form action="viewRecipesByKeyword.do" method="POST" class="d-flex"
			id="search-bar">
			<input class="form-control me-2" name="recipeKeyword" type="search"
				placeholder="Search For a Recipe" aria-label="Search">
			<button class="btn btn-outline-success" type="submit">Search</button>
		</form>
	</div>
</nav>
