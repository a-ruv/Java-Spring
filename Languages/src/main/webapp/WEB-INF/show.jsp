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
<a href="/language">Dashboard</a>

<p><c:out value="${language.name}"></c:out></p>
<p><c:out value="${language.creator}"></c:out></p>
<p><c:out value="${language.version}"></c:out></p>

<a href="/language/${language.id}">edit</a>
<a href="/language/${language.id}/delete"> delete</a>

</body>
</html>