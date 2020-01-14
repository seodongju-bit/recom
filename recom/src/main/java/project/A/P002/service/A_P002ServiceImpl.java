package project.A.P002.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P002.dao.A_P002DAO;
import project.A.P001.vo.A_P001VO;


@Service("a_p002Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P002ServiceImpl implements A_P002Service {
	@Autowired
	A_P002DAO a_p002DAO;
	
	
	@Override
	public void addMember(A_P001VO A_P001VO) throws Exception{
		a_p002DAO.insertNewMember(A_P001VO);
	}
	
	@Override
	public String overlappedid(String id) throws Exception{
		return a_p002DAO.selectOverlappedID(id);
	}
	
	@Override
	public String overlappednick(String nick) throws Exception{
		return a_p002DAO.selectOverlappedNICK(nick);
	}
	
	@Override
	public String overlappedemail(Map emailMap) throws Exception{
		return a_p002DAO.selectOverlappedEMAIL(emailMap);
	}
	
	public void verifyMember(A_P001VO A_P001VO) {
		a_p002DAO.verifyMember(A_P001VO);
	}
}