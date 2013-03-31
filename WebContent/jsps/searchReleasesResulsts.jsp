<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%

String appId = request.getParameter("application");
String releaseName = request.getParameter("releaseName");

CachedRowSetImpl crApp = SMSDBOperations.execute("select app.app_name, app.app_version from smsdb.applications app where app.app_id="+appId);
String appName = "";
String appVersion = "";

if(crApp.next()) {
	appName = crApp.getString(1);
	appVersion = crApp.getString(2);
}

%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">

<html>

<jsp:include page="head.jsp"></jsp:include>
<head>
	<title><%=appName%> Releases</title>
</head>
<body>

	<!-- Main Page Container -->
	<div class="page-container">

		<jsp:include page="header.jsp"></jsp:include>
		<!-- B. MAIN -->


		<table class="mytable">
			<tr>
				<td align="left">
					<p><Strong>&nbsp;</Strong></p>
				</td>
				<td align="right">
					<a href="javascript:history.back();" title='Go to previous page'><Strong> << Back << </Strong></a>
				</td>
			</tr>
		</table>

		<div class="main">

			<!-- B.1 MAIN CONTENT -->
			<div class="main-content">

					<div class="subcontent-unit-border-blue-nobg-big">
						<h1 class="blue">Releases for <%=appName%>&nbsp;<%=appVersion%></h1>

						<table>
						    <tbody>
			            		<tr>
			            			<th class="top" scope="col">Name</th>
			            			<th class="top" scope="col">Date</th>
			            			<th class="top" scope="col">Type</th>
			            			<th class="top" scope="col">QA/Prod</th>
			            			<th class="top" scope="col">Comments</th>
			            			<th class="top" scope="col">Notes</th>
			            			<th class="top" scope="col">Created By</th>
			            		</tr>
<%
if(appId != null) {
	
	StringBuffer queryBuffer = new StringBuffer("select rel.release_id, rel.release_name, DATE_FORMAT(rel.release_Date,'%m-%d-%Y') as release_Date, rel.release_type, if(rel.release_promoted=1, 'QA/Prod', 'QA') as promoted, rel.release_comments, rel.release_notes_URL, rel.created_by, rel.release_status from smsdb.releases rel where rel.app_id="+appId);
	if(releaseName!= null && !"".equals(releaseName.trim())) {
		queryBuffer.append(" and upper(rel.release_name) like '%"+releaseName.toUpperCase()+"%'");
	}
	queryBuffer.append(" order by rel.release_Date desc");
	System.out.println("##View Releases="+queryBuffer);
	CachedRowSetImpl crs = SMSDBOperations.execute(queryBuffer.toString());

	if(crs!=null && crs.next()) {
		do {
%>
				            <tr>
				            	<td scope="row"><a href="#" onMouseover="dropdownmenu(this, event, 'anylinkmenu<%=crs.getString(1)%>')"><%=crs.getString(2)%></a></td>
				            	<td><%=crs.getString(3)%></td>
				            	<td><%=crs.getString(4)%></td>
				            	<td><%=crs.getString(5)%></td>
				            	<td><%=crs.getString(6)%></td>
				            	<td><a href="javascript:window.open('<%=crs.getString(7)%>');" title="<%=crs.getString(7)%>"><%=(crs.getString(7)).substring(0, 10)%>...</a></td>
				            	<td><%=crs.getString(8)%></td>
				            </tr>

				            <div id="anylinkmenu<%=crs.getString(1)%>" class="anylinkcss">
								<a href="viewRelease.jsp?appName=<%=appName%>&appVersion=<%=appVersion%>&releaseId=<%=crs.getString(1)%>&appId=<%=appId%>">Details</a>
								<a href="editRelease.jsp?appName=<%=appName%>&appVersion=<%=appVersion%>&releaseId=<%=crs.getString(1)%>&appId=<%=appId%>">Edit</a>
							</div>
<%
		}while(crs.next());
	}
	else {
%>
							<tr><td colspan="7"><br><p>No matching data found.</td></tr>
<%
	}
%>
							</tbody>
			          	</table>
<%
}
else {
%>		

						<br><br><p><Strong><font color="red">Unauthorized page access.</font></Strong></p>
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
	document.getElementById('releases').className  = "active";
</script>

</html>
