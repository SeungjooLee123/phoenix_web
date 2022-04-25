package admin;

import java.util.List;

import customer.CustomerVO;

public interface AdminService {
	
	//사용자 목록 조회
//	List<Admin_UserVO> admin_user_list();
	

	AdminPage admin_user_list(AdminPage page);
	
	//사용자 상세 조회
	Admin_UserVO admin_user_detail(String id);
	
	//사용자 정보 삭제
	void admin_user_delete(String id);
	
	//문의사항 조회
	List<CustomerVO> customer_list();
	
	

}
