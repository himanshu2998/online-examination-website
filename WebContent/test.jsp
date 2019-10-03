<%@page import="java.util.Random"%>
<%@page import="beans.testdetails" %>
<%@ page import="java.sql.*"%>
<%String test=(String)session.getAttribute("testchoice"); %>
<% Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select sno from "+test);
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

int size=0;
int h=0;
while(rs.next())
{
	size++;
}
Random ran=new Random();
int num=0;
int[] arr=new int[size];
for(int i=0;i<question;i++)
{
	h=1;
	while(h==1)
	{
		num=1+ran.nextInt(size);
		h=0;
		for(int j=0;j<i;j++)
		{
			if(arr[j]==num)
			{
				h=1;
				break;
			}
		}
	}
	arr[i]=num;
}
int temp;
int[] opt=new int[question];
for(int o=0;o<question;o++)
	opt[o]=0;
testdetails td=new testdetails();
td.setCorrectans(0);
td.setMarked(opt);
td.setQues(arr);
td.setQuestionleft(question);
td.setTotalmarks(0);
td.setWrongans(0);
session.setAttribute("td",td);
%>
<jsp:forward page="viewquestion.jsp"/>


