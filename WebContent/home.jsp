<%@ page import="java.sql.*" %> 
<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/website","root","himanshu");
PreparedStatement ps=conn.prepareStatement("select * from paper");
int question=0,correct=0,wrong=0;
ResultSet rs=ps.executeQuery();
if(rs.next())
{
	question=rs.getInt("question");
	correct=rs.getInt("correct");
	wrong=rs.getInt("wrong");
}
conn.close();
%>
<html>
<head><title>home</title>
<style>
nav {
width : 15%;
padding: 4px;
height: 5%;
background-color: cyan;
}
nav a {
	margin-top: 4px;
	display: inline-block;
	background-color: cyan;
	margin-left: 4px; 
}
nav a:hover{
	background-color: red;
	color: black;
}
.green.btn {
  background: linear-gradient(#6BDB55, #57B245);
  text-shadow: 1px 1px 1px #57B245;
}

.red.btn {
  background: linear-gradient(#D60A0A, #B20808);
  text-shadow: 1px 1px 1px #B20808;
}

.blue.btn {
  background: linear-gradient(#11A1D6, #0E86B2);
  text-shadow: 1px 1px 1px #0E86B2;
}
</style>
</head>
<body style="background-image: url('home.jpg');background-repeat: no-repeat;background-attachment: fixed;background-size: cover;">
<br>
<h2 style="font-family: Showcard Gothic;"><u>Welcome to our site !!!</u></h2>
<p>
Here students are allowed to give examination on computer programming language.
</p> 
<h2 style="font-family: Showcard Gothic;"><u>Rules.</u></h2>
<ul>
<li>One student can give only one test of any topic they choose.</li>
<li>To give exam student must be registered.</li>
<li>Paper would be MCQ with <%=question%> question.</li>
<ol>
<li>Each <b>correct</b> answer will fetch you <%=correct%> marks.</li>
<li>Each <b>wrong</b> answer will take away your <%=wrong%> mark.</li>
<li><b>Unattempted</b> question has no marking.</li>
</ol>
</ul>
<h4>Here are some useful links to study computer languages.</h4>
<button style="padding: 10px;width: 15%;cursor: pointer;background-color: yellow;" onclick="window.location.href='http://www.w3schools.in/java-tutorial/'"><b>Java</b></button>
<button style="padding: 10px;width: 15%;cursor: pointer;background-color: red;" onclick="window.location.href='http://www.w3schools.in/c-tutorial/'"><b>C</b></button>
<button style="padding: 10px;width: 15%;cursor: pointer;background-color: green;" onclick="window.location.href='http://www.w3schools.in/category/cplusplus-tutorial/'"><b>C++</b></button>
<button style="padding: 10px;width: 15%;cursor: pointer;background-color: purple;" onclick="window.location.href='http://www.w3schools.in/category/data-structures-tutorial/'"><b>Data structures</b></button>
</body>
</html>