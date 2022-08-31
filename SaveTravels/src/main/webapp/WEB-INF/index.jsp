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
<h1>Save Travels</h1>
<table>
	<thead>
		<tr>
			<th>Expense</th>
			<th>Vendor</th>
			<th>Amount</th>
			<th>Actions</th>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="expense" items="${expenses}">
			<tr>
				<td><a href="/show/${expense.id}"><c:out value="${expense.name}"></c:out></a></td>
				<td><c:out value="${expense.vendor}"></c:out></td>
				<td><c:out value="${expense.amount}"></c:out></td>
				<td>
					<a href="/expense/${expense.id}">edit</a> | 
					<form action="/expense/${expense.id}/delete" method="post">
						<input type="hidden" name="_method" value="delete">
						<button>delete</button>
					</form>
				
				</td>
			</tr>	
		</c:forEach>
	</tbody>
</table>
<div>
	<h1>Add an expense:</h1>
	<form:form action="/expense/create" method="post" modelAttribute="expense">
		<p>
			<form:label path="name">Expense Name:</form:label>
			<form:errors path="name"/>
			<form:input path="name"/>
		</p>
		<p>
			<form:label path="vendor">Vendor:</form:label>
			<form:errors path="vendor"/>
			<form:input path="vendor"/>
		</p>
		<p>
			<form:label path="amount">Amount:</form:label>
			<form:errors path="amount"/>
			<form:input path="amount"/>
		</p>
		<p>
			<form:label path="description">Description:</form:label>
			<form:errors path="description"/>
			<form:input path="description"/>
		</p>
		<button>Submit</button>
	</form:form>
</div>

</body>
</html>