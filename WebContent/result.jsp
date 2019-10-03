
<%@page import="java.text.*"%>
<%@page import="java.util.Date"%>
<%@page import="beans.testdetails" %>
<%@page import="beans.info" %>
<%@ page import="java.sql.*"%> 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps4=conn.prepareStatement("select * from paper");
int questionquan=0,correctnum=0,wrongnum=0;
ResultSet rs4=ps4.executeQuery();
if(rs4.next())
{
	questionquan=rs4.getInt("question");
	correctnum=rs4.getInt("correct");
	wrongnum=rs4.getInt("wrong");
}
%>
<%String test=(String)session.getAttribute("testchoice"); %>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<% 
	testdetails td=(testdetails)session.getAttribute("td");
	int[] ques=td.getQues();
	int correctans=td.getCorrectans();
	int[] marked=td.getMarked();
	int totalmarks=td.getTotalmarks();
	int wrongans=td.getWrongans();
	int unattempted=questionquan-correctans-wrongans;
		String correct="";
	String your="-";
	String question="";
%>
<body background='background.jpg'></body>
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<table cellpadding='5' width="95%">
<tr bgcolor="red">
<th>Sno.</th>
<th>Question</th>
<th>Correct choice.</th>
<th>Your choice</th>
</tr>
<%
for(int i=0;i<questionquan;i++)
{
	PreparedStatement ps=conn.prepareStatement("select * from "+test);
	ResultSet rs=ps.executeQuery();
	while(rs.next())
	{
		if(rs.getInt("sno")==ques[i])
		{
			question=rs.getString("question");
			{
				if(rs.getString("choice").equals("1"))
					correct=rs.getString("choice1");
				else if(rs.getString("choice").equals("2"))
					correct=rs.getString("choice2");
				else if(rs.getString("choice").equals("3"))
					correct=rs.getString("choice3");
				else if(rs.getString("choice").equals("4"))
					correct=rs.getString("choice4");
			}
			if(marked[i]==1)
				your=rs.getString("choice1");
			else if(marked[i]==2)
				your=rs.getString("choice2");
			else if(marked[i]==3)
				your=rs.getString("choice3");
			else if(marked[i]==4)
				your=rs.getString("choice4");
			else if(marked[i]==0)
				your="-";
			break;
		}
	}
	out.println("<tr bgcolor='gray'>");
	out.println("<th>"+(i+1)+"</th>");
	out.println("<th>"+question+"</th>");
	out.println("<th>"+correct+"</th>");
	out.println("<th>"+your+"</th>");
	out.println("</tr>");
}
%>
<tr bgcolor='yellow'>
<td colspan='3'><b>Correct ans.</b></td>
<th><b><%=correctans%></b></th>
</tr>
<tr bgcolor='yellow'>
<td colspan='3'><b>Wrong ans.</b></td>
<th><b><%=wrongans%></b></th>
</tr>
<tr bgcolor='yellow'>
<td colspan='3'><b>Unattempted ques.</b></td>
<th><b><%=unattempted%></b></th>
</tr>
<tr bgcolor='cyan' style="border-width: medium;border-color: black;">
<td colspan='3'><h2><b>Total marks</b></h2></td>
<th><h2><b><u><%=totalmarks%></u></b></h2></th>
</tr>
</table>
<%
Date fecha=new Date();
String sdf=new SimpleDateFormat("yyyy-MM-dd").format(fecha);
PreparedStatement ps1=conn.prepareStatement("update student set test=?,date_of_test=?,marks_obtained=?,question=?,correct=?,wrong=?,outof=? where name=?");
ps1.setString(1,test);
ps1.setDate(2,java.sql.Date.valueOf(sdf));
ps1.setInt(3,totalmarks);
ps1.setInt(4,questionquan);
ps1.setInt(5,correctnum);
ps1.setInt(6,wrongnum);
ps1.setInt(7,correctnum*questionquan);
ps1.setString(8,name);
ps1.executeUpdate();
%>
<br>
<center><a href='studentpanel.jsp'><input type='button' value='Click here to go back to student panel' ></a></center>