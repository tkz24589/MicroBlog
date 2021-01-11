package com.wb.util;

import java.util.Random;

public class CodeUtil {
	public static String str(){
		String str = "ABCDEFGHJKLMNPQRSTUVWXY3456789";
		Random r = new Random();
		char c = str.charAt(r.nextInt(str.length()));
		return c+"";
	}
	
	public static void main(String[] args) {
		System.out.println(str());
	}
}
