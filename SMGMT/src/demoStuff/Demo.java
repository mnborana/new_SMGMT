package demoStuff;

import java.sql.Date;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Iterator;
import java.util.List;

import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;
import com.servletStore.setup.model.SetupDAO;
import com.servletStore.setup.model.SetupImpl;
import com.servletStore.setup.model.SetupPOJO;

public class Demo {

	public static void main(String[] args) throws SQLException {
		
		
		FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
		  
		String check=feesCollectionDAO.checkStudFee("2");
		
		if(check.equals(","))
		{
			
		}
		else
		{
			String data[] = check.split(",");
			
			String status = data[0];
			
			String date = data[1];
			
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd");
					
			java.util.Date currentDate = new java.util.Date();
			
			LocalDate ld= LocalDate.now();
			dtf.format(ld);
			
			
			System.out.println(status+" a Date "+date+" Curent Date "+ld);
		}
		
		
		
		
		
		/*UserLoginDAO login= new UserLoginImpl();
		
		List list=login.getUserCredentials("admin");
		
		System.out.println(list.get(0));
		System.out.println(list.get(1));
		
		
		Boolean result=login.checkUserExist("trusteeadmin");
		if(result)
>>>>>>> refs/remotes/origin/HEAD
		{
			pojo=itr.next();
			
		}
		
		if(pojo.getDashboard()!=0)
		{
<<<<<<< HEAD
			System.out.println("dashboard");
		}
		if(pojo.getSetting()!=0)
		{
			System.out.println("setting");
		}
		if(pojo.getManagement()!=0)
		{
			System.out.println("management");
		}
		if(pojo.getAdmission()!=0)
		{
			System.out.println("admission");
		}
		if(pojo.getFee()!=0)
		{
			System.out.println("fee");
		}
		if(pojo.getAttendance()!=0)
		{
			System.out.println("attendance");
		}
		if(pojo.getExam()!=0)
		{
			System.out.println("exam");
		}
		if(pojo.getTeacher()!=0)
		{
			System.out.println("teacher");
		}
		if(pojo.getRegister()!=0)
		{
			System.out.println("register");
		}
		if(pojo.getCashbook()!=0)
		{
			System.out.println("cashbook");
		}
		if(pojo.getTransport()!=0)
		{
			System.out.println("transport");
		}
		if(pojo.getSalary()!=0)
		{
			System.out.println("salary");
		}
		if(pojo.getOther()!=0)
		{
			System.out.println("other");
		}
		if(pojo.getEmsg()!=0)
		{
			System.out.println("message");
		}
		
		
		
		
=======
			System.out.println("available");
		}*/
		
		/*String userName="something";
		String Password="password";
		
		if(Password.equals("password") && userName.equals("something"))
		{
			System.out.println("true");
		}
		
		{
			System.out.println("false");
		}
*/		
	}

}
