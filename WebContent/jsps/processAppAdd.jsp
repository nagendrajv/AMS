
<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<%
	//if(session.getAttribute("userid") == null)
		//response.sendRedirect("errorPage.jsp");

	int rowCount = Integer.parseInt(request.getParameter("rowCount"));

	String appName		= request.getParameter("appName");
	String appVersion	= request.getParameter("appVersion");
	String techs[]		= request.getParameterValues("technologies");
	String depndApps[]	= request.getParameterValues("appDependency");
	String contacts		= request.getParameter("contacts");

	CachedRowSetImpl crs = SMSDBOperations.execute("SELECT AUTO_INCREMENT FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'smsdb' AND TABLE_NAME = 'applications'");
	int newAppId = 0;

	if(crs.next())
		newAppId = crs.getInt(1);

	if(newAppId > 0) { 

		String relInsertQuery = "INSERT INTO `smsdb`.`applications` (`App_Id`,`App_Name`,`App_Version`,`App_Contacts`,`Created_By`) VALUES("+newAppId+",'"+appName+"','"+appVersion+"','"+contacts+"','njalapati')";
		System.out.println("## Application insert query="+relInsertQuery);
		int insertStatus = SMSDBOperations.insert(relInsertQuery);

		if(insertStatus > 0) {

			System.out.println("Insert dependent apps");
			for(int i=0; i<depndApps.length; i++) {
				String daInsert = "insert into smsdb.app_dependency(app_id, dependency_app_id) values("+newAppId+","+depndApps[i]+")";
				System.out.println("Insert dependent apps:"+daInsert);
				SMSDBOperations.insert(daInsert);
			}

			System.out.println("Insert technologies");
			for(int i=0; i<techs.length; i++) {
				String techInsert = "insert into smsdb.app_techs(tech_id, app_id) values("+techs[i]+","+newAppId+")";
				System.out.println("Insert technologies:"+techInsert);
				SMSDBOperations.insert(techInsert);
			}

			for(int i=1; i<=rowCount; i++) {
				String serverId = (request.getParameter("server"+i) == "" || request.getParameter("server"+i) == null)? "NULL" : request.getParameter("server"+i);
				String relInsertQuery2 = "insert into smsdb.app_resources(app_id, resource_id, server_id, resource_value, resource_comments, Created_By) values("+newAppId+","+request.getParameter("resource"+i)+","+serverId+",'"+request.getParameter("resourceValue"+i)+"','"+request.getParameter("comments"+i)+"','njalapati')";
				System.out.println("## Release insert query="+relInsertQuery);
				insertStatus = SMSDBOperations.insert(relInsertQuery2);
			}
		}
	}
	out.println("<br><br><p><Strong><font color='green'>Successfully created application "+appName+"-"+appVersion+".</font></Strong></p>");
	out.println("<a href='javascript:history.back();' title='Go to previous page'><Strong> << Back << </Strong></a>");
	//session.setAttribute("releaseStatus", "Success");
	response.sendRedirect("appInfo.jsp?appCreation=success&appId="+newAppId);

%>
