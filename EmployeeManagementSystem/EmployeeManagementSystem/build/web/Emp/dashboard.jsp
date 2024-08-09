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
            out.print("</br><h3 align=\"center\">" + ft.format(dNow) + "</h3>");
        %></h3>
</div>
<%
    DbManager.Dbconnection d = new DbManager.Dbconnection();
%>
<div class="card" style="background-color: #29b6f6;border-radius: 10px; margin-top: 50px">
    <div class="row">
        <div class="col s4">
            <div class="left-align">
                <h5 style='margin-top:30px;color: white;margin-left: 15px'>Employee ID : <%=session.getAttribute("id")%></h5>
            </div>
        </div>
        <div class="col s11">
            <div class="left-align">
                <%

                    ResultSet ed = d.getResult("SELECT u.name AS name, d.name AS department FROM user AS u JOIN department AS d ON u.department=d.id WHERE u.id=" + session.getAttribute("id") + ";");
                    ed.next();
                    out.print("<h5 style='color:white;margin-left:15px'>Name : "+ed.getString("name")+"</h5>");
                    %>
            </div>
        </div>
    </div>
    <div class="left-align">
        <h5 style='padding-bottom: 30px;color:white;margin-left: 15px'>Department : <%=ed.getString("department")%></h5>
    </div>
</div>
<script>
    $(document).
            ready(function () {
            });
</script>
<jsp:include page="footer.jsp"></jsp:include>

