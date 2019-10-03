<%@ page import="java.sql.*"%>
<body background="background.jpg">
<% 
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps1=conn.prepareStatement("select * from feedback");
ResultSet rs=ps1.executeQuery();
%>
	<center><h2>Feedbacks...</h2>
	<%
	while(rs.next())
	{
		out.print("<table frame='box' bgcolor='cyan'>");
		out.print("<tr>");
		out.print("<td>Name :"+rs.getString("name")+"</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>"+rs.getString("feedbackgiven")+"</td>");
		out.print("</tr>");
		out.print("<tr>");
		out.print("<td>");
		for(int i=0;i<rs.getInt("stars");i++)
		{
		out.print("<img src='star.png' width='30px' hspace='0'>");
		}
		out.print("</td>");
		out.print("</tr>");
		out.print("</table>");
		out.print("<br>");
	}
	conn.close();
	%>
	</center>
	</body>
	