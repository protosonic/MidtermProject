<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<jsp:include page="bootstrapHead.jsp"/>
</head>
<body>
	<jsp:include page="nav.jsp"/>
	<h1>StackPlates</h1>
	<div>
	<c:if test="${empty sessionScope.loggedInUser}">
		<h2>Create an account</h2>
		<form action="createAccount.do" method="POST">
			<input type="text" name="firstName" placeholder="First Name">
			<input type="text" name="lastName" placeholder="Last Name"> <input
				type="text" name="username" placeholder="Username"> <input
				type="password" name="password" placeholder="Password"> <input
				type="submit" value="Register">
		</form>
		</c:if>
	</div>
	<jsp:include page="bootstrapFoot.jsp"/>
</body>
</html>