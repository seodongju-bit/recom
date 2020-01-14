package project.A.P003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;


import project.A.P003.dao.A_P003DAO;
import project.A.P001.vo.A_P001VO;


@Service("a_p003Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P003ServiceImpl implements A_P003Service {
	@Autowired
	A_P003DAO a_p003DAO;
	
	
	@Override
	public void updateMyInfo(A_P001VO A_P001VO){
		a_p003DAO.updateMyInfo(A_P001VO);
	}
		
	
	public A_P001VO myDetailInfo(String mem_id) throws Exception{
		return a_p003DAO.selectMyDetailInfo(mem_id);
	}


	public A_P001VO Secessionmember(A_P001VO A_P001VO) throws Exception {
		a_p003DAO.Secessionmember(A_P001VO);
		return A_P001VO;
	}
	
	@Override
	public boolean pwCheck(String mem_id,String mem_pw) throws Exception {
		return a_p003DAO.pwCheck(mem_id,mem_pw);
	}
	
}