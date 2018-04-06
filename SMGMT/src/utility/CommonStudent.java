package utility;

import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.Date;
import java.util.Locale;

public class CommonStudent{ 
	   public static void main(String args[]){
			 SimpleDateFormat myFormat = new SimpleDateFormat("dd MM yyyy");
			 String dateBeforeString = "31 01 2014";
			 String dateAfterString = "02 02 2014";

			 try {
			       Date dateBefore = myFormat.parse(dateBeforeString);
			       Date dateAfter = myFormat.parse(dateAfterString);
			       long difference = dateAfter.getTime() - dateBefore.getTime();
			       float daysBetween = (difference / (1000*60*60*24));
		               /* You can also convert the milliseconds to days using this method
		                * float daysBetween = 
		                *         TimeUnit.DAYS.convert(difference, TimeUnit.MILLISECONDS)
		                */
			       System.out.println("Number of Days between dates: "+daysBetween);
			 } catch (Exception e) {
			       e.printStackTrace();
			 }
		   }

	/*public static void main(String[] args) throws ParseException {
		String str_date="First-April-1994";
		  SimpleDateFormat format=new SimpleDateFormat("E-MMMMM-YYYY");
		  Date  date=format.parse(str_date);
	}*/
	}
   /*public static void main(String[] args) {  
     System.out.println(reverseString("“a,b$c”"));  
   }  
   *//**  
    * Reverse a string with maintaining special character position.  
    * Algorithm :  
    * 1) Let input string be 'str[]' and length of string be 'n'  
    * 2) l = 0, r = n-1  
    * 3) While l is smaller than r, do following  
    * a) If str[l] is not an alphabetic character, do l++  
    * b) Else If str[r] is not an alphabetic character, do r--  
    * c) Else swap str[l] and str[r]  
    *  
    * @param input : Input string  
    * @return reverse string  
    *//* 
   public static String reverseString(String input) {  
     char[] inputArr = input.toCharArray();  
     int l = 0;  
     int r = inputArr.length - 1;  
     while (l < r) {  
       if (!Character.isAlphabetic(inputArr[l])) {  
         l++;  
       } else if (!Character.isAlphabetic(inputArr[r])) {  
         r--;  
       } else {  
         char tempChar = inputArr[l];  
         inputArr[l] = inputArr[r];  
         inputArr[r] = tempChar;  
         l++;  
         r--;  
       }  
     }  
     return new String(inputArr);  
   }*/  
 




































/**
 *   Author : HIMANSHU PATEL
 * Document : CommonStudent.java
 *     Date : 05-Jan-2018
 *     Time : 11:26:04 AM
 * 
 *//*
package utility;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.dbconnect.DBConnection;

public class CommonStudent {
	
	public static void main(String[] args) {
		
		
		String query="SELECT trustee_info.edu_society_name,school_master.name,school_master.address FROM school_master,trustee_info WHERE school_master.id=0";
		try {
			DBConnection con=new DBConnection();
			Connection connection=con.getConnection();
			PreparedStatement pstmt=null;

			PreparedStatement ps=connection.prepareStatement(query);
			ResultSet rs= ps.executeQuery();
			while(rs.next())
			{
				String trustyName = rs.getString(1);
				String schoolName = rs.getString(2);
				String sAddress = rs.getString(3);
				System.out.println("dsadsadasddsadsasad"+trustyName);
				
			}
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
}
*/