package community;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;
@Component
public class CommunityPage extends PageVO{

	private List<CommunityCommentVO> list;

	
	
	
	public List<CommunityCommentVO> getList() {
		return list;
	}

	public void setList(List<CommunityCommentVO> list) {
		this.list = list;
	}
	
	
}
