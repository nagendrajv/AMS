package org.nags.sms.utils;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

import org.nags.sms.exceptions.SMSException;

import sun.misc.BASE64Encoder;

public final class PasswordEncryptor {
	
	private static PasswordEncryptor instance;

	private PasswordEncryptor() {
	}

	public static String encrypt(String plaintext) throws SMSException {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA");
		} catch (NoSuchAlgorithmException e) {
			throw new SMSException(e.getMessage());
		}
		try {
			md.update(plaintext.getBytes("UTF-8"));
		} catch (UnsupportedEncodingException e) {
			throw new SMSException(e.getMessage());
		}

		byte raw[] = md.digest();
		String hash = (new BASE64Encoder()).encode(raw);
		return hash;
	}

	public static PasswordEncryptor getInstance() {
		if (instance == null) {
			instance = new PasswordEncryptor();
		}
		return instance;
	}

/*	public static void main(String args[]) {

		try {
			PasswordEncryptor ead = PasswordEncryptor.getInstance();
			System.out.println(ead.encrypt("secret"));
		} catch (Exception exo) {
			System.out.println(exo);
		}
	}*/

}