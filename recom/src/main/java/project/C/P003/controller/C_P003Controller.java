package project.C.P003.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import project.C.P003.vo.PageVO;

public interface C_P003Controller {
	    
//고객센터 메인	
public ModelAndView notice(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;

//고객센터 메인-신고사항
public ModelAndView noticeDetail(@RequestParam("de_number")String de_number, HttpServletRequest request, HttpServletResponse response) throws Exception;

//고객센터 메인-문의사항
public ModelAndView noticeDetail2(@RequestParam("qu_number")String qu_number, HttpServletRequest request, HttpServletResponse response) throws Exception;

//문의사항 페이지
public ModelAndView questions(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;

//문의사항 상세설명
public ModelAndView questionDetail1(@RequestParam("qu_number")String qu_number, HttpServletRequest request, HttpServletResponse response) throws Exception;

//신고사항 페이지
public ModelAndView questions1(PageVO vo,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;

//신고사항 상세설명
public ModelAndView questionDetail(@RequestParam("de_number")String de_number, HttpServletRequest request, HttpServletResponse response) throws Exception;


//문의사항 작성(1은 작성창 2는 작성 후 넘어가는창)
public ModelAndView questionwrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite2(HttpServletRequest request, HttpServletResponse response) throws Exception;

//신고사항 작성
public ModelAndView questionwrite3(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite4(HttpServletRequest request, HttpServletResponse response) throws Exception;



public ModelAndView question(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView question2(HttpServletRequest request, HttpServletResponse response) throws Exception;



//관리자로 로그인시 문의사항 답변 
public ModelAndView questionwrite5(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionwrite6(HttpServletRequest request, HttpServletResponse response) throws Exception;


//자주묻는질문 페이지
public ModelAndView questions2(PageVO vo2,String nowPage, String cntPerPage,HttpServletRequest request, HttpServletResponse response) throws Exception;

//자주 묻는 질문 상세페이지
public ModelAndView questionDetail2(@RequestParam("oq_number")String qu_number, HttpServletRequest request, HttpServletResponse response) throws Exception;


public ModelAndView questionresponse(HttpServletRequest request, HttpServletResponse response) throws Exception;
public ModelAndView questionresponse2(HttpServletRequest request, HttpServletResponse response) throws Exception;


}                      