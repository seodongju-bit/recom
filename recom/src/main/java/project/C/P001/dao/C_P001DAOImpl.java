package project.C.P001.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.C.P001.vo.C_P001VO;
import project.C.P001.vo.PagingVO;
import project.F.P002.vo.F_P002VO;



@Repository("EventDAO")
public class C_P001DAOImpl implements C_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllEventList(PagingVO vo) throws DataAccessException {
		List<C_P001VO> eventList = null;
		eventList = sqlSession.selectList("mapper.event.selectAllEventList", vo);
		return eventList;
	}
	

	@Override
	public void updateCNT(Map<String, Object>dataMap) {
		sqlSession.update("mapper.event.updateCnt", dataMap);
	}
	
	@Override
	public List selectBoardDetail(Map<String, Object> dataMap) {
		List dataList = null;
		dataList = sqlSession.selectList("mapper.event.selectBoardDetail", dataMap);
		return dataList;
	}
	
	@Override
	public void write(Map<String, Object> dataMap) throws DataAccessException {
		sqlSession.insert("mapper.event.insertEvent", dataMap);
	}


	@Override
	public int countBoard() {
		return sqlSession.selectOne("mapper.event.countBoard");
	}


	@Override
	public List<Map<String, Object>> searchSale(Map<String, Object> searchMap) {
		List<Map<String, Object>> list = sqlSession.selectList("mapper.event.searchSale", searchMap);
		return list;
	}


	@Override
	public void addItem(Map<String, Object> eventMap) {
		sqlSession.insert("mapper.event.addItem", eventMap);
		
	}
	
	
	
}
