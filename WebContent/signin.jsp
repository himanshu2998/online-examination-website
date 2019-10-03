<%@ page import="beans.info"%>
<%@ page import='java.sql.*'%>
<%
info in=(info)session.getAttribute("user");
String name=in.getUser();
String password=in.getPassword();
String typeuser=in.getTypeuser();
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from "+typeuser+" where name=? and password=?");
ps.setString(1,name);
ps.setString(2,password);
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	if(typeuser.equals("student"))
	{
	%>
	<jsp:forward page="studentpanel.jsp"/>
<%
 }
	else if(typeuser.equals("admin"))
	{
		%>
		<jsp:forward page="adminpanel.jsp"/>
<%
}
else if(typeuser.equals("company"))
{
%>
<jsp:forward page="companypanel.jsp"/>
<%
}
}
else
{
%>
<jsp:include page="signin.html"/>
<h3><center><font color='red'>Wrong details!!!</font></center></h3>
<center><a href='registeruser.html'>Click here to register now.</a></center>
<%} conn.close();%>