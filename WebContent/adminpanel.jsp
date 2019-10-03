<%@ page import="beans.info"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<html>
<head>
<title>admin</title>
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
</style>
</head>
<body background='background.jpg'>
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<h1>Question editing.</h1>
<div>
<center>
<form action='adminpanelprocess.jsp' methot='post'>
<table >
<tr>
<th>Language :</th>
<td colspan='2'><select name='language'>
<option value='java'>Java</option>
<option value='cpp'>C++</option>
<option value='c'>C</option>
<option value='datastructures'>Data Structures</option>
</select>
</td>
</tr>
<th><input type='radio' name="radio" value='addquestion' checked="checked">Add Questions</th>
<th><input type='radio' name='radio' value='deletequestion'>Delete Questions</th>
<th><input type='radio' name='radio' value='allquestion'>View All Questions</th>
</tr>
<tr>
<th colspan='3'><input type='submit' value='Submit'><th>
</th>
</table>
</form>
</center>
</div>
<h1>Question Paper settings.</h1>
<div>
<center>
<form action='papersetting.jsp' methot='post'>
<table >
<tr>
<th>No. of Questions</th>
<th><select name='numberofquestion'>
<%int i=1;
for(i=1;i<=30;i++)
out.println("<option value='"+i+"'>"+i+"</option>");
%>
</th>
</tr>
<tr>
<th>Marks alloted for each correct ans.</th>
<th><select name='correctnumber'>
<% i=1;
for(i=1;i<=5;i++)
out.println("<option value='"+i+"'>"+i+"</option>");
%>
</th>
</tr>
<tr>
<th>Marks deducted for each wrong ans.</th>
<th><select name='wrongnumber'>
<% i=1;
for(i=1;i<=5;i++)
out.println("<option value='"+i+"'>"+i+"</option>");
%>
</th>
</tr>
<tr>
<th colspan='2'><input type='submit' value='Done'></th>
</tr>
</table>
</form>
</center>
</div>

<h1>Search students.</h1>
<div>
<center>
<h4><nav><a href='showallstudents.jsp'>Click here to get a list of all students</a></nav></h4>
<form action='searchbyname.jsp' method='post'>
<table>
<tr>
<th>Enter name:</th>
<th><input type="search" name='nameofstudent'></th>
</th>
<tr>
<th colspan='2'><input type='submit' value="Search"></th>
</table>
</form>
<form action='searchbylanguage.jsp' method='post'>
<table>
<tr>
<th>Select language:</th>
<th><select name='language'>
<option value='java'>Java</option>
<option value='c++'>C++</option>
<option value='c'>C</option>
<option value='datastructures'>Data Structures</option>
</select></th>
<tr>
<th colspan='2'><input type='submit' value="Show all students"></th>
</table>
</form>
</center>
</div>
<h1>Search company.</h1>
<div>
<center>
<h4><nav><a href='showallcompany.jsp'>Click here to get a list of all companies</a></nav></h4>
<form action='searchbytype.jsp' method='post'>
<table>
<tr>
<th>Select type:</th>
<th>
<select name='type'>
<option value='product'>Product based</option>
<option value='service'>Service based</option>
</select>
</th>
</th>
<tr>
<th colspan='2'><input type='submit' value="Search"></th>
</table>
</form>
</center>
</div>
</body>
</html>

