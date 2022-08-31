<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1><c:out value="${book.title}"></c:out></h1>
<a href="/dashboard">Back to the shelves</a>

<h2><c:out value="${book.user.userName}"></c:out> read <c:out value="${book.title}"></c:out> by <c:out value="${book.author}"></c:out></h2>
<h3>Here are <c:out value="${book.user.userName}"></c:out>'s thoughts:</h3>
<div>
<p><c:out value="${book.thoughts}"></c:out></p>
</div>
</body>
</html>