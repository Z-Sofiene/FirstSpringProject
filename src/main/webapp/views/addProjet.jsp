<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Project</title>
    <spring:url value="/src/bootstrap/dist" var="bts"/>
    <link rel="stylesheet" href="${bts}/css/bootstrap.min.css">
    <link rel="stylesheet" href="${bts}/fontawesome/css/all.min.css">
</head>
<body>
    <a href="${pageContext.request.contextPath}/home" class="btn btn-secondary">
        <i class="fas fa-home"></i> Home Page
    </a>    
    <div class="container mt-5">
        <h2>Add New Project</h2>
        <form:form modelAttribute="proj" action="${pageContext.request.contextPath}/saveProjet" method="post">
            <div class="form-group">
                <form:label path="titre">Title:</form:label>
                <form:input path="titre" type="text" class="form-control" required="true"/>
            </div>
            <div class="form-group">
                <form:label path="etat">Status:</form:label>
                <form:select path="etat" class="form-control" required="true">
                    <form:option value="" label="-- Select Status --"/>
                    <form:option value="Loading">Loading</form:option>
                    <form:option value="Active">Active</form:option>
                    <form:option value="Not Active">Achieved</form:option>
                </form:select>
            </div>
            <div class="form-group">
                <form:label path="dept.id">Department:</form:label>
                <form:select path="dept.id" class="form-control" items="${dpt}" itemValue="id" itemLabel="nom">
                </form:select>
            </div>

            <button type="submit" class="btn btn-primary">Submit</button>
        </form:form>
    </div>
    
    <script src="${bts}/js/bootstrap.bundle.min.js"></script>
</body>
</html>
