<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Latitude Fintech</title>
<link href="resources/css/bootstrap.min.css" rel="stylesheet">

<link href="resources/css/styles.css" rel="stylesheet">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>


</head>
<body>

					


	<a href="post">POST</a>
	

	<div id="postHere">
		<c:if test="${ispost==true}">
			<%@ include file="post.jsp"%>
		</c:if>
	</div>


	<div id="commentHere">
		<c:if test="${ispostcomment==true}">
			<%@ include file="postcomment.jsp"%>

		</c:if>
	</div>
	
	

			

	

					


	


	

</body>
</html>