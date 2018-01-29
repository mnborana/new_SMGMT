package utility;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

public class SysDate {
	public String todayDate()
	{
		DateFormat df = new SimpleDateFormat("dd-MM-yyyy");
		String requiredDate = df.format(new Date()).toString();
				
		return requiredDate;
	}
}
