<%@ page import="beans.info"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); 
%>
<html>
<head>
<title>companypanel</title>
<style>
div {
background-color: yellow;
}
nav a {
	display: inline-block;
}
nav a:hover{
	background-color: green;
	color: white;
}	
}
</style>
</head>
<body background='background.jpg'>
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<h1>Filter.</h1>
<div>
<center>
<form action="companypanelprocess.jsp" method="post">
<table cellspacing='20'>
<tr>
<th>Qualification :</th>
<td>
<select name='qualification'>
<option value='%'>Any</option>
<option value='B.tech'>B.Tech</option>
<option value='MCA'>MCA</option>
<option value='BCA'>BCA</option>
<option value='other'>other</option>
</select>
</td>
<th>Score :</th>
<td>
<select name='score'>
<option value='0'>50% below</option>
<option value='50'>50%-60%</option>
<option value='60'>60%-70%</option>
<option value='70'>70%-80%</option>
<option value='80'>80%-90%</option>
<option value='90'>90% above</option>
</select>
</td>
</tr>
<tr>
<th>Topic :</th>
<td>
<select name='topic'>
<option value='c'>C</option>
<option value='java'>JAVA</option>
<option value='cpp'>C++</option>
<option value='datastructures'>Data Structures</option>
</select>
</td>
<th>Passing year :</th>
<td>
<select name='year'>
<option value='%'>Any</option>
<option value='2014-2015'>2014-15</option>
<option value='2015-2016'>2015-16</option>
<option value='2016-2017'>2016-17</option>
<option value='persuing'>Still persuing</option>
</select>
</td>
</tr>
<tr>
<th colspan='4'>
<input type='radio' name='gender' value='M' checked="checked">Male
<input type='radio' name='gender' value='F'>Female
<input type='radio' name='gender' value='%'>No preference
</th>
</tr>
<tr>
<th colspan='4'>
<input type='Submit' value='Get it'>
</th>
</tr>
</table>
</form>
</center>
</div>
</body>
</html>

