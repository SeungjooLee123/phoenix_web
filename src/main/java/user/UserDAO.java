package user;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class UserDAO {
	
	@Autowired private SqlSession sql;
	
	public UserVO user_login(HashMap<String, String> map) {
		return sql.selectOne("user.mapper.login", map);
	}

	public List<String> baby_info_title_list(String id){
		return sql.selectList("user.mapper.titlelist", id);
	}
	
	public boolean user_join(UserVO vo) {
		return sql.insert("user.mapper.join", vo) == 1? true: false ;
	}
	
	public UserVO user_loginn(HashMap<String, String> loginmap) {
		System.out.println("dao!");
		return sql.selectOne("user.mapper.loginn" , loginmap );
		
	}
	
	public boolean social_login(String id) {
		return ((Integer) sql.selectOne("user.mapper.social_login", id)) == 1? true : false;
	}
}
