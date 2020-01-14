package project.A.P002.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.A.P001.vo.A_P001VO;



public interface A_P002Controller {
	public ModelAndView signupmain(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView signupmain2(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView memberdivision(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView signupsuccess(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView mailsendmessage(HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity  addMember(@ModelAttribute("A_P001VO") A_P001VO A_P001VO,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlappedid(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlappednick(@RequestParam("nick") String nick,HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ResponseEntity   overlappedemail(@RequestParam Map<String, String> emailMap,HttpServletRequest request, HttpServletResponse response) throws Exception;
	
}

