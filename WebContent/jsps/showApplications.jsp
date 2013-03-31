<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="org.nags.sms.helpers.QuickSearch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">

		<jsp:include page="header.jsp"></jsp:include>
		<!-- B. MAIN -->

<%
QuickSearch qsearch = new QuickSearch();
String searchServer = request.getParameter("server_id");
String serverTokens[] = searchServer.split(";");

String searchTech = request.getParameter("tech_id");
String techTokens[] = searchTech.split(";");
%>
		<table class="mytable">
			<tr>
				<td align="left">&nbsp;</td>
				<td align="right">
					<a href="javascript:history.back();" title='Go to previous page'><Strong> << Back << </Strong></a>
				</td>
			</tr>
		</table>

		<div class="main">

			<!-- B.1 MAIN CONTENT -->
			<div class="main-content">

					<div class="subcontent-unit-border-blue-nobg-big">
<%
if(!"0".equals(serverTokens[0])) {
%>
						<h1 class="blue">Applications on Server <i>"<%=serverTokens[1]%>"</i></h1>
						<table>
						    <tbody>
					    		<tr><th class="top" scope="col">Application</th><th class="top" scope="col">Version</th><th class="top" scope="col">Contacts</th></tr>
<%
	CachedRowSetImpl crs = SMSDBOperations.execute("select distinct ap.app_id, ap.app_name, ap.app_version, ap.app_contacts from smsdb.server sr, smsdb.app_resources ar, smsdb.applications ap where sr.server_id = ar.server_id and ar.app_id = ap.app_id and upper(sr.server_name) like upper('%"+serverTokens[0]+"%') order by ap.app_name asc"); 
	//SMSDBOperations.execute("select server_id, server_name,3,4,5 from smsdb.server where server_status=1 order by server_name asc");
	if(crs!=null && crs.next()) {
		do {
%>
					        <tr>
				            	<td><%=crs.getString(2)%></td>
				            	<td><%=crs.getString(3)%></td>
				            	<td><%=crs.getString(4)%></td>
				            </tr>
<%
		}while(crs.next());
	}
	else {
%>
							<tr><td colspan="3"><br><p>No matching data found.</td></tr>
<%
	}
%>
							</tbody>
			          	</table>
<%
}
else if(!"0".equals(techTokens[0])) {
%>
						<h1 class="blue">Applications using <i>"<%=techTokens[1]%>"</i></h1>
						<table>
						    <tbody>
					    		<tr><th class="top" scope="col">Application</th><th class="top" scope="col">Version</th><th class="top" scope="col">Contacts</th></tr>
<%

	CachedRowSetImpl crs = SMSDBOperations.execute("select app.app_name, app.app_version, app.app_contacts from smsdb.technologies te, smsdb.app_techs ate, smsdb.applications app where te.tech_id = ate.tech_id and ate.app_id = app.app_id and te.tech_id="+techTokens[0]+" order by app.app_name asc");
	if(crs!=null && crs.next()) {
		do {
%>
					        <tr>
				            	<td><%=crs.getString(1)%></td>
				            	<td><%=crs.getString(2)%></td>
				            	<td><%=crs.getString(3)%></td>
				            </tr>
<%
		}while(crs.next());
		          	
	}
	else {
%>
							<tr><td colspan="3"><br><p>No matching data found.</td></tr>
<%
	}
%>
							</tbody>
			          	</table>
<%
}
%>
					</div>
			</div>
			<!-- main content -->

		</div>
	</div>

</body>

<script>
	document.getElementById('apps').className  = "active";
</script>

</html>
