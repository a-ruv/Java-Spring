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
<h1>Expense Detail</h1>
<a href="/expense">Go Back</a>

<p>Expense Name:<c:out value="${expense.name}"></c:out></p>
<p>Expense Description: <c:out value="${expense.description}"></c:out></p>
<p>Vendor: <c:out value="${expense.vendor}"></c:out></p>
<p>Amount Spent: <c:out value="${expense.amount}"></c:out></p>
</body>
</html>