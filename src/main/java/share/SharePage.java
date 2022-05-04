package share;

import java.util.List;

import org.springframework.stereotype.Component;

import common.PageVO;
@Component
public class SharePage extends PageVO{

	private List<ShareCommentVO> list;

	
	
	public List<ShareCommentVO> getList() {
		return list;
	}

	public void setList(List<ShareCommentVO> list) {
		this.list = list;
	}

		
		
	
}
