package project.A.P003.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.multipart.MultipartHttpServletRequest;


import project.A.P001.vo.A_P001VO;

public interface A_P003Service {
	public void updateMyInfo(A_P001VO A_P001VO);
	public A_P001VO myDetailInfo(String mem_id) throws Exception;
	public A_P001VO Secessionmember(A_P001VO A_P001VO) throws Exception;
	public boolean pwCheck(String mem_id,String mem_pw) throws Exception;
}