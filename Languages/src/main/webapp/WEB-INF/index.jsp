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
<table>
	<thead>
		<tr>
			<td>Name</td>
			<td>Creator</td>
			<td>Version</td>
			<td>Action</td>
		</tr>
	</thead>
	<tbody>
		<c:forEach var="lang" items="${languages}">
			<tr>
				<td><a href="/language/show/${lang.id}"><c:out value="${lang.name}"></c:out></a></td>
				<td><c:out value="${lang.creator}"></c:out></td>
				<td><c:out value="${lang.version}"></c:out></td>
				<td>
					<a href="/language/${lang.id}/delete"> delete</a>
					<a href="/language/${lang.id}">edit</a>
				</td>
			</tr>
		</c:forEach>
	</tbody>
</table>
<form:form action="/language/create" method="post" modelAttribute="language">
	<p>
		<form:label path="name">Name: </form:label>
		<form:errors path="name"/>
		<form:input path="name"/>
	</p>
	<p>
		<form:label path="creator">Creator:</form:label>
		<form:errors path="creator"/>
		<form:input path="creator"/>
	</p>
	<p>
		<form:label path="version">Version:</form:label>
		<form:errors path="version"/>
		<form:input path="version"/>
	</p>
	<button>Submit</button>
</form:form>


</body>
</html>