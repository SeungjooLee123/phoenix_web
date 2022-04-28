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
	
	//문의사항 해당 글 파일
	CustomerVO admin_file(int id);
	
	//문의사항 해당 글 답변하기
	boolean admin_reply(CustomerVO vo);
	
	//문의사항 카테고리 없이 글 찾기
	CustomerVO admin_customer_detail(int id);
	
	//문의사항 작성자 아이디로 찾기
	List<CustomerVO> user_cs_list(String user_id);
	
	//사용자 문의사항 답변상태 조회
	CustomerVO admin_reply_detail(int id);
	
	
	

}
