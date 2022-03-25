package sns;

import java.util.HashMap;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	public boolean snsInsert(HashMap<Object, Object> map) {
		return sql.insert("sns.mapper.insert", map) == 1 ? true : false;
		
	}
	

}
