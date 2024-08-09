<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@page  import="DbManager.Dbconnection.*" %>
<%@page import="com.google.gson.Gson;" %>
<%@page import="java.sql.ResultSet"%>
<%  
    try{
        DbManager.Dbconnection d = new DbManager.Dbconnection();
        HashMap<String,Object> map=new HashMap<String, Object>();
        if (request.getParameter("id")=="") {
            map.put("status", "No Credentials Found");
        }
        else{
            String id=request.getParameter("id");
            response.setContentType("application/json");
                    
            ResultSet r1 = d.getResult("select role from user where id="+id+" ;");
            r1.next();
//                    if(r1.getString("role")=="admin"){
//                        if(r1.next()){
                    ResultSet atd=d.getResult("SELECT a.emp_id AS emp_id, a.attendance_date AS attendance_date, u.name AS name, a.checkin AS checkin, a.checkout AS checkout,a.longitude as longitude, a.latitude as latitude, a.total_hours AS total_hours FROM emp_attendance AS a JOIN user AS u ON a.emp_id=u.id where a.emp_id="+id+" ORDER BY attendance_date DESC ;");
                    List<HashMap> atd_data=new ArrayList<HashMap>();
                    HashMap<String,String> temp=new HashMap<String, String>();
                    while(atd.next()){
                        temp=new HashMap<String, String>();
                        temp.put("emp_id",atd.getString("emp_id"));
                        temp.put("attendance_date",atd.getString("attendance_date"));
                        temp.put("name",atd.getString("name"));
                        temp.put("checkin",atd.getString("checkin"));
                        temp.put("checkout",atd.getString("checkout"));
                        temp.put("longitude",atd.getString("longitude"));
                        temp.put("latitude",atd.getString("latitude"));
                        temp.put("total_hours",atd.getString("total_hours"));
                        atd_data.add(temp);
                    }
                    map.put("status","sucess");
                    map.put("table",atd_data);
//                        }
//                        else{
//                            map.put("status","ID not Found");
//                        }
//                    }
//                    else{
//                        map.put("status", "Access Denied");
//                    }
        }
                     Gson gson = new Gson();
                    String jsonData = gson.toJson(map);
                    //PrintWriter out = response.getWriter();
                    try {
                        out.println(jsonData);
                    } finally {
                        out.close();
                    }
          
//                response.setContentType("application/json");
//                
//                out.println(map.toString().replace("=",":"));
    }
    catch(Exception e){
        HashMap<String,String> map=new HashMap<String, String>();
        map.put("status", "Something went wrong");
        response.setContentType("application/json");
        out.println(map.toString().replace("=",":"));
    }
            
%>

