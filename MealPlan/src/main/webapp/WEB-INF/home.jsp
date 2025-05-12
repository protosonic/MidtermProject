<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>StackPlates Homepage</title>
</head>
<body>
	<jsp:include page="nav.jsp" />
	<h1>StackPlates Meal Planning</h1>

	<div>
		<h2>Create an account</h2>
		<form action="createAccount.do" method="POST">
			<input type="text" name="firstName" placeholder="First Name">
			<input type="text" name="lastName" placeholder="Last Name"> <input
				type="text" name="username" placeholder="Username"> <input
				type="password" name="password" placeholder="Password"> <input
				type="submit" value="Register">
		</form>
	</div>
	

</body>
</html>