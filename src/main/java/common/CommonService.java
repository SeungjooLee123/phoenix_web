package common;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@Service
public class CommonService {
		//파일 업로드 처리
		public String fileUpload(String category, MultipartFile file, HttpSession session) {
			//업로드할 위치
			String resources = session.getServletContext().getRealPath("resources");
			String folder = resources + "/upload/" + category + "/" + new SimpleDateFormat("yyyy/MM/dd").format(new Date());
			String uuid = UUID.randomUUID().toString() + "_" + file.getOriginalFilename();
			
			File dir = new File(folder);
			if(! dir.exists()) dir.mkdirs();
			try {
				file.transferTo(new File(folder , uuid));
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			return folder.substring(resources.length()+1) + "/" + uuid ;
		}
		
		//파일 삭제 처리
		public void fileDelete(String directory, HttpSession session) {
			//업로드된 위치 
			String resources = session.getServletContext().getRealPath("resources");

			String result = directory.substring(directory.indexOf("/upload")+1);
			String folder = resources + "/"+ result;
			
			File dir = new File(folder);
		

			try {
				if(dir.exists())
					dir.delete();
				
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//파일 다운로드
		public void fileDownload(String filename, String filepath, HttpSession session, HttpServletResponse res) {
			//실제 파일의 위치와 파일을 찾아 file 처리
			File file = new File(session.getServletContext().getRealPath("resources")+ "/" + filepath);
			
			String mine = session.getServletContext().getMimeType(filename); //마인타입 가져오기
			
			res.setContentType(mine);	//응답처리할 마인타입 설정
			
			try {
			filename = URLEncoder.encode(filename, "utf-8").replaceAll("\\+", "%20");//파일이름 인코딩 처리+공백 처리(+일 때 공백으로)
				//%20==공백
			res.setHeader("content-disposition", "attachment; filename="+filename);	//헤더에 파일정보 담기
			
			//응답(출력)시 문자 타입은 printWriter, 그외 타입은 inputStream, outputStream 사용
				ServletOutputStream out = res.getOutputStream();
				FileCopyUtils.copy(new FileInputStream(file), out);
				out.flush();//비우기
			} catch (Exception e) {
				e.printStackTrace();
				System.out.println("fileDownload 오류");
			}
			
		}
		
		public String requestAPI(StringBuffer url) {
			String result = "";			//<= 나중에 결과를 보내기 위한 변수 선언
			try {
			      HttpURLConnection con = (HttpURLConnection) new URL(url.toString()).openConnection();
			      con.setRequestMethod("GET"); //통신 방법 = get
			      int responseCode = con.getResponseCode(); //통신하고 응답 코드를 가져옴
			      
			      BufferedReader br;
			      System.out.print("responseCode="+responseCode);
			      if(responseCode==200) { // 정상 호출
			        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			      } else {  // 에러 발생
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			      }
			      
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {//몇 개의 정보가 있을지 모르므로 while로 반복문 돌린다(=>rs.next()랑 비슷함)
			        res.append(inputLine);//가져온 정보가 null이 아닐 때 StringBuffer에 추가함
			      }
			      br.close();
			      con.disconnect();
			      result = res.toString();	//Buffer를 스트링으로 바꿔 리턴시킨다.
			      	      
			    } catch (Exception e) {
			      System.out.println(e.getMessage()); //에러 메시지 처리
			    }
			return result;
		}
		
		public String requestAPI(StringBuffer url, String property) {
			String result = "";			//<= 나중에 결과를 보내기 위한 변수 선언
			try {
				
			      HttpURLConnection con = (HttpURLConnection) new URL(url.toString()).openConnection();
			      con.setRequestMethod("GET"); //통신 방법 = get
			      
			      con.setRequestProperty("Authorization", property);
			      int responseCode = con.getResponseCode(); //통신하고 응답 코드를 가져옴
			      
			      BufferedReader br;
			      System.out.print("responseCode="+responseCode);
			      if(responseCode==200) { // 정상 호출
			        br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			      } else {  // 에러 발생
			        br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			      }
			      
			      String inputLine;
			      StringBuffer res = new StringBuffer();
			      while ((inputLine = br.readLine()) != null) {//몇 개의 정보가 있을지 모르므로 while로 반복문 돌린다(=>rs.next()랑 비슷함)
			        res.append(inputLine);//가져온 정보가 null이 아닐 때 StringBuffer에 추가함
			      }
			      br.close();
			      con.disconnect();
			      result = res.toString();	//Buffer를 스트링으로 바꿔 리턴시킨다.
			      	      
			    } catch (Exception e) {
			      System.out.println(e.getMessage()); //에러 메시지 처리
			    }
			return result;
		}
		
		
		public String getAccessToken (String authorize_code) {
			String access_Token = "";
			String refresh_Token = "";
			String reqURL = "https://kauth.kakao.com/oauth/token";

			try {
				URL url = new URL(reqURL);
	            
				HttpURLConnection conn = (HttpURLConnection) url.openConnection();
				// POST 요청을 위해 기본값이 false인 setDoOutput을 true로
	            
				conn.setRequestMethod("POST");
				conn.setDoOutput(true);
				// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
	            
				BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
				StringBuilder sb = new StringBuilder();
				sb.append("grant_type=authorization_code");
	            
				sb.append("&client_id=4b12573ac9cb8199a62e031d7c2e1808"); //본인이 발급받은 key
				sb.append("&redirect_uri=http://localhost/bss/kakaocallback"); // 본인이 설정한 주소
	            
				sb.append("&code=" + authorize_code);
				bw.write(sb.toString());
				bw.flush();
	            
				// 결과 코드가 200이라면 성공
				int responseCode = conn.getResponseCode();
				System.out.println("responseCode : " + responseCode);
	            
				// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
				BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
				String line = "";
				String result = "";
	            
				while ((line = br.readLine()) != null) {
					result += line;
				}
				System.out.println("response body : " + result);
	            
				// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
				JsonParser parser = new JsonParser();
				JsonElement element = parser.parse(result);
	            
				access_Token = element.getAsJsonObject().get("access_token").getAsString();
				refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
	            
				System.out.println("access_token : " + access_Token);
				System.out.println("refresh_token : " + refresh_Token);
	            
				br.close();
				bw.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
			return access_Token;
		}
		
		
}