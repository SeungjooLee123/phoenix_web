package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import customer.CustomerVO;
import welfare.WelfareVO;

@Repository
public class Admin_UserDAO  implements AdminService{
	
	@Autowired  private SqlSession sql;
	
	//사용자 목록 조회 페이징 처리
	@Override
	public AdminPage admin_user_list(AdminPage page) {
		page.setTotalList(sql.selectOne("admin.mapper.totalList", page));
		
		List<Admin_UserVO> list = sql.selectList("admin.mapper.list", page);
		page.setList(list);
		return page;
	}
	
	
	

//	@Override
//	public List<Admin_UserVO> admin_user_list() {
//		return sql.selectList("admin.mapper.list");
//	}
	
	//제목으로 해당 문의글 디테일 조회
	@Override
	public CustomerVO admin_qanda_detail(String title) {
		return sql.selectOne("admin.mapper.detail", title);
	}

	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub
		
	}

	//카테고리별 문의사항 조회
	@Override
	public List<CustomerVO> customer_list(String category) {
		return sql.selectList("admin.mapper.cs_list", category);
	}



	//파일 조회
	@Override
	public CustomerVO admin_file(int id) {
		return sql.selectOne("admin.mapper.file", id);
	}



	//문의사항 글 답변 업데이트
	@Override
	public boolean admin_reply(CustomerVO vo) {
		return sql.update("admin.mapper.reply", vo) > 0 ? true : false;
	}



	//글번호로 문의사항 디테일 조회
	@Override
	public CustomerVO admin_customer_detail(int id) {
		return sql.selectOne("admin.mapper.cs_one", id);
	}



	//사용자 계정으로 문의사항 리스트 조회
	@Override
	public List<CustomerVO> user_cs_list(String user_id) {
		return sql.selectList("admin.mapper.my_cs_list", user_id);
	}



	//글 번호로 내 문의사항 조회
	@Override
	public CustomerVO admin_reply_detail(int id) {
		return sql.selectOne("admin.mapper.my_cs_detail", id);
	}




	





}
