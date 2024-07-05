<jsp:include page="home.jsp" ></jsp:include>
<br>
<br>
<br>
<%
	session.removeAttribute("username");
	out.print("<h2 style='text-align:center;color:white;'>You are Successfully Loged Out</h2>");
%>

