<%@ page import="beans.checkbox"%>
<jsp:useBean id="r" class="beans.checkbox"/>
<jsp:setProperty property="*" name="r"/>
<% session.setAttribute("ch",r);%>
<jsp:forward page="deletequestionprocess.jsp"/>