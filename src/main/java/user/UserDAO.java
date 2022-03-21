package user;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired private SqlSession sql;
	
	public UserVO user_login(HashMap<String, String> map) {
		return sql.selectOne("user.mapper.login", map);
	}

}
