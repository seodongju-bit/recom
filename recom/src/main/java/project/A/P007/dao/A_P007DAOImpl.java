package project.A.P007.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P007.vo.A_P007VO;



@Repository("makecouponDAO")
public class A_P007DAOImpl implements A_P007DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public int make(Map<String, Object> dataMap) {
		int result = sqlSession.insert("mapper.makecoupon.make", dataMap);
		return result;
	}

	@Override
	public List<A_P007VO> listcoupon() {
		List<A_P007VO> list = sqlSession.selectList("mapper.makecoupon.listcoupon");
		return list;
	}
	
	@Override
	public void updateData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.makecoupon.updateData", row);
	}

	@Override
	public void deleteData(Map<String, String> row) throws DataAccessException {
		sqlSession.update("mapper.makecoupon.deleteData", row);
	}

}
