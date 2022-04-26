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

	@Override
	public CustomerVO admin_qanda_detail(String title) {
		return sql.selectOne("admin.mapper.detail", title);
	}

	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub
		
	}

	//문의 사항 ㅈ회
	@Override
	public List<CustomerVO> customer_list(String category) {
		return sql.selectList("admin.mapper.cs_list", category);
	}



	//파일 조회
	@Override
	public CustomerVO admin_file(int id) {
		return sql.selectOne("admin.mapper.file", id);
	}

	



}
