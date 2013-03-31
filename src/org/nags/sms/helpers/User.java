package org.nags.sms.helpers;

import org.nags.sms.db.SMSDBOperations;
import org.nags.sms.exceptions.SMSException;
import org.nags.sms.utils.PasswordEncryptor;

import com.sun.rowset.CachedRowSetImpl;

public class User {

	public int createUser(String uid, String pwd, int role) {

		int status = 0;
		try {

			status = SMSDBOperations.insert("INSERT INTO `smsdb`.`users`(`userid`,`passwd`,`user_role`) VALUES('"+uid+"','"+PasswordEncryptor.encrypt(pwd)+"',"+role+")");
			System.out.println("Status of creating user="+uid+",Status="+status);

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while creating user="+uid,
					SMSDBOperations.class.getName());
		}

		return status;
	}

	public int validateUser(String uid, String pwd) {

		int status = 0;
		try {

			CachedRowSetImpl crs = SMSDBOperations.execute("select 1 from smsdb.users where userid='"+uid+"' and passwd='"+PasswordEncryptor.encrypt(pwd)+"'");
			if(crs.next())
				status = crs.getInt(1);

			System.out.println("Validating user="+uid+",Status="+status);

		} catch (Exception e) {
			SMSException.printException(e,
					"Exception while validating user="+uid,
					SMSDBOperations.class.getName());
		}

		return status;
	}

	public static void main(String[] args) {

		//new User().createUser("test","test",2);
		
		new User().validateUser("test", "test");
	}

}
