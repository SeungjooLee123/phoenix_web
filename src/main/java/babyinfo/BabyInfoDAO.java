package babyinfo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BabyInfoDAO {
	@Autowired private SqlSession sql;
	
	public List<BabyInfoVO> baby_info_list() {
		return sql.selectList("babyinfo.mapper.list");
	}
	
	public String baby_info_rels(String baby_id) {
		return sql.selectOne("babyinfo.mapper.rels", baby_id);
	}
	
	public void baby_info_title_change(HashMap<String, String> map) {
		sql.update("babyinfo.mapper.chtitle", map);
	}
	
	public List<FamilyInfoVO> baby_info_co_parent(String baby_id){
		return sql.selectList("babyinfo.mapper.coparent", baby_id);
	}
	
	public List<String> baby_info_title_list(){
		return sql.selectList("babyinfo.mapper.titlelist");
	}
}