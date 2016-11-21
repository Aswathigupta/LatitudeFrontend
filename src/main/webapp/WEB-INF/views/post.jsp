<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>post submit</title>
</head>
<body>


<c:url var="addAction" value="/post/add"></c:url>

	<form:form action="${addAction}" commandName="post" >
	

	<table>
			<tr>
				<td><form:label path="id">
						<spring:message text="ID" />
					</form:label></td>
				<c:choose>
					<c:when test="${!empty post.id}">
						<td><form:input path="id" disabled="true" readonly="true" />
						</td>
					</c:when>

					<c:otherwise>
						<td><form:input path="id" pattern=".{1,8}" required="true"
								title="id should contains 3 to 4 characters" /></td>
					</c:otherwise>
				</c:choose>
			<tr>
				<form:input path="name" hidden="true" />
				<td><form:label path="name">
						<spring:message text="Name" />
					</form:label></td>
				<td><form:input path="name" required="true" /></td>
			</tr>
		
			
			<tr>
				<td><form:label path="description">
						<spring:message text="description" />
					</form:label></td>
				<td><form:input path="description" required="description" /></td>
			</tr>
			
			<tr>
				<td colspan="2">
						 <c:if test="${empty post.name}">
						<input type="submit" value="<spring:message text="Add post"/>" />
					</c:if></td>
				
			</tr>
		</table>
	</form:form>
	<br>
	
		<h3>Posts</h3>
	<c:if test="${!empty postList}">
	<c:forEach items="${postList}" var="post">

				<p>Post ID: ${post.id}</p>
				<p>Title : ${post.name} </p>
				<p>Description :  ${post.description} </p>
				<p><a  href="<c:url value='post/delete/${post.id}' />">Delete</a>
				<!--  <a class="btn btn-primary" href="<c:url value='postcomment/${post.id}' />">Comment</a></p>-->
				<a href="postComment">comment</a>
		
			</c:forEach>
		
	</c:if>
	
	
	
</body>
</html>