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
<form action='registercompanyprocess.jsp' method='post'>
<table>
<tr>
<th>Name of company :</th>
<td><input type='text' name='user' required="required"></td>
</tr>
<tr>
<th>Address :</th>
<td><textarea rows='2' cols='30' name='address' required="required"></textarea></td>
</tr>
<tr>
<th>Enter new password :</th>
<td><input type='password' name='password' required="required"></td>
</tr>
<tr>
<th>Type :</th>
<td>
<select name='type'>
<option value='product'>Product based</option>
<option value='service'>Service based</option>
</select>
</td>
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