<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<jsp:include page="head.jsp"></jsp:include>

<head>
<title>AMS Admin</title>

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

<script>

function takeAdminAction() {
	
	var catSelctVal = document.getElementById("category").options[document.getElementById("category").selectedIndex].value;
	var actSelctVal = document.getElementById("action").options[document.getElementById("action").selectedIndex].value;

	if(catSelctVal == "0" || actSelctVal == "0") {
		alert('Please select Category & Action.');
	}
	else {
		document.forms[0].action = catSelctVal+actSelctVal+".jsp";
		document.forms[0].submit();
	}
}

</script>

</head>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>

	<form method="post">
		<table style="width: 500px">
			
			<tr>
				<td><strong>Category</strong></td>
				<td><strong>Action</strong></td>
				<td>&nbsp;</td>
			</tr>
			<tr>			
				<td>
					<select style='font-size: 12px;' id='category' name='category' size='3'>
						<option selected="selected" value='0'>Select</option>
						<option value='app'>Application</option>
						<option value='tech'>Technology</option>
						<option value='server'>Server</option>
					</select>
				</td>
				<td>
					<select style='font-size: 12px;' id='action' name='action' size='3'>
						<option selected="selected" value='0'>Select</option>
						<option value='Add'>Add</option>
						<option value='Edit'>Edit</option>
						<option value='Remove'>Remove</option>
					</select>				

				</td>
				<td>
					<div align="left"> <input name="savebtn" type="button" onclick="takeAdminAction();" value="&nbsp;&nbsp;Go!&nbsp;&nbsp;" /></div>
				</td>
			</tr>
			<tr>
				<td>
					<dl>
						<dt><strong><br/><br/>Others</strong></dt>
						<dd><span>- <a href="#">Reload Startup Attributes</a></span></dd>
					</dl>
				</td>
			</tr>
		</table>
	</form>
</div>

<script>
	document.getElementById('admin').className  = "active";
</script>

</body>
</html>