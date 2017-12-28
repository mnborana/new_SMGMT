package demoStuff;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Map;

import com.dbconnect.DBConnection;

public class demoUpd {
	Map<String, String> DB = new HashMap<String, String>();
	public static final String SALT = "my-salt-text";

	public static void main(String args[]) {
		demoUpd demo = new demoUpd();
		String userName="admin";
		String password="admin";
		demo.signup(userName, password);
        
		// login should succeed.
		if (demo.login("admin", "admin"))
			System.out.println("user login successfull.");

		// login should fail because of wrong password.
		if (demo.login("Omkar", "blahblah"))
			System.out.println("User login successfull.");
		else
			System.out.println("user login failed.");
	}

	public void signup(String username, String password) {
		String saltedPassword = SALT + password;
		String hashedPassword = generateHash(saltedPassword);
		System.out.println("Encrypted Password "+hashedPassword);
		DB.put(username, hashedPassword);
	}

	public Boolean login(String username, String password) {
		Boolean isAuthenticated = false;

		// remember to use the same SALT value use used while storing password
		// for the first time.
		String saltedPassword = SALT + password;
		String hashedPassword = generateHash(saltedPassword);

		String storedPasswordHash = DB.get(username);
		if(hashedPassword.equals(storedPasswordHash)){
			isAuthenticated = true;
		}else{
			isAuthenticated = false;
		}
		return isAuthenticated;
	}

	public static String generateHash(String input) {
		StringBuilder hash = new StringBuilder();

		try {
			MessageDigest sha = MessageDigest.getInstance("SHA-1");
			byte[] hashedBytes = sha.digest(input.getBytes());
			char[] digits = { '0', '1', '2', '3', '4', '5', '6', '7', '8', '9',
					'a', 'b', 'c', 'd', 'e', 'f' };
			for (int idx = 0; idx < hashedBytes.length; ++idx) {
				byte b = hashedBytes[idx];
				hash.append(digits[(b & 0xf0) >> 4]);
				hash.append(digits[b & 0x0f]);
			}
		} catch (NoSuchAlgorithmException e) {
			// handle error here.
		}

		return hash.toString();
	}


}
