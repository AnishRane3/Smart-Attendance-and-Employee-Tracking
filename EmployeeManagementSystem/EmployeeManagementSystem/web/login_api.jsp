<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson;" %>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
        <%  
            try{
                DbManager.Dbconnection d = new DbManager.Dbconnection();
                HashMap<String,String> map=new HashMap<String, String>();
                if (request.getParameter("email")==null) {
                    map.put("status", "No Credentials Found");
                }
                else{
                    String email = request.getParameter("email");
                    String pass = request.getParameter("password");
                    String role = request.getParameter("role");
                    String id=d.login(email, pass, role);
                    if (id!="") {                
                        response.setContentType("application/json");

                        map.put("status", "sucess");
                        map.put("id", id);
                    } else {
                            map.put("status", "Login Failed");
                    }
                }
                
                //out.println(map.toString().replace("=",":"));
                
                 Gson gson = new Gson();
        String jsonData = gson.toJson(map);
        //PrintWriter out = response.getWriter();
        try {
            out.println(jsonData);
        } finally {
            out.close();
        }
                
            }
            catch(Exception e){
                HashMap<String,String> map=new HashMap<String, String>();
                map.put("status", "Something went wrong");
                out.println(map.toString().replace("=",":"));
            }
            
        %>
       
