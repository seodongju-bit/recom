package project.A.P010.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;



@Repository("A_P010DAO")
public class A_P010DAOImpl implements A_P010DAO{

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<Map<String, Object>> searchProfile(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("A.P010.searchProfile", searchMap);
		System.out.println("프로필"+list);
		return list;
	}

	@Override
	public void saveProfile(Map<String, String> map) {
		sqlSession.update("A.P010.saveProfile", map);
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("A.P010.searchReview", searchMap);
		return list;
	}
	

	
}
