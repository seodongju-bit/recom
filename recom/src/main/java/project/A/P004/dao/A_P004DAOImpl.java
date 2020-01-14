package project.A.P004.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P004.vo.A_P004VO;



@Repository("ActiveDAO")
public class A_P004DAOImpl implements A_P004DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllCouponList(String p_id) throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("mapper.active.selectAllCouponList", p_id);
		return couponList;
	}
	
	@Override
	public List usecoupon(String mem_id) throws DataAccessException {
		List<A_P004VO> usecouponList = null;
		usecouponList = sqlSession.selectList("mapper.active.usecoupon", mem_id);
		return usecouponList;
	}
	
	@Override
	public List<A_P004VO> selectAllPointList(Map<String, Object> searchMap) throws DataAccessException {
	List<A_P004VO> list =  sqlSession.selectList("mapper.active.selectAllPointlist", searchMap);
		return list;
		
	}

	@Override
	public List<Map<String, Object>> orderList2(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("mapper.active.orderList2",searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> orderList3(Map<String, Object> searchMap) {
		List<Map<String, Object>> list =sqlSession.selectList("mapper.active.orderList3",searchMap);
		return list;
	}
	
	@Override
	public List<Map<String, Object>> quList(Map<String, Object> searchMap) {
		List<Map<String, Object>> list =sqlSession.selectList("mapper.active.quList",searchMap);
		return list;
	}
	
	@Override
	public int takecoupon(Map<String, Object> dataMap) throws DataAccessException {
	int result =  sqlSession.insert("mapper.active.takecoupon", dataMap);
		return result;
		
	}
	
	@Override
	public List givecoupon() throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("mapper.active.givecoupon");
		return couponList;
	}

	@Override
	public int couponcheck(Map<String, Object> check) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.countcoupon", check);
	}

	@Override
	public int coulist(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.coulist", p_id);
	}
	@Override
	public int baslist(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.baslist", p_id);
	}
	@Override
	public int mempoint(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.mempoint", p_id);
	}
	@Override
	public int delcount(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.delcount", p_id);
	}
	
	@Override
	public int question(String p_id) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.question", p_id);
	}

	@Override
	public List<Map<String,Object>> listquestion(Map<String, Object> searchMap) {
		List list =sqlSession.selectList("mapper.active.listquestion",searchMap);
		return list; 
	}
	@Override
	public List alert(String p_id) throws DataAccessException {
		List alertList = null;
		alertList = sqlSession.selectList("mapper.active.alert", p_id);
		return alertList;
	}
	@Override
	public int pointSearch(Map<String, Object> searchMap) {
		int point = sqlSession.selectOne("mapper.active.pointSearch", searchMap);
		return point;
	}

	@Override
	public boolean passCheck(String id, String password) {
		String check_id = sqlSession.selectOne("mapper.active.passCheck", id );
		return password.equals(check_id);
	}

	@Override
	public void withdrawSave(Map<String, String> withdrawMap) {
		sqlSession.insert("mapper.active.withdrawSave", withdrawMap);
		sqlSession.update("mapper.active.pointDeduction", withdrawMap);
		sqlSession.insert("mapper.active.pointUseRecord", withdrawMap);
	}

	@Override
	public Map<String, Object> confirm(Map<String, Object> dataMap) {
		System.out.println("확정"+dataMap);
		sqlSession.update("mapper.active.confirm", dataMap);
		String ReviewerId =  sqlSession.selectOne("mapper.active.reviewerId", dataMap);
		dataMap.put("ReviewerId", ReviewerId);
		return dataMap;

	}

	
	
	@Override
	public int confirmcheck(Map<String, Object> check) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.confirmcheck", check);
	}
	
	@Override
	public void cancle(Map<String, Object> dataMap) {
		sqlSession.update("mapper.active.cancle", dataMap);
	}
	
	@Override
	public int canclecheck(Map<String, Object> check) throws DataAccessException {
		return sqlSession.selectOne("mapper.active.canclecheck", check);
	}

	@Override
	public void reviewerGive(Map<String, Object> useMap) {
		sqlSession.update("mapper.active.reviewerGive", useMap);
		sqlSession.update("mapper.active.giveReviewPoint", useMap);
	}

	@Override
	public void reviewerGiveSave(Map<String, Object> useMap) {
		System.out.println("포인트 적립 기록");
		sqlSession.insert("mapper.active.reviewerGiveSave", useMap);
	}

	@Override
	public void giveMe(Map<String, Object> useMap) {
		sqlSession.update("mapper.active.giveMe", useMap);
	}

	@Override
	public void giveMeSave(Map<String, Object> useMap) {
		sqlSession.insert("mapper.active.giveMeSave", useMap);
		
	}
	

	
}
