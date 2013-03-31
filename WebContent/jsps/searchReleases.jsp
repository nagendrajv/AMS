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

function addRow()
{
    var table = document.getElementById("tblGrid");
    var rowCount = table.rows.length;
    //alert(table.rows.length);
    var newRow = document.all("tblGrid").insertRow(rowCount);
    //var rowId = parseInt(document.getElementById("rowCount").value);

    newRow.id = "row"+rowCount;
    newRow.innerHTML="<td style='width: 110px'><textarea name='compdesc"+rowCount+"' style='width: 155px; height: 31px' cols='30'></textarea></td><td style='width: 218px'><textarea name='arturl"+rowCount+"' style='width: 191px; height: 60px' rows='3' class='auto-style1'></textarea></td><td style='width: 200px'><textarea name='otherurl"+rowCount+"' style='width: 191px; height: 60px' rows='3'></textarea></td><td style='width: 5px'><a href='javascript:removeRow("+rowCount+");' > Remove </a></td>";
 
    document.getElementById("rowCount").value = rowCount;

}

function removeRow(src)
{

	var row = document.getElementById('row'+src);
	row.parentElement.removeChild(row); 

}

function openModalWin() {
	
	var appSelct = document.getElementById("application");
	var selctVal = appSelct.options[appSelct.selectedIndex].value;
	if(selctVal != "" && selctVal != "0")
		showPopWin('dependentApps.jsp?appId='+appSelct.options[appSelct.selectedIndex].value, 200, 200, null)
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

		<table class='mytable'>
			<tr>
				<td align="left">
					<font style="font-size: 13px; font-weight: bold; color: black;">Search Releases:</font>
				</td>
				<td align="right">
					<a href="newRelease.jsp" title='Go to previous page'><Strong> [ Add Release ] </Strong></a>
				</td>
			</tr>
		</table>

			<form method="post" action="searchReleasesResulsts.jsp">
				<table class='clear'>
					<tr>   
						<th style="width: 94px; height: 25px;">Application</th>
						<td style="width: 218px; height: 25px;">
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
						</select>
						</td>
						<th style="width: 136px; height: 25px;">Release Name</th>
						<td style="height: 25px">
						<input class='field' name="releaseName" type="text" />
						</td>
					</tr>
					<tr>
						<th style="width: 94px; height: 32px;">Date From</th>
						<td style="width: 218px; height: 32px;">
							<input type="text" readonly="readonly" name="date" class="tcal" />
						</td>
						<th style="width: 136px; height: 32px;">Date To</th>
						<td style="height: 32px">
							<input type="text" readonly="readonly" name="date" class="tcal" />
						</td>
					</tr>
			</table>

			<p>&nbsp;</p>
			 <table>
				<tr>
					<td style="width: 340px">
						<div align="right"> <input name="savebtn" type="submit" value="&nbsp;Search&nbsp;" /></div>
					</td>
				</tr>
			</table>
			</form>

			</div>

<script>
	document.getElementById('releases').className  = "active";
</script>

</body>
</html>

