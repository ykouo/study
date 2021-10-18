package model.mem;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service("memService")
public class MemServiceImpl implements MemService{
	@Autowired
	private SpringMemDAO memDAO;
	
	@Override
	public void insertMem(MemVO vo) {
		memDAO.insertMem(vo);
	}

	@Override
	public void updateMem(MemVO vo) {
		memDAO.updateMem(vo);
	}

	@Override
	public void deleteMem(MemVO vo) {
		memDAO.deleteMem(vo);
	}

	@Override
	public MemVO getMem(MemVO vo) {
		try {
			return memDAO.getMem(vo);
		}catch(Exception e) {
			return null;
		}		
	}

	@Override
	public List<MemVO> getMemList(MemVO vo) {
		return memDAO.getMemList(vo);
	}

}
