package admin;

import java.util.List;

public interface AdminService {
	
	//사용자 목록 조회
	List<Admin_UserVO> admin_user_list();
	
	//사용자 상세 조회
	Admin_UserVO admin_user_detail(String id);
	
	//사용자 정보 삭제
	void admin_user_delete(String id);
	
	

}
