<%@ page import="java.sql.*" %>
<%@ page import="beans.info"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); 
%>
<% String stars=request.getParameter("stargiven");
String feedback=request.getParameter("feedbackgiven");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select name from feedback where name=?");
ps.setString(1,name);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
		%>
		<center><h3><font color='red'>You have already given us review.</font></h3></center>
		<jsp:include page="studentpanel.jsp"/>
		<% 
}
else
{
	PreparedStatement ps1=conn.prepareStatement("insert into feedback values(?,?,?)");
	ps1.setString(1,name);
	ps1.setInt(2,Integer.valueOf(stars));
	ps1.setString(3,feedback);
	ps1.executeUpdate();
	%>
	<center><h3>Thanks for your feedback.</h3></center>
	<jsp:include page="studentpanel.jsp"/>
	<%
	}
%>
	