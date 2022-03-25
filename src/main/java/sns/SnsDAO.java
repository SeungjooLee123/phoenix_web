package sns;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	public boolean snsInsert(SnsVO imgVO) {
		return sql.insert("sns.mapper.insert", imgVO) == 1 ? true : false;
		
	}
	

}
