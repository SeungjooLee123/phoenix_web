package community;

import java.sql.Date;

public class CommunityVO {

	
	private int id, cnt;
	private String title, content, web_file, web_path, user_id;
	private Date  web_date;
	
	
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWeb_file() {
		return web_file;
	}
	public void setWeb_file(String web_file) {
		this.web_file = web_file;
	}
	public String getWeb_path() {
		return web_path;
	}
	public void setWeb_path(String web_path) {
		this.web_path = web_path;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getWeb_date() {
		return web_date;
	}
	public void setWeb_date(Date web_date) {
		this.web_date = web_date;
	}
	
	
	
	
	
}
