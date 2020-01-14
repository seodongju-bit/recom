package project.A.P010.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.EnableAspectJAutoProxy;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import project.A.P010.dao.A_P010DAO;

@Service("A_P010Service")
@Transactional(propagation = Propagation.REQUIRED)
public class A_P010ServiceImpl implements A_P010Service{
	@Autowired
	private A_P010DAO a_P010DAO;

	@Override
	public List<Map<String, Object>> searchProfile(Map<String, Object> searchMap) {
		return a_P010DAO.searchProfile(searchMap);
	}

	@Override
	public void saveProfile(Map<String, String> map) {
		a_P010DAO.saveProfile(map);
		
	}

	@Override
	public List<Map<String, Object>> searchReview(Map<String, Object> searchMap) {
		return a_P010DAO.searchReview(searchMap);
	}
	
	
}
