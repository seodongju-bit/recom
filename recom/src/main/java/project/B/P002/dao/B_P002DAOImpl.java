package project.B.P002.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.B.P002.vo.B_P002VO;
import project.main.paging.MainPagingVO;


@Repository("B_P002DAO") 
public class B_P002DAOImpl implements B_P002DAO {
	private String sell_number = "";
	@Autowired
	private SqlSession sqlSession;
	

	
	@Override
	public void addSell(B_P002VO b_P002VO) throws DataAccessException {
		List<Map<String, Object>> sellNum = sqlSession.selectList("B.P002.nextSell");
		sell_number = String.valueOf(sellNum.get(0).get("sell_number"));
		b_P002VO.setSell_number(sell_number);
		sqlSession.insert("B.P002.addSell", b_P002VO);	
	}

	@Override
	public List<B_P002VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		return sqlSession.selectList("B.P002.searchNum", searchMap);
				
	}

	@Override
	public void addOption(Map<String, Object> optionMap) {
		System.out.println("addoption dao 실행");
		optionMap.put("sell_number", sell_number);
		sqlSession.insert("B.P002.addOption", optionMap);
		
	}
	
	@Override
	public List orderRequestList(MainPagingVO mainPagingVO) throws DataAccessException {
		List<B_P002VO> orderRequestList = null;
		orderRequestList = sqlSession.selectList("B.P002.orderRequestList", mainPagingVO);
		return orderRequestList;
	}
	
	@Override
	public int countOrdererList(String p_id) throws Exception {
		return sqlSession.selectOne("B.P002.countOrdererList", p_id);
	}
	
	@Override
	public List<Map<String,Object>> ordererInfoList(Map<String, Object> ordererInfoList) throws DataAccessException {
		List<Map<String,Object>> list = sqlSession.selectList("B.P002.ordererInfoList", ordererInfoList);
		System.out.println(list);
		return list;
	}
	
	@Override
	public List<Map<String,Object>> changeState(Map<String, Object> dataMap) throws DataAccessException {
		List<Map<String,Object>> list = sqlSession.selectList("B.P002.changeState", dataMap);
		return list;
	}

}
