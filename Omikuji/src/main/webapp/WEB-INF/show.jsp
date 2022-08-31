<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Show</title>
<link rel="stylesheet" type="text/css" href="/css/style.css">
</head>
<body>
<h1>Here's Your Omikuji!</h1>

<div>
<p>
In <c:out value="${number}"></c:out> years, you will live in <c:out value="${city}"></c:out> with <c:out value="${name}"></c:out> 
as your room mate, <c:out value="${hobby}"></c:out> for a living. The next time you see a <c:out value="${thing}"></c:out>, you will have
good luck. Also,<c:out value="${nice}"></c:out>.</p>
</div>
<a href="/omikuji"> Go Back</a>

</body>
</html>