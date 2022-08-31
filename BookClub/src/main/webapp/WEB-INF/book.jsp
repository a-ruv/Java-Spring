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
<h1>Add a Book to Your Shelf!</h1>
<a href="/dashboard">Back to the shelves</a>

<div>
	<form:form action="/book/create" method="post" modelAttribute="book">
	<div>
		<form:label path="title">Title:</form:label>
		<form:input path="title"/>
		<form:errors path="title"/>
	</div>
	<div>
		<form:label path="author">Author:</form:label>
		<form:input path="author"/>
		<form:errors path="author"/>
	</div>
	<div>
		<form:label path="thoughts">My thoughts:</form:label>
		<form:input path="thoughts" type="textarea"/>
		<form:errors path="thoughts"/>
	</div>
	<button>Submit</button>
	
	</form:form>

</div>

</body>
</html>