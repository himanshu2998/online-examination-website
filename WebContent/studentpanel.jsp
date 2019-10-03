<%@ page import="beans.info"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); 
%>
<html>
<head>
<title>student</title>
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
.button{
display: inline-block;
cursor: pointer;
}
.button:HOVER {
	
width: 230;	
height: 230;	
}
</style>
</head>
<body background='background.jpg'>
<h5 align="right" >Signed in as:<%=name%><button style="cursor: pointer;" onclick="window.location.href='signin.html'">Log out</button></h5>
<h1>Start your test here.</h1>
<div>
<center>
<form action="studentpanelprocess.jsp" method="post">
<table cellspacing='20'>
<tr>
<th><button class="button" type="submit" name='lang' value='java' title='Java'><img src="java.png" width="200" height="200"></button></th>
<th><button class="button" type="submit" name='lang' value='c' title='C'><img src="c.jpg" width="200" height="200"></button></th>
<th><button class="button" type="submit" name='lang' value='cpp' title='C++'><img src="cpp.png" width="200" height="200"></button></th>
<th><button class="button" type="submit" name='lang' value='datastructures' title='Data structures'><img src="datastructures.png" width="200" height="200"></button></th>
</tr>
</table>
</form>
</center>
</div>
<h1>Feedback.</h1>
<div>
<center>
<form action='review.jsp' method='post'>
<table>
<tr>
<th>Your feedback :</th>
<th><textarea rows="3" cols="100" name='feedbackgiven' required="required" ></textarea></th>
</tr>
<tr>
<th colspan='2'>
<button type="submit" name='stargiven' value='1' title='1 star'><img src="star.png" width="32px" height="30px"></button><button type="submit" name='stargiven' value='2' title='2 star'><img src="star.png" width="32px" height="30px"></button><button type="submit" name='stargiven' value='3' title='3 star'><img src="star.png" width="32px" height="30px"></button><button type="submit" name='stargiven' value='4' title='4 star'><img src="star.png" width="32px" height="30px"></button><button type="submit" name='stargiven' value='5' title='5 star'><img src="star.png" width="32px" height="30px"></button>
</th>
</tr>
</table>
</form>
</center>
</div>
<h1>Your info.</h1>
<div>
<center>
<form action='myinfo.jsp' method='post'>
<input type="submit" value="Click here to know about yourself" style="padding: 10px;width: 15%;cursor: pointer;background-color: orange;">
</form>
</center>
</div>

</body>
</html>

