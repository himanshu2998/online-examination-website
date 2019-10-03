<%@ page import="java.sql.*"%>
<%@ page import="beans.admininfo" %>
<%admininfo in=(admininfo)session.getAttribute("use");
String language=in.getLanguage();
String choice4=request.getParameter("choice4");
String question=request.getParameter("question");
String choice1=request.getParameter("choice1");
String choice2=request.getParameter("choice2");
String choice3=request.getParameter("choice3");
String radio=request.getParameter("choice");
Class.forName("com.mysql.jdbc.Driver");
int s=1;
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps1=conn.prepareStatement("select sno from "+language);
ResultSet rs=ps1.executeQuery();
while(rs.next())
{
	s++;
}
PreparedStatement ps=conn.prepareStatement("insert into "+language+" values(?,?,?,?,?,?,?)");
ps.setInt(1,s);
ps.setString(2,question);
ps.setString(3,choice1);
ps.setString(4,choice2);
ps.setString(5,choice3);
ps.setString(6,choice4);
ps.setString(7,radio);
ps.executeUpdate();
conn.close();
%>
<center><h4>question added.</h4></center>
<jsp:include page="addquestion.jsp"/>