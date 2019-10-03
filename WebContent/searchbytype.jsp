<%@ page import="beans.info"%>
<%@ page import='java.sql.*'%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<%
String type=request.getParameter("type");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from company Where type=?");
ps.setString(1,type);
ResultSet rs=ps.executeQuery();
%>
<body background="background.jpg">
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<table border="4" cellpadding='10px' bordercolor='black'>
<tr bgcolor='red'>
<th><font face='Cooper'>Name</font></th>
<th><font face='Cooper'>Password</font></th>
<th><font face='Cooper'>Address</font></th>
</tr>
<%
while(rs.next())
{
	out.println("<tr bgcolor='gray'>");
	out.println("<td>"+rs.getString("name")+"</td>");
 	out.println("<td>"+rs.getString("password")+"</td>");
	out.println("<td>"+rs.getString("address")+"</td>");
	out.println("</tr>");	
}
%>
</table>
<center><h4><a href='adminpanel.jsp'>Click here to go to admin panel.</a></h4></center>
</body>