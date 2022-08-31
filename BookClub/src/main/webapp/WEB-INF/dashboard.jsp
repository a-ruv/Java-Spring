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
<h1>Welcome, <c:out value="${user.userName}"></c:out></h1>
<a href="/logout">Logout</a>
<a href="/book">+ Add a book to my shelf!</a>
<div>
<h3>Books from everyone's shelves:</h3>
<div>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author Name</th>
				<th>Posted By</th>
				<th>Actions</th>			
			</tr>
		</thead>
		<tbody>
			<c:forEach var="book" items="${books}">
			<c:if test="${book.borrower.id != user.id}">
				<tr>
					<td><c:out value="${book.id}"></c:out></td>
					<td><a href="/book/${book.id}"><c:out value="${book.title}"></c:out></a></td>
					<td><c:out value="${book.author}"></c:out></td>
					<td><c:out value="${book.user.userName}"></c:out></td>
					<c:if test="${book.user.id == user.id}">
						<td>
							<a href="/book/edit/${book.id}">edit</a>
							<a href="/book/delete/${book.id}">delete</a>
						</td>
					</c:if>
					<c:if test="${book.user.id != user.id}">
						<td><a href="/bookmarket/${book.id}">borrow</a></td>
					</c:if>
				</tr>
			</c:if>
			</c:forEach>		
		</tbody>
	</table>
	<p>Books I'm borrowing</p>
	<table>
		<thead>
			<tr>
				<th>ID</th>
				<th>Title</th>
				<th>Author</th>
				<th>Posted by</th>
				<th>Actions</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="borrbook" items="${user.borrowedBooks}">
				<tr>
					<td><c:out value="${borrbook.id}"></c:out></td>
					<td><a href="/book/${borrbook.id}"><c:out value="${borrbook.title}"></c:out></a></td>
					<td><c:out value="${borrbook.author}"></c:out></td>
					<td><c:out value="${borrbook.user.userName}"></c:out></td>
					<td><a href="/bookmarket/return/${borrbook.id}">return</a></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</div>

</div>


</body>
</html>