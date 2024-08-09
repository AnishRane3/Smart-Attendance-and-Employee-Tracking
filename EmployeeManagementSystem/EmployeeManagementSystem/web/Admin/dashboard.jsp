<%-- 
    Document   : dashboard
    Created on : Apr 18, 2021, 5:30:06 PM
    Author     : Acer
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="header.jsp"></jsp:include>
    <div class="row center-align">
        <h3><%
            Date dNow = new Date();
            SimpleDateFormat ft
                    = new SimpleDateFormat("E, dd MMM ,yyyy  '-' hh:mm a");
            out.print("<h2 align=\"center\">" + ft.format(dNow) + "</h2>");
        %></h3>
    </div>
<div class="row">
    <div class="col s6">
        <div class="card"  style="background-color: buttonhighlight;">
            <div class="card-title center-align"><h1><%
                    DbManager.Dbconnection d = new DbManager.Dbconnection();
                    ResultSet r = d.getResult("SELECT COUNT(*) as total FROM department;");
                    r.next();
                    out.print(r.getString("total"));
                    %></h1></div>
            <div class="card-content center-align"><h6>Department</h6></div>
        </div>
    </div>
    <div class="col s6">
        <div class="card"  style="background-color: buttonhighlight;">
            <div class="card-title center-align"><h1>
                <%
                    ResultSet re = d.getResult("SELECT COUNT(*) as total FROM user");
                    re.next();
                    out.print(re.getString("total"));
                    %>
                </h1></div>
            <div class="card-content center-align"><h6>Employees</h6></div>
        </div>
    </div>
</div>
                <div class="row">
                    <div class="col s4 center-align">
                        <h1><%=session.getAttribute("id")%></h1>
                    </div>
                    <div class="col s8 center-align">
                        <h1><%
                            ResultSet ed = d.getResult("SELECT u.name AS name, d.name AS department FROM user AS u JOIN department AS d ON u.department=d.id WHERE u.id="+session.getAttribute("id")+";");
                            ed.next();
                            out.print(ed.getString("name"));
                            %></h1>
                    </div>
                </div>
                    <div class="row center-align">
                        <h4>Department:-<%=ed.getString("department")%></h4>
                    </div>
<script>
    $(document).ready(function () {
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>

