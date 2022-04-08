package join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;

import babyinfo.BabyInfoVO;
import babyinfo.FamilyInfoVO;
import user.UserVO;

@Repository
public class JoinDAO {
	@Autowired private SqlSession sql;

	public boolean title_check(String title) {
		return (Integer) sql.selectOne("join.mapper.title_check",title) == 0 ? true : false;
	}
	
	public boolean id_check(String id) {
		return (Integer) sql.selectOne("join.mapper.id_check",id) == 0 ? true : false;
	}
	
	public boolean userJoin(UserVO vo) {
		//int a = sql.insert("join.mapper.userjoin", vo);
		return sql.insert("join.mapper.userjoin", vo) > 0 ? true: false;
//		return  == 1? true: false;
	}
	
	public boolean babyJoin(BabyInfoVO vo) {
		return sql.insert("join.mapper.babyjoin",vo) == 1? true: false;
	}

	public boolean invite_login(FamilyInfoVO familyInfoVO) {
		return sql.insert("join.mapper.invite_login",familyInfoVO) == 1? true: false;
	}
	
	
	
}
