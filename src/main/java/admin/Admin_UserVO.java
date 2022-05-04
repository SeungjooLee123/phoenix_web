package admin;

import java.sql.Date;

public class Admin_UserVO {
	String id, pw, naver_id, kakao_id, admin, naver_id_chk, kakao_id_chk; //소셜_chk는 계정 확인용
	Date join_date;
	
	
	
	public String getNaver_id_chk() {
		return naver_id_chk;
	}
	public void setNaver_id_chk(String naver_id_chk) {
		this.naver_id_chk = naver_id_chk;
	}
	public String getKakao_id_chk() {
		return kakao_id_chk;
	}
	public void setKakao_id_chk(String kakao_id_chk) {
		this.kakao_id_chk = kakao_id_chk;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getNaver_id() {
		return naver_id;
	}
	public void setNaver_id(String naver_id) {
		this.naver_id = naver_id;
	}
	public String getKakao_id() {
		return kakao_id;
	}
	public void setKakao_id(String kakao_id) {
		this.kakao_id = kakao_id;
	}
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}
	
	
	
	
	

	
	
}
