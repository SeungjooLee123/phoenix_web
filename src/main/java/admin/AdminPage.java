package admin;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;

@Component
public class AdminPage extends PageVO{
	
	private List<Admin_UserVO> list;

	public List<Admin_UserVO> getList() {
		return list;
	}

	public void setList(List<Admin_UserVO> list) {
		this.list = list;
	}
	
	
	

	
	

}
