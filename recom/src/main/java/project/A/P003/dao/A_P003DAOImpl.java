package project.A.P003.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.ajde.internal.LstBuildConfigFileParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P001.vo.A_P001VO;


@Repository("a_p003DAO") 
public class A_P003DAOImpl implements A_P003DAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public void updateMyInfo(A_P001VO A_P001VO) throws DataAccessException{
		sqlSession.update("A.A_P003.updateMyInfo",A_P001VO);
	}
	
	public A_P001VO selectMyDetailInfo(String mem_id) throws DataAccessException{
		A_P001VO A_P001VO=(A_P001VO)sqlSession.selectOne("A.A_P003.selectMyDetailInfo",mem_id);
		return A_P001VO;
		
	}
	
	@Override
	public void Secessionmember(A_P001VO A_P001VO) throws DataAccessException {
		sqlSession.update("A.A_P003.Secessionmember",A_P001VO);
	}
	
	
	public boolean pwCheck(String mem_id,String mem_pw) {
		boolean result = false;
		Map<String,String> map = new HashMap<String,String>();
		map.put("mem_id", mem_id);
		map.put("mem_pw", mem_pw);
		int count = sqlSession.selectOne("A.A_P003.pwCheck",map);
		if(count == 1 )result = true;
		return result;
	}
	
}