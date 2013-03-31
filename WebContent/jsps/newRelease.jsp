<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>
<html>

<head>
<style type="text/css">
.auto-style1 {
	margin-left: 42px;
}

</style>

<script type="text/javascript">

function addComponentRow()
{
    var table = document.getElementById("tblGrid");
    var rowCount = table.rows.length;
    //alert(table.rows.length);
    var newRow = document.all("tblGrid").insertRow(rowCount);
    //var rowId = parseInt(document.getElementById("rowCount").value);

    newRow.id = "C"+rowCount;
    newRow.innerHTML="<td style='width: 110px'><textarea name='compdesc"+rowCount+"' style='width: 155px; height: 31px' cols='30'></textarea></td><td style='width: 218px'><textarea name='arturl"+rowCount+"' style='width: 191px; height: 60px' rows='3' class='auto-style1'></textarea></td><td style='width: 200px'><textarea name='otherurl"+rowCount+"' style='width: 191px; height: 60px' rows='3'></textarea></td><td style='width: 5px'><a href='javascript:removeRow("+rowCount+", \"C\");' > Remove </a></td>";
 
    document.getElementById("rowCountC").value = rowCount;
}

function addReleaseRow()
{
    var table = document.getElementById("tblGrid2");
    var rowCount = table.rows.length;
    //alert(table.rows.length);
    var newRow = document.all("tblGrid2").insertRow(rowCount);
    //var rowId = parseInt(document.getElementById("rowCount").value);

    newRow.id = "R"+rowCount;
    newRow.innerHTML="<td style='width: 70px;'><select style='font-size: 10px;' id='release_app"+rowCount+"' name='release_app"+rowCount+"'></select></td><td style='width: 70px'><select style='font-size: 10px;' id='app_release"+rowCount+"' name='app_release"+rowCount+"'></select></td><td style='width: 5px'><a href='javascript:removeRow("+rowCount+", \"R\");' > Remove </a></td>";
 
    document.getElementById("rowCountR").value = rowCount;
    //alert(document.getElementById("release_app"+rowCount));
    copySelectData(document.getElementById("release_app1"), document.getElementById("release_app"+rowCount));
    //alert(rowCount);
    copySelectData(document.getElementById("app_release1"), document.getElementById("app_release"+rowCount));
}

function copySelectData(selt1, selt2) {
	for(var i=0; i<selt1.options.length; i++)
		selt2.options[i] = new Option(selt1.options[i].text, selt1.options[i].value);
}

function removeRow(src, rowType) {
	var row = document.getElementById(rowType+src);
	row.parentElement.removeChild(row); 
}

function openModalWin() {
	var appSelct = document.getElementById("application");
	var selctVal = appSelct.options[appSelct.selectedIndex].value;
	if(selctVal != "" && selctVal != "0")
		showPopWin('dependentApps.jsp?appId='+appSelct.options[appSelct.selectedIndex].value, 200, 200, null);
}

</script>

	<link rel="stylesheet" type="text/css" href="../css/subModal.css" />
	<script type="text/javascript" src="../js/common.js"></script>
	<script type="text/javascript" src="../js/subModal.js"></script>

</head>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>

<%
	CachedRowSetImpl cr = SMSDBOperations.execute("select App_Id, concat(App_Name,' - ',App_Version)app from smsdb.applications where app_status = 1 order by app_name asc");
%>

			<form method="post" action="processRelease.jsp">
				<table class='clear'>
					<tr>   
						<th style="width: 94px; height: 25px;">Build Name*</th>
						<td style="width: 218px; height: 25px;">
						<input class='field' name="buildName" type="text" />
						</td>
						<th style="width: 136px; height: 25px;">Date*</th>
						<td style="height: 25px">
						<input type="text" readonly="readonly" name="date" class="tcal" />
						</td>
					</tr>
					<tr>
						<th style="width: 94px; height: 32px;">Application*</th>
						<td style="width: 218px; height: 32px;">
						<select style='font-size: 11px;' id='application' name="application">
							<option style="font-size: 9px;" value=0 selected="selected">------- Select -------</option>
<%
					if(cr!=null) {

						while(cr.next()) {
%>
							<option value="<%=cr.getString(1)%>"><%=cr.getString(2)%></option>
<%
						}
					}
%>
						</select>&nbsp; <a href="javascript:openModalWin();"><strong>Dependency</strong></a>
						</td>
						<th style="width: 136px; height: 32px;">Release Type*</th>
						<td style="height: 32px">
						<select style='font-size: 11px;' name="releaseType">
							<option value=0  selected="selected">------- Select -------</option>
							<option>Normal</option>
							<option>Emergency</option>
							<option>Hotfix</option>
						</select></td>
					</tr>
					<tr>
						<th style="width: 94px; height: 32px;">Comments*</th>
						<td style="width: 218px; height: 32px;">
						<textarea name="comments" style="width: 155px; height: 60px" cols="30" rows="3"></textarea>
						</td>
						<th style="width: 136px; height: 32px;">Release Notes URL*</th>
						<td style="height: 32px">
						<textarea name="relurl" style="width: 155px; height: 60px" cols="30" rows="3"></textarea>
						</td>
					</tr>
					</table>

				<br/><br/><hr/>

				<table id='tblGrid' width="700px">
					<tbody>
						<tr>
							<td onclick="toggleItem('myTbodyC');" style="width: 110px;text-align:left;"><font size="2.5px" style="color: black;"><strong><u>Release Components:</u></strong></font></td>
						</tr>
					</tbody>
				    <tbody id="myTbodyC" style="display:none;">
						<tr>
							<td colspan="4"><div style="width: 700px;" align="right"><a href="javascript:addComponentRow();"><strong>Add Row</strong></a></div></td>
						</tr>
						<tr align="center">
							<th style="width: 110px;text-align:center;">Component Desc*</th>
							<th style="width: 191px;text-align:center;">Artifact URL*</th>
							<th style="width: 191px;text-align:left;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Supporting Docs URL</th>
							<td style="width: 2px;">&nbsp;</td>
						</tr> 
						<tr id='C1'>
							<td style='width: 110px;'>
							<textarea name='compdesc1' style='width: 155px; height: 31px' cols='30'></textarea></td>
							<td style='width: 191px'>
							<textarea name='arturl1' style='width: 191px; height: 60px' rows='3' class='auto-style1'></textarea></td>
							<td style='width: 191px'>
							<textarea name='otherurl1' style='width: 191px; height: 60px' rows='3'></textarea></td>
							<td style='width: 2px'>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<p>&nbsp;</p>

				<table id='tblGrid2' width="400px">
					<tbody>
						<tr align="center">
							<td onclick="toggleItem('myTbodyR');" style="width: 110px;text-align:left;"><font size="2.5px" style="color: black;"><strong><u>Dependent Releases:</u></strong></font></td>
						</tr>
					</tbody>
				    <tbody id="myTbodyR" style="display:none;">
						<tr>
							<td colspan="3"><div style="width: 400px;" align="right"><a href="javascript:addReleaseRow();"><strong>Add Row</strong></a></div></td>
						</tr>
						<tr>
							<th align="left" style="width: 70px;text-align:center;">Application</th>
							<th style="width: 70px;text-align:center;">Release</th>
							<td style="width: 5px;">&nbsp;</td>
						</tr>
						<tr id='R1'>
							<td style='width: 70px;'>
							<select id='release_app1' name="release_app1" style='font-size: 11px;'>
								<option value=0 selected="selected">------- Select -------</option>
	<%
								if(cr!=null) {
									cr.first();
									while(cr.next()) {
	%>
									<option value="<%=cr.getString(1)%>"><%=cr.getString(2)%></option>
	<%
									}
								}
	%>
							</select>
							</td>
							<td style='width: 70px'>
								<select id='app_release1' name="app_release1" style="font-size: 11px;">
									<option value=0 selected="selected">------- Select -------</option>
									<option>Build 3(11/22/12-QA)</option>
									<option>Build 2(11/10/12-Prod)</option>
									<option>Build 1(10/02/12-QA)</option>
								</select>
							</td>
							<td style='width: 5px'>&nbsp;</td>
						</tr>
					</tbody>
				</table>
				<br/><br/>
				 <table>
					<tr>
						<td style="width: 340px">
							<div align="right"> <input name="savebtn" type="submit" value="Save &amp; Notify" /></div>
						</td>
						<td style="width: 350px">
							<div align="left"><input name="cancelbtn" type="button" onclick="javascript:window.location.reload();" value="Cancel" /></div>
						</td>
					</tr>
				</table>
				   <input type="hidden" id="rowCountC" name="rowCount" value="1"/>
				   <input type="hidden" id="rowCountR" name="rowCount" value="1"/>
			</form>

			</div>

<script>
	document.getElementById('releases').className  = "active";
</script>

</body>
</html>

