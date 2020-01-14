package project.A.P004.service;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import project.A.P004.dao.A_P004DAO;
import project.A.P004.vo.A_P004VO;


@Service("activeService")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P004ServiceImpl implements A_P004Service {
	@Autowired
	private A_P004DAO activeDAO;

	@Override
	public List listCoupon(String p_id) throws DataAccessException {
		List couponList = null;
		couponList = activeDAO.selectAllCouponList(p_id);
		return couponList;
	}	
	
	@Override
	public List usecoupon(String mem_id) throws DataAccessException {
		List usecouponList = null;
		usecouponList = activeDAO.usecoupon(mem_id);
		return usecouponList;
	}	
	
	@Override
	public int couponcheck(Map<String, Object> check) {
		return activeDAO.couponcheck(check);
		
		
	}	
	@Override
	public List<A_P004VO> listPoint(Map<String, Object> searchMap) throws DataAccessException{
		List<A_P004VO> list = activeDAO.selectAllPointList(searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> orderList2(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.orderList2(searchMap);	
		
		return list;
		
	}
	
	@Override
	public List<Map<String, Object>> orderList3(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.orderList3(searchMap);	
		
		return list;
		
	}
	
	@Override
	public List<Map<String, Object>> quList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list= activeDAO.quList(searchMap);	
		
		return list;
		
	}
	
	@Override
	public void takecoupon(Map<String, Object> dataMap) throws DataAccessException{
		activeDAO.takecoupon(dataMap);
	}
	
	@Override
	public List givecoupon() throws DataAccessException {
		List couponList = null;
		couponList = activeDAO.givecoupon();
		return couponList;
	}
	@Override
	public int coulist(String p_id) throws DataAccessException{
		return activeDAO.coulist(p_id);
	}
	@Override
	public int baslist(String p_id) throws DataAccessException{
		return activeDAO.baslist(p_id);
	}
	@Override
	public int mempoint(String p_id) throws DataAccessException{
		return activeDAO.mempoint(p_id);
		
	}
	@Override
	public int delcount(String p_id) throws DataAccessException{
		return activeDAO.delcount(p_id);
	}
	@Override
	public int question(String p_id) throws DataAccessException{
		return activeDAO.question(p_id);
	}
	@Override
	public List<Map<String,Object>> listquestion(Map<String, Object> searchMap) throws DataAccessException {
		List list= activeDAO.listquestion(searchMap);	
		
		return list;
	}
	@Override
	public List alert(String p_id) throws DataAccessException {
		List alertList = null;
		alertList = activeDAO.alert(p_id);
		return alertList;
	}

	public int pointSearch(Map<String, Object> searchMap) {
		return activeDAO.pointSearch(searchMap);
	}
	@Override
	public boolean passCheck(String id, String password) {
		return activeDAO.passCheck(id, password);
	}
	@Override
	public void withdrawSave(Map<String, String> withdrawMap) {
		activeDAO.withdrawSave(withdrawMap);
		
	}
	
	@Override
	public List<Map<String, Object>> paging(List<Map<String, Object>> list, int page ) {
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		Map<String, Object> pageInfo = new HashMap<String, Object>();
		int size = list.size();
		int one = ((page-1)*10);
		int start = (page/10)*5;
		int end = (int)Math.ceil( size/10.0 ); //최종페이지
		int num = 10; //데이터 조회개수
		if(start + 6 > end) { //페이지 여섯장이 안될때 
			end = end - start; 
		}else {
			end = 6;
		}
		pageInfo.put("start", start);
		pageInfo.put("end", end);
		pageInfo.put("page", page);
		if((size-one)<10) { //조회할 페이지의 데이터가 10개가 안될 때  
			num = size-one;
		}
		for(int i=one; i < one+num ;i++){
			result.add(list.get(i));
		}
		result.add(pageInfo);
		return result;
	}

	@Override
	public Map<String, Object> confirm(Map<String, Object> dataMap) {
		Map<String, Object> returnMap = activeDAO.confirm(dataMap);
		return returnMap;
		
	}
	
	@Override
	public int confirmcheck(Map<String, Object> check) {
		return activeDAO.confirmcheck(check);
	}	
	
	@Override
	public void cancle(Map<String, Object> dataMap) {
		activeDAO.cancle(dataMap);
	}
	
	@Override
	public int canclecheck(Map<String, Object> check) {
		return activeDAO.canclecheck(check);
	}

	@Override
	public void reviewerGive(Map<String, Object> useMap) {
		activeDAO.reviewerGive(useMap);
		
	}

	@Override
	public void reviewerGiveSave(Map<String, Object> useMap) {
		activeDAO.reviewerGiveSave(useMap);
		
	}

	@Override
	public void giveMe(Map<String, Object> useMap) {
		activeDAO.giveMe(useMap);
		
	}

	@Override
	public void giveMeSave(Map<String, Object> useMap) {
		activeDAO.giveMeSave(useMap);
		
	}	
	
}
