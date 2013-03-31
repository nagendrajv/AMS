<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<html>
<head>
<title>Add Application</title>

<link rel="stylesheet" type="text/css" href="../css/subModal.css" />
<script type="text/javascript" src="../js/common.js"></script>
<script type="text/javascript" src="../js/subModal.js"></script>

<script type="text/javascript">
	function openModalWin(pageName, appid) {
		showPopWin(pageName+'?appId='+appid, 300, 200, null);
	}
</script>
`
</head>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>

<%
	String appId = request.getParameter("appId");
	String appCreation = request.getParameter("appCreation");
	CachedRowSetImpl crs = SMSDBOperations.execute("select app.App_Name, app.App_Version, app.app_contacts from smsdb.applications app where app.app_id ="+appId);
	
	String appName = "N/A";
	String appVersion = "N/A";
	String appContacts = "N/A";

	if(crs.next()) {
		appName = crs.getString(1);
		appVersion = crs.getString(2);
		appContacts = crs.getString(3);
	}
	
	if(appCreation!=null && "success".equals(appCreation))
	{
%>
		<p><font color="green"><Strong>Successfully created application.</Strong></font></p>
<%
	}
%>
	<form method="post" action="processAddApp.jsp">
		<table class='clear' width='700px'>
			<tr>
				<td style="width: 115px; height: 25px;"><Strong>Name</td>
				<td style="width: 115px; height: 25px;"><%=appName%></td>
				<td style="width: 115px; height: 25px;"><Strong>Version</Strong></td>
				<td style="width: 115px; height: 25px;"><%=appVersion%></td>
			</tr>
			<tr>
				<td style="width: 115px; height: 50px;" colspan="2"><a href="javascript:openModalWin('technologiesUsed.jsp', '<%=appId%>');">Technologies Used</a></td>
				<td style="width: 115px; height: 50px;" colspan="2"><a href="javascript:openModalWin('appsDependentOn.jsp', '<%=appId%>');">Apps Dependent on</a></td>
			</tr>
			<tr>
				<td style="width: 115px; height: 50px;"><Strong>Contact Email Id's</Strong></td>
				<td style="width: 115px; height: 50px;">
				<textarea readonly style="width: 200px; height: 50px"><%=appContacts%></textarea></td>
				<td style="width: 115px">&nbsp;</td>
				<td style="width: 115px">&nbsp;</td>
			</tr>
		</table>

<br/><br/><hr/>

		<table width="700px">
			<tr>
				<td><strong>Resource</strong></td>
				<td><strong>Value</strong></td>
				<td><strong>Server</strong></td>
				<td><strong>Comments</strong></td>
			</tr>
<%
	crs = SMSDBOperations.execute("select ar.app_resource_id, r.resource_name, ar.resource_value, sr.server_name, ar.resource_comments, r.resource_type from smsdb.app_resources ar, smsdb.resources r, smsdb.server sr where ar.resource_id = r.resource_id and ar.server_id = sr.server_id and ar.app_id="+appId);
	
	while(crs.next()) {
%>
			<tr>
				<td><%=crs.getString(2)%></td>
				<td><%=crs.getString(3)%></td>
				<td><%=crs.getString(4)%></td>
				<td>
					<textarea readonly="readonly" style="width: 135px; height: 39px" cols="20" rows="1"><%=crs.getString(5)%></textarea>
				</td>
			</tr>
<%
	}
%>
		</table>
	</form>
	
</div>

<script>
	document.getElementById('apps').className  = "active";
</script>
	
</body>

</html>
