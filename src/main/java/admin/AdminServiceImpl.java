package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.CustomerVO;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired private Admin_UserDAO dao;
	
	//사용자 목록 조회(페이징 처리)
	@Override
	public AdminPage admin_user_list(AdminPage page) {
		return dao.admin_user_list(page);
	}

//	@Override
//	public List<Admin_UserVO> admin_user_list() {
//		return dao.admin_user_list();
//	}

	//관리자 계정 문의사항 디테일 조회
	@Override
	public CustomerVO admin_qanda_detail(String title) {
		return dao.admin_qanda_detail(title);
	}

	//사용자 계정 삭제 -> 비구현
	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub
	}

	//카테고리별 문의사항 조회
	@Override
	public List<CustomerVO> customer_list(String category) {
		return dao.customer_list(category);
	}

	//해당 문의사항 글 첨부파일 다운로드
	@Override
	public CustomerVO admin_file(int id) {
		return dao.admin_file(id);
	}

	//문의사항 글 답변대기 조회
	@Override
	public boolean admin_reply(CustomerVO vo) {
		return dao.admin_reply(vo);
	}

	//해당 문의사항글 디테일 조회
	@Override
	public CustomerVO admin_customer_detail(int id) {
		return dao.admin_customer_detail(id);
	}

	//사용자별 문의사항 조회
	@Override
	public List<CustomerVO> user_cs_list(String user_id) {
		return dao.user_cs_list(user_id);
	}

	//사용자별 문의사항 답변 조회
	@Override
	public CustomerVO admin_reply_detail(int id) {
		return dao.admin_reply_detail(id);
	}

	

	

	

	

	

}
