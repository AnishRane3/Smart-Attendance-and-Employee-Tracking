<%@page import="java.util.HashMap"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.google.gson.Gson;" %>
<%@page import="java.util.Date"%>
<%@page import="java.sql.ResultSet"%>
<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%
    
            try{
                DbManager.Dbconnection d = new DbManager.Dbconnection();
                HashMap<String,String> map=new HashMap<String, String>();
                String id = request.getParameter("id");
                
                String f_sql="SELECT u.id as emp_id2, ea.* FROM user u left join (select * from emp_attendance ea WHERE ea.emp_id="+id+" and ea.attendance_date = CURRENT_DATE ) as ea on u.id=ea.emp_id WHERE u.id="+id+";";
                ResultSet r1 = d.getResult(f_sql);
                    if(r1.next()){
                        if(id != null ){
                            String longitude=request.getParameter("longitude");
                            String latitude=request.getParameter("latitude");
                            String ci=request.getParameter("ci");
                            if(ci==null){ } else if(ci.equals("1")){
                                if(r1.getString("checkin")==null){
                                    if(longitude!=null & latitude!=null){
                                        Date dt = new Date();
                                        String ins_qry="INSERT INTO emp_attendance(emp_id,attendance_date,checkin,longitude,latitude) VALUES("+id+",'"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"','"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS").format(dt)+"','"+longitude+"','"+latitude+"');";
                                        int p = d.executeUpdate(ins_qry);
                                        map.put("status","sucess");
                                        map.put("checkin","done");
                                    }
                                    else{
                                       map.put("status","Longitude and Latitude not found");
                                    }
                                }
                                else{
                                     map.put("status","Checkin Already Done");
                                }
                            }
                            String co = request.getParameter("co");
                            if(co==null){ } else if(co.equals("2")){
                                if(r1.getString("checkout")==null ){
                                    String tyy = r1.getString("checkin");
                                    if(tyy!=null){
                                        if(longitude!=null & latitude!=null){
                                            int p = d.executeUpdate("UPDATE emp_attendance SET checkout='"+new SimpleDateFormat("yyyy-MM-dd HH:mm:ss.SSSSSS").format(new Date())+"' WHERE emp_id="+id+" AND attendance_date='"+new SimpleDateFormat("yyy-MM-dd").format(new Date())+"';");
                                            int q = d.executeUpdate("UPDATE emp_attendance set total_hours=TIMESTAMPDIFF(HOUR,checkin,checkout) WHERE emp_id="+id+" AND attendance_date='"+new SimpleDateFormat("yyyy-MM-dd").format(new Date())+"';");
                                            map.put("status","sucess");
                                            map.put("checkout","done");
                                        } else {
                                           map.put("status","Longitude and Latitude not found");
                                        }
                                    } else {
                                        map.put("status","First Checkin");
                                    }
                                }
                                else{
                                    map.put("status","Checkout Already Done");
                                }
                                
                            }
                        }
                        else{
                            map.put("status", "Done Attendance for today");
                        }
                    }
                    else{
                        map.put("status", "Employee ID not Found");
                    }
                response.setContentType("application/json");
                out.println(map.toString().replace("=",":"));
            }
            catch(Exception e){
                HashMap<String,String> map=new HashMap<String, String>();
                map.put("status", "Something went wrong");
                response.setContentType("application/json");
                out.println(map.toString().replace("=",":"));
            }
%>
