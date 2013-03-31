<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">


<jsp:include page="head.jsp"></jsp:include>

<head>
<title>Application Info</title>

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
		
		<form>
			<table style="width: 100%">
				<tr>
					<td style="width: 137px">Name</td>
					<td style="width: 145px"><input name="Text1" type="text" /></td>
					<td style="width: 24px">&nbsp;&nbsp;</td>
					<td style="width: 175px">Version</td>
					<td><input name="Text2" type="text" /></td>
				</tr>
				<tr>
					<td style="width: 137px">Technologies Used</td>
					<td style="width: 145px"><select name="Select1">
					<option selected="selected">------- Select -------</option>
					</select></td>
					<td style="width: 24px">&nbsp;&nbsp;</td>
					<td style="width: 175px">Apps Dependent on</td>
					<td><select name="Select2">
					<option selected="selected">------- Select -------</option>
					</select></td>
				</tr>
				<tr>
					<td style="width: 137px">Contacts</td>
					<td style="width: 145px">
					<textarea name="TextArea1" style="width: 135px; height: 39px"></textarea></td>
					<td style="width: 24px">&nbsp;</td>
					<td style="width: 175px">&nbsp;</td>
					<td>&nbsp;</td>
				</tr>
			</table>
		</form>
		
		<table style="width: 100%">
			<tr>
				<td>Resource</td>
				<td>Value</td>
				<td>Environment</td>
				<td>Server</td>
				<td>Comments</td>
				<td>&nbsp;</td>
			</tr>
			<tr>
				<td><select name="Select3">
				<option selected="selected">------- Select -------</option>
				</select></td>
				<td><input name="Text3" type="text" /></td>
				<td><select name="Select4">
				<option selected="selected">------- Select -------</option>
				</select></td>
				<td><select name="Select5">
				<option selected="selected">------- Select -------</option>
				</select></td>
				<td>
					<textarea name="TextArea2" style="width: 135px; height: 39px" cols="20" rows="1"></textarea></td>
				<td><input checked="checked" name="Radio1" type="radio" value="V1" /></td>
			</tr>
		</table>
	</div>

<script>
	document.getElementById('apps').className  = "active";
</script>

</body>

</html>
