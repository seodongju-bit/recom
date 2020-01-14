package project.A.P006.service;

import java.util.List;
import java.util.Map;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import project.A.P001.vo.A_P001VO;
import project.A.P006.dao.A_P006DAO;
import project.A.P006.vo.A_P006VO;


@Service("A_P006Service")
public class A_P006ServiceImpl implements A_P006Service {
	@Inject
	private A_P006DAO c_p002_d005_DAO;

	@Override
	public List<A_P006VO> selectMessageList(A_P006VO c_p002_d005vo) throws Exception {
		List<A_P006VO> list=c_p002_d005_DAO.selectMessageList(c_p002_d005vo);
		return list;
	}

	@Override
	public void insertMessage(A_P006VO c_p002_d005vo) throws Exception {
		c_p002_d005_DAO.insertMessage(c_p002_d005vo);
		
	}

	@Override
	public List<A_P001VO> selectMemberList(String mem_id) throws Exception {
		List<A_P001VO> list=c_p002_d005_DAO.selectMemberList(mem_id);		
		return list;
	}

	@Override
	public List<A_P001VO> selectSearchList(Map<String, String> searchMap) throws Exception {
		List<A_P001VO> list=c_p002_d005_DAO.selectSearchList(searchMap);		
		return list;
	}

	@Override
	public List selectSeller(Map<String, Object> searchMap) {
		List<A_P001VO> list=c_p002_d005_DAO.selectSeller(searchMap);		
		return list;
	}
	
	@Override
	public List selectprod(Map<String, Object> searchMap) {
		List<A_P001VO> list=c_p002_d005_DAO.selectprod(searchMap);		
		return list;
	}
}
