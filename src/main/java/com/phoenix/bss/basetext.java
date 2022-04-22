package com.phoenix.bss;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Base64;


public class basetext {




	public static void main(String[] args){
		
		System.out.println("C");

//		File file = new File("C:\\aa\\bbb.png");
//		byte[] fileContent = Files.readAllBytes(file.toPath());

		//System.out.println("a: "+new String(fileContent));

		//파일을 파일객체에 넣는다/
		
        
//		AudioInputStream audioInputStream = AudioSystem.getAudioInputStream(file);
//    
//		inputStreamToByteArray(audioInputStream);
//	    FileInputStream inputStream = new FileInputStream(file);
//	    ByteArrayOutputStream byteOutStream = null;

        
//        byteOutStream = new ByteArrayOutputStream();
//        int len = 0;
//        byte[] buf = new byte[1024];
//
//        while ((len = inputStream.read(buf)) != -1) {
//             byteOutStream.write(buf, 0, len);
//        }
		
		File file = new File("C:\\aa\\aaa.mp3");
		byte[] data = new byte[(int) file.length()];
		
		try (FileInputStream stream = new FileInputStream(file)) {
			stream.read(data, 0, data.length);
		} catch (Throwable e) {
			e.printStackTrace();
		}

        //byte[] fileArray = byteOutStream.toByteArray();
		
		//byte[] array2 = Base64.encodeBase64(data);
		
		String base64data = Base64.getEncoder().encodeToString(data);
		System.out.println("a: "+base64data.length());
		System.out.println("a");
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
