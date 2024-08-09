<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
    <div class="row center-align">
        <h1>Attendance</h1>
    </div>
    <div class="row">
        <div class="card">
            <div class="card-content">
                <div class="row">
                    <div class="col s12 center-align">
                    <%
                        DbManager.Dbconnection d = new DbManager.Dbconnection();
                        String id = session.getAttribute("id").toString();
                        if(request.getParameter("ci")==null){}
                        else if(request.getParameter("ci").equals("1")){
                            Date dt = new Date();
                            int p = d.executeUpdate("INSERT INTO emp_attendance(emp_id,attendance_date,checkin) VALUES("+id+",'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS").format(dt)+"');");
                        }
                        if(request.getParameter("co")==null){}
                        else if(request.getParameter("co").equals("2")){
                            int p = d.executeUpdate("UPDATE emp_attendance SET checkout='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS").format(new Date())+"' WHERE emp_id="+id+" AND attendance_date='"+new SimpleDateFormat("yyy-MM-dd").format(new Date())+"';");
                            int q = d.executeUpdate("UPDATE emp_attendance set total_hours=TIMESTAMPDIFF(HOUR,checkin,checkout) WHERE emp_id="+id+" AND attendance_date='"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"';");
                        }
                        ResultSet r1 = d.getResult("SELECT * FROM emp_attendance WHERE emp_id="+id+" AND attendance_date='"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"';");
                        if(r1.next()){
                            String checkin=r1.getString("checkin");
                            if(r1.getString("checkout")==null){
                                out.print("<h1>Check-in :- <span class='btn-large green'>"+checkin+"</span></h1><br/><a class='btn-large red' href='?co=2'>Check-Out</a>");
                            }
                            else{
                                out.print("<h1>Check-in :- <span class='btn-large green'>"+checkin+"</span></h1><br/><h1>Check-out :- <span class='btn-large red'>"+r1.getString("checkout")+"</span></h1><br/><h3>You have done Check-in & Check-out for today.</h3>");
                            }
                        }
                        else{
                            out.print("<a class='btn-large green' href='?ci=1'>Check-in</a>");
                        }
                    %>
                </div>
            </div>
        </div>
    </div>
</div>
<div class="row">
    <table class="responsive-table">
        <tr>
            <th>Date</th>
            <th>Check In</th>
            <th>Check Out</th>
            <th>Hours</th>
        </tr>
        <%
        ResultSet r2 = d.getResult("SELECT * FROM emp_attendance WHERE emp_id="+id+";");
        while(r2.next()){
        %>
        <tr>
            <td><%=r2.getString("attendance_date")%></td>
            <td><%=r2.getString("checkin")%></td>
            <%
                if(r2.getString("checkout")==null){
                    out.print("<td>Pending</td><td>-</td>");
                }
                else{
                    out.print("<td>"+r2.getString("checkout")+"</td><td>"+r2.getString("total_hours")+"</td>");
                }
            %>
        </tr>
        <%}%>
    </table>
</div>

<script>
    $(document).ready(function () {

    });
</script>
<jsp:include page="footer.jsp"></jsp:include>
