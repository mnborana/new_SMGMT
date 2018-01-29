/**
 *   Author : HIMANSHU PATEL
 * Document : test.java
 *     Date : 24-Jan-2018
 *     Time : 5:53:49 PM
 * 
 */
package com.servletStore.student.model;

public class test {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		AESenc key=new AESenc();
		String x="";
		try {
			x=key.encrypt("2016-2017");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("This String>>> "+x);
		x="2016-2017";
		try {
			x=key.decrypt(x);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("This String new >>> "+x);
		
	}

}
