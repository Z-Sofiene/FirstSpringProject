<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>List of Departments</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${bts}/fontawesome/css/all.min.css">
</head>
<body>
    <div class="container mt-5">
        <a href="addDepartmentForm" class="btn btn-primary mb-3">
            <i class="fas fa-plus"></i> Add New Department
        </a>
        
        <div class="card">
            <div class="card-header">
                <h3 class="card-title">List of Departments</h3>
            </div>
            <div class="card-body">
                <table class="table table-bordered">
                    <thead>
                        <tr>
                            <th>Name</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach var="depts" items="${depts}">
                            <tr>
                                <td>${depts.nom}</td>
                                <td>
                        
                                    <a href="employes/dept/${depts.id}" class="btn btn-warning btn-sm">
                                        <i class="fas fa-users"></i> View Employees
                                    </a>
                                    
                                    <a href="projets/dept/${depts.id}" class="btn btn-success btn-sm">
                                        <i class="fas fa-tasks"></i> View Projects
                                    </a>
                                    <a href="deleteDepartement/${depts.id}" class="btn btn-danger btn-sm">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        </c:forEach>
                    </tbody>
                </table>
            </div>
        </div>
        <br>
        <a href="addEmployeForm" class="btn btn-primary mt-3">
            <i class="fas fa-plus"></i> Add New Worker
        </a>
        <br> <br>
        <a href="addProjetForm" class="btn btn-primary mt-3">
            <i class="fas fa-plus"></i> Add New Project
        </a>
    </div>
    
</body>
</html>
