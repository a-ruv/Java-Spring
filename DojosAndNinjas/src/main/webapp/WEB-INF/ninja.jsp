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
<form:form action="/ninja/create" method="post" modelAttribute="ninja">
	<p>
		<form:label path="dojo">Dojo:</form:label>
		<form:select path="dojo">
			<c:forEach var="dojo" items="${dojos}">
				<form:option value="${dojo.id}">
					<c:out value="${dojo.name}"></c:out>
				</form:option>
			</c:forEach>
		</form:select>
	</p>
	<p>
		<form:label path="firstName">First Name: </form:label>
		<form:errors path="firstName"/>
		<form:input path="firstName"/>
	</p>
	<p>
		<form:label path="lastName">Last Name: </form:label>
		<form:errors path="lastName"/>
		<form:input path="lastName"/>
	</p>
	<p>
		<form:label path="age">Age: </form:label>
		<form:errors path="age"/>
		<form:input path="age"/>
	</p>
	<button>Create</button>

</form:form>

</body>
</html>