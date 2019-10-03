<%@ page import="beans.info"%>
<jsp:useBean id="c" class="beans.info"/>
<jsp:setProperty property="*" name="c"/>
<%
session.setAttribute("user",c);
%>
<jsp:forward page="signin.jsp"/>