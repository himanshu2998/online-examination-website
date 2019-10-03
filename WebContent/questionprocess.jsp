<%@page import="beans.testdetails" %>
<%@page import="beans.info" %>
<%@ page import="java.sql.*"%>
<%String test=(String)session.getAttribute("testchoice"); %>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<% 
String opt="0";
if(request.getParameter("opt")!=null)
{
	opt=request.getParameter("opt");
}
	testdetails td=(testdetails)session.getAttribute("td");
	int[] ques=td.getQues();
	int questionleft=td.getQuestionleft();
	int correctans=td.getCorrectans();
	int[] marked=td.getMarked();
	int totalmarks=td.getTotalmarks();
	int wrongans=td.getWrongans();
	
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
	PreparedStatement ps=conn.prepareStatement("select * from "+test);
	ResultSet rs=ps.executeQuery();
	PreparedStatement ps4=conn.prepareStatement("select * from paper");
	int question=0,correct=0,wrong=0;
	ResultSet rs4=ps4.executeQuery();
	if(rs4.next())
	{
		question=rs4.getInt("question");
		correct=rs4.getInt("correct");
		wrong=rs4.getInt("wrong");
	}
	marked[question-questionleft]=Integer.valueOf(opt);
	while(rs.next())
	{
		if(rs.getInt("sno")==ques[question-questionleft])
		{
			if(!opt.equals("0"))
			{
				if(rs.getString("choice").equals(opt))
				{
					correctans++;	
				}
				else
					wrongans++;
			}
			break;
		}
	}
	totalmarks=(correct*correctans)-(wrongans*wrong);
	questionleft--;
	td.setCorrectans(correctans);
	td.setMarked(marked);
	td.setQuestionleft(questionleft);
	td.setTotalmarks(totalmarks);
	td.setWrongans(wrongans);
	conn.close();
	if(questionleft==0)
	{
		%>
		<jsp:forward page="result.jsp"/>
		<%
		}
		else
		{
		%>
		<jsp:forward page="viewquestion.jsp"/>
		<%
		}%>