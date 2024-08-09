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
        <h1>Manage Leave</h1>
    </div>
    <div class="row">
        <table class="responsive-table">
            <tr>
                <th>Employee Name</th>
                <th>From Date</th>
                <th>To Date</th>
                <th>Description</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        <%
            DbManager.Dbconnection d = new DbManager.Dbconnection();
            if(request.getParameter("approve")==null){}
            else{
                int p = d.executeUpdate("UPDATE emp_leave SET isapprove=1 WHERE id="+request.getParameter("approve")+";");
                out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Leave Application Approved Successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
            if(request.getParameter("reject")==null){}
            else{
                int p = d.executeUpdate("UPDATE emp_leave SET isapprove=2 WHERE id="+request.getParameter("reject")+";");
                out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Leave Application Rejected Successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
            ResultSet r = d.getResult("SELECT e.id AS id, e.emp_id AS emp_id, u.name AS name, e.fromdt AS fromdt, e.todt AS todt, e.discription AS discription, e.isapprove AS isapprove FROM emp_leave AS e JOIN user AS u ON e.emp_id=u.id WHERE e.emp_id<>" + session.getAttribute("id") + ";");
            while (r.next()) {
        %>
        <tr>
            <td><%=r.getString("name")%></td>
            <td><%=r.getString("fromdt")%></td>
            <td><%=r.getString("todt")%></td>
            <td><%=r.getString("discription")%></td>
            <td><%
                if(r.getString("isapprove").equals("0")){
                    out.print("<span class='btn orange'>Pending</span>");
                }
                else if(r.getString("isapprove").equals("1")){
                    out.print("<span class='btn green'>Approved</span>");
                }
                else if(r.getString("isapprove").equals("2")){
                    out.print("<span class='btn red'>Rejected</span>");
                }
                %></td>
            <td><%
                if(r.getString("isapprove").equals("0")){
                    out.print("<a class='btn green' href='?approve="+r.getString("id")+"'>Approve</a><a class='btn red' href='?reject="+r.getString("id")+"'>Reject</a>");
                }
                else{
                    out.print("Done");
                }
                %>
            </td>
        </tr>
        <%}%>
    </table>
</div>
<script>
    $(document).ready(function () {

    });
</script>
</body>
</html>
<jsp:include page="footer.jsp"></jsp:include>
