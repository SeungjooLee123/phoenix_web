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
	
	public List<GrowthVO> groList(String id) {
		return sql.selectList("sns.mapper.list", id);
	}
	
	public boolean snsInsert(GrowthVO Imgvo) {
		return sql.insert("sns.mapper.insert", Imgvo) == 1 ? true : false;
		
	}
	

}
