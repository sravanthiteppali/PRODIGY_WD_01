<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.*, javax.servlet.http.*" %>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Registration Data</title>
	<style>
	body {
      margin: 0;
      padding: 0;
      font-family: 'Times New Roman', Times, serif;
      background-image: url('https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRCnAt4YGDibR_eppnQV5fI8w_TLpUnInaKaQ&s');
      background-size: cover; 
      background-position: center;
      color: black;
	  </style>
</head>
<body>
	<h4> <a href="admin_home.html">go back</a></h4>
    <h1>Registered Users</h1>
    <table border="1">
        <tr>
            <th>First Name</th>
            <th>Age</th>
            <th>Username</th>
            <th>Gender</th>
            <th>Phone Number</th>
        </tr>
        <% 
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sravanthi");
            String qry = "select * from register";
            PreparedStatement pst = con.prepareStatement(qry);
            ResultSet rs = pst.executeQuery();
            while (rs.next()) {
                String fname = rs.getString("fname");
                int age = rs.getInt("age");
                String username = rs.getString("username");
                String gender = rs.getString("gender");
                String phno = rs.getString("phno");
        %>
                <tr>
                    <td><%= fname %></td>
                    <td><%= age %></td>
                    <td><%= username %></td>
                    <td><%= gender %></td>
                    <td><%= phno %></td>
                </tr>
        <% 
            }
            con.close();
        } catch (Exception e) {
            out.print(e);
        }
        %>
    </table>
	
</body>
</html>
