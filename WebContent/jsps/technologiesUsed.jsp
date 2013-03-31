<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
body, html, input {
	font-family:Verdana, Arial, Helvetica, sans-serif;
	font-size:10px;
	color: #333333;
}
</style>
</head>
<body>

<%
	String appId = request.getParameter("appId");
	CachedRowSetImpl crs = SMSDBOperations.execute("select te.tech_id, te.tech_name, te.tech_version, te.tech_desc from smsdb.technologies te, smsdb.app_techs ate where te.tech_id = ate.tech_id and ate.app_id="+appId);
	if(crs!=null && crs.next()) {
%>

	<table width="300px">
	<tr>
		<td><Strong>Technology</Strong></td>
		<td><Strong>Version</Strong></td>
		<td><Strong>Description</Strong></td>
	</tr>

<%
		do {
%>
	<tr>
		<td><%=crs.getString(2)%></td>
		<td><%=crs.getString(3)%></td>
		<td><%=crs.getString(4)%></td>
	</tr>
<%
		}while(crs.next());
%>
	</table>
<%	
	}
	else {
%>
		<table><tr><td><p><Strong><font color="green">No dependent Applications exist.</font></Strong></p></td></tr></table>
<%
	}
%>

</body>
</html>
