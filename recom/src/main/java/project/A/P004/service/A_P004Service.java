package project.A.P004.service;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import project.A.P004.vo.A_P004VO;



public interface A_P004Service {
	public List listCoupon(String p_id) throws DataAccessException;
	public List usecoupon(String mem_id) throws DataAccessException;
	public List<A_P004VO> listPoint(Map<String, Object> searchMap) throws DataAccessException;
	public List<Map<String, Object>> orderList2(Map<String, Object> searchMap);
	public List<Map<String, Object>> orderList3(Map<String, Object> searchMap);
	public List<Map<String, Object>> quList(Map<String, Object> searchMap);
	public void takecoupon(Map<String, Object> dataMap) throws DataAccessException;
	public List givecoupon() throws DataAccessException;
	public int couponcheck(Map<String, Object> check) throws DataAccessException;
	public int coulist(String p_id);
	public int baslist(String p_id);
	public int mempoint(String p_id);
	public int delcount(String p_id);
	public int question(String p_id);
	public List<Map<String,Object>> listquestion(Map<String, Object> searchMap) throws DataAccessException;
	public List alert(String p_id) throws DataAccessException;
	public int pointSearch(Map<String, Object> searchMap);
	public boolean passCheck(String id, String password);
	public void withdrawSave(Map<String, String> withdrawMap);
	List<Map<String, Object>> paging(List<Map<String, Object>> list, int page);
	public Map<String, Object> confirm(Map<String, Object> dataMap);
	public int confirmcheck(Map<String, Object> check) throws DataAccessException;
	public void cancle(Map<String, Object> dataMap);
	public int canclecheck(Map<String, Object> check) throws DataAccessException;
	public void reviewerGive(Map<String, Object> useMap);
	public void reviewerGiveSave(Map<String, Object> useMap);
	public void giveMe(Map<String, Object> useMap);
	public void giveMeSave(Map<String, Object> useMap);
	

}
