package org.nags.sms.servlets;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.nags.sms.db.SMSDBOperations;

import com.sun.rowset.CachedRowSetImpl;

public class StartupServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	public void init() throws ServletException {
		// TODO Auto-generated method stub
		super.init();
		System.out.println("**** INIT STARTUP SERVLET....");
		loadStartupData(getServletContext());
	}


	public void doGet(HttpServletRequest  req, HttpServletResponse  resp)
		throws ServletException, IOException {


		String refreshStartupAttributes = (String) req.getAttribute("refreshStartupAttributes");
		System.out.println("*** refreshStartupAttributes..."+refreshStartupAttributes);

		if(refreshStartupAttributes != null || "refresh".equals(refreshStartupAttributes)) {
			System.out.println("*** Reloading attributes...");
			loadStartupData(getServletContext());
		}

	}

	private void loadStartupData(ServletContext servCxt) {

		CachedRowSetImpl cr = SMSDBOperations.execute("select App_Id, concat(App_Name,' - ',App_Version)app from smsdb.applications where app_status = 1");
		servCxt.setAttribute("applications", cr);
		System.out.println("**** END STARTUP SERVLET....");

	}
	
	public void destroy() {
		 
	}

}
