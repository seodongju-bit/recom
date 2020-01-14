package project.A.P005.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P005.vo.A_P005VO;



@Repository("BasketDAO")
public class A_P005DAOImpl implements A_P005DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List selectAllBasketList(String mem_id) throws DataAccessException {
		List<A_P005VO> basketList = null;
		basketList = sqlSession.selectList("mapper.basket.selectAllBasketList" ,mem_id);
		System.out.println(basketList);
		return basketList;
	}

	@Override
	public int deleteBasket(Map<String, Object> dataMap) throws DataAccessException {
		int result = sqlSession.delete("mapper.basket.deleteBasket", dataMap);
		return result;
	}
	
	@Override
	public int updateBasket(Map<String, Object> dataMap) throws DataAccessException {
		int result = sqlSession.update("mapper.basket.updateBasket", dataMap);
		return result;
	}
	
}
