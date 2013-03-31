
<%@page import="org.nags.sms.db.SMSDBOperations"%>
<%@page import="com.sun.rowset.CachedRowSetImpl"%>

<%
	//if(session.getAttribute("userid") == null)
		//response.sendRedirect("errorPage.jsp");

	int rowCount = Integer.parseInt(request.getParameter("rowCount"));

	String buildName	= request.getParameter("buildName");
	String date			= request.getParameter("date");
	String appId		= request.getParameter("application");
	String releaseType	= request.getParameter("releaseType");
	String comments		= request.getParameter("comments");
	String relurl		= request.getParameter("relurl");

	CachedRowSetImpl crs = SMSDBOperations.execute("SELECT AUTO_INCREMENT FROM information_schema.TABLES  WHERE TABLE_SCHEMA = 'smsdb' AND TABLE_NAME = 'releases'");
	int newReleaseId = 0;

	if(crs.next())
		newReleaseId = crs.getInt(1);

	if(newReleaseId > 0) { 

		String relInsertQuery = "insert into smsdb.releases(release_id, app_id, release_name, release_date, release_type, release_comments, release_notes_url, release_status, Created_By) values("+newReleaseId+","+appId+",'"+buildName+"',STR_TO_DATE('"+date+"','%m/%d/%Y'),'"+releaseType+"','"+comments+"','"+relurl+"','Deployed','njalapati')";
		System.out.println("## Release insert query="+relInsertQuery);
		int insertStatus = SMSDBOperations.insert(relInsertQuery);

		if(insertStatus > 0) {
			for(int i=1; i<=rowCount; i++) {
				String relInsertQuery2 = "insert into smsdb.release_components(release_id, component_desc, supporting_docs_url, artifact_url) values("+newReleaseId+",'"+request.getParameter("compdesc"+i)+"','"+request.getParameter("otherurl"+i)+"','"+request.getParameter("arturl"+i)+"')";
				System.out.println("## Release insert query="+relInsertQuery);
				insertStatus = SMSDBOperations.insert(relInsertQuery2);
			}
		}
	}

	//session.setAttribute("releaseStatus", "Success");
	response.sendRedirect("viewReleases.jsp?releaseStatus=success&appId="+appId);

%>
