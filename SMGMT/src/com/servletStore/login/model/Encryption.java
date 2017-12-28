package com.servletStore.login.model;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

public class Encryption {
	
	Map<String, String> DB = new HashMap<String, String>();
	//don't change this string value if database is not empty
	public static final String SALT = "my-salt-text";

	UserLoginDAO login= new UserLoginImpl();
	
	public static void main(String[] args) {
		
		//incase someone forget password then pass new password to signup method
		//and copy from console and update it in database
		
		
		Encryption encrypt = new Encryption();
		System.out.println("pass ----"+encrypt.signup("trusteepass"));;
		
	}
	
	public String signup(String password) {
		
		
		String saltedPassword = SALT + password;
		String hashedPassword = generateHash(saltedPassword);
		System.out.println("Encrypted Password "+hashedPassword);
		
		//saving userName and password into database
		
		//DB.put(username, hashedPassword);
		return hashedPassword;
	}

	public Boolean login(String username, String password) throws SQLException {
		Boolean isAuthenticated = false;

		// remember to use the same SALT value use used while storing password
		// for the first time.
		String saltedPassword = SALT + password;
		String hashedPassword = generateHash(saltedPassword);

		
		//getting userName and password from database
		List userLoginDetails=login.getUserCredentials(username);
		
		if(!userLoginDetails.isEmpty())
		{
			String DbUserName=(String) userLoginDetails.get(0);
			String storedPasswordHash=(String) userLoginDetails.get(1);
			if(hashedPassword.equals(storedPasswordHash) && username.equals(DbUserName))
			{
				isAuthenticated = true;
			}
			else
			{
				isAuthenticated = false;
			}
		}
		else
		{
			isAuthenticated = false;
		}
		
		
		return isAuthenticated;
	}

	
	//encryption algorithm
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
