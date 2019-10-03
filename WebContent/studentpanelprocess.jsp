<%@ page import="java.sql.*" %>
<%@ page import="beans.info"%>
<%String language=request.getParameter("lang");
session.setAttribute("testchoice",language);%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select test from student where name=?");
ps.setString(1,name);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	if(rs.getString("test").equals("not given"))
	{
		%>
		<jsp:forward page="test.jsp"/>
		<%
	}
	else
	{
		%>
		<center><h3><font color='red'>You have already given one test.</font></h3></center>
		<jsp:include page="studentpanel.jsp"/>
		<%	
	}
}
%>