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
	CachedRowSetImpl crs = SMSDBOperations.execute("select app.app_id, concat(app.App_Name,' - ',app.App_Version)appname from smsdb.applications app, smsdb.app_dependency appd where app.app_id = appd.dependency_app_id and appd.app_id ="+appId);
	if(crs!=null && crs.next()) {
%>
	<table>
	<tr>
		<td><Strong>Applications Dependent On:</Strong></td>
	</tr>
<%
		do {
%>
			<tr><td><br/><%=crs.getString(2)%></td></tr>
<%
		}while(crs.next());
%>
	</table>
<%	
	}
	else {
%>
		<table><tr><td><p><Strong><font color="green">Not dependent on any applications.</font></Strong></p></td></tr></table>
<%
	}
%>

</body>
</html>