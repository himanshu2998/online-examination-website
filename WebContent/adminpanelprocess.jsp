<%@ page import="beans.admininfo"%>
<jsp:useBean id="admin" class="beans.admininfo"/>
<jsp:setProperty property="*" name="admin"/>
<%
session.setAttribute("use",admin);
%>
<%
String radio=request.getParameter("radio");
String name=request.getParameter("name");
if(radio.equals("addquestion"))
{
	%>
	<jsp:forward page="addquestion.jsp"/>
	<%
}
else if(radio.equals("deletequestion"))
{
	 %>
	<jsp:forward page="deletequestion.jsp"/>
	<%
}
else if(radio.equals("allquestion"))
{
	 %>
	<jsp:forward page="allquestion.jsp"/>
	<%
}
%>