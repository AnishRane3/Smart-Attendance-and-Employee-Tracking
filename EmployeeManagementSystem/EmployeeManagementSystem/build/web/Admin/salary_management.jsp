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


if(request.getParameter("emp_id")!=null & request.getParameter("month_year")!=null){
    String emp_id=request.getParameter("emp_id");
    String month_year=request.getParameter("month_year");
    String working_days=request.getParameter("working_days");
    String salary_payable=request.getParameter("salary_payable");
    String ins_qry="INSERT INTO salary_tbl(emp_id,salary_payable,working_days,month_year) VALUES("+emp_id+","+salary_payable+",'"+working_days+"','"+month_year+"');";
    int p = d.executeUpdate(ins_qry);
    if(p==1){
         out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Salary Paid Successfully<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
    } else {
       out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Action Failed<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
    <div class="row center-align">
        <h3>Salary Management</h3>
    </div>


    <div class="row center-align" id="form_div">
        <form method="post" name="typeform">
            <div class="card">
                <div class="card-content">
                    <div class="row">
                        <div class="input-field col s6">
                            <select name="month" id="month">
                                <option value="01">January</option>
                                <option value="02">February</option>
                                <option value="03">March</option>
                                <option value="04">April</option>
                                <option value="05">May</option>
                                <option value="06">June</option>
                                <option value="07">July</option>
                                <option value="08">August</option>
                                <option value="09">September</option>
                                <option value="10">October</option>
                                <option value="11">November</option>
                                <option value="12">December</option>
                            </select>
                            <label for="atd_date">Month</label>
                        </div>
                        <div class="input-field col s6">
                        <% java.util.Calendar cal = java.util.Calendar.getInstance();
                            int year = cal.get(java.util.Calendar.YEAR);
                        %>

                        <select name="year">
                            <option value="<%= year - 1%>"><%= year - 1%></option>
                            <option value="<%= year%>" selected><%= year%></option>
                            <option value="<%= year + 1%>"><%= year + 1%></option>
                        </select>
                    </div>
                    <div class="input-field col s3">
                        <input type="submit" class="btn light-blue lighten-1" id="submit_btn" name="submit_btn" style="width:100%; font-size:20px" value="Search">
                    </div>
                    <div class="input-field col s1">
                        <a href="salary_management.jsp" class="btn red">Reset</a>
                    </div>
                </div>
            </div>
            <div class="card-action">


            </div>
        </div>
    </form>
</div>
<script>
    $(document).ready(function () {
        $('select').formSelect();
    });
</script>
<div class="row">
    <%

        
        String sql = "";
        String aaa=request.getParameter("submit_btn");
        if (aaa!=null) {
            String month = request.getParameter("month");
            String years = request.getParameter("year");
            sql = "SELECT a.emp_id, e.name, e.email, FLOOR( SUM( e.monthly_salary / DAY(LAST_DAY(CONCAT('" + years + "-" + month + "', '-01'))) ) ) AS salary, dt.name as department, CONCAT( COUNT(a.id), '/', DAY(LAST_DAY(CONCAT('" + years + "-" + month + "', '-01'))) ) AS working_days, '" + years + "-" + month + "' AS month_year, ( SELECT CASE WHEN COUNT(1) = 0 THEN 0 ELSE 1 END FROM salary_tbl sal WHERE sal.emp_id = a.emp_id AND sal.month_year = '" + years + "-" + month + "' ) AS pay_status FROM emp_attendance a LEFT JOIN user e ON e.id = a.emp_id LEFT JOIN department dt ON dt.id = e.department WHERE MONTH(a.attendance_date) = " + month + " AND YEAR(a.attendance_date) = " + years + " GROUP BY a.emp_id;";
    %>
    <script>
        $('#month').val('<%=month%>');
        $('#year').val('<%=years%>');
    </script>
    <%

    } else {
        sql = "select a.emp_id,e.name, e.email, FLOOR(sum(e.monthly_salary/DAY(LAST_DAY(DATE_SUB(NOW(), INTERVAL 1 MONTH))))) as salary, dt.name as department, CONCAT(COUNT(a.id),'/',DAY(LAST_DAY(DATE_SUB(NOW(), INTERVAL 1 MONTH)))) as working_days, DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 MONTH), '%Y-%m') as month_year, (select CASE when count(1)=0 then 0 else 1 end from salary_tbl sal where sal.emp_id=a.emp_id and sal.month_year=DATE_FORMAT(DATE_SUB(NOW(), INTERVAL 1 MONTH), '%Y-%m')) as pay_status from emp_attendance a left join user e on e.id=a.emp_id LEFT join department dt on dt.id=e.department where MONTH(a.attendance_date)=MONTH(DATE_SUB(NOW(), INTERVAL 1 MONTH)) and YEAR(a.attendance_date)=YEAR(DATE_SUB(NOW(), INTERVAL 1 MONTH)) group by a.emp_id;";

    %>
    <script>// Get the current date
        const currentDate = new Date();

        // Subtract 1 month from the current date to get the last month
        const lastMonth = new Date(currentDate.getFullYear(), currentDate.getMonth() - 1);

        // Get the value of the last month in the format "MM"
        const lastMonthValue = (lastMonth.getMonth() + 1).toString().padStart(2, '0');

        // Set the value of the dropdown to the value of the last month
        $('#month').val(lastMonthValue);
        $('#month').formSelect();
    </script>
    <%           
        }
    %>

    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Post</th>
            <th>Salary</th>
            <th>Year-Month</th>
            <th>Attendance</th>
            <th>Action</th>
        </tr>
        <%           
            ResultSet r = d.getResult(sql);
            int rc = 0;

            while (r.next () 
                ) {
                rc++;
        %>
        <tr>
            <td><%=r.getString("emp_id")%></td>
            <td><%=r.getString("name")%> (<small><%=r.getString("email")%> )</td>
            <td> <%=r.getString("department")%> </td>
            <td>RS. <%=r.getString("salary")%> </td>
            <td><%=r.getString("month_year")%></td>
            <td><%=r.getString("working_days")%></td>
            <td>
                <%
                    if(r.getString("pay_status").equals("0")){
                %>
                <a href="salary_management.jsp?emp_id=<%=r.getString("emp_id")%>&month_year=<%=r.getString("month_year")%>&salary_payable=<%=r.getString("salary")%>&working_days=<%=r.getString("working_days")%>" class="btn red">Pay Salary</a>
                <%
                    } else {
                %>
                <a class="btn green">Paid Salary</a>
                
                <% } %>
            </td>
        </tr>   
        <%
            }
        %>
    </table>
</div>
</body>
</html>


<jsp:include page="footer.jsp"></jsp:include>