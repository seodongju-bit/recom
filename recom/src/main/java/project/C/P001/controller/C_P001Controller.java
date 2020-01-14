package project.C.P001.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.C.P001.vo.PagingVO;

public interface C_P001Controller {
//	public ModelAndView listEvent(PagingVO vo, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView eventDetail(@RequestParam("no_number") String no_number, HttpServletRequest request, HttpServletResponse response) throws Exception;
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	public ModelAndView listEvent(PagingVO vo, String nowPage, String cntPerPage, HttpServletRequest request,
			HttpServletResponse response) throws Exception;
	ModelAndView write(Map<String, String> map, HttpServletRequest request, HttpServletResponse response)
			throws Exception;

}
