package join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import babyinfo.BabyInfoVO;
import user.UserVO;

@Repository
public class JoinDAO {
	@Autowired private SqlSession sql;

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
	
	
	
}
