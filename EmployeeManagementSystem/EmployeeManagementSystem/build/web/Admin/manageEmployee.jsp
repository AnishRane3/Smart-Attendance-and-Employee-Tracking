<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<!<!doctype html>
<html>
    <head>
        <!--Import Google Icon Font-->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <!--Import materialize.css-->
        <link type="text/css" rel="stylesheet" href="css/materialize.min.css"  media="screen,projection"/>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management System</title>
    </head>
    <body>
    <div class="row center-align">
        <h1>Manage Employees</h1>
    </div>
    <div class="row">
        <table class="responsive-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Monthly Salary</th>
            <th>Role</th>
            <th>Department</th>
            <th>Action</th>
        </tr>
        <%
            DbManager.Dbconnection d = new DbManager.Dbconnection();
            int p;
            if(request.getParameter("id")==null){}
            else{
                p = d.executeUpdate("DELETE FROM user WHERE id='"+request.getParameter("id")+"';");
                out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Employee removed successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
                    "  displayLength: 2000" + 
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
            
            ResultSet r = d.getResult("SELECT u.id AS id, u.name AS name, u.email AS email, u.role AS role, d.id AS d_id, d.name AS department, u.monthly_salary FROM user AS u JOIN department AS d ON d.id=u.department WHERE u.id<>" + session.getAttribute("id") + ";");
            while (r.next()) {
        %>
        <tr>
            <td><%=r.getString("id")%></td>
            <td><%=r.getString("name")%></td>
            <td><%=r.getString("email")%></td>
            <td><%=r.getString("monthly_salary")%></td>
            <td><%=r.getString("role")%></td>
            <td><%=r.getString("department")%></td>
            <td><a class="btn-flat transparent" href="?id=<%=r.getString("id")%>"><i class="material-icons" style="color: red;font-size: 30px">delete</i></a></td>
        </tr>
        <%
            }
        %>
    </table>
    </div>
    </body>
</html>
<jsp:include page="footer.jsp"></jsp:include>

