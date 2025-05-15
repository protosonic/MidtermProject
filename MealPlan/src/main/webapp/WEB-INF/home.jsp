<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>StackPlates | Home</title>
    <jsp:include page="bootstrapHead.jsp" />
    <link rel="stylesheet" href="css/styles.css" />
</head>
<body>
    <jsp:include page="nav.jsp" />

    <div class="container mt-4">

        <!-- Hero / Intro Section -->
        <div class="text-center mb-5 d-flex flex-column align-items-center">
		    <img src="images/stackPlatesIcon.png"
		         alt="StackPlates Icon"
		         class="mb-3"
		         style="max-width: 100px;">
            <h1 class="display-4 fw-bold text-primary">StackPlates</h1>
            <p class="lead">
                In a modest chamber where the hum of machines replaced the gallop of steeds,
                three fledgling knights of the code—green in their craft yet bold of spirit—
                were summoned by the lords of the Realm of Development and charged with a noble quest:
                to forge a wondrous tapestry of the web, a site to serve the culinary dreams of the populace.
                Thus did we, bound not by sword but by syntax, pledge ourselves to the cause and christen our
                creation <strong><em>StackPlates</em></strong>.
            </p>
            <p class="fst-italic">
                With minds alight and fingers swift, we endeavored to fashion a haven where hungry souls might
                scribe and store their cherished recipes, and from these scrolls, conjure meal plans most divine.
                Though dragons of bugs and labyrinthine errors did oft besiege our path, we pressed forth with
                the valor of Quixote himself, guided by the twin stars of purpose and camaraderie.
            </p>
        </div>

        <!-- Main Row: Featured Recipe + Create Account -->
        <div class="row align-items-start">
            <!-- Featured Recipe (Left Column) -->
            <div class="col-md-7 mb-4">
                <div class="featured-recipe bg-light p-4 rounded shadow-sm h-100 d-flex flex-column" id="featured-recipe">
                    <div class="mb-3">
                        <h3>Featured Recipe</h3>
                        <h4>
                            <a href="viewrecipe.do?recipeId=2" class="text-decoration-none text-dark fw-semibold">Bayou's Best Gumbo Recipe</a>
                        </h4>
                        <p>
                            This incredible Gumbo recipe is bursting with the flavors of the bayou!
                            It features a delicious base of spicy andouille sausage, tender chicken, and rich seafood,
                            expertly seasoned with the revered holy trinity and the perfect blend of Cajun spices.
                        </p>
                    </div>
                    <div>
                        <img class="homepageImg img-fluid rounded" src="images/gumboRecipe.jpg" alt="Best Gumbo Recipe">
                    </div>
                </div>
            </div>

            <!-- Create Account Form (Right Column) -->
            <c:if test="${empty sessionScope.loggedInUser}">
                <div class="col-md-5 mb-4">
                    <div class="create-account-form border p-4 rounded shadow-sm bg-white h-100">
                        <h2 class="text-center">Create an Account</h2>
                        <form action="createAccount.do" method="POST" class="row g-3">
                            <div class="col-md-6">
                                <input type="text" name="firstName" class="form-control" placeholder="First Name" required>
                            </div>
                            <div class="col-md-6">
                                <input type="text" name="lastName" class="form-control" placeholder="Last Name" required>
                            </div>
                            <div class="col-md-12">
                                <input type="text" name="username" class="form-control" placeholder="Username" required>
                            </div>
                            <div class="col-md-12">
                                <input type="password" name="password" class="form-control" placeholder="Password" required>
                            </div>
                            <div class="col-12">
                                <input type="submit" value="Register" class="btn btn-primary w-100">
                            </div>
                        </form>
                    </div>
                </div>
            </c:if>
        </div>
    </div>

    <jsp:include page="bootstrapFoot.jsp" />
</body>
</html>