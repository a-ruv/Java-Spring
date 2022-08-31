<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
       <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>index</title>
</head>
<body>
	<form action="/submit" method="POST">
	<label>Pick any number from 5 to 25</label>
	<input type="number" name="number">
	<label>Enter the name of any city.</label>
	<input type="text" name="city">
	<label>Enter the name of any real person</label>
	<input type="text" name="name">
	<label>Enter professional endeavor or hobby</label>
	<input type="text" name="hobby">
	<label>Enter any type of living thing</label>
	<input type="text" name="thing">
	<label>Say something nice to someone</label>
	<textarea rows="4" cols="6" name="nice"></textarea>
	<button>Send</button>
	</form>

</body>
</html>