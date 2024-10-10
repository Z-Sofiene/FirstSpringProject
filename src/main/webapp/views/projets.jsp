<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Projects</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${bts}/fontawesome/css/all.min.css">
</head>
<body>
	<a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
    <i class="fas fa-home"></i> Home Page
	</a>	
    <div class="container">
        <h2 class="mt-4">Department: ${dpt.get().nom}</h2> 

        <!-- Project List Table -->
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th scope="col">Title</th>
                    <th scope="col">Status</th> <!-- Added status column -->
                    <th scope="col">Actions</th>
                    <th scope="col">Extras</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="proj" items="${proj}">
                    <tr>
                        <td>${proj.titre}</td> 
                        <td>${proj.etat}</td> 
                        <td>
                        	<a href="${pageContext.request.contextPath}/employes/projet/${proj.id}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-users"></i> View Employees</a>
                        </td>
                        <td>
                            <form:form action="deleteProjet/${proj.id}" method="get">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-trash-alt"></i> 
                                </button>
                            </form:form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Add New Project Button -->
        <a href="${pageContext.request.contextPath}/addProjetForm" class="btn btn-primary mt-3">
            <i class="fas fa-plus"></i> Add New Project
        </a>
    </div>
</body>
</html>
