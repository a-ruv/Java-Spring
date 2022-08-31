<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>   
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Login and Registration</h1>
<div>
	<h2>Registration</h2>
	<form:form action="/register" method="post" modelAttribute="user">
	<div>
		<form:label path="userName">User Name:</form:label>
		<form:input path="userName" type="text"/>
		<form:errors path="userName"/>
	</div>
	<div>
		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text"/>
		<form:errors path="email"/>
	</div>
	<div>
		<form:label path="password">Password:</form:label>
		<form:input path="password" type="password"/>
		<form:errors path="password"/>
	</div>
	<div>
		<form:label path="confirm">Confirm Password:</form:label>
		<form:input path="confirm" type="password"/>
		<form:errors path="confirm"/>
	</div>
	<button>Submit</button>
	</form:form>
</div>
<div>
<h2>Log in</h2>
<form:form action="/login" method="post" modelAttribute="loginUser">
	<div>
		<form:label path="email">Email:</form:label>
		<form:input path="email" type="text"/>
		<form:errors path="email"/>
	</div>
	<div>
		<form:label path="password">Password:</form:label>
		<form:input path="password" type="password"/>
		<form:errors path="password"/>
	</div>
	<button>Submit</button>

</form:form>
</div>

</body>
</html>