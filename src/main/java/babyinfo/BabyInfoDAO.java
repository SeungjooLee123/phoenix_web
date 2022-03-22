package babyinfo;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BabyInfoDAO {
	@Autowired private SqlSession sql;
	
	public List<BabyInfoVO> baby_info_list(String id) {
		return sql.selectList("babyinfo.mapper.list", id);
	}
	
	public FamilyInfoVO baby_info_rels(HashMap<String, String> map) {
		return sql.selectOne("babyinfo.mapper.rels", map);
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
	
	public boolean baby_info_update(BabyInfoVO vo) {
		return sql.update("babyinfo.mapper.babyupdate", vo) == 1 ? true : false;
	}
	
	public boolean baby_info_rels_update(FamilyInfoVO vo) {
		return sql.update("babyinfo.mapper.relsupdate", vo) == 1 ? true : false;
	}
}