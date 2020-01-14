package project.B.P001.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.B.P001.vo.B_P001VO;
import project.B.P001.dao.B_P001DAO;

@Service("B_P001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class B_P001ServiceImpl implements B_P001Service {
	@Autowired
	private B_P001DAO b_P001DAO;

	
	@Override
	public List<B_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<B_P001VO> list =  b_P001DAO.selectItem(searchMap);
		return list;
	}
	
	@Override
	public void addProduct(B_P001VO b_P001VO) throws DataAccessException {
		System.out.println("서비스 실행");
		b_P001DAO.addProduct(b_P001VO);
	}

	@Override
	public List<B_P001VO> conditionSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<B_P001VO> list = b_P001DAO.conditionSearch(searchMap);
		return list;
	}

}
