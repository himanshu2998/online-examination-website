
<%@ page import="beans.info"%>
<%info in=(info)session.getAttribute("user");
String name=in.getUser(); %>
<body background="background.jpg">
<h5 align="right" >Signed in as:<%=name%></h5>
<h1>Add Question here:</h1>
<form action="addquestionprocess.jsp" method="post">
<table>
<tr>
<th>Write question to be added here:<br>(mark radio corresponding to correct ans)</th>
<th><textarea rows="3" cols="100" name='question'>enter question here</textarea></th>
</tr>
<tr>
<th><input type='radio' name='choice' value='1'  checked="checked"></th>
<td><textarea name='choice1' rows="1" cols="80">option 1</textarea></td>
</tr>
<tr>
<th><input type='radio' name='choice' value='2'></th>
<td><textarea name='choice2' rows="1" cols="80">option 2</textarea></td>
</tr>
<tr>
<th><input type='radio' name='choice' value='3'></th>
<td><textarea name='choice3' rows="1" cols="80">option 3</textarea></td>
</tr>
<tr>
<th><input type='radio' name='choice' value='4'></th>
<td><textarea name='choice4' rows="1" cols="80">option 4</textarea></td>
</tr>
<tr>
<th colspan="2"><input type='submit' value='Add this question'></th>
</tr>
</table>
</form>
<center><h4><a href="adminpanel.jsp">Click here if you are done.</a></h4></center>
</body>
