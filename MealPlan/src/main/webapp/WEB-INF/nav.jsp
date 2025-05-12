<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

	<nav class="navbar navbar-expand-sm navbar-light bg-light">
		<a class="navbar-brand" href="#">StackPlates</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto"
				style="display: flex; flex-wrap: wrap; justify-content: space-between;">
				<li class="nav-item active"><a class="nav-link" href="home.do">Home
						<span class="sr-only">(current)</span>
				</a></li>
				<!-- Add link to recipes once complete -->
				<li class="nav-item"><a class="nav-link" href="getRecipes.do">View All Recipes</a></li>
				<li class="nav-item"><a class="nav-link" href="login.do">Login</a></li>
				
			</ul>
			<!-- Add name and map  -->
			<form class="d-flex" id="search-bar">
				<input class="form-control me-2" type="search" placeholder="Search For a Recipe"
					aria-label="Search">
				<button class="btn btn-outline-success" type="submit">Search</button>
			</form>
		</div>
	</nav>
