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
                    
                
        <ul class="sidenav sidenav-fixed"  id="mySidenav">
            <li class="center-align">
                <img class="circle" style="height: 200px; width: 200px; margin-top: 20px" src="../img/person.png" width="100%" height="100%">
                <h5>Administrator</h5>
                <h5><%out.print(session.getAttribute("email"));%></h5>
                <a class="btn light-blue lighten-1" href="../Login.jsp">Logout</a>
            </li>
            <li class="bold <% if(request.getRequestURI().endsWith("dashboard.jsp")){ %> active<%}%>"><a  href="dashboard.jsp"><i class="material-icons">dashboard</i>Dashboard</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("addDepartment.jsp")){ %> active<%}%>"><a href="addDepartment.jsp"><i class="material-icons">queue</i>Add Department</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("manageDepartment.jsp")){ %> active<%}%>"><a href="manageDepartment.jsp"><i class="material-icons">business</i>Manage Department</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("addEmployee.jsp")){ %> active<%}%>"><a href="addEmployee.jsp"><i class="material-icons">person_add</i>Add Employee</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("manageEmployee.jsp")){ %> active<%}%>"><a href="manageEmployee.jsp"><i class="material-icons">group</i>Manage Employees</a></li>
            <!--<li class="bold"><a href="addLeave.jsp">Add Leaves</a></li>-->
            <li class="bold <% if(request.getRequestURI().endsWith("manageLeave.jsp")){ %> active<%}%>"><a href="manageLeave.jsp"><i class="material-icons">contact_mail</i>Manage Leaves</a></li>
            <!--<li class="bold"><a href="attendance.jsp">Attendance</a></li>-->
            <li class="bold <% if(request.getRequestURI().endsWith("employeesAttendance.jsp")){ %> active<%}%>"><a href="employeesAttendance.jsp"><i class="material-icons">spellcheck</i>View Attendance</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("salary_management.jsp")){ %> active<%}%>"><a href="salary_management.jsp"><i class="material-icons">attach_money</i>Manage Salary</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("view_feedback.jsp")){ %> active<%}%>"><a href="view_feedback.jsp"><i class="material-icons">feedback</i>View Feedback</a></li>
            <li class="bold <% if(request.getRequestURI().endsWith("view_alert.jsp")){ %> active<%}%>"><a href="view_alert.jsp"><i class="material-icons">notifications</i>View Alert</a></li>
        </ul>
                <script>
                </script>
                </div>
                <div class="col s10">


    
