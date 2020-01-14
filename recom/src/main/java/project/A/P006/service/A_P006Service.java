package project.A.P006.service;

import java.util.List;
import java.util.Map;

import project.A.P001.vo.A_P001VO;
import project.A.P006.vo.A_P006VO;



public interface A_P006Service {

	public List<A_P006VO> selectMessageList(A_P006VO c_p002_d005vo) throws Exception;
	public void insertMessage(A_P006VO c_p002_d005vo) throws Exception;
	public List<A_P001VO> selectMemberList(String mem_id) throws Exception;
	public List<A_P001VO> selectSearchList(Map<String, String> searchMap) throws Exception;
	public List selectSeller(Map<String, Object> searchMap);
	public List selectprod(Map<String, Object> searchMap);

}
