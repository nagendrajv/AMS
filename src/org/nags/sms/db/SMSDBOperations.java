package org.nags.sms.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

import org.nags.sms.exceptions.SMSException;

import com.sun.rowset.CachedRowSetImpl;

public class SMSDBOperations {

	private static SMSDBOperations instance = null;

	private SMSDBOperations() {

	}

	public static SMSDBOperations getInstance() {
		if (instance == null)
			instance = new SMSDBOperations();
		return instance;
	}

	public Connection getConnection() throws Exception {

		Connection conn = null;
		try {
			System.out.println("MySQL Connect Example.");
			String url = "jdbc:mysql://localhost:3306/";
			String dbName = "smsdb";
			String driver = "com.mysql.jdbc.Driver";
			String userName = "root";
			String password = "nagendra";
			Class.forName(driver).newInstance();
			conn = DriverManager
					.getConnection(url + dbName, userName, password);
			if (conn == null)
				throw new Exception("Connection object is null");
			System.out.println("Connected to the database");
		} catch (Exception e) {
			SMSException.printException(e, "Consturctor getting conn",
					SMSDBOperations.class.getName());
		}

		return conn;
	}

	public static CachedRowSetImpl execute(String queryStr) {

		CachedRowSetImpl crs = null;
		Statement statement = null;
		ResultSet resultSet = null;
		Connection conn = null;

		try {
			SMSDBOperations smsc = SMSDBOperations.getInstance();
			statement = smsc.getConnection().createStatement();
			resultSet = statement.executeQuery(queryStr);
			crs = new CachedRowSetImpl();
			crs.populate(resultSet);
			System.out.println("Successfully executed and got CRSet");

		} catch (Exception e) {
			SMSException.printException(e, "Exception while executing query.."
					+ queryStr, SMSDBOperations.class.getName());
		} finally {
			try {
				if (resultSet != null)
					resultSet.close();
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
				System.out.println("Closed database objects");
			} catch (Exception e) {
				SMSException.printException(e,
						"Exception while closing db objects",
						SMSDBOperations.class.getName());
			}
		}
		return crs;
	}

	public static int insert(String queryStr) {

		Statement statement = null;
		Connection conn = null;
		int updateStatus = 0;

		try {
			SMSDBOperations smsc = SMSDBOperations.getInstance();
			statement = smsc.getConnection().createStatement();
			updateStatus = statement.executeUpdate(queryStr);
			System.out.println("Successfully ran insert stmt");
		} catch (Exception e) {
			SMSException.printException(e, "Exception while executing query.."
					+ queryStr, SMSDBOperations.class.getName());
		} finally {
			try {
				if (statement != null)
					statement.close();
				if (conn != null)
					conn.close();
				System.out.println("Closed database objects");
			} catch (Exception e) {
				SMSException.printException(e,
						"Exception while closing db objects",
						SMSDBOperations.class.getName());
			}
		}
		return updateStatus;
	}

/*	public static void main(String[] args) {

		try {

			CachedRowSetImpl crs = SMSDBOperations
					.execute("select app.app_id, app.app_name from smsdb.applications app, smsdb.app_dependency appd where app.app_id = appd.dependency_app_id and appd.app_id = 4");
			System.out.println("got CRS in main");
			if (crs != null) {
				while (crs.next()) {
					System.out.println(crs.getString(1) + crs.getString(2));
				}
			}

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while retreving data from resuleset",
					SMSDBOperations.class.getName());
		}
	}*/

}