package storage;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BabyStorDAO {
	@Autowired private SqlSession sql;
	
	//가장 최근 날짜 키, 몸무게 조회
	public BabyStorVO cntBody(String baby_id) {
		return sql.selectOne("storage.mapper.cntbody", baby_id);
	}
}