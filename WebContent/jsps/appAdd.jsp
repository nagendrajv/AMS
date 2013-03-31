<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<html>
<head>
<title>Add Application</title>
<style type="text/css">
.auto-style1 {
	text-align: right;
}
</style>

<script type="text/javascript">

	function addRow() {
	    var table = document.getElementById("tblGrid");
	    var rowCount = table.rows.length;
	    //alert(table.rows.length);
	    var newRow = document.all("tblGrid").insertRow(rowCount);
	    //var rowId = parseInt(document.getElementById("rowCount").value);

	    newRow.id = "row"+rowCount;
	    newRow.innerHTML="<td><select id='resource"+rowCount+"' name='resource"+rowCount+"'></select></td><td><input class='field' name='resourceValue"+rowCount+"' type='text' /></td><td><select id='server"+rowCount+"' name='server"+rowCount+"'></select></td><td><textarea name='comments"+rowCount+"' style='width: 135px; height: 39px' cols='20' rows='1'></textarea><a href='javascript:removeRow("+rowCount+");' > Remove </a></td>";

	    document.getElementById("rowCount").value = rowCount;

	    copySelectData(document.getElementById("resource1"), document.getElementById("resource"+rowCount));
	    copySelectData(document.getElementById("server1"), document.getElementById("server"+rowCount));

	}

	function removeRow(src)	{
		var row = document.getElementById('row'+src);
		row.parentElement.removeChild(row); 
	}

	function copySelectData(selt1, selt2) { 
		for(var i=0; i<selt1.options.length; i++)
			selt2.options[i] = new Option(selt1.options[i].text, selt1.options[i].value);
	}

</script>

</head>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>

	<form method="post" action="processAppAdd.jsp">
		<table class='clear' width='700px'>
			<tr>
				<td style="width: 115px; height: 25px;">Name</td>
				<td style="width: 115px; height: 25px;"><input class='field' name="appName" type="text" /></td>
				<td style="width: 115px; height: 25px;">Version</td>
				<td style="width: 115px; height: 25px;"><input class='field' name="appVersion" type="text" /></td>
			</tr>
<%
	CachedRowSetImpl crs = SMSDBOperations.execute("SELECT tech_id, concat(tech_name,' - ',tech_version)tech FROM smsdb.technologies order by tech_name asc");
%>
			<tr>
				<td style="width: 115px; height: 50px;">Technologies Used</td>
				<td style="width: 115px">
				<select style='font-size: 10px;' name="technologies" size='4' multiple="multiple">
					<option selected="selected">------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>
				</select>
				</td>
<%
	crs = SMSDBOperations.execute("select App_Id, concat(App_Name,' - ',App_Version)app from smsdb.applications where app_status = 1 order by app_name asc");
%>
				<td style="width: 115px; height: 50px;">Apps Dependent on</td>
				<td>
				<select style='font-size: 10px;' name="appDependency" size='4' multiple="multiple">
					<option selected="selected">------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>
				</select>
				</td>
			</tr>
			<tr>
				<td style="width: 115px; height: 50px;">Contact Email Id's(;)</td>
				<td style="width: 115px; height: 50px;">
				<textarea name="contacts" style="width: 200px; height: 50px"></textarea></td>
				<td style="width: 115px">&nbsp;</td>
				<td style="width: 115px">&nbsp;</td>
			</tr>
		</table>

<br/><br/><hr/>

		<table width="700px">
			<tr>
				<td><div style="width: 700px;" align="right"><a href="javascript:addRow();"><strong>Add Row</strong></a></div></td>
			</tr>
		</table>
		<table id='tblGrid' width="700px">
			<tr>
				<td><strong>Resource</strong></td>
				<td><strong>Value</strong></td>
				<td><strong>Server</strong></td>
				<td><strong>Comments</strong></td>
			</tr>
<%
	crs = SMSDBOperations.execute("select resource_id, resource_name, resource_type from smsdb.resources order by resource_name asc");
%>
			<tr>
				<td>
				<select id='resource1' name="resource1">
					<option selected="selected">------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>
				</select>
				</td>
				<td><input class='field' name="resourceValue1" type="text" /></td>
<%
	crs = SMSDBOperations.execute("select server_id, server_name from smsdb.server where server_status=1 order by server_name asc");
%>
				<td>
				<select id='server1' name="server1">
					<option selected="selected">------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>	
				</select>
				</td>
				<td>
					<textarea name="comments1" style="width: 135px; height: 39px" cols="20" rows="1"></textarea>
				</td>
			</tr>
		</table>
		<p>&nbsp;</p>
		 <table>
			<tr>
				<td style="width: 340px">
					<div align="right"> <input name="savebtn" type="submit" value="&nbsp;Save&nbsp;" /></div>
				</td>
				<td style="width: 350px">
					<div align="left"><input name="cancelbtn" type="button" onclick="javascript:window.location.reload();" value="Cancel" /></div>
				</td>
			</tr>
		</table>
		<input type="hidden" id="rowCount" name="rowCount" value="1"/>
	
	</form>
	
</div>

<script>
	document.getElementById('apps').className  = "active";
</script>
	
</body>

</html>
