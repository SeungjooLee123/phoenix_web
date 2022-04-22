package com.phoenix.bss;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;

import org.springframework.util.Base64Utils;


public class basetext {




	public static void main(String[] args){
		
		System.out.println("C");

		
		File file = new File("C:\\aa\\aa.mp3");
		byte[] data = new byte[(int) file.length()];
		
		try (FileInputStream stream = new FileInputStream(file)) {
			stream.read(data, 0, data.length);
			
		} catch (Throwable e) {
			e.printStackTrace();
		}

        
		
//		String base64data = Base64Utils.encodeToUrlSafeString(data);
		String base64data = Base64.getUrlEncoder().encodeToString(data);
		System.out.println(base64data.substring(0,9));
		//String base64data = Base64.encodeBase64URLSafeString(data);
				//.getEncoder().encodeToString(data);
		System.out.println("a: "+base64data.length());
		
		
//		byte[] base64data1 = Base64Utils.decodeFromUrlSafeString(base64data);
		byte[] base64data1 = Base64.getUrlDecoder().decode(base64data);
		
		FileOutputStream fos;
		try {
			fos = new FileOutputStream("C:\\aa\\ccc.mp3");
		    fos.write(base64data1);
		    fos.close();
//			File target = new File("C:\\aa\\ccc.mp3");
//			target.createNewFile();
//			fos = new FileOutputStream(target);
//			fos.write(base64data1);
//			fos.close();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		//System.out.println("a");
	}
	
	public byte[] inputStreamToByteArray(InputStream inStream) throws IOException {
	    ByteArrayOutputStream baos = new ByteArrayOutputStream();
	    byte[] buffer = new byte[8192];
	    int bytesRead;
	    while ((bytesRead = inStream.read(buffer)) > 0) {
	        baos.write(buffer, 0, bytesRead);
	    }
	    return baos.toByteArray();
	}

}
