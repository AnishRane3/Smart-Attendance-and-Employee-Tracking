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
    <div class="row center-align">
        <h1>Manage Department</h1>
    </div>
    <div class="row">
        <table class="responsive-table">
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Description</th>
            <th>Action</th>
        </tr>
        <%
            DbManager.Dbconnection d = new DbManager.Dbconnection();
            int p;
            if(request.getParameter("id")==null){}
            else{
                p = d.executeUpdate("DELETE FROM department WHERE id='"+request.getParameter("id")+"';");
                out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Department removed Successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
            
            ResultSet r = d.getResult("SELECT * FROM department;");
            while (r.next()) {
        %>
        <tr>
            <td><%=r.getString("id")%></td>
            <td><%=r.getString("name")%></td>
            <td><%=r.getString("disc")%></td>
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
