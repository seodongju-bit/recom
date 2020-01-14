package project.A.P008.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P008.vo.A_P008VO;
import project.B.P001.vo.B_P001VO;

@Repository("A_P008DAO")
public class A_P008DAOImpl implements A_P008DAO {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List<A_P008VO> searchMember(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P008VO> list = sqlSession.selectList("A.P008.searchMember", searchMap);
		return list;
	}
	
	@Override
	public List<A_P008VO> conditionMember(Map<String, Object> searchMap) throws DataAccessException {
		List<A_P008VO> list = sqlSession.selectList("A.P008.conditionMember", searchMap);
		System.out.println(list);
		return list;
	}
	
	@Override
	public void insertData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P008.insertData", row);
	}
	
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P008.updateData", row);
	}
	
	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("A.P008.deleteData", row);
	}
}