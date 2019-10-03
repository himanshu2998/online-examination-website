<%@page import="beans.testdetails" %>
<%@page import="beans.info" %>
<%@ page import="java.sql.*"%>
<%String test=(String)session.getAttribute("testchoice"); %>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<body background='background.jpg'></body>
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<% Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from "+test);
ResultSet rs=ps.executeQuery();
testdetails td=(testdetails)session.getAttribute("td");
PreparedStatement ps4=conn.prepareStatement("select * from paper");
int question=0,correct=0,wrong=0;
ResultSet rs4=ps4.executeQuery();
if(rs4.next())
{
	question=rs4.getInt("question");
	correct=rs4.getInt("correct");
	wrong=rs4.getInt("wrong");
}
int[] ques=td.getQues();
int questionleft=td.getQuestionleft();
int quesno=question-questionleft+1;
while(rs.next())
{
	if(rs.getInt("sno")==ques[question-questionleft])
	{
		%>
		
		<form action='questionprocess.jsp' method='post'>
		<table cellpadding='10'>
		<tr>
		<th><h2>Q<%=quesno %>.</h2></th>
		<th colspan='3'><h2><%=rs.getString("question")%></h2></th>
		</tr>
		<tr>
		<th><input type='radio' name='opt' value='1'></th>
		<th><%=rs.getString("choice1")%></th>
		<th><input type='radio' name='opt' value='2'></th>
		<th><%=rs.getString("choice2")%></th>
		</tr>
		<tr>
		<th><input type='radio' name='opt' value='3'></th>
		<th><%=rs.getString("choice3")%></th>
		<th><input type='radio' name='opt' value='4'></th>
		<th><%=rs.getString("choice4")%></th>
		</tr>
		<tr>
		<th colspan='3'></th>
		<%if(questionleft==1) {%>
		<th><input type="submit" value='Finish'></a></th>
		<%} 
		else{ %>
		<th><input type="submit" value='Next->'></th>
		<%} %>
		</tr>
		</table>
		</form>
		<%
		break;
	}
}

%>
