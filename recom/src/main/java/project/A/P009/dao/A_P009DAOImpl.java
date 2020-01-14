package project.A.P009.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P009.vo.A_P009VO;

@Repository("A_P009DAO")
public class A_P009DAOImpl implements A_P009DAO{

	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<A_P009VO> declarationsList(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P009VO> list = sqlSession.selectList("A.P009.declarationsList", searchMap);
		return list;
	}
	
	@Override
	public List<A_P009VO> conditionDeclaration(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P009VO> list = sqlSession.selectList("A.P009.conditionDeclaration", searchMap);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P009.insertData", row);
	}
	
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P009.updateData", row);
	}
	
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P009.deleteData", row);
	}
	
}
