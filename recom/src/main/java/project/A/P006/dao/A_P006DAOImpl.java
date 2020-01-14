package project.A.P006.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import project.A.P001.vo.A_P001VO;
import project.A.P006.vo.A_P006VO;



@Repository("A_P006DAO")
public class A_P006DAOImpl implements A_P006DAO{
	
	
	@Autowired
	SqlSession sqlSession;
	
	
	@Override
	public void insertMessage(A_P006VO c_p002_d005vo) throws Exception {
		sqlSession.insert("Customers.chat.insertMessage",c_p002_d005vo);
		
	}

	@Override
	public List<A_P001VO> selectMemberList(String mem_id) throws Exception {
		List<A_P001VO> list = sqlSession.selectList("Customers.chat.selectMemberList",mem_id);
		return list;
	}

	@Override
	public List<A_P006VO> selectMessageList(A_P006VO c_p002_d005vo) throws Exception {
		List<A_P006VO> list = sqlSession.selectList("Customers.chat.selectMessageList", c_p002_d005vo);
		return list;
	}

	@Override
	public List<A_P001VO> selectSearchList(Map<String, String> searchMap) throws Exception {
		List<A_P001VO> list=sqlSession.selectList("Customers.chat.selectSearchList", searchMap);
		return list;
	}

	@Override
	public List<A_P001VO> selectSeller(Map<String, Object> searchMap) {
		List<A_P001VO> list = sqlSession.selectList("Customers.chat.selectSeller",searchMap);
		return list;
	}
	
	@Override
	public List<A_P001VO> selectprod(Map<String, Object> searchMap) {
		List<A_P001VO> list = sqlSession.selectList("Customers.chat.selectprod",searchMap);
		return list;
	}

}
