package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired private Admin_UserDAO dao;

	@Override
	public List<Admin_UserVO> admin_user_list() {
		return dao.admin_user_list();
	}

	@Override
	public Admin_UserVO admin_user_detail(String id) {
		return dao.admin_user_detail(id);
	}

	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub

	}

}
