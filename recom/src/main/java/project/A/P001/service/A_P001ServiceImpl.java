package project.A.P001.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P001.dao.A_P001DAO;
import project.A.P001.vo.A_P001VO;


@Service("a_p001Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P001ServiceImpl implements A_P001Service {
	@Autowired
	A_P001DAO a_p001DAO;

	
	
	@Override
	public A_P001VO login(Map  loginMap) throws Exception{
		return a_p001DAO.login(loginMap);
	}
	
	
	@Override
	public A_P001VO searchID(A_P001VO A_P001VO) {
		return a_p001DAO.searchID(A_P001VO);
	}

	@Override
	public A_P001VO searchPW(A_P001VO A_P001VO) {
		return a_p001DAO.searchPW(A_P001VO);
	}
	
}