<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html>

<jsp:include page="head.jsp"></jsp:include>

<body>

	<!-- Main Page Container -->
	<div class="page-container">
		<jsp:include page="header.jsp"></jsp:include>
		<div class="main">
			<div class="main-content">

			<form>
				<table class='clear'>
					<tr>
						<th>Application</th>
						<td><select name="Select6">
						<option selected="selected">------- Select -------</option>
						</select></td>
						<th>Build Name</th>
						<td><input class='field' name="Text2" type="text" /></td>
					</tr>
					<tr>
						<th>Date</th>
						<td><input class='field' name="Text4" type="text" /></td>
						<th>Release Type</th>
						<td><select name="Select2">
						<option selected="selected">------- Select -------</option>
						</select></td>
					</tr>
					</table>

				<br/><hr/>

				<table class='clear'>
					<tr>
						<td><div align="right"><a href="#">Add Component</a>&nbsp;|&nbsp;<a href="#">Remove Component</a></div></td>
					</tr>
				</table>
				<table class='clear'>
					<tr>
						<th>Component Desc</th>
						<th>Artifact URL</th>
						<th>Other Docs URL</th>
						<td>&nbsp;</td>
					</tr>
					<tr>
						<td><textarea name="TextArea3" style="width: 135px; height: 45px" cols="30" rows="2"></textarea></td>
						<td><input class='field' name="arturl" type="text" style="width: 250px"/></td>
						<td><input class='field' name="otherurl" type="text" style="width: 250px" /></td>
						<td><input tyep='hidden' name='rowid' value=''/> <input name="radio" type="radio" value="V1" /></td>
					</tr>
				</table>
				<p>&nbsp;</p>
				<table class='clear'>
					<tr>
						<td>
							<div align="right"> <input name="savebtn" type="submit" value="Save &amp; Notify" /> </div>
						</td>
						<td>
							<div align="left"><input name="cancelbtn" type="button" value="Cancel" /></div>
						</td>
					</tr>
				</table>
			</form>

			</div>
		</div>
	</div>

</body>

</html>

<script>
	document.getElementById('releases').className  = "active";
</script>