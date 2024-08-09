<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
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




%>
    <div class="row center-align">
        <h3>View Feedback</h3>
    </div>


   
<div class="row">
  

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Email</th>
            <th>Contact</th>
            <th>Feedback</th>
            <th>Send On</th>
        </tr>
        <%     
            String sql="SELECT *,DATE_FORMAT(created_on,'%e %M %Y, %h:%i:%s %p') as created_dt from feedback_tbl";
            ResultSet r = d.getResult(sql);
            int rc = 0;

            while (r.next () 
                ) {
                rc++;
        %>
        <tr>
            <td><%=r.getString("id")%></td>
            <td><%=r.getString("name")%></td>
            <td><%=r.getString("email_id")%></td>
            <td> <%=r.getString("contact")%> </td>
            <td>Subject:- <%=r.getString("subject")%> <hr> Description:- <%=r.getString("description")%>  </td>
            <td><%=r.getString("created_dt")%></td>
          
        </tr>   
        <%
            }
        %>
    </table>
</div>
</body>
</html>


<jsp:include page="footer.jsp"></jsp:include>