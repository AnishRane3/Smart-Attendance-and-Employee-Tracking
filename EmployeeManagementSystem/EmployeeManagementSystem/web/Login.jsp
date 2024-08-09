<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
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
            session.setAttribute("email", "");
            DbManager.Dbconnection d = new DbManager.Dbconnection();
            if (request.getParameter("email")==null) {
                
            }
            else{
                String email = request.getParameter("email");
                String pass = request.getParameter("password");
                String role = request.getParameter("role");
                String id=d.login(email, pass, role);
                if (id!="") {
                    session.setAttribute("id", id);
                    session.setAttribute("email", email);
                    if(role.equals("admin")){
                        response.sendRedirect("Admin/dashboard.jsp");
                    }
                    else if(role.equals("emp")){
                        response.sendRedirect("Emp/dashboard.jsp");            
                    } 
                } 
                else {
                    out.println("<script>" +
                    "M.toast({" +
                    "  html: 'Login Failed<i class=\"material-icons right tooltipped\" data-position=\"left\" onclick=\"dismissToast()\">close</i>'," +
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
        <div class="container">
            <div class="row center-align">
                <h1>Employee Tracking</h1>
            </div>
            <div class="row">
                <div class="col s6">
                    <div class="card">
                        <div class="card-title center-align">
                            <h3>Login</h3>
                        </div>
                        <form method="post" name="login" id="login">
                            <div class="card-content">
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="email" name="email" type="email" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
                                        <label for="email">Email</label>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <input id="password" name="password" type="password" required pattern=".{6,20}" title="Password must be a number between 6 and 20">
                                        <label for="password">Password</label> 
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="input-field col s12">
                                        <select id="role" name="role" required>
                                            <option value="" disabled selected>Choose your option</option>
                                            <option value="admin">Administrator</option>
                                            <option value="emp">Employee</option>
                                        </select>
                                        <label>Role</label>
                                    </div>
                                </div>
                            </div>
                            <div class="card-action">
                                <input type="submit" class="btn light-blue lighten-1" id="login_btn" name="login_btn" style="width:100%; font-size:20px" value="Login">
                            </div>
                        </form>
                    </div>
                </div>
                <div style="width: 50%;margin-left: auto;left:auto;right: auto;">
                    <img src="img/emp_img2.png" width="100%" style="margin-top:1.9rem;height:32.99rem;">  
                </div>
            </div>
        </div>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
        <!--JavaScript at end of body for optimized loading-->
        <script type="text/javascript" src="js/materialize.min.js"></script>
        <script>
            $(document).ready(function () {
                $('select').formSelect();
                $('.modal').modal();
            });
        </script>
        
    </body>
</html>
