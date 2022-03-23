package join;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class JoinDAO {
	@Autowired private SqlSession sql;

	public boolean id_check(String id) {
		return (Integer) sql.selectOne("join.mapper.id_check",id) == 0 ? true : false;
	}
	
	
}
