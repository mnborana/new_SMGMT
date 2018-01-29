package utility;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import com.servletStore.fees.feescollection.model.FeesCollectionDAO;
import com.servletStore.fees.feescollection.model.FeesCollectionImpl;

import java.util.Iterator;

public class demou {

	
		public static void main (String[] args) throws SQLException, ParseException
		{
			FeesCollectionDAO feesCollectionDAO = new FeesCollectionImpl();
				
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			
			String year="2016-2017";

			Date date = new Date();  
			
			String currentDate = sdf.format(date);
			
			
			String dateForCheck = feesCollectionDAO.getDateForCheck("7","FEE ASSIGNED");
	
			String[] newYear = year.split("-"); 
			
			String startDate = newYear[0]+"-07-01";
			
			String endDate = newYear[1]+"-04-30";
			
			//System.out.println(dateForCheck);
			
			if(dateForCheck=="")
			{
				//insert 
				System.out.println("if");
			}
			else
			{
				Date start = sdf.parse(startDate);
				Date end = sdf.parse(endDate);
				Date availableDate = sdf.parse(dateForCheck);
				
				System.out.println("Start Date:"+startDate+"\nEnd Date:"+endDate+"\nA Date:"+dateForCheck+"\nCurrent Date:"+currentDate);
				
//				Date current = sdf.parse(currentDate);
//				//System.out.println(current);
//				if(current.after(end))
//				{
//					System.out.println("expired");
//				}
				
				if(start.compareTo(availableDate)*availableDate.compareTo(end)>0)
				{
					System.out.println("not insert");
				}
				else
				{
					if(dateForCheck!="")
					{
						System.out.println("not insert because already assinged");
					}
					else
					{
						System.out.println("insert");
					}
				}
				 
				
			}
		}
	}