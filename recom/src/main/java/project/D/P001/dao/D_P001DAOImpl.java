package project.D.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;


import project.D.P001.vo.D_P001VO;

@Repository("D_P001DAO")
public class D_P001DAOImpl implements D_P001DAO {
	@Autowired
	private SqlSession sqlSession;
	


	@Override
	public List reviewItem2(String p_id) throws DataAccessException {
	   List<D_P001VO> reviewlist2 = null;
	   System.out.println("dao실행");
	   reviewlist2 = sqlSession.selectList("mapper.review.reviewItem2");
	   System.out.println(reviewlist2);
	   return reviewlist2;
	   
		
	}
	
	
	@Override
	public List<Map<String,Object>> myReview2(Map<String, Object> searchMaps2) {
	  List reviewlist3=null;
	  System.out.println("dao실행");
	  reviewlist3 = sqlSession.selectList("mapper.review.myReview2");
	   return reviewlist3;
	   
		
	}
	
	@Override
	public void reviewwrite(Map<String, Object> dataMap) throws DataAccessException {
		System.out.println("dao실행");
		sqlSession.insert("mapper.review.reviewwrite",dataMap);
		
		
	}
	
	@Override
	public void addReview(Map<String, Object> resultMap) throws DataAccessException {
		
		List<Map<String, Object>> proNum = sqlSession.selectList("mapper.review.searProNum", resultMap);
		String pro_number = String.valueOf(proNum.get(0).get("pro_number"));
		
		resultMap.put("pro_number", pro_number);
		resultMap.put("pro_score", proNum.get(0).get("pro_score"));
		resultMap.put("pro_scorecount", proNum.get(0).get("pro_scorecount"));
		resultMap.put("sell_score", proNum.get(0).get("sell_score"));
		resultMap.put("sell_scorecount", proNum.get(0).get("sell_scorecount"));
		System.out.println("리뷰추가 dao:"+resultMap);
		sqlSession.insert("mapper.review.addReview", resultMap);
		sqlSession.update("mapper.review.updateProScore", resultMap);
		sqlSession.update("mapper.review.updateSellScore", resultMap);
		
	}

}
