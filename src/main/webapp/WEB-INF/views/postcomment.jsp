<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

	<c:url var="addAction" value="/comment/add"></c:url>

	<form:form action="${addAction}" commandName="postComment">


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
				<td><form:label path="comment">
						<spring:message text="comment" />
					</form:label></td>
				<td><form:input path="comment" required="comment" /></td>
			</tr>

			<tr>
				<td colspan="2"><c:if test="${empty postComment.id}">
						<input type="submit" value="<spring:message text="Add comment"/>" />
					</c:if></td>

			</tr>
		</table>
	</form:form>

	<br>

	<h3>Comments</h3>
	<c:if test="${!empty postCommentList}">
		<c:forEach items="${postCommentList}" var="postComment">

			<p>Comment ID: ${postComment.id}</p>
			<p>Comment : ${postComment.comment}</p>
			<p>
				<a class="btn btn-primary"
					href="<c:url value='post/delete/${postComment.id}' />">Delete</a>
			</p>



		</c:forEach>

	</c:if>

</body>
</html>