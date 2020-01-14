package project.A.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.dao.DataAccessException;
import project.A.P001.vo.A_P001VO;

public interface A_P001DAO {
	public A_P001VO login(Map loginMap) throws DataAccessException;
	public A_P001VO searchID(A_P001VO A_P001VO);
	public A_P001VO searchPW(A_P001VO A_P001VO);
}



