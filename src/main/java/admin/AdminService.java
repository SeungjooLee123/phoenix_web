package admin;

import java.util.List;


import customer.CustomerVO;

public interface AdminService {
	
	//사용자 목록 조회
//	List<Admin_UserVO> admin_user_list();
	

	AdminPage admin_user_list(AdminPage page);
	
	//사용자 정보 삭제
	void admin_user_delete(String id);
	
	//문의사항 조회
	List<CustomerVO> customer_list(String category);
	
	//문의사항 상세조회
	CustomerVO admin_qanda_detail(String title);
	
	CustomerVO admin_file(int id);
	
	

}
