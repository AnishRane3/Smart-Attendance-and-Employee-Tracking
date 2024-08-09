<%@page import="java.util.HashMap"%>
<%@page import="com.google.gson.Gson;" %>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
        <%  
            try{
                DbManager.Dbconnection d = new DbManager.Dbconnection();
                HashMap<String,String> map=new HashMap<String, String>();
                if (request.getParameter("user_id")==null) {
                    map.put("status", "User ID required");
                } else if(request.getParameter("longitude")==null){
                    map.put("status", "longitude required");
                } else if(request.getParameter("latitude")==null){
                    map.put("status", "latitude required");
                } else{
                    String user_id = request.getParameter("user_id");
                    String longitude = request.getParameter("longitude");
                    String latitude = request.getParameter("latitude");
                    
                    String ins_qry="INSERT INTO alert_tbl(user_id,longitude,latitude) VALUES("+user_id+",'"+longitude+"','"+latitude+"');";
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
       
