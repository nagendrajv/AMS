<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="org.nags.sms.helpers.QuickSearch"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
	<link rel="stylesheet" type="text/css" href="../css/subModal.css" />
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/subModal.js"></script>
	
	<script>
		function openModalWin(appid) {
			showPopWin('dependentApps.jsp?appId='+appid, 200, 200, null)
		}
	</script>
</head>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">

		<jsp:include page="header.jsp"></jsp:include>
		<!-- B. MAIN -->

<%

QuickSearch qsearch = new QuickSearch();

String searchCriteria = request.getParameter("searchCriteria");
//String searchType = request.getParameter("searchType");

%>
		<table class="mytable">
			<tr>
				<td align="left">
					<p><Strong>Criteria=*<%=searchCriteria%>*</Strong></p>
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
						<h1 class="blue">Search Results</h1>

<%

if(searchCriteria != null) {
//if("Resource".equals(searchType)) {

%>
						<table>
						    <caption onclick="toggleItem('myTbodyR');" align="top">
						      <u>Resources</u>
						    </caption>
						    <tbody id="myTbodyR" style="display:none;">
			            		<tr><th class="top" scope="col"> Name</th><th class="top" scope="col">Type</th><th class="top" scope="col">Server</th><th class="top" scope="col">Comments</th></tr>
<%
	CachedRowSetImpl crs = qsearch.searchResources(searchCriteria);
	if(crs!=null && crs.next()) {
		do {
%>
				            <tr>
				            	<td scope="row"><a href="#" onMouseover="dropdownmenu(this, event, 'anylinkmenu<%=crs.getString(1)%>')"><%=crs.getString(2)%></a></td>
				            	<td><%=crs.getString(4)%></td>
				            	<td><%=crs.getString(5)%></td>
				            	<td><%=crs.getString(3)%></td>
				            </tr>

				            <div id="anylinkmenu<%=crs.getString(1)%>" class="anylinkcss">
								<a href="resourceApps.jsp?appResId=<%=crs.getString(1)%>">Usage</a>
							</div>
<%
		}while(crs.next());
	}
	else {
%>
							<tr><td colspan="4"><br><p>No matching data found.</td></tr>
<%
	}
%>
							</tbody>
			          	</table>
						<table>
						    <caption onclick="toggleItem('myTbodyA');" align="top">
						      <u>Applications</u>
						    </caption>
						    <tbody id="myTbodyA">
								<tr><th class="top" scope="col"> Name</th><th class="top" scope="col">Version</th></tr>
<%
	crs = qsearch.searchApplications(searchCriteria);
	if(crs!=null && crs.next()) {
		do {
%>
				            <tr>
				            	<td scope="row"><a href="#" onMouseover="dropdownmenu(this, event, 'anylinkmenu<%=crs.getString(1)%>')"><%=crs.getString(2)%></a></td>
				            	<td><%=crs.getString(3)%></td>
				            </tr>

				            <div id="anylinkmenu<%=crs.getString(1)%>" class="anylinkcss">
								<a href="appInfo.jsp?appId=<%=crs.getString(1)%>">View Details</a> 
								<a href="#" onclick="javascript:openModalWin(<%=crs.getString(1)%>);">View Dependent Apps</a>
								<a href="viewReleases.jsp?appId=<%=crs.getString(1)%>">View Releases</a>
								<a href="appEdit.jsp?appId=<%=crs.getString(1)%>">Edit Details</a>
							</div>
<%
		}while(crs.next());
	}
	else {
%>
							<tr><td colspan="2"><br><p>No matching data found.</td></tr>
<%
	}
%>
							</tbody>
			          	</table>
						<table>
						    <caption onclick="toggleItem('myTbodyT');" align="top">
						      <u>Technologies</u>
						    </caption>
						    <tbody id="myTbodyT" style="display:none;">
				           		<tr><th class="top" scope="col">Name</th><th class="top" scope="col">Version</th><th class="top" scope="col">Comments</th></tr>
<%
	crs = qsearch.searchTechnologies(searchCriteria);
	if(crs!=null && crs.next()) {
		do {
%>
				            <tr>
				            	<td scope="row"><a href="#" onMouseover="dropdownmenu(this, event, 'anylinkmenu<%=crs.getString(1)%>')"><%=crs.getString(2)%></a></td>
				            	<td><%=crs.getString(3)%></td>
				            	<td><%=crs.getString(4)%></td>
				            </tr>

				            <div id="anylinkmenu<%=crs.getString(1)%>" class="anylinkcss">
								<a href="techApps.jsp?techId=<%=crs.getString(1)%>">Usage</a>
								<a href="editTech.jsp?techId=<%=crs.getString(1)%>">Edit</a>
							</div>
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
	document.getElementById('home').className  = "active";
</script>

</html>
