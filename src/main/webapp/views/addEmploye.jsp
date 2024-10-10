<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Employee</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${bts}/fontawesome/css/all.min.css">
</head>
<body>
	<a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
    <i class="fas fa-home"></i> Home Page
	</a>
    <div class="container mt-5">
        <h2>Add New Employee</h2>
        <form:form modelAttribute="emp" action="${pageContext.request.contextPath}/saveEmploye" method="post">
            <div class="form-group">
                <form:label path="nom">Name:</form:label>
                <form:input path="nom" type="text" class="form-control" required="true"/>
            </div>
            <div class="form-group">
                <form:label path="fonction">Function:</form:label>
                <form:select path="fonction" class="form-control" required="true">
                    <form:option value="" label="-- Select Function --"/>
                    <form:option value="Manager">Manager</form:option>
                    <form:option value="Engineer">Engineer</form:option>
                    <form:option value="Technician">Technician</form:option>
                    <form:option value="Student">Student</form:option>
                </form:select>
            </div>
            <div class="form-group">
                <form:label path="dept">Department:</form:label>
                <form:select path="dept.id" class="form-control" items="${departements}" itemValue="id" itemLabel="nom">
                </form:select>
            </div>
            <div class="form-group">
                <form:label path="projet">Project:</form:label>
                <form:select path="projet.id" class="form-control">
                    <form:option value="" label="-- Select Project --"/>
                    <form:options items="${projets}" itemValue="id" itemLabel="titre"/>
                </form:select>
            </div>
            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
    
</body>
</html>
