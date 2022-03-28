package sns;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	public boolean snsDelete(int no) {
		return sql.delete("sns.mapper.delete", no) == 1 ? true : false;
	}
	
	public List<SnsVO> snsList(SnsVO vo) {
		return sql.selectList("sns.mapper.list", vo);
	}
	
	public boolean snsInsert(SnsVO imgVO) {
		return sql.insert("sns.mapper.insert", imgVO) == 1 ? true : false;
		
	}
	

}
