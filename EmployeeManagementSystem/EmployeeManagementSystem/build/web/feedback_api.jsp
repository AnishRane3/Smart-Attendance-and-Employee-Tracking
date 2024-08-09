<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson;" %>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
        <%  
            try{
                DbManager.Dbconnection d = new DbManager.Dbconnection();
                HashMap<String,String> map=new HashMap<String, String>();
                if (request.getParameter("email_id")==null) {
                    map.put("status", "Email ID required");
                } else if(request.getParameter("name")==null){
                    map.put("status", "Name required");
                } else if(request.getParameter("contact")==null){
                    map.put("status", "contact required");
                } else if(request.getParameter("subject")==null){
                    map.put("status", "subject required");
                } else if(request.getParameter("description")==null){
                    map.put("status", "description required");
                } else{
                    String email_id = request.getParameter("email_id");
                    String name = request.getParameter("name");
                    String contact = request.getParameter("contact");
                    String subject = request.getParameter("subject");
                    String description = request.getParameter("description");
                    
                    String ins_qry="INSERT INTO feedback_tbl(name,email_id,contact,subject,description) VALUES('"+name+"','"+email_id+"',"+contact+",'"+subject+"','"+description+"');";
                    int p = d.executeUpdate(ins_qry);
                    if(p==1){
                        response.setContentType("application/json");
                        map.put("status", "Sucess");
                    } else {
                        map.put("status", "Failed");
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
       
