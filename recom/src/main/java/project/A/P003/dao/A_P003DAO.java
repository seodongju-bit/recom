package project.A.P003.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P001.vo.A_P001VO;

public interface A_P003DAO {
	
	public void updateMyInfo(A_P001VO A_P001VO) throws DataAccessException;
	public A_P001VO selectMyDetailInfo(String mem_id) throws DataAccessException;
	public void Secessionmember(A_P001VO A_P001VO) throws DataAccessException;
	public boolean pwCheck(String mem_id,String mem_pw)throws DataAccessException;

}




