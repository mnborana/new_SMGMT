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
			
			String year="2018-2019";

			Date date = new Date();  
			
			String currentDate = "2018-08-30";
			
			//String currentDate=sdf.format(date);
			
			
			String dateForCheck = feesCollectionDAO.getDateForCheck("15","FEE ASSIGNED");
	
			String[] newYear = year.split("-"); 
			
			String startDate = newYear[0]+"-07-01";
			
			String endDate = newYear[1]+"-04-30";
			

			
			//System.out.println(dateForCheck);
			
			if(dateForCheck=="")
			{
				//insert 
				System.out.println("insert for new");
			}
			else
			{
				Date start = sdf.parse(startDate);
				Date end = sdf.parse(endDate);
				Date availableDate = sdf.parse(dateForCheck);
				Date cDate = sdf.parse(currentDate);
				
				System.out.println("Start Date:"+startDate+"\nEnd Date:"+endDate+"\nFound record Date:"+dateForCheck+"\nCurrent Date:"+currentDate);
				
//				Date current = sdf.parse(currentDate);
//				//System.out.println(current);
//				if(current.after(end))
//				{
//					System.out.println("expired");
//				}
				
				if(start.compareTo(availableDate)*availableDate.compareTo(end)>0)
				{
					System.out.println("not insert because already assinged for this year");
				}
				else
				{
							if(availableDate.before(end))
							{
								if(cDate.after(start))
								{
									System.out.println("insert for next year");
								}
								else
								{
									System.out.println("check current date");
								}

							}
							else
							{
								System.out.println("not insert choose appropriate login year");
							}
								
				}
			
			}
		}
	}