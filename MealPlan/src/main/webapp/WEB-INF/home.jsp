<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>StackPlates</h1>
<div>
<h2>Create an account</h2>
<form action="createAccount.do" method="POST">
	<input type="text" name="firstName" placeholder="First Name">
	<input type="text" name="lastName" placeholder="Last Name">
	<input type="text" name="userName" placeholder="Username">
	<input type="password" name="passWord" placeholder="Password">
	<input type="submit" value="Register">
</form>
</div>
</body>
</html>