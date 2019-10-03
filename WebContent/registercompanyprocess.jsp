<%@ page import='java.sql.*'%>
<%
String name=request.getParameter("user");
String password=request.getParameter("password");
String capcha=(String)session.getAttribute("capi");
String capchau=request.getParameter("capchau");
String address=request.getParameter("address");
String type=request.getParameter("type");
if(capcha.equals(capchau))
{
	int r=1;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
	PreparedStatement ps=conn.prepareStatement("insert into company values(?,?,?,?)");
	PreparedStatement ps1=conn.prepareStatement("select * from company");
	ps.setString(1,name);
	ps.setString(2,password);
	ps.setString(3,type);
	ps.setString(4,address);
	ResultSet rs=ps1.executeQuery();
	while(rs.next())
	{
		if(rs.getString("name").equals(name))
		{
			r=0;
			break;
		}
		else
			r=1;
	}
	
	if(r!=0)
	{
		r=ps.executeUpdate();
		out.println("<center><h3>Registered succesfully!!!</h3/></center>");
		%>
		<br>
		<body background='background.jpg'></body>
		<center><a href="signin.html"><input type='button' value='Click here to sign in'></a></center>
		<%
		conn.close();
	}
	else
	{
%>
<center><h2><font color='red'>Try another name.This name already registered.</font></h2></center>
<jsp:include page="registercompany.jsp"/>
<%
	}
}
else
{
	%>
<center><h3><font color='red'>Wrong capcha.</font></h3></center>
<jsp:include page="registercompany.jsp"/>
<%	
}%>