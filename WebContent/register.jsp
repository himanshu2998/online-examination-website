<%@ page import="java.util.Random"%>
<%Random r=new Random();
String capchat="";
int a;
a=48+r.nextInt(10);
capchat=capchat+(char)a;
a=48+r.nextInt(10);
capchat=capchat+(char)a;
a=65+r.nextInt(26);
capchat=capchat+(char)a;
a=97+r.nextInt(26);
capchat=capchat+(char)a;
a=48+r.nextInt(10);
capchat=capchat+(char)a;
String capcha=capchat;
session.setAttribute("capi",capcha);
%>
<body background="background.jpg">
<center>
<br>
<form action='registerprocess.jsp' method='post'>
<table>
<tr>
<th>Enter name :</th>
<td><input type='text' name='user' required="required"></td>
</tr>
<tr>
<th>Enter email :</th>
<td><input type='email' name='email' required="required"></td>
</tr>
<tr>
<th>Enter mobile :</th>
<td><input type='text' name='mobile' required="required"></td>
</tr>
<tr>
<th>Enter password :</th>
<td><input type='password' name='password' required="required"></td>
</tr>


<tr>
<th>Qualification :</th>
<td>
<select name='qualification'>
<option value='B.tech'>B.Tech</option>
<option value='MCA'>MCA</option>
<option value='BCA'>BCA</option>
<option value='other'>other</option>
</select>
</td>
</tr>
<tr>
<th>Passing year :</th>
<td>
<select name='year'>
<option value='2014-2015'>2014-15</option>
<option value='2015-2016'>2015-16</option>
<option value='2016-2017'>2016-17</option>
<option value='persuing'>Still persuing</option>
</select>
</td>
</tr>
<tr>
<th colspan='2'>
<input type='radio' name='gender' value='M' checked="checked">Male
<input type='radio' name='gender' value='F'>Female
</th>
</tr>
<tr>
<th>capcha :</th>
<th><del><input type="button" value='<%=capcha%>' disabled="disabled"></del></th>
</tr>
<tr>
<th></th>
<th><input type='text' name='capchau' required="required"></th>
</tr>
<tr>
<th><input type="reset" value='Reset'></th>
<th><input type='submit' value='Register'></th>
</tr>
</table>
</form>
</center>
</body>