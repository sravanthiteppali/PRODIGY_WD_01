<%@ page session="true" %>
<jsp:include page="admin_home.html" />
<%
	String name=request.getParameter("username");
	String pass=request.getParameter("password");
	String un = "Admin";
	String ps = "Admin#12";
	if(name.equals(un) && pass.equals(ps))
	{
		session.setAttribute("user",name);
		
		out.print("<br><br><br>Welcome" + name);	
	}
	else
	{
		out.println("invalid user name & password");
	%>
		<jsp:include page="admin_login.html"/>
	<%
	}
	%>
	<p>Copy  Rights  @ T.sravanthi, 22761A05C2.</p>
<style>
p{
text-align:center;
color:green;
}
</style>





















