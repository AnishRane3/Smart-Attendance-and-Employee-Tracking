<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
<%
    DbManager.Dbconnection d = new DbManager.Dbconnection();
    if(request.getParameter("dptname")==null){}
    else{
        String name = request.getParameter("dptname");
        String disc = request.getParameter("dptdisc");
        int s = d.addDepartment(name, disc);
        if(s==1){
            out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Department Added successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
        else{
             out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Fail to Add Department<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
    }
%>
<!DOCTYPE html>
<div class="row center-align">
    <h1>Add Department</h1>
</div>
<div class="row">
    <form method="post" name="dprt">
        <div class="card">
            <div class="card-content">
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" id="dptname" name="dptname" required pattern=".{0,50}" title="Department name can only be of 50 character">
                        <label for="dptname">Enter Department Name</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" id="dptdisc" name="dptdisc" required pattern=".{0,100}" title="Maximum 100 character are allowed">
                        <label for="dptdisc">Description</label>
                    </div>
                </div> 
            </div>
            <div class="card-action">
                <input type="submit" class="btn light-blue lighten-1" id="add_dpt" name="add_dpt" style="width:100%; font-size:20px" value="Add Department">
            </div>
        </div>
    </form>
</div>
<div class="row">
    <table class="responsive-table">
        <tr>
            <th style="padding-left: 0px;">ID</th>
            <th style="padding-left: 400px;">Name</th>
            <th style="padding-left: 300px;">Description</th>
        </tr>
        <%
            ResultSet r = d.getResult("SELECT * FROM department;");
            while (r.next()) {
        %>
        <tr>
            <td style="padding-left: 0px;"><%=r.getString("id")%></td>
            <td style="padding-left: 400px;"><%=r.getString("name")%></td>
            <td style="padding-left: 300px;"><%=r.getString("disc")%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<script>
    $(document).ready(function () {

    });
</script>

<jsp:include page="footer.jsp"></jsp:include>
