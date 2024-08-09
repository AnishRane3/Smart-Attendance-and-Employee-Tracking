/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DbManager;

import java.sql.*;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import com.google.gson.Gson;

/**
 *
 * @author Acer
 */
public class Dbconnection {

    public ResultSet getResult(String query) throws SQLException {
        Connection con = null;

        try {

            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            ResultSet rs = stmt.executeQuery(query);

            if (rs != null) {
                return rs;
            }
            con.close();
        } catch (Exception e) {
        }
        return null;
    }

    public String login(String email, String pass, String role) {
        Connection con;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            String sql = "SELECT * FROM user WHERE email='" + email + "' AND password='" + pass + "' AND role='" + role + "';";
            System.out.print(sql);
            ResultSet result = stmt.executeQuery(sql);
            String id = "";
            boolean f = false;
            while (result.next()) {
                if (email.equals(result.getString("email")) && pass.equals(result.getString("password"))) {
                    id = result.getString("id");
                    f = true;
                }
            }
            if (f == true) {
                return id;
            } else {
                return "";
            }
        } catch (Exception e) {
            return "";
        }
    }

    public String compareDate(String d1, String d2) throws ParseException{
        SimpleDateFormat sf = new SimpleDateFormat("yyyy-MM-dd");
        Date s1 = sf.parse(d1);
        Date s2 = sf.parse(d2);
        if (s2.after(s1)) {
            return "1";
        }
        else if(s1.equals(s2)){
            return "1";
        }
        else {
            return "0";
        }
    }

    public int addDepartment(String name, String disc) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            int result;
            result = stmt.executeUpdate("INSERT INTO department(name,disc) VALUES('" + name + "','" + disc + "');");

            if (result > 0) {
                con.close();
                return 1;
            } else {
                con.close();
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }

    public int addEmployee(String name, String email, String dprt, String role, String pass, String monthly_salary) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            int result;
            result = stmt.executeUpdate("INSERT INTO user(name,email,password,role,department,monthly_salary) VALUES('" + name + "','" + email + "','" + pass + "','" + role + "'," + dprt + ","+monthly_salary+");");

            if (result > 0) {
                con.close();
                return 1;
            } else {
                con.close();    
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }

    public int addLeave(String fromdt, String todt, String disc, String emp_id) {
        Connection con = null;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            int result;
            result = stmt.executeUpdate("INSERT INTO emp_leave(emp_id,fromdt,todt,discription,isapprove) VALUES(" + emp_id + ",'" + fromdt + "','" + todt + "','" + disc + "',0);");

            if (result > 0) {
                con.close();
                return 1;
            } else {
                con.close();
                return 0;
            }

        } catch (Exception e) {
            return 0;
        }
    }

    public int executeUpdate(String query) throws SQLException {
        Connection con = null;
        int result = 0;
        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/employeemanagementsystem", "root", "");
            Statement stmt = con.createStatement();
            result = stmt.executeUpdate(query);
            if (result > 0) {
                con.close();
                return 1;
            } else {
                con.close();
                return 0;
            }

        } catch (Exception e) {
            con.close();
            return 0;
        }
    }
}
