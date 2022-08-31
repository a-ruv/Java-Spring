<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Change your Entry</h1>
<a href="/book">Back to the shelves</a>
<br>
<a href="/book/delete/${book.id}">Delete</a>
<br>
<form:form action="/book/edit/${book.id}" method="post" modelAttribute="book">
	<input type="hidden" name="_method" value="put">
	<form:input type="hidden" name="user" path="user"/>
	<form:input type="hidden" name="borrower" path="borrower"/>

	<table>
	    <thead>
	    	<tr>
	            <td>Title:</td>
	            <td>
	            	<form:errors path="title"/>
					<form:input path="title"/>
	            </td>
	        </tr>
	        <tr>
	            <td>Author:</td>
	            <td>
	            	<form:errors path="author"/>
					<form:input path="author"/>
	            </td>
	        </tr>        
	        <tr>
	            <td>My Thoughts:</td>
	            <td>
	            	<form:errors path="thoughts"/>
					<form:textarea path="thoughts"/>
	            </td>
	        </tr>   
	    </thead>
	</table>
	        	<button>Submit</button>
	
	

</form:form>

</body>
</html>