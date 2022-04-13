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
	
	public List<FamilyInfoVO> baby_info_co_parent(String title){
		return sql.selectList("babyinfo.mapper.coparent", title);
	}
	
	public boolean baby_info_update(BabyInfoVO vo) {
		return sql.update("babyinfo.mapper.babyupdate", vo) == 1 ? true : false;
	}
	
	public boolean baby_info_rels_update(FamilyInfoVO vo) {
		return sql.update("babyinfo.mapper.relsupdate", vo) == 1 ? true : false;
	}
	
	public boolean baby_info_delete(String baby_id) {
		return sql.delete("babyinfo.mapper.delete", baby_id) == 1 ? true : false;
	}
	
	public boolean baby_info_count(String title) {
		return (Integer)sql.selectOne("babyinfo.mapper.count", title) == 0 ? true : false;
	}
	
	public boolean family_exit(HashMap<String, String> map) {
		return (Integer)sql.delete("babyinfo.mapper.exit", map) == 1 ? true : false;
	}
	
	public void family_change(HashMap<String, String> map) {
		sql.update("babyinfo.mapper.update_fam", map);
	}
	
	public void delete_all(String title) {
		sql.delete("babyinfo.mapper.del_all", title);
	}
	
	public void delete_title(String title) {
		sql.delete("babyinfo.mapper.del_title", title);
	}
	
	public String get_title(String id) {
		return sql.selectOne("babyinfo.mapper.get_title",id);
	}
	
	public boolean secession(String id) {
		return sql.delete("babyinfo.mapper.secession", id) == 1 ? true : false;
	}
	
	public List<String> title(String id){
		return sql.selectList("babyinfo.mapper.title", id);
	}
	
	public BabyInfoVO curbaby(String baby_id) {
		return sql.selectOne("babyinfo.mapper.curbaby", baby_id);
	}
}