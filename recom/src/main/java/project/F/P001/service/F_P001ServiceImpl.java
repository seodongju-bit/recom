package project.F.P001.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.F.P001.vo.F_P001VO;
import project.F.P001.vo.PagingVO;
import  project.F.P001.dao.F_P001DAO;


             
@Service("productitem")
@Transactional(propagation = Propagation.REQUIRED)
public class F_P001ServiceImpl implements F_P001Service{
	@Autowired
	private F_P001DAO f_P001DAO ;
	
	@Override
	public List searchItem(Map<String, Object> searchMap) throws DataAccessException {
		List productlist = null; 
		productlist=f_P001DAO.selectItem(searchMap);
		return productlist;
	}
	
	@Override
	public List<F_P001VO> searchoption(Map<String, Object> searchMap) throws DataAccessException {
		List<F_P001VO> productlist =  f_P001DAO.searchoption(searchMap);
		System.out.println("서비스 실행");
		return productlist;
	}


	

	@Autowired
	private F_P001DAO f_P001_D04DAO ;           
	
	@Override
	public List searchItem1() throws DataAccessException {
		List productlist1 = null; 
		System.out.println("���񽺽���");
		productlist1=f_P001_D04DAO.selectItem1();
		return productlist1;
	}
	
	
	@Autowired
	private F_P001DAO f_P001_D03DAO ;           
	
	@Override
	public List searchItem2(String ctgrNum) throws DataAccessException {
		List productlist2 = null; 
		productlist2=f_P001_D03DAO.selectItem2(ctgrNum);
		return productlist2;
	}


	@Autowired
	private F_P001DAO f_P001_D01DAO ;  
	@Override
	public List searchItem5() throws DataAccessException {
		List productlist5 = null; 
		System.out.println("service실행");
		productlist5=f_P001_D01DAO.selectItem5();
		return productlist5;
	}

	
	@Autowired
	private F_P001DAO memberReviewDAO ;
	@Override
	public List listEvent(PagingVO vo) throws DataAccessException {
		List reviewList = null;
		reviewList = memberReviewDAO.memberReviewList(vo);
		return reviewList;
	}
	@Override
	public int countBoard() {
		return memberReviewDAO.countBoard();
	}

	
	@Override
	public List bannerList() throws DataAccessException {
		List banner = null;
		banner = f_P001_D04DAO.bannerList();
		return banner;
	}

	@Override
	public List<Map<String, String>> eventItemSearch(Map<String, Object> searchMap) {
		List<Map<String, String>> list = f_P001DAO.eventItemSearch(searchMap);
		return list;
	}

	@Override
	public List<Map<String, String>> eventSearch(Map<String, Object> searchMap) {
		List<Map<String, String>> list = f_P001DAO.eventSearch(searchMap);
		return list;
	}

	@Override
	public List preBannerList() {
		List banner = f_P001_D04DAO.preBannerList();
		return banner;
	}

	@Override
	public List endBannerList() {
		List banner = f_P001_D04DAO.endBannerList();
		return banner;
	}

	

	



}