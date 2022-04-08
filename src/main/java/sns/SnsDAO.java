package sns;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class SnsDAO {
	@Autowired private SqlSession sql;
	
	public boolean groDelete(int no) {
		return sql.delete("sns.mapper.delete", no) > 0 ? true : false;
	}
	
	//게시글 업데이트
	public boolean groupdate(GrowthVO vo) {
		return sql.update("sns.mapper.update", vo) > 0 ? true: false;
	}
	
	public List<GrowthVO> groList(String baby_id) {
		return sql.selectList("sns.mapper.list", baby_id);
	}
	
	
	public boolean snsInsert(GrowthVO Imgvo) {
		sql.insert("sns.mapper.insert", Imgvo);
		String filename = Imgvo.getImgList().get(0);
		int test = sql.selectOne("sns.mapper.check", filename);
		return test > 0 ? true : false;
		
	}
	
	public List<GrowthVO>  gro_img(int no) {
		return sql.selectList("sns.mapper.gro_img", no);
	}
	
	public boolean gro_update(GrowthVO vo) {
		return sql.update("sns.mapper.gro_update", vo) > 0 ? true : false;
	}
	
		

	
}
