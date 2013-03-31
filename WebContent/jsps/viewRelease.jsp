<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<html>

<jsp:include page="head.jsp"></jsp:include>

<head>
<title>Release Info</title>

<style type="text/css">
	table th {height:2.0em; padding:2px 20px 2px 7px; text-align:left; color:rgb(80,80,80); font-weight:bold; font-size:110%;}
	table th.top {height:2.0em; padding:0 7px 0 7px; empty-cells:show; text-align:left; color:#fff; font-weight:bold; font-size:110%;}
	table td {height:2.0em; padding:2px 7px 2px 7px; font-size:110%;width:100px; word-wrap:break-word;}
	
	table th.nobg {height:2.0em; padding:0 7px 0 7px; empty-cells:show; background-color:#fff; font-weight:bold; font-size:110%;}
	table td.nobg {height:2.0em; padding:0 7px 0 7px; empty-cells:show; background-color:#fff; text-align:left; font-size:110%;}
	
	
	table.clear {clear:both; width:650px; margin:0 0 0 0; table-layout: fixed; border-collapse:collapse; empty-cells:show;}
	table.clear th {height:2.0em; padding:0 0px 0 0px; empty-cells:show; background-color:#fff; text-align:left; font-weight:bold; font-size:110%;}
	table.clear td {height:2.0em; padding:0 0px 0 0px; empty-cells:show; background-color:#fff; text-align:left; font-size:110%;}
	
</style>
</head>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>


<%
String appId 		= request.getParameter("appId");
String appName 		= request.getParameter("appName");
String appVersion 	= request.getParameter("appVersion");
String releaseId 	= request.getParameter("releaseId");

String query = "select rel.release_id, rel.release_name, DATE_FORMAT(rel.release_Date,'%m/%d/%Y') as release_Date, rel.release_type, if(rel.release_promoted=1, 'QA/Prod', 'QA') as promoted, rel.release_comments, rel.release_notes_URL, rel.created_by, rel.release_status from smsdb.releases rel where rel.release_id="+releaseId;
System.out.println("##View Release Query1="+query);
CachedRowSetImpl crs = SMSDBOperations.execute(query);

if(crs.next()) {
%>

		<table>
			<tr>
				<th style="width: 100px;">Build Name</th>
				<td style="width: 200px;"><%=crs.getString(2)%></td>
				<th style="width: 150px;">Date</th>
				<td style="width: 200px;"><%=crs.getString(3)%></td>
			</tr>
			<tr>
				<th>Application</th>
				<td><a href='appInfo.jsp?appId=<%=appId%>'> <%=appName%> - <%=appVersion%></a></td>
				<th>Release Type</th>
				<td><%=crs.getString(4)%></td>
			</tr>
			<tr>
				<th>Comments</th>
				<td style="max-width:150px;"><%=crs.getString(6)%></td>
				<th>Release Notes URL</th>
				<td style="max-width:150px;"><a href="javascript:window.open('<%=crs.getString(7)%>');" title="<%=crs.getString(7)%>"><%=crs.getString(7)%></a></td>
			</tr>
			<tr>
				<th>Created By</th>
				<td><%=crs.getString(8)%></td>
				<th>QA/Prod</th>
				<td><%=crs.getString(5)%></td>
			</tr>
			</table>

		<br/><hr width="800px"/>

<%
query = "select component_id, component_desc, artifact_url, supporting_docs_url, DATE_FORMAT(created_dt,'%m/%d/%Y') as created_dt from smsdb.release_components where release_id="+releaseId;
System.out.println("##View Release Query2="+query);
crs = SMSDBOperations.execute(query);
%>
			<table style="width: 800px">
				<tbody>
					<tr>
						<th colspan="4"><font size="2.5px" style="color: black;"><strong><u>Release Components:</u></strong></font></th>
					</tr>
				</tbody>
				<tbody>
				<tr>
					<th><span>Component Desc</span></th>
					<th>Artifact URL</th>
					<th>Supporting Docs URL</th>
					<th>Created Date</th>
				</tr>
<%
while(crs.next()) {
%>
				<tr>
					<td style="max-width:100px;"><%=crs.getString(2)%></td>
					<td style="max-width:200px;"><a href="javascript:window.open('<%=crs.getString(3)%>');" title="<%=crs.getString(3)%>"><%=crs.getString(3)%>http://localhost:9090/sm/jsps/newRelea</a></td>
					<td style="max-width:200px;"><a href="javascript:window.open('<%=crs.getString(4)%>');" title="<%=crs.getString(4)%>"><%=crs.getString(4)%></a></td>
					<td><%=crs.getString(5)%></td>
				</tr>
<%
}
%>
				</tbody>
			</table>
<br/><hr width="800px"/>
			<table style="width: 400px">
				<tbody>
					<tr>
						<th><font size="2.5px" style="color: black;"><strong><u>Dependent Releases:</u></strong></font></th>
					</tr>
				</tbody>
				<tbody>
					<tr>
						<th><span>Application</span></th>
						<th>Release</th>
					</tr>
					<tr>
						<td><span>WeCare1.0</span></td>
						<td>Build3.3(11/22/12-QA)</td>
					</tr>
					<tr>
						<td><span>CCP1.0</span></td>
						<td>MPers Changes(11/01/12-QA)</td>
					</tr>
					<tr>
						<td><span>SID2.0</span></td>
						<td>MPers Changes(11/01/12-QA)</td>
					</tr>
				</tbody>
			</table>
<%
}
else {
%>
			<br><br><p><Strong><font color="red">Problem encountered... Please try again.</font></Strong></p>
<%
}
%>
	</div>

<script>
	document.getElementById('releases').className  = "active";
</script>

</body>
</html>
