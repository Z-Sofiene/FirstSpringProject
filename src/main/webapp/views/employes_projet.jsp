<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Employees</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${bts}/fontawesome/css/all.min.css">
    

</head>
<body>
	<a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
    <i class="fas fa-home"></i> Home Page
	</a>	
    <div class="container">
        <h2 class="mt-4">Project: ${proj.get().titre}</h2>

        <!-- Employee List Table -->
        <table class="table table-striped mt-4">
            <thead>
                <tr>
                    <th scope="col">Name</th>
                    <th scope="col">Role</th>
                    <th scope="col">Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="emps" items="${emps}">
                    <tr>
                        <td>${emps.nom}</td>
                        <td>${emps.fonction}</td>
                        <td>
                            <!-- Delete Employee Action -->
                            <form:form action="deleteEmploye/${emps.id}" method="get">
                                <button type="submit" class="btn btn-danger">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </button>
                            </form:form>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>

        <!-- Add New Employee Button -->
        <a href="${pageContext.request.contextPath}/addEmployeForm" class="btn btn-primary mt-3">
            <i class="fas fa-plus"></i> Add New Employee
        </a>
    </div>

 
</body>
</html>
