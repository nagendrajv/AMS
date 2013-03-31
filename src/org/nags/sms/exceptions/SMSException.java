package org.nags.sms.exceptions;

public class SMSException extends Exception {

	private static final long serialVersionUID = 1L;
	private String message = null;

	public SMSException(String mesg) {
		super(mesg);
		message = mesg;
	}

	public static void printException(Exception e, String message, String classn) {

		System.out.println(classn + " ## " + message + "\n" + e);
	}

	public String getMessage() {

		return message;
	}

}