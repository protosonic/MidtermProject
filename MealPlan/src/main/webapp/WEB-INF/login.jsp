<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<%-- <head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
Edit the file nav.jsp to change nav links
<jsp:include page="nav.jsp"/>

<h2>Log In</h2>
<form action="login.do" method="POST">
	Error messages
	<input type="text" name="username">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>
<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html> --%>
<head>
<meta charset="UTF-8">
<title>Log In</title>
<jsp:include page="bootstrapHead.jsp" />
</head>
<body>
	<jsp:include page="nav.jsp" />

	<div class="container mt-4" style="max-width: 400px;">
		<h2 class="mb-4">Log In</h2>
		<form action="login.do" method="POST">
			<%-- Error messages could be displayed here if any, e.g. using c:if --%>
			<div class="mb-3">
				<label for="username" class="form-label">Username</label> <input
					type="text" id="username" name="username" class="form-control"
					required autofocus autocomplete="username">
			</div>
			<div class="mb-3">
				<label for="password" class="form-label">Password</label> <input
					type="password" id="password" name="password" class="form-control"
					required autocomplete="current-password">
			</div>
			<button type="submit" class="btn btn-primary">Log In</button>
		</form>
	</div>

	<jsp:include page="bootstrapFoot.jsp" />
</body>