<%@page import="java.sql.ResultSet"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<jsp:include page="header.jsp"></jsp:include>
<%
    DbManager.Dbconnection d = new DbManager.Dbconnection();
    if(request.getParameter("cancel")==null){}
    else{
        String l_id = request.getParameter("cancel");
        int p = d.executeUpdate("DELETE FROM emp_leave WHERE id='"+l_id+"';");
    }
    if(request.getParameter("fromdt")==null || request.getParameter("todt")==null || request.getParameter("leavedisc")==null){}
    else{
        String fromdt = request.getParameter("fromdt");
        String todt = request.getParameter("todt");
        String disc = request.getParameter("leavedisc");
        String self_id = session.getAttribute("id").toString();
        if (d.compareDate(fromdt, todt).equals("1")) {
            int s = d.addLeave(fromdt, todt, disc, self_id);
            if (s == 1) {
                out.print("<script>M.toast({html: 'Leave Requested Successfully'})</script>");
            } else {
                out.print("<script>M.toast({html: 'Fail to send Leave Request'})</script>");
            }
        } else {
            out.print("<script>M.toast({html: 'Enter Proper Date'})</script>");
        }
    }
%>
<div class="row center-align">
        <h1>Add Leave</h1>
</div>

<div class="row">
    <form method="post" name="leaveform">
        <div class="card">
            <div class="card-content">
                <div class="row">
                    <div class="input-field col s6">
<!--                        <input type="text" id="fromdt" name="fromdt" class="datepicker">-->
                        <input type="date" id="fromdt" name="fromdt">
                        <label for="fromdt">From Date</label>
                    </div>
                    <div class="input-field col s6">
<!--                        <input type="text" id="todt" name="todt" class="datepicker">-->
                        <input type="date" id="todt" name="todt">
                        <label for="todt">To Date</label>
                    </div>
                </div>
                <div class="row">
                    <div class="input-field col s12">
                        <input type="text" id="leavedisc" name="leavedisc">
                        <label for="leavedisc">Leave Description</label>
                    </div>
                </div>
            </div>
            <div class="card-action">
                <input type="submit" class="btn blue" id="add_dpt" name="add_dpt" style="width:100%; font-size:20px" value="Add Leave Request">
            </div>
        </div>
    </form>
</div>
<div class="row">
    <table class="responsive-table">
        <tr>
            <th>From Date</th>
            <th>To Date</th>
            <th>Description</th>
            <th>Status</th>
            <th>Action</th>
        </tr>
        <%
            ResultSet r = d.getResult("SELECT * FROM emp_leave WHERE emp_id=" + session.getAttribute("id") + ";");
            while (r.next()) {
        %>
        <tr>
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
                    out.print("<a class='btn red' href='?cancel="+r.getString("id")+"'>Cancel</a>");
                }
                else{
                    out.print("Verified");
                }
                %>
            </td>
        </tr>
        <%
            }
        %>
    </table>
</div>
<script>
    $(document).ready(function () {
        $('select').formSelect();
//        $('.datepicker').datepicker(
//                format:'dd/mm/yyyy',
//                selectMonths: true,
//        );
    });
</script>
<jsp:include page="footer.jsp"></jsp:include>
