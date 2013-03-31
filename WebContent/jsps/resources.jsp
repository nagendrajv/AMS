<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<html>
<head>
<title>Resources</title>
<script>

function submitPage() {
	
	var appSelctVal = document.getElementById("app").options[document.getElementById("app").selectedIndex].value;
	//alert("appSelctVal="+appSelctVal);
	var srvrSelctVal = document.getElementById("server").options[document.getElementById("server").selectedIndex].value;
	//alert("srvrSelctVal="+srvrSelctVal);

	if(appSelctVal == "0" && srvrSelctVal == "0") {
		alert('Please select a criteria [Server or Application] to see resources.');
	}
	else {
		if(appSelctVal != "0" && srvrSelctVal != "0") {
			document.forms[0].action = "showResources.jsp?server_id=0&app_id="+appSelctVal;
			document.forms[0].submit();
		}
		else if(appSelctVal != "0") {
			document.forms[0].action = "showResources.jsp?server_id=0&app_id="+appSelctVal;
			document.forms[0].submit();
		}
		else if(srvrSelctVal != "0") {
			document.forms[0].action = "showResources.jsp?app_id=0&server_id="+srvrSelctVal;
			document.forms[0].submit();
		}
	}
		
}

</script>

</head>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>

	<form method="post">
		<div><p style="font-size: 13px; font-weight: bold;">&nbsp;Show Resources:</p></br></br></div>
		<table class='clear'>
<%
	CachedRowSetImpl crs = SMSDBOperations.execute("select server_id, server_name from smsdb.server where server_status=1 order by server_name asc");
%>
			<tr>
				<td style="width: 75px; height: 50px;">By Server</td>
				<td style="width: 175px">
				<select style='font-size: 12px;' id='server' name="server" size='4' multiple="multiple">
					<option selected="selected" value=0>------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>;<%=crs.getString(2)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>
				</select>
				</td>
				<td style="width: 75px; height: 50px;"><i><strong>(OR)</strong></i></td>
<%
	crs = SMSDBOperations.execute("select App_Id, concat(App_Name,' - ',App_Version)app from smsdb.applications where app_status = 1 order by app_name asc");
%>
				<td style="width: 105px; height: 50px;">By Application</td>
				<td style="width: 115px; height: 50px;">
				<select style='font-size: 12px;' id='app' name="app" size='4' multiple="multiple">
					<option selected="selected" value=0>------- Select -------</option>
<%
					if(crs!=null) {
						while(crs.next()) {
%>
							<option value="<%=crs.getString(1)%>;<%=crs.getString(2)%>"><%=crs.getString(2)%></option>
<%
						}
					}
%>
				</select>
				</td>
			</tr>
		</table>

	<p>&nbsp;</p>
	 <table>
		<tr>
			<td style="width: 340px">
				<div align="right"> <input name="savebtn" type="button" onClick="submitPage();" value="&nbsp;Search&nbsp;" /></div>
			</td>
		</tr>
	</table>

</form>

</div>

<script>
	document.getElementById('resources').className  = "active";
</script>

</body>

</html>
