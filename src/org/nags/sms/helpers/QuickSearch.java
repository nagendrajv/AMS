package org.nags.sms.helpers;

import org.nags.sms.db.SMSDBOperations;
import org.nags.sms.exceptions.SMSException;

import com.sun.rowset.CachedRowSetImpl;

public class QuickSearch {

	public CachedRowSetImpl searchApplications(String searchStr) {

		CachedRowSetImpl crs = null;
		try {

			crs = SMSDBOperations
					.execute("select app.app_id, app.app_name, app.app_version from smsdb.applications app where upper(app.app_name) like upper('%"
							+ searchStr + "%')");

			System.out.println("Searching for applications=" + searchStr);

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while Searching for applications="
							+ searchStr, SMSDBOperations.class.getName());
		}

		return crs;
	}

	public CachedRowSetImpl searchResources(String searchStr) {

		CachedRowSetImpl crs = null;
		try {

			crs = SMSDBOperations.execute("select ar.app_resource_id, ar.resource_value, ar.resource_comments, res.resource_name, srvr.server_name from smsdb.app_resources ar, smsdb.resources res, smsdb.server srvr where ar.server_id = srvr.server_id and ar.resource_id = res.resource_id and upper(ar.resource_value) like upper('%"+searchStr+"%') order by ar.resource_value asc");

			System.out.println("Searching for resources=" + searchStr);

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while Searching for resources="
							+ searchStr, SMSDBOperations.class.getName());
		}

		return crs;
	}

	public CachedRowSetImpl searchTechnologies(String searchStr) {

		CachedRowSetImpl crs = null;
		try {

			crs = SMSDBOperations
					.execute("select tech_id, tech_name, tech_version, tech_desc from smsdb.technologies where (tech_name) like upper('%"
							+ searchStr + "%')");

			System.out.println("Searching for technologies=" + searchStr);

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while Searching for technologies="
							+ searchStr, SMSDBOperations.class.getName());
		}

		return crs;
	}

	public static void main(String args[]) {

		CachedRowSetImpl crs = null;
		crs = new QuickSearch().searchApplications("CP");
		//crs = new QuickSearch().searchTechnologies("pr");

		try {

			while (crs.next()) {

				System.out.println(crs.getString(1) + "-" + crs.getString(2));
			}
		} catch (Exception exo) {
			System.out.println("Exception.." + exo);
		}

	}

}
