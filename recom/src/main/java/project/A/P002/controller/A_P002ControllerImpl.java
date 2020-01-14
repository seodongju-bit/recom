package project.A.P002.controller;

import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.sun.mail.util.logging.MailHandler;

import project.A.P001.vo.A_P001VO;
import project.A.P002.mailservice.A_P002MailHandler;
import project.A.P002.service.A_P002Service;

@Controller("A_P002Controller")
public class A_P002ControllerImpl   implements A_P002Controller {
		

	
	
	@Override
	@RequestMapping(value="/signuppage.do" ,method = RequestMethod.GET)
	public ModelAndView signupmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		int ran = new Random().nextInt(900000) + 100000;
		viewName = "signuppage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/signuppage2.do" ,method = RequestMethod.GET)
	public ModelAndView signupmain2(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		int ran = new Random().nextInt(900000) + 100000;
		viewName = "signuppage2";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/memberdivisionpage.do" ,method = RequestMethod.GET)
	public ModelAndView memberdivision(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "memberdivisionpage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/signupsuccesspage.do" ,method = RequestMethod.GET)
	public ModelAndView signupsuccess(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "signupsuccesspage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/mailsendpage.do" ,method = RequestMethod.GET)
	public ModelAndView mailsendmessage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "mailsendpage";
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Autowired
	A_P002Service a_p002Service;
	@Autowired
	A_P001VO A_P001VO;
	@Inject
	private JavaMailSender mailSender;


	 

	
	@Override
	@RequestMapping(value="/addMember.do" ,method = RequestMethod.POST)
	public ResponseEntity addMember(@ModelAttribute("A_P001VO") A_P001VO _A_P001VO,HttpServletRequest request, HttpServletResponse response) throws Exception  {
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		
		String message = null;
		ResponseEntity resEntity = null;
		HttpHeaders responseHeaders = new HttpHeaders();
		System.out.println("asdfasf"+_A_P001VO.getMem_id());
		 
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		try {
			a_p002Service.addMember(_A_P001VO);
			A_P002MailHandler sendMail = new A_P002MailHandler(mailSender);
			sendMail.setSubject("[이메일 인증]");
			sendMail.setText(new StringBuffer().append("<h1>메일인증</h1>")
					.append("RI:COM에 가입해주셔서 감사합니다.<br><a href='http://localhost:8090/recom/verify.do?mem_email1=" + _A_P001VO.getMem_email1()
							+ "&mem_email2=" + _A_P001VO.getMem_email2())
					.append("' target='_blenk'>이메일 인증 확인</a>").toString());
			sendMail.setFrom("RICOM@ricom.com", "리컴");
			sendMail.setTo(_A_P001VO.getMem_email1() + "@" + _A_P001VO.getMem_email2());
			sendMail.send();
		    message  = "<script>";
		    message += " location.href='"+request.getContextPath()+"/mailsendpage.do';";
		    message += " </script>";
		}catch(Exception e) {
			message  = "<script>";
		    message +=" alert('작업 중 오류가 발생했습니다. 다시 시도해 주세요');";
		    message += " location.href='"+request.getContextPath()+"/signuppage.do';";
		    message += " </script>";
			e.printStackTrace();
		}
		resEntity =new ResponseEntity(message, responseHeaders, HttpStatus.OK);
		return resEntity;
	}
	

	
	@Override
	@RequestMapping(value="/overlappedid.do" ,method = RequestMethod.POST)
	public ResponseEntity overlappedid(@RequestParam("id") String id,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		System.out.println(id);
		String result = a_p002Service.overlappedid(id);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	
	@Override
	@RequestMapping(value="/overlappednick.do" ,method = RequestMethod.POST)
	public ResponseEntity overlappednick(@RequestParam("nick") String nick,HttpServletRequest request, HttpServletResponse response) throws Exception{
		ResponseEntity resEntity = null;
		System.out.println(nick);
		String result = a_p002Service.overlappednick(nick);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@Override
	@RequestMapping(value="/overlappedemail.do" ,method = RequestMethod.POST)
	public ResponseEntity overlappedemail(@RequestParam Map<String, String> emailMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ResponseEntity resEntity = null;
		System.out.println(emailMap);	
		String result = a_p002Service.overlappedemail(emailMap);
		resEntity =new ResponseEntity(result, HttpStatus.OK);
		return resEntity;
	}
	
	@RequestMapping(value = "/verify.do", method = RequestMethod.GET)
	public String signSuccess(@RequestParam String mem_email1,@RequestParam String mem_email2) throws Exception {
		System.out.println("이메일 인증기능 처리");
		System.out.println(mem_email1);
		System.out.println(mem_email2);
		A_P001VO A_P001VO = new A_P001VO();
		A_P001VO.setMem_email1(mem_email1);
		A_P001VO.setMem_email2(mem_email2);
		a_p002Service.verifyMember(A_P001VO);
		return "signupsuccesspage";
	}
	
	 	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			viewName = viewName.substring(viewName.lastIndexOf("/",1), viewName.length());
		}
		return viewName;
	}



}