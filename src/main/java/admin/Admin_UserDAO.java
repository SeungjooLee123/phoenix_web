package admin;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class Admin_UserDAO  implements AdminService{
	
	@Autowired  private SqlSession sql;

	@Override
	public List<Admin_UserVO> admin_user_list() {
		return sql.selectList("admin.mapper.list");
	}

	@Override
	public Admin_UserVO admin_user_detail(String id) {
		return sql.selectOne("admin.mapper.detail", id);
	}

	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub
		
	}

}
