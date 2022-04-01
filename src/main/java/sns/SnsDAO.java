package sns;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	public boolean snsDelete(int no) {
		return sql.delete("sns.mapper.delete", no) > 0 ? true : false;
	}
	
	public List<GrowthVO> groList(String baby_id) {
		return sql.selectList("sns.mapper.list", baby_id);
	}
	
	
	public boolean snsInsert(GrowthVO Imgvo) {
		sql.insert("sns.mapper.insert", Imgvo);
		String filename = Imgvo.getImgList().get(0);
		int test = sql.selectOne("sns.mapper.check", filename);
		return false;
		
	}
	

}
