<%@page import="java.io.FileOutputStream"%>
<%@ page import="beans.info"%>
<%@ page import='java.sql.*'%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<%
int j=0;
String qualification=request.getParameter("qualification");
String topic=request.getParameter("topic");
String score=request.getParameter("score");
int percentage=Integer.valueOf(score);
String gender=request.getParameter("gender");
String year=request.getParameter("year");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from student Where test=? and qualification like ? and gender like ? and passing_year like ?");
PreparedStatement ps5=conn.prepareStatement("select * from files");
ResultSet rs5=ps5.executeQuery();
if(rs5.next())
{
    j=rs5.getInt("no");

}
ps5=conn.prepareStatement("update files set no=? where no=?");
ps5.setInt(1,j++);
ps5.setInt(2,j);
ps5.executeUpdate();
FileOutputStream fos=new FileOutputStream("D:/info"+j+".txt",true);
ps.setString(1,topic);
ps.setString(2,qualification);
ps.setString(3,gender);
ps.setString(4,year);
ResultSet rs=ps.executeQuery();
%>
<body background="background.jpg">
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<table border="4" cellpadding='10px' bordercolor='black'>
<tr bgcolor='red'>
<th><font face='Cooper'>Name</font></th>
<th><font face='Cooper'>Email</font></th>
<th><font face='Cooper'>Mobile</font></th>
<th><font face='Cooper'>Gender</font></th>
</tr>
<%
int i=0;
while(rs.next())
{
	float obt=rs.getInt("marks_obtained");
	float total=rs.getInt("outof");
	float per=(obt/total)*100;
	if(percentage>=50)
	{
		if(per<(percentage+10) && per>=percentage)
		{	
			out.println("<tr bgcolor='gray'>");
			out.println("<td>"+rs.getString("name")+"</td>");
			for(i=0;i<(rs.getString("name")).getBytes().length;i++)
				fos.write((rs.getString("name")).getBytes());
				fos.write(10);
	    	out.println("<td>"+rs.getString("email")+"</td>");
	    	for(i=0;i<(rs.getString("email")).getBytes().length;i++)
				fos.write((rs.getString("email")).getBytes());
	    	fos.write(10);
			out.println("<td>"+rs.getString("mobile")+"</td>");
			for(i=0;i<(rs.getString("mobile")).getBytes().length;i++)
				fos.write((rs.getString("mobile")).getBytes());
			fos.write(10);
			out.println("<td>"+rs.getString("gender")+"</td>");
			for(i=0;i<(rs.getString("gender")).getBytes().length;i++)
				fos.write((rs.getString("gender")).getBytes());
			fos.write(10);
			fos.write(10);
			out.println("</tr>");
		}
	}
	else
	{
		if(per<50)
		{	
			out.println("<tr bgcolor='gray'>");
			out.println("<td>"+rs.getString("name")+"</td>");
				fos.write((rs.getString("name")).getBytes());
			fos.write(10);
			out.println("<td>"+rs.getString("email")+"</td>");
				fos.write((rs.getString("email")).getBytes());
	    	fos.write(10);
	    	out.println("<td>"+rs.getString("mobile")+"</td>");
				fos.write((rs.getString("mobile")).getBytes());
			fos.write(10);
			out.println("<td>"+rs.getString("gender")+"</td>");
				fos.write((rs.getString("gender")).getBytes());
			fos.write(10);
			fos.write(10);
			out.println("</tr>");
		}
	}
}
conn.close();
fos.close();
%>
</table>
<center><h4><a href='companypanel.jsp'>Click here to go back.</a></h4></center><br><br>
<% 
out.println("<center><a href='D:/info"+j+".txt' download><button>Download file</button></a></center>");
%>

</body>