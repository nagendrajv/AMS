<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<html>
<head>
<title>Resources</title>
<script>

function submitPage() {
	var techSelctVal = document.getElementById("tech").options[document.getElementById("tech").selectedIndex].value;
	//alert("techSelctVal="+techSelctVal);
	var srvrSelctVal = document.getElementById("server").options[document.getElementById("server").selectedIndex].value;
	//alert("srvrSelctVal="+srvrSelctVal);

	if(techSelctVal == "0" && srvrSelctVal == "0") {
		alert('Please select a criteria [Server or Technology] to see resources.');
	}
	else {
		if(techSelctVal != "0" && srvrSelctVal != "0") {
			document.forms[0].action = "showApplications.jsp?server_id=0&tech_id="+techSelctVal;
			document.forms[0].submit();
		}
		else if(techSelctVal != "0") {
			document.forms[0].action = "showApplications.jsp?server_id=0&tech_id="+techSelctVal;
			document.forms[0].submit();
		}
		else if(srvrSelctVal != "0") {
			document.forms[0].action = "showApplications.jsp?tech_id=0&server_id="+srvrSelctVal;
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
		<div><p style="font-size: 13px; font-weight: bold;">&nbsp;&nbsp;&nbsp;Show Applications:</p></br></br></div>
		<table class='clear'>
<%
	CachedRowSetImpl crs = SMSDBOperations.execute("select server_id, server_name from smsdb.server where server_status=1 order by server_name asc");
%>
			<tr>
				<th style="width: 75px; height: 50px;"><strong>By Server</strong></th>
				<td style="width: 175px">
				<select style='font-size: 12px;' id='server' name="server" size='5'>
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
	crs = SMSDBOperations.execute("SELECT tech_id, concat(tech_name,' - ',tech_version)tech FROM smsdb.technologies order by tech_name asc");
%>
				<th style="width: 105px; height: 50px;"><strong>By Technology</strong></th>
				<td style="width: 115px; height: 50px;">
				<select style='font-size: 12px;' id='tech' name="tech" size='5'>
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
	document.getElementById('apps').className  = "active";
</script>

</body>

</html>
