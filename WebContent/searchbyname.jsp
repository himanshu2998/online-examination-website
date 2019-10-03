<%@ page import="beans.info"%>
<%@ page import='java.sql.*'%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<%
String nameu=request.getParameter("nameofstudent");
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from student Where name=?");
ps.setString(1,nameu);
ResultSet rs=ps.executeQuery();
%>
<body background="background.jpg">
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<table border="4" cellpadding='4px' bordercolor='black'>
<tr bgcolor='red'>
<th><font face='Cooper'>Name</font></th>
<th><font face='Cooper'>Email</font></th>
<th><font face='Cooper'>Mobile</font></th>
<th><font face='Cooper'>Password</font></th>
<th><font face='Cooper'>Test given</font></th>
<th><font face='Cooper'>Date of test</font></th>
<th><font face='Cooper'>Marks obtained</font></th>
<th><font face='Cooper'>Total marks</font></th>
<th><font face='Cooper'>Gender</font></th>
<th><font face='Cooper'>Passing year</font></th>
<th><font face='Cooper'>Qualification</font></th>

<th><font face='Cooper'>Questions</font></th>
<th><font face='Cooper'>Marks(corr.)</font></th>
<th><font face='Cooper'>Marks(wrong)</font></th>

</tr>
<%
while(rs.next())
{
	out.println("<tr bgcolor='gray'>");
	out.println("<td>"+rs.getString("name")+"</td>");
    out.println("<td>"+rs.getString("email")+"</td>");
	out.println("<td>"+rs.getString("mobile")+"</td>");
	out.println("<td>"+rs.getString("password")+"</td>");
	out.println("<td>"+rs.getString("test")+"</td>");
	out.println("<td>"+rs.getDate("date_of_test")+"</td>");
	out.println("<td align='right'>"+rs.getInt("marks_obtained")+"</td>");
	out.println("<td align='right'>"+rs.getInt("outof")+"</td>");
	out.println("<td>"+rs.getString("gender")+"</td>");
	out.println("<td>"+rs.getString("passing_year")+"</td>");
	out.println("<td>"+rs.getString("qualification")+"</td>");
	out.println("<td align='right'>"+rs.getInt("question")+"</td>");
	out.println("<td align='right'>"+rs.getInt("correct")+"</td>");
	out.println("<td align='right'>"+rs.getInt("wrong")+"</td>");
	out.println("</tr>");	
}
%>
</table>
<center><h4><a href='adminpanel.jsp'>Click here to go to admin panel.</a></h4></center>
</body>