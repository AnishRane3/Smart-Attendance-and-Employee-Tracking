<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<!DOCTYPE html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management System</title>
    </head>
<body>
<%
    DbManager.Dbconnection d = new DbManager.Dbconnection();
    if(request.getParameter("empname")==null || request.getParameter("empemail")==null || request.getParameter("empdprt")==null || request.getParameter("emprole")==null){}
    else{
        String name = request.getParameter("empname");
        String email = request.getParameter("empemail");
        String dprt = request.getParameter("empdprt");
        String role = request.getParameter("emprole");
        String pass = request.getParameter("emppass");
        String monthly_salary = request.getParameter("monthly_salary");
        int s = d.addEmployee(name, email, dprt, role, pass, monthly_salary);
        if(s==1){
            out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Employee Added Successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
                    "  displayLength: 2000" + // Display the toast message for 5 seconds
                    "});" +
                    "var closeButton = document.querySelector('.tooltipped');" +
                    "M.Tooltip.init(closeButton, {position: 'left'});" +
                    "function dismissToast() {" +
                    "  var toastElement = document.querySelector('.toast');" +
                    "  var toastInstance = M.Toast.getInstance(toastElement);" +
                    "  toastInstance.dismiss();" +
                    "}" +
                    "</script>"); 
                    
        }
        else{
            out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Fail to Add Employee<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
                    "  displayLength: 2000" + // Display the toast message for 5 seconds
                    "});" +
                    "var closeButton = document.querySelector('.tooltipped');" +
                    "M.Tooltip.init(closeButton, {position: 'left'});" +
                    "function dismissToast() {" +
                    "  var toastElement = document.querySelector('.toast');" +
                    "  var toastInstance = M.Toast.getInstance(toastElement);" +
                    "  toastInstance.dismiss();" +
                    "}" +
                    "</script>"); 
        }
    }
%>
<div class="row center-align">
    <h1>Add Employees</h1>
</div>
<div class="row">
    <form method="post" name="empform">
        <div class="card">
            <div class="card-content">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" id="empname" name="empname" required pattern=".{2,100}" title="Name must be a number between 2 and 100">
                        <label for="empname">Enter Employee Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="email" id="empemail" name="empemail" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                        <label for="empemail">Enter Employee Email ID</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="password" id="emppass" name="emppass" required pattern=".{6,20}" title="Password must be a number between 6 and 20">
                        <label for="emppass">Enter Password for Employee</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <select id="empdprt" name="empdprt" required>
                            <option value="" disabled selected>Choose your option</option>
                            <%
                                ResultSet rd = d.getResult("SELECT * FROM department");
                                while(rd.next()){
                            %>
                            <option value=<% out.print(rd.getString("id"));%>><% out.print(rd.getString("name")); %></option>
                            <%}%>
                        </select>
                        <label>Select Employee Department</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <select id="emprole" name="emprole" required>
                            <option value="" disabled selected>Choose your option</option>
                            <option value="admin">Administrator</option>
                            <option value="emp">Employee</option>
                        </select>
                        <label>Select Employee Role</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="number" id="monthly_salary" name="monthly_salary" required>
                        <label for="monthly_salary">Enter Monthly Salary</label>
                    </div>
                </div>
            </div>
            <div class="card-action">
                <input type="submit" class="btn light-blue lighten-1" id="add_dpt" name="add_dpt" style="width:100%; font-size:20px" value="Add Employee">
            </div>
        </div>
    </form>
</div>
<div class="row">
    <table class="responsive-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Role</th>
            <th>Department</th>
            <th>Monthly Salary</th>
        </tr>
        <%
            ResultSet r = d.getResult("SELECT u.id AS id, u.name AS name, u.email AS email, u.role AS role, d.id AS d_id, d.name AS department, u.monthly_salary FROM user AS u JOIN department AS d ON d.id=u.department WHERE u.id<>" + session.getAttribute("id") + ";");
            while (r.next()) {
        %>
        <tr>
            <td><%=r.getString("id")%></td>
            <td><%=r.getString("name")%></td>
            <td><%=r.getString("email")%></td>
            <td><%=r.getString("role")%></td>
            <td><%=r.getString("department")%></td>
            <td><%=r.getString("monthly_salary")%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('select').formSelect();
    });
</script>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>

