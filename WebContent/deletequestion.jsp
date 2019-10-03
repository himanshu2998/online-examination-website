<%@ page import="java.sql.*"%>
<%@ page import="beans.info"%>
<%@ page import="beans.admininfo"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<body background="background.jpg">
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>

<%admininfo inad=(admininfo)session.getAttribute("use");
String language=inad.getLanguage();%>
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps1=conn.prepareStatement("select * from "+language);
ResultSet rs=ps1.executeQuery();
int i=1;
%>
	<center><h2>Mark questions to be deleted.</h2></center>
	<form action='checkbox.jsp' method='post'>
	<table border="4" cellpadding='10' bordercolor='black' width="100%">
	<tr bgcolor='red'>
	<th><font face='Cooper'>Mark</font></th>
	<th><font face='Cooper'>Question</font></th>
	<th><font face='Cooper'>Choice 1</font></th>
	<th><font face='Cooper'>Choice 2</font></th>
	<th><font face='Cooper'>Choice 3</font></th>
	<th><font face='Cooper'>Choice 4</font></th>
	<th><font face='Cooper'>Correct choice</font></th>
	</tr>
	<%
	while(rs.next())
	{
		
		out.println("<tr bgcolor='gray'>");
		out.println("<th><input type='checkbox' name='check' value='"+i+"'></th>");
		out.println("<th>"+rs.getString("question")+"</th>");
		out.println("<th>"+rs.getString("choice1")+"</th>");
		out.println("<th>"+rs.getString("choice2")+"</th>");
		out.println("<th>"+rs.getString("choice3")+"</th>");
		out.println("<th>"+rs.getString("choice4")+"</th>");
		out.println("<th>"+rs.getString("choice")+"</th>");
		out.println("</tr>");
		i++;
	}
	conn.close();
	%>
	<tr bgcolor='yellow'>
	<th colspan='7'><input type='submit' value='Delete marked question'></th>
	</tr>
	</table>
	</form>
	</body>