package join3;

import java.util.ArrayList;

public class memDAO {
	
	ArrayList<memVO> datas = new ArrayList<memVO>();

	public ArrayList<memVO> getDatas() {
		return datas;
	}

	public void addMem(memVO vo) {
		datas.add(vo);
	}
}
