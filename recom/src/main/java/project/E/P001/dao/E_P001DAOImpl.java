package project.E.P001.dao;

import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import project.A.P004.vo.A_P004VO;
import project.E.P001.vo.E_P001VO;


@Repository("E_P001DAO") 
public class E_P001DAOImpl implements E_P001DAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<E_P001VO> selectItem(Map<String, Object> searchMap) throws DataAccessException {
		List<E_P001VO> list = sqlSession.selectList("E.P001.searchItem", searchMap);
		System.out.println("dao:"+list);
		return list;
	}
	
	@Override
	public List selectAllCouponList(String p_id) throws DataAccessException {
		List<A_P004VO> couponList = null;
		couponList = sqlSession.selectList("E.P001.couponList", p_id);
		System.out.println(couponList);
		return couponList;
	}


	
	@Override
	public void insertNewOrder(List<E_P001VO> orderList) throws DataAccessException {
		int order_number = selectOrderNumber();
		int od_number = selectOrderDetailNumber();
		for(int i = 0; i < orderList.size(); i++) {
			E_P001VO e_P001VO = (E_P001VO)orderList.get(i);
			e_P001VO.setOrder_number(order_number);
			e_P001VO.setOd_number(od_number);
			sqlSession.insert("E.P001.insertNewOrder", e_P001VO);
			sqlSession.insert("E.P001.insertNewOrderDetail", e_P001VO);
			sqlSession.update("E.P001.saveMemPoint", e_P001VO);
			if(!e_P001VO.getOrder_pointuse().equals("0")) {
			sqlSession.insert("E.P001.point_use", e_P001VO);
			}
			sqlSession.insert("E.P001.point_add", e_P001VO);
			sqlSession.update("E.P001.useCoupon", e_P001VO);
			}
		}
	
	private int selectOrderNumber() throws DataAccessException {
		return sqlSession.selectOne("E.P001.selectOrderNumber");
	}
	
	private int selectOrderDetailNumber() throws DataAccessException {
		return sqlSession.selectOne("E.P001.selectOrderDetailNumber");
	}

	}
