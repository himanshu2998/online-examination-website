<%@ page import="java.sql.*"%>
<%@ page import="beans.info"%>
<%@ page import="beans.admininfo"%>
<%@ page import="beans.checkbox"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<%admininfo inad=(admininfo)session.getAttribute("use");
String language=inad.getLanguage();%>
<% 
checkbox ch=(checkbox)session.getAttribute("ch");
String[] choice=ch.getCheck();
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps1=conn.prepareStatement("select sno from "+language);
ResultSet rs=ps1.executeQuery();
while(rs.next())
{
	for(int i=0;i<choice.length;i++)
	{
		if(choice[i].equals(String.valueOf(rs.getInt("sno"))))
		{
			PreparedStatement ps=conn.prepareStatement("delete from "+language+" where sno=?");
			ps.setInt(1,rs.getInt("sno"));
			ps.executeUpdate();
		}
	}
}
PreparedStatement ps3=conn.prepareStatement("select sno from "+language);
ResultSet rs1=ps3.executeQuery();
int j=1;
while(rs1.next())
{
	if(j!=rs1.getInt("sno"))
	{
		PreparedStatement ps2=conn.prepareStatement("update "+language+" set sno=? where sno=?");
		ps2.setInt(1,j);
		ps2.setInt(2,rs1.getInt("sno"));
		ps2.executeUpdate();
	}
	j++;
}
conn.close();
%>
<center><h4>Questions deleted.</h4></center>
<center><h4><a href='adminpanel.jsp'>Click here to go to admin panel</a></h4></center>
<jsp:include page="deletequestion.jsp"/>