package project.B.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.B.P001.vo.B_P001VO;


@Repository("B_P001DAO") 
public class B_P001DAOImpl implements B_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<B_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<B_P001VO> list = sqlSession.selectList("B.P001.searchList", searchMap);
		System.out.println(list);
		return list;
	}
	
	@Override
	public void addProduct(B_P001VO b_P001VO) throws DataAccessException {
		sqlSession.insert("B.P001.addProduct", b_P001VO);
	}
	
	@Override
	public List<B_P001VO> conditionSearch(Map<String, Object> searchMap) throws DataAccessException {
		List<B_P001VO> list = sqlSession.selectList("B.P001.conditionSearch", searchMap);
		System.out.println(list);
		return list;
	}
}
