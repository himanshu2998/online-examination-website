<%@ page import="java.sql.*" %>
<% 
int correct=Integer.valueOf(request.getParameter("correctnumber"));
int question=Integer.valueOf(request.getParameter("numberofquestion"));
int wrong=Integer.valueOf(request.getParameter("wrongnumber"));
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("delete from paper");
ps.executeUpdate();
ps=conn.prepareStatement("insert into paper values(?,?,?)");
ps.setInt(1,question);
ps.setInt(2,correct);
ps.setInt(3,wrong);
ps.executeUpdate();
conn.close();
%>
<center><h4>Paper settings done.</h4></center>
<jsp:include page="adminpanel.jsp"/>