<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<%@page import="org.nags.sms.db.SMSDBOperations"%>
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
		<div class="main">

			<!-- B.1 MAIN CONTENT -->
			<div class="main-content">

					<div class="subcontent-unit-border-blue-nobg">
						<h1 class="blue">Search</h1>
							<form action="searchResults.jsp" method="post">
								&nbsp;&nbsp;
								<Table style="width: 400px; background-color: #fff;">
									<tr>
										<td style="background-color: #fff;"><input type="text" style="width: 190px" title='Please enter a search criteria...' class="field" name="searchCriteria" value="Enter search criteria..." onClick="this.value=''" /></td>
										<td style="background-color: #fff;"><input type="submit" name="button" value="&nbsp;&nbsp;Go!&nbsp;&nbsp;" /></td>
									</tr>
								</Table>
							</form>
					</div>

					<div class="subcontent-unit-border-blue-nobg">
						<h1 class="blue">Releases</h1>
						
						<table class='small'>
							<caption onclick="toggleItem('myTbodyP');" align="top"><u>Planned Releases</u></caption>
						    <tbody id="myTbodyP" style="display:none;">
							<tr><th class="top" scope="col">Application</th><th class="top" scope="col">Date</th><th class="top" scope="col">Environment</th></tr>
							<tr><td>&nbsp;</td><td>&nbsp;</td><td>&nbsp;</td></tr>							
						</table>
						
<%
String query = "select app. app_id, app.app_name, app.app_version, rel.release_id, rel.release_name, DATE_FORMAT(rel.release_Date,'%m-%d-%Y') as release_Date, rel.release_type, if(rel.release_promoted=1, 'QA/Prod', 'QA') as promoted, rel.created_by from smsdb.releases rel, smsdb.applications app where rel.app_id = app.app_id order by rel.release_Date desc limit 10";
System.out.println("##Home Recent Releases="+query);
CachedRowSetImpl crs = SMSDBOperations.execute(query);
%>
						<table class='small'>
							<caption onclick="toggleItem('myTbodyR');" align="top"><u>Recent Releases</u></caption>
						    <tbody id="myTbodyR">
								<tr><th class="top" scope="col">Application</th><th class="top" scope="col">Date</th><th class="top" scope="col">Release Name</th><th class="top" scope="col">Type</th><th class="top" scope="col">QA/Prod</th><th class="top" scope="col">Contact</th></tr>
<%
	while(crs.next()) {
%>
								<tr>
									<td>
										<a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, 'anylinkmenuRR<%=crs.getString(1)%>')"><%=crs.getString(2)%>-<%=crs.getString(3)%></a>
										<div id="anylinkmenuRR<%=crs.getString(1)%>" class="anylinkcss">
											<a href="viewReleases.jsp?appId=<%=crs.getString(1)%>">More Releases</a>
										</div>
									</td>
									<td><%=crs.getString(6)%></td>
									<td><a href="viewRelease.jsp?appName=<%=crs.getString(2)%>&appVersion=<%=crs.getString(3)%>&releaseId=<%=crs.getString(4)%>&appId=<%=crs.getString(1)%>"><%=crs.getString(5)%></a></td>
									<td><%=crs.getString(7)%></td>
									<td><%=crs.getString(8)%></td>
									<td><%=crs.getString(9)%></td>
								</tr>
<%
	}
%>
							</tbody>
						</table>
					</div>

			</div>
			<!-- main content -->


			<div class="main-subcontent">
		        <div id="logindiv" class="subcontent-unit-border">
		          <div class="round-noborder-topleft"></div>
						<h1 class="orange">Applications</h1>

<%
				crs = SMSDBOperations.execute("select App_Id, concat(App_Name,' - ',App_Version)app from smsdb.applications where app_status = 1 order by app_name asc");
				while(crs.next()) {
%>
					&nbsp;&nbsp;<a href="#" onClick="return clickreturnvalue()" onMouseover="dropdownmenu(this, event, 'anylinkmenu<%=crs.getString(1)%>')"><%=crs.getString(2)%></a><br/>
					<div id="anylinkmenu<%=crs.getString(1)%>" class="anylinkcss">
						<a href="appInfo.jsp?appId=<%=crs.getString(1)%>">View Info </a>
						<a href="viewReleases.jsp?appId=<%=crs.getString(1)%>">View Releases</a>
						<a href="#" onclick="javascript:openModalWin(<%=crs.getString(1)%>);">View Dependent Apps</a>
						<a href="appEdit.jsp?appId=<%=crs.getString(1)%>">Edit Info</a>
					</div>
<%
				}
%>
						
		        </div>                               
	  		</div> 

		</div>
	</div>

</body>
</html>

<script>
	document.getElementById('home').className  = "active";
</script>
