package project.A.P006.dao;

import java.util.List;
import java.util.Map;

import project.A.P001.vo.A_P001VO;
import project.A.P006.vo.A_P006VO;

public interface A_P006DAO {

	void insertMessage(A_P006VO c_p002_d005vo) throws Exception;

	List<A_P001VO> selectMemberList(String mem_id) throws Exception;

	List<A_P006VO> selectMessageList(A_P006VO c_p002_d005vo) throws Exception;

	List<A_P001VO> selectSearchList(Map<String, String> searchMap) throws Exception;

	List<A_P001VO> selectSeller(Map<String, Object> searchMap);

	List<A_P001VO> selectprod(Map<String, Object> searchMap);

}
