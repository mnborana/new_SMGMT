package utility;

public class demou {

   
	public static void main(String[] args) {
		
		        String s1 = "Remove Last Character,";
		        String s2 = "Remove Last Character,";
		        System.out.println("After removing s1==" + removeLastChar(s1) + "==");
		        System.out.println("After removing s2==" + removeLastChar(s2) + "==");
		        
		        
		        String a="omkar,";
		        System.out.println(a.substring(0, a.length()-1));
	
	}
	
	  private static String removeLastChar(String str) {
	        return str.substring(0, str.length() - 1);
	    }

}