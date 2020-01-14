 	package project.A.P002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.aspectj.ajde.internal.LstBuildConfigFileParser;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P001.vo.A_P001VO;


@Repository("a_p002DAO") 
public class A_P002DAOImpl implements A_P002DAO {
	@Autowired
	private SqlSession sqlSession;	
	
	@Override
	public void insertNewMember(A_P001VO A_P001VO) throws DataAccessException{
		sqlSession.insert("A.A_P002.insertNewMember",A_P001VO);
	}

	@Override
	public String selectOverlappedID(String id) throws DataAccessException {
		String result =  sqlSession.selectOne("A.A_P002.selectOverlappedID",id);
		return result;
	}
	
	@Override
	public String selectOverlappedNICK(String nick) throws DataAccessException {
		String result =  sqlSession.selectOne("A.A_P002.selectOverlappedNICK",nick);
		return result;
	}
	

	@Override
	public String selectOverlappedEMAIL(Map emailMap) throws DataAccessException {
		String result = sqlSession.selectOne("A.A_P002.selectOverlappedEMAIL",emailMap);
		return result;
	}
	
	

	public void verifyMember(A_P001VO A_P001VO) throws DataAccessException {
		sqlSession.update("A.A_P002.verifyMember",A_P001VO);
	}
	
}