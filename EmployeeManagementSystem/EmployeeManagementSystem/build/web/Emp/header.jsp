<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="../css/materialize.min.css"  media="screen,projection"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <title>Employee Attendance System</title>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col s2">
                    
                
        <ul class="sidenav sidenav-fixed">
            <li class="center-align">
                <img class="circle" style="height: 200px; width: 200px; margin-top: 20px" src="../img/person.png" width="100%" height="100%">
                <h5>Employee</h5>
                <h5><%out.print(session.getAttribute("email"));%></h5>
                <a class="btn light-blue lighten-1" href="../Login.jsp">Logout</a>
            </li>
            <li class="bold <%if(request.getRequestURI().endsWith("dashboard.jsp")){%> active <%}%>"><a href="dashboard.jsp"><i class="material-icons">dashboard</i>Dashboard</a></li>
            <li class="bold <%if(request.getRequestURI().endsWith("addLeave.jsp")){%> active <%}%>"><a href="addLeave.jsp"><i class="material-icons">drafts</i>Add Leaves</a></li>
            <li class="bold <%if(request.getRequestURI().endsWith("attendance.jsp")){%> active <%}%>"><a href="attendance.jsp"><i class="material-icons">assessment</i>View Attendance</a></li>
            <li class="bold <%if(request.getRequestURI().endsWith("employeeSalary.jsp")){%> active <%}%>"><a href="employeeSalary.jsp"><i class="material-icons">attach_money</i>View Salary</a></li>
        </ul>
                </div>
                <div class="col s10">


    
