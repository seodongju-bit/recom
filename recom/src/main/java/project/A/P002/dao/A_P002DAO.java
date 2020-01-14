package project.A.P002.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;
import project.A.P001.vo.A_P001VO;

public interface A_P002DAO {
	
	public void insertNewMember(A_P001VO A_P001VO) throws DataAccessException;
	public String selectOverlappedID(String id) throws DataAccessException;
	public String selectOverlappedNICK(String nick) throws DataAccessException;
	public String selectOverlappedEMAIL(Map emailMap) throws DataAccessException;
	public void verifyMember(A_P001VO A_P001VO) throws DataAccessException;

}




