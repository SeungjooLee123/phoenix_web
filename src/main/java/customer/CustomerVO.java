package customer;

import java.sql.Date;

public class CustomerVO {
	int id, no      ;
	String category;
	String user_id   ;
	String content   ;
	Date share_date;
	String filename  ;
	String filepath  ;
	String title     ;
	String reply     ;
	String phone;
	String email;
	
	
	
	String reply_chk;
	
	
	
	
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getReply_chk() {
		return reply_chk;
	}
	public void setReply_chk(String reply_chk) {
		this.reply_chk = reply_chk;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getShare_date() {
		return share_date;
	}
	public void setShare_date(Date share_date) {
		this.share_date = share_date;
	}
	public String getFilename() {
		return filename;
	}
	public void setFilename(String filename) {
		this.filename = filename;
	}
	public String getFilepath() {
		return filepath;
	}
	public void setFilepath(String filepath) {
		this.filepath = filepath;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getReply() {
		return reply;
	}
	public void setReply(String reply) {
		this.reply = reply;
	}
	
	
}
