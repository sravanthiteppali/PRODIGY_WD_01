<%@ page import="java.sql.*" %>
<%
try {
    String un = request.getParameter("suname");
    String p = request.getParameter("pwd");
    //out.print("from form "+un+" "+p+"<br>");

    Class.forName("oracle.jdbc.driver.OracleDriver");
    Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "system", "sravanthi");
    PreparedStatement pst = con.prepareStatement("SELECT * FROM register where username=? and password=?");
    pst.setString(1,un);
    pst.setString(2,p);
    ResultSet rs = pst.executeQuery();


     if (rs.next()) {
        // Set the username in the session
        session.setAttribute("username", un);
		out.print("<br><h3 style='text-align:center;color:white;'>Welcome "+un+"</h3>");
%>
<jsp:include page="home.jsp"></jsp:include>
<%
    } else {
        out.print("<h3 style='text-align:center;color:white;'>Invalid Credentials, please login again</h3><br>");
%>
<jsp:include page="login.html"/>
<%
    }

   
    con.close();
} catch (Exception e) {
    out.println("<h3>Error: " + e.getMessage() + "</h3>");
}
%>

