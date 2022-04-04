package storage;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import diary.DiaryVO;

@Repository
public class BabyStorDAO {
	@Autowired private SqlSession sql;
	
	//가장 최근 날짜 키, 몸무게 조회
	public BabyStorVO cntBody(String baby_id) {
		return sql.selectOne("storage.mapper.cntbody", baby_id);
	}

	//키 몸무게 넣기
	public boolean insert(BabyStorVO vo) {
		return sql.insert("storage.mapper.insert", vo)==1 ? true : false;
	}

	public BabyStorVO select(HashMap<String, String> map) {
		return sql.selectOne("storage.mapper.select", map);
	}

	public boolean update(BabyStorVO vo) {
		return sql.insert("storage.mapper.update", vo)==1 ? true : false;
	}
	
	public List<BabyStorVO> select_hw(String baby_id){
		return sql.selectList("storage.mapper.select_body", baby_id);
	}
	
	public List<DiaryVO> select_heat(String baby_id){
		return sql.selectList("storage.mapper.select_heat", baby_id);
	}
}