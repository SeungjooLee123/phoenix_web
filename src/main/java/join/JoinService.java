package join;


import org.springframework.stereotype.Service;

import user.UserVO;

@Service
public interface JoinService {
		//회원가입 성공 여부 => boolean으로
		boolean member_join(UserVO vo);
		
		//아이디 중복검사
		boolean id_check(String id);
	
}
