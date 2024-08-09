<%@page import="java.sql.ResultSet"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<jsp:include page="header.jsp"></jsp:include>

    <div class="row center-align">
        <h3>View Salary</h3>
    </div>

    

    <div class="row">
        <table>
            <tr>
                <th>ID</th>
                <th>Salary</th>
                <th>Working Days</th>
                <th>Month/Year</th>
                <th>Paid on</th>
            </tr>
        <%
            DbManager.Dbconnection d = new DbManager.Dbconnection();
            int rc = 0;
            ResultSet r = d.getResult("SELECT *,DATE_FORMAT(created_on, '%e %M %Y, %h:%i:%s %p') as created_dt FROM salary_tbl WHERE emp_id="+session.getAttribute("id")+" ;");
            while (r.next()) {
                rc++;
        %>
        <tr>
            <td><%=rc%></td>
            <td><%=r.getString("salary_payable")%></td>
            <td><%=r.getString("working_days")%></td>
            <td><%=r.getString("month_year")%></td>
            <td><%=r.getString("created_dt")%></td>
        </tr>
        <%
            }
        %>
    </table>
</div>


<jsp:include page="footer.jsp"></jsp:include>