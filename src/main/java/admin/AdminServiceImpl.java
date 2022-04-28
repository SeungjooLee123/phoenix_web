package admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import customer.CustomerVO;


@Service
public class AdminServiceImpl implements AdminService {
	@Autowired private Admin_UserDAO dao;
	
	@Override
	public AdminPage admin_user_list(AdminPage page) {
		return dao.admin_user_list(page);
	}

//	@Override
//	public List<Admin_UserVO> admin_user_list() {
//		return dao.admin_user_list();
//	}

	@Override
	public CustomerVO admin_qanda_detail(String title) {
		return dao.admin_qanda_detail(title);
	}

	@Override
	public void admin_user_delete(String id) {
		// TODO Auto-generated method stub

	}

	@Override
	public List<CustomerVO> customer_list(String category) {
		return dao.customer_list(category);
	}

	@Override
	public CustomerVO admin_file(int id) {
		return dao.admin_file(id);
	}

	@Override
	public boolean admin_reply(CustomerVO vo) {
		return dao.admin_reply(vo);
	}

	@Override
	public CustomerVO admin_customer_detail(int id) {
		return dao.admin_customer_detail(id);
	}

	@Override
	public List<CustomerVO> user_cs_list(String user_id) {
		return dao.user_cs_list(user_id);
	}

	@Override
	public CustomerVO admin_reply_detail(int id) {
		return dao.admin_reply_detail(id);
	}

	

	

	

	

	

}
