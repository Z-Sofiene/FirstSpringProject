<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<%@ taglib prefix="form"   uri="http://www.springframework.org/tags/form"%>

<%@ taglib prefix="c"      uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
	<a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
    <i class="fas fa-home"></i> Home Page
	</a>	
		<spring:url value="/src/bootstrap/dist" var="bts"/>
		<link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Add a Departement</title>
</head>
<body>
	    <div class="container">
        <h2 class="mt-4">Add a Departement</h2>
        
        <form:form method="POST" action="saveDepartement" modelAttribute="etd">
            <div class="form-group">
                <label for="nom">Departement Name</label>
                <input type="text" class="form-control" id="nom" name="nom" placeholder="Enter Name" required>
            </div>

            <button type="submit" class="btn btn-success">Save</button>
        </form:form>
    </div>
</body>
</html>