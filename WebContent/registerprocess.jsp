<%@ page import='java.sql.*'%>
<%
String name=request.getParameter("user");
String password=request.getParameter("password");
String email=request.getParameter("email");
String mobile=request.getParameter("mobile");
String capcha=(String)session.getAttribute("capi");
String capchau=request.getParameter("capchau");
String qualification=request.getParameter("qualification");
String year=request.getParameter("year");
String gender=request.getParameter("gender");
if(capcha.equals(capchau))
{
	int r=1;
	Class.forName("com.mysql.jdbc.Driver");
	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
	PreparedStatement ps=conn.prepareStatement("insert into student values(?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
	PreparedStatement ps1=conn.prepareStatement("select * from student");
	ps.setString(1,name);
	ps.setString(2,email);
	ps.setString(3,mobile);
	ps.setString(4,password);
	ps.setString(5,"not given");
	ps.setDate(6,null);
	ps.setInt(7,0);
	ps.setInt(8,0);
	ps.setInt(9,0);
	ps.setInt(10,0);
	ps.setInt(11,0);
	ps.setString(12,gender);
	ps.setString(13,year);
	ps.setString(14,qualification);
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
<jsp:include page="register.jsp"/>
<%
	}
}
else
{
	%>
<center><h3><font color='red'>Wrong capcha.</font></h3></center>
<jsp:include page="register.jsp"/>
<%	
}%>