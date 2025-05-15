<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StackPlates Homepage</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />
	<div>
		<h1>StackPlates</h1>
		<p>
			In a modest chamber where the hum of machines replaced the gallop of
			steeds, three fledgling knights of the code—green in their craft yet
			bold of spirit—were summoned by the lords of the Realm of Development
			and charged with a noble quest: to forge a wondrous tapestry of the
			web, a site to serve the culinary dreams of the populace. Thus did
			we, bound not by sword but by syntax, pledge ourselves to the cause
			and christen our creation <em><strong>StackPlates</strong></em>. With
			minds alight and fingers swift, we endeavored to fashion a haven
			where hungry souls might scribe and store their cherished recipes,
			and from these scrolls, conjure meal plans most divine—each suited to
			the whims and fancies of the curator. Though dragons of bugs and
			labyrinthine errors did oft besiege our path, we pressed forth with
			the valor of Quixote himself, for ours was a codebound odyssey,
			guided by the twin stars of purpose and camaraderie.
		</p>
	</div>
	<div class="featured-recipe">
		<h3>Featured Recipe</h3>
		<h4><a href="viewrecipe.do?recipeId=2">Best Gumbo Recipe</a></h4>
		<p>This incredible Gumbo recipe is bursting with the flavors of
			the bayou! It features a delicious base of spicy andouille sausage,
			tender chicken, and rich seafood, expertly seasoned with the revered
			holy trinity and the perfect blend of Cajun spices.</p>
			<img class="homepageImg" src="images/gumboRecipe.jpg" alt="Best Gumbo Recipe">
	</div>
	<div class="create-account-form">
		<c:if test="${empty sessionScope.loggedInUser}">
			<h2>Create an account</h2>
			<form action="createAccount.do" method="POST">
				<input type="text" name="firstName" placeholder="First Name">
				<input type="text" name="lastName" placeholder="Last Name">
				<input type="text" name="username" placeholder="Username"> <input
					type="password" name="password" placeholder="Password"> <input
					type="submit" value="Register">
			</form>
		</c:if>
	</div>
	<jsp:include page="bootstrapFoot.jsp" />
</body>
</html>