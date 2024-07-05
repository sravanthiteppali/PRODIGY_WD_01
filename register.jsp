<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html >
<head>
   
    <title>Registration Details</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-image: url('https://thumbs.dreamstime.com/b/education-cdr-181590785.jpg'); 
            background-size: cover; 
            background-position: center;
        }
        h1 {
            text-align: center;
            margin-top: 20px;
            margin-bottom: 10px;
        }
        
    </style>
</head>
<body>
    <h1>Registration successful!</h1>
    
   
        <% 

		 String fname = request.getParameter("fname");
            int age = Integer.parseInt(request.getParameter("age"));
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            String gender = request.getParameter("gender");
            String phno = request.getParameter("phno");
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
            Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sravanthi");
            String qry = "insert into register values(?, ?, ?, ?, ?, ?)";
		PreparedStatement pst=con.prepareStatement(qry);
		 pst.setString(1, fname);
         pst.setInt(2, age);
         pst.setString(3, username);
         pst.setString(4, password);
         pst.setString(5, gender);
         pst.setString(6, phno);
                
         pst.executeUpdate();
		
		out.print("<br>");

		out.print("<center><a href='login.html'>LOGIN</a></center>");
		con.close();
	}
	catch(Exception e)
	{
		out.print(e);
	}
           
            
            
            
        %>
    
    
</body>
</html>




