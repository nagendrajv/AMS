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
String searchServer = request.getParameter("server");
String serverTokens[] = searchServer.split(";");

String searchApp = request.getParameter("app");
String appTokens[] = searchApp.split(";");
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
if(searchServer != null && !"0".equals(serverTokens[0])) {
%>
						<h1 class="blue">Resources on Server <i>"<%=serverTokens[1]%>"</i></h1>
						<table>
						    <tbody>
					    		<tr><th class="top" scope="col">Resource</th><th class="top" scope="col">Comments</th><th class="top" scope="col">Application</th></tr>
<%
	CachedRowSetImpl crs = SMSDBOperations.execute("select distinct ar.app_resource_id, ar.resource_value, res.resource_type, ar.resource_comments, concat(ap.app_name, '-', ap.app_version)appl, ap.app_id from smsdb.app_resources ar, smsdb.resources res, smsdb.server srvr, smsdb.applications ap where ar.server_id = srvr.server_id and ar.resource_id = res.resource_id and ap.app_id = ar.app_id and upper(srvr.server_name) like upper('%"+serverTokens[1]+"%') order by ar.resource_value asc");
	if(crs!=null && crs.next()) {
		do {
%>
					        <tr>
				            	<td><%=crs.getString(2)%></td>
				            	<td><%=crs.getString(4)%></td>
				            	<td><%=crs.getString(5)%></td>
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
else if(searchApp != null && !"0".equals(appTokens[0])) {
%>
						<h1 class="blue">Resources for Application <i>"<%=appTokens[1]%>"</i></h1>
						<table>
						    <tbody>
					    		<tr><th class="top" scope="col">Resource</th><th class="top" scope="col">Comments</th><th class="top" scope="col">Application</th></tr>
<%
	String appTokens2[] = appTokens[1].split("-");
	CachedRowSetImpl crs = SMSDBOperations.execute("select distinct ar.app_resource_id, ar.resource_value, res.resource_type, ar.resource_comments, concat(ap.app_name, '-', ap.app_version)appl, ap.app_id from smsdb.app_resources ar, smsdb.resources res, smsdb.applications ap where ar.resource_id = res.resource_id and ap.app_id = ar.app_id and upper(ap.app_name) like upper('%"+appTokens2[0].trim()+"%') order by ar.resource_value asc");
	if(crs!=null && crs.next()) {
		do {
%>
						        <tr>
					            	<td><%=crs.getString(2)%></td>
					            	<td><%=crs.getString(4)%></td>
					            	<td><%=crs.getString(5)%></td>
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
	document.getElementById('resources').className  = "active";
</script>

</html>
