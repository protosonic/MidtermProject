<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%> 
 <%@ taglib uri="jakarta.tags.core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Log In</title>
</head>
<body>
<%--Edit the file nav.jsp to change nav links --%>
<jsp:include page="home.jsp"/>

<h2>Log In</h2>
<form action="login.do" method="POST">
	<%-- Error messages --%>
	<input type="text" name="userName">
	<input type="password" name="password"/>
	<input type="submit" value="Log In" > 
</form>
</body>
</html>