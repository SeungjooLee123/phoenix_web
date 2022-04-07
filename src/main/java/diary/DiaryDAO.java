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
	public boolean diary_insert(DiaryVO vo) {
		//if(vo.getBaby_category().equals(""))
		int result = 0;
		result = sql.insert("diary.mapper.insert",vo);
//		if(vo.getBaby_category().equals("모유")){
//			result = sql.insert("diary.mapper.insert",vo);
//        } else if(vo.getBaby_category().equals("분유")){
//        	result = sql.insert("diary.mapper.insert_bunu",vo);
//        } else if(vo.getBaby_category().equals("이유식")){
//        	result = sql.insert("diary.mapper.insert_eat",vo);
//        } else if(vo.getBaby_category().equals("기저귀")){
//        	result = sql.insert("diary.mapper.insert_toilet",vo);
//        } else if(vo.getBaby_category().equals("수면")){
//        	result = sql.insert("diary.mapper.insert_sleep",vo);
//        } else if(vo.getBaby_category().equals("목욕")){
//        	result = sql.insert("diary.mapper.insert_bath",vo);
//        } else if(vo.getBaby_category().equals("체온")){
//        	result = sql.insert("diary.mapper.insert_temp",vo);
//        } else if(vo.getBaby_category().equals("물")){
//        	result = sql.insert("diary.mapper.insert_water",vo);
//        } else if(vo.getBaby_category().equals("투약")){
//        	result = sql.insert("diary.mapper.insert_pills",vo);
//        } else if(vo.getBaby_category().equals("간식")){
//        	result = sql.insert("diary.mapper.insert_danger",vo);
//        }
		
		return result == 1 ? true : false;
		//System.out.println(sql.insert("diary.mapper.insert",vo));
		
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
