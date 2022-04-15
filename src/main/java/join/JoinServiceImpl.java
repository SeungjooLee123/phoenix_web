package join;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import user.UserVO;

@Service
public class JoinServiceImpl implements JoinService{

	@Autowired JoinDAO dao;
	
	@Override
	public boolean member_join(UserVO vo) {
		return dao.member_join(vo);
	}

	@Override
	public boolean id_check(String id) {
		return dao.id_check(id);
	}

}
