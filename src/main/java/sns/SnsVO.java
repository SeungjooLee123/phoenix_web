package sns;

import java.sql.Date;
import java.util.ArrayList;


public class SnsVO {

	
	String sns_content, id, title;
	int sns_no;
	Date sns_date;
	ArrayList<String> imgList = new ArrayList<String>();
	
	
	
	public ArrayList<String> getImgList() {
		return imgList;
	}
	public void setImgList(ArrayList<String> imgList) {
		this.imgList = imgList;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}

	
	public String getSns_content() {
		return sns_content;
	}
	public void setSns_content(String sns_content) {
		this.sns_content = sns_content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getSns_no() {
		return sns_no;
	}
	public void setSns_no(int sns_no) {
		this.sns_no = sns_no;
	}
	public Date getSns_date() {
		return sns_date;
	}
	public void setSns_date(Date sns_date) {
		this.sns_date = sns_date;
	}
	
	


	
	
	
}
