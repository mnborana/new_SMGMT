package demoStuff;

import java.sql.Date;
import java.sql.SQLException;
import java.util.List;

import com.servletStore.login.model.UserLoginDAO;
import com.servletStore.login.model.UserLoginImpl;

public class Demo {

	public static void main(String[] args) throws SQLException {
		
		 	long millis=System.currentTimeMillis();  
		  java.sql.Date date=new java.sql.Date(millis);  
		  String newDate=date.toString();
		
		  System.out.println(newDate);
		
		
		
		/*UserLoginDAO login= new UserLoginImpl();
		
		List list=login.getUserCredentials("admin");
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		
		Boolean result=login.checkUserExist("trusteeadmin");
		if(result)
		{
			System.out.println("not available");
		}
		else
		{
			System.out.println("available");
		}*/
		
		/*String userName="something";
		String Password="password";
		
		if(Password.equals("password") && userName.equals("something"))
		{
			System.out.println("true");
		}
		else
		{
			System.out.println("false");
		}
*/		
	}

}
