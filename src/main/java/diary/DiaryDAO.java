package diary;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.google.gson.JsonElement;


@Repository
public class DiaryDAO {
	@Autowired private SqlSession sql;
	
	public List<DiaryVO> diary_list(HashMap<String, String> map) {
		return sql.selectList("diary.mapper.list",map);
	}
	public List<DiaryVO> diary_list_cate(DiaryVO vo) {
		return sql.selectList("diary.mapper.list_cate",vo);
	}
	public boolean diary_insert(DiaryVO vo) {
		int result = 0;
		result = sql.insert("diary.mapper.insert",vo);
		return result == 1 ? true : false;
		
	}
	public DiaryVO diary_detail(int no) {
		return sql.selectOne("diary.mapper.detail",no);
	}
	public boolean diary_delete(DiaryVO vo) {
		return sql.delete("diary.mapper.delete",vo) == 1 ? true : false;
	}
	public boolean diary_update(DiaryVO vo) {
		return sql.update("diary.mapper.update",vo) == 1 ? true : false;
	}
	
}
