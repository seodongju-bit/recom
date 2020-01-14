package project.F.P001.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.F.P001.vo.PagingVO;
import project.F.P001.vo.F_P001VO;


@Repository("F_P001DAO")
public class F_P001DAOImpl implements F_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectItem(Map<String, Object> searchMap) throws DataAccessException {
		
		System.out.println("dao:"+searchMap);
		List<F_P001VO> productlist = null;
		productlist = sqlSession.selectList("mapper.product.selectItem", searchMap);
		System.out.println(productlist);
		return productlist;
	}

	@Override
	public List<F_P001VO> searchoption(Map<String, Object> searchMap) throws DataAccessException { 
		List<F_P001VO> productlist = sqlSession.selectList("F.P001.searchoption", searchMap);
		System.out.println("dao실행"); 
		return productlist;
	}

	@Override
	public List selectItem1() throws DataAccessException {
		List<F_P001VO> productlist1 = null;  
		productlist1 = sqlSession.selectList("mapper.product.selectItem1");
		System.out.println(productlist1);
		return productlist1;
	}

	
	@Override
	public List selectItem2(String ctgrNum) throws DataAccessException {
		Map<String, Object> searchMap = new HashMap<String, Object>();
		System.out.println(ctgrNum);
		searchMap.put("ctgrNum", ctgrNum);
		List<F_P001VO> productlist2 = sqlSession.selectList("mapper.product.selectItem2", searchMap);
		// sell_thumbnail, sell_title, sell_number, sell_score, sell_scorecount,
		// sell_price, pro_price
		System.out.println(productlist2);
		return productlist2;
	}




	@Override
	public List selectItem5() throws DataAccessException {
		List<F_P001VO> productlist5 = null;
		System.out.println("dao실행");    
		productlist5 = sqlSession.selectList("mapper.product.selectItem5");
		System.out.println(productlist5);
		return productlist5;
	}
	
	
	
	@Override
	public List memberReviewList(PagingVO vo) throws DataAccessException {
		List<F_P001VO> reviewList = null;
		reviewList = sqlSession.selectList("mapper.product.memberReviewList", vo);
		System.out.println("reviewList"+reviewList);
		return reviewList;
	}


	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.product.countBoard");
	}

	@Override
	public List bannerList() throws DataAccessException {
		List bannerList = null;     
		bannerList = sqlSession.selectList("mapper.product.bannerList");
		System.out.println("3333333333333333333333333333333"+bannerList);
		return bannerList;
	}

	@Override
	public List<Map<String, String>> eventItemSearch(Map<String, Object> searchMap) {
		System.out.println(searchMap.get("event_no"));
		List<Map<String, String>> list = sqlSession.selectList("mapper.product.eventItemSearch", searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> eventSearch(Map<String, Object> searchMap) {
		List<Map<String, String>> list = sqlSession.selectList("mapper.product.eventSearch", searchMap);
		return list;
	}

	@Override
	public List preBannerList() {
		List bannerList = sqlSession.selectList("mapper.product.preBannerList");
		return bannerList;
	}

	@Override
	public List endBannerList() {
		List bannerList = sqlSession.selectList("mapper.product.endBannerList");
		return bannerList;
	}




}
   