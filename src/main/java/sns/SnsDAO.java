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
	
	//이미지 수정 -> 이미지 지움
	public boolean del_img(int no) {
		return sql.delete("sns.mapper.del_img", no) > 0 ? true : false;
	}
	
	//해당글 이미지들 가져오기
	public List<GrowthVO> select_imgs(int no) {
		return sql.selectList("sns.mapper.select_imgs", no);
	}
	//글 조회
	public GrowthVO select_text(int no) {
		return sql.selectOne("sns.mapper.select_text", no);
	}
	//글 업데이트
	public GrowthVO text_update(GrowthVO vo) {
		int result = 0;
		result = sql.update("sns.mapper.text_update", vo);
		System.out.println(result > 0 ? true : false);
		int no = vo.getGro_no();
		return sql.selectOne("sns.mapper.choice", no);			
	}
	
	public List<GrowthVO> insertall(GrowthVO vo) {
		int result = 0;
		result = sql.insert("sns.mapper.insertall", vo);
		System.out.println(result > 0 ? true : false);
		int no = vo.getGro_no();
		return sql.selectList("sns.mapper.choice_all", no);
	}
	
	
	
}
