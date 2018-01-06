package demoStuff;

import java.sql.SQLException;
import java.util.Iterator;
import java.util.List;

import com.servletStore.setup.model.SetupDAO;
import com.servletStore.setup.model.SetupImpl;
import com.servletStore.setup.model.SetupPOJO;

public class Demo {

	public static void main(String[] args) throws SQLException {
		
		SetupDAO dao = new SetupImpl();
		List list=dao.getAccessControlDetails(3);
		Iterator<SetupPOJO> itr= list.iterator();
		SetupPOJO pojo = new SetupPOJO();
		
		while(itr.hasNext())
		{
			pojo=itr.next();
			
		}
		
		if(pojo.getDashboard()!=0)
		{
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
