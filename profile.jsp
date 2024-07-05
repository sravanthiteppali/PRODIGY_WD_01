<%@ page import="java.sql.*"%>
<jsp:include page="home.jsp" />
<br>
<br>
<br>

<%
String uname = (String)session.getAttribute("username");
if(uname != null) {
    out.print("<br><br><br><br><br><div style='text-align:center;color:white;'>This is your PROFILE<br><br>Your are Mr/Ms. " + uname + "</div>");

    try {
        Class.forName("oracle.jdbc.driver.OracleDriver");
        Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:XE", "system", "sravanthi");
        String query = "SELECT * FROM register WHERE username = ?";
        PreparedStatement pstmt = con.prepareStatement(query);
        pstmt.setString(1, uname);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String name = rs.getString("fNAME");
            int age = rs.getInt("AGE");
            String pwd = rs.getString("Password");
            String gen = rs.getString("GENDER");
            String phno = rs.getString("PHNO");
            
%>

<style>
    table.styled-table {
        width: 40%;
        margin: 0 auto; /* Center the table */
        border:1px;
        background-color: Lavender;
    }
    table.styled-table th, table.styled-table td {
        border: 1px solid #ddd;
        padding: 8px;
    }
    table.styled-table th {
        background-color: #4CAF50; /* Header background color */
        color: black;
    }
    p {
        text-align: center;
        color: green;
    }
</style>

<table class="styled-table" border="1" cellspacing="0">
    <tr>
        <th>NAME</th>
        <td><%= name %></td>
    </tr>
    <tr>
        <th>AGE</th>
        <td><%= age %></td>
    </tr>
    <tr>
        <th>UNAME</th>
        <td><%= uname %></td>
    </tr>
    <tr>
        <th>PWD</th>
        <td><%= pwd %></td>
    </tr>
    <tr>
        <th>GENDER</th>
        <td><%= gen %></td>
    </tr>
    <tr>
        <th>PHNO</th>
        <td><%= phno %></td>
    </tr>
   
</table>

<%
        } else {
            out.println("Please login first");
        %>
<jsp:include page="login.html" />
<%
        }
    } catch(Exception e) {
        out.print(e);
    }
}
%>

