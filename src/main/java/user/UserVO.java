package user;

import java.sql.Date;

public class UserVO {
	private String title, family_rels, id, pw,pw_chk, naver_id, kakao_id, admin;
	private Date join_date;
	
	
	

	public Date getJoin_date() {
		return join_date;
	}

	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

	public String getAdmin() {
		return admin;
	}

	public void setAdmin(String admin) {
		this.admin = admin;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getFamily_rels() {
		return family_rels;
	}

	public void setFamily_rels(String family_rels) {
		this.family_rels = family_rels;
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

	public String getPw_chk() {
		return pw_chk;
	}

	public void setPw_chk(String pw_chk) {
		this.pw_chk = pw_chk;
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

	
	
	

    
}