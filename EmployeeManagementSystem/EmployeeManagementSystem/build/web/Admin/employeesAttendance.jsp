<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <%
        DbManager.Dbconnection d = new DbManager.Dbconnection();
        String id = session.getAttribute("id").toString();
    %>
    <div class="row center-align">
        <h1>View Attendance</h1>
    </div>
    <div class="row center-align">
        <h3>Today's Attendance Record (<span class="text-accent-4"><b><%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%></b></span>)</h3>
    </div>
    <div class="row" style="overflow:auto;height:250px;max-width:100%;overflow-x:hidden;">
        <table class="responsive-table">
            <tr>
                <th>ID</th>
                <th>Employee Name</th>
                <th>Check-in</th>
                <th>Check-out</th>
                <th>Hours</th>
                <th>Longitude</th>
                <th>Latitude</th>
            </tr>
            <%
               ResultSet r1 = d.getResult("SELECT a.emp_id AS emp_id, u.name AS name, a.checkin AS checkin, a.checkout AS checkout,a.longitude AS longitude,a.latitude AS latitude,a.total_hours AS total_hours FROM emp_attendance AS a JOIN user AS u ON a.emp_id=u.id WHERE a.attendance_date='"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"' AND a.emp_id<>"+id+" ORDER BY checkin DESC ;");
               while(r1.next()){
            %>
            <tr>
                <td><%=r1.getString("emp_id")%></td>
                <td><%=r1.getString("name")%></td>
                <td><%=r1.getString("checkin")%></td>
                
                <%
                    if(r1.getString("checkout")==null){
                        out.print("<td>Pending</td><td>-</td>");
                    }
                    else{
                        out.print("<td>"+r1.getString("checkout")+"</td><td>"+r1.getString("total_hours")+"</td>");
                    }
                %>
                <td><%=r1.getString("longitude")%></td>
                <td><%=r1.getString("latitude")%></td>
            </tr>
            <%}%>
        </table>
    </div>
        <div class="row center-align">
            <h3>All Attendance Record</h3>
        </div>
        <div class="row" style="overflow:auto;height:500px;max-width:100%;overflow-x:hidden;">
            <table>
                <tr>
                    <th>ID</th>
                    <th>Employee Name</th>
                    <th>Date</th>
                    <th>Check-in</th>
                    <th>Check-out</th>
                    <th>Hours</th>
                    <th>Longitude</th>
                    <th>Latitude</th>
                </tr>
                <%
               ResultSet r2 = d.getResult("SELECT a.emp_id AS emp_id, a.attendance_date AS attendance_date, u.name AS name, a.checkin AS checkin, a.checkout AS checkout,a.longitude AS longitude,a.latitude as latitude,a.total_hours AS total_hours FROM emp_attendance AS a JOIN user AS u ON a.emp_id=u.id WHERE a.attendance_date<>'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"' AND a.emp_id<>"+id+" ORDER BY attendance_date DESC ;");
               while(r2.next()){
            %>
            <tr>
                <td><%=r2.getString("emp_id")%></td>
                <td><%=r2.getString("name")%></td>
                <td><%=r2.getString("attendance_date")%></td>
                <td><%=r2.getString("checkin")%></td>
                <td><%=r2.getString("checkout")%></td>
                <td><%=r2.getString("total_hours")%></td>
                <td><%=r2.getString("longitude")%></td>
                <td><%=r2.getString("latitude")%></td>
            </tr>
            <%}%>
            </table>
        </div>
<script>
    $(document).ready(function () {

    });
</script>
<jsp:include page="footer.jsp"></jsp:include>