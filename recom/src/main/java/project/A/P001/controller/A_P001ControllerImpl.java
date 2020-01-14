package project.A.P001.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.mail.MessagingException;
import javax.mail.Session;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.github.scribejava.core.model.OAuth2AccessToken;
import com.sun.mail.util.logging.MailHandler;

import project.A.P001.base.A_P001Base;
import project.A.P001.service.A_P001Service;
import project.A.P001.vo.A_P001VO;
import project.A.P002.mailservice.A_P002MailHandler;

@Controller("A_P001Controller")
public class A_P001ControllerImpl implements A_P001Controller {
	
	@Autowired
	A_P001Service a_p001Service;
	@Autowired
	A_P001VO A_P001VO;
	
	@Inject
	private JavaMailSender mailSender;
	
	/* NaverLoginBO */
    private NaverLoginBO naverLoginBO;
    private String apiResult = null;
    
    @Autowired
    private void setNaverLoginBO(NaverLoginBO naverLoginBO) {
        this.naverLoginBO = naverLoginBO;
    }

    //로그인 첫 화면 요청 메소드
    @RequestMapping(value = "/users/naverlogin", method = { RequestMethod.GET, RequestMethod.POST })
    public String login(Model model, HttpSession session) {
        
        /* 네이버아이디로 인증 URL을 생성하기 위하여 naverLoginBO클래스의 getAuthorizationUrl메소드 호출 */
        String naverAuthUrl = naverLoginBO.getAuthorizationUrl(session);
        
        //https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=sE***************&
        //redirect_uri=http%3A%2F%2F211.63.89.90%3A8090%2Flogin_project%2Fcallback&state=e68c269c-5ba9-4c31-85da-54c16c658125
        System.out.println("네이버:" + naverAuthUrl);
        
        //네이버 
        model.addAttribute("url", naverAuthUrl);

        /* 생성한 인증 URL을 View로 전달 */
        return "signinpage";
    }

    //네이버 로그인 성공시 callback호출 메소드
    @RequestMapping(value = "/users/callback.do", method = { RequestMethod.GET, RequestMethod.POST })
    public String callback(Model model, @RequestParam String code, @RequestParam String state, HttpSession session)
            throws IOException {
        System.out.println("여기는 callback");
        OAuth2AccessToken oauthToken;
        oauthToken = naverLoginBO.getAccessToken(session, code, state);
        //로그인 사용자 정보를 읽어온다.
        apiResult = naverLoginBO.getUserProfile(oauthToken);
        System.out.println(naverLoginBO.getUserProfile(oauthToken).toString());
        model.addAttribute("result", apiResult);
        System.out.println("result"+apiResult);
        /* 네이버 로그인 성공 페이지 View 호출 */
//      JSONObject jsonobj = jsonparse.stringToJson(apiResult, "response");
//      String snsId = jsonparse.JsonToString(jsonobj, "id");
//      String name = jsonparse.JsonToString(jsonobj, "name");
//
//      UserVO vo = new UserVO();
//      vo.setUser_snsId(snsId);
//      vo.setUser_name(name);
//
//      System.out.println(name);
//      try {
//          vo = service.naverLogin(vo);
//      } catch (Exception e) {
//          // TODO Auto-generated catch block
//          e.printStackTrace();
//      }


//      session.setAttribute("login",vo);
//      return new ModelAndView("user/loginPost", "result", vo);
        
        return "users/naverSuccess";
    }

	
	@Override
	@RequestMapping(value="/signinpage.do" ,method = RequestMethod.GET)
	public ModelAndView signinmain(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "signinpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/searchidpage.do" ,method = RequestMethod.GET)
	public ModelAndView searchidpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "searchidpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/idsearchresult.do" ,method = RequestMethod.GET)
	public ModelAndView idsearchresult(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "idsearchresult";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/searchpwpage.do" ,method = RequestMethod.GET)
	public ModelAndView searchpwpage(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "searchpwpage";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/unauthorizedmember.do" ,method = RequestMethod.GET)
	public ModelAndView unauthorizedmember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "unauthorizedmember";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/secessionmember.do" ,method = RequestMethod.GET)
	public ModelAndView secessionmember(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		viewName = "secessionmember";
		//List membersList = memberService.listMembers();
		ModelAndView mav = new ModelAndView(viewName);
		//mav.addObject("membersList", membersList);
		return mav;
	}

	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		try {
			String addr = (String)request.getParameter("referrer");
			String[] addr2 = addr.split("recom");
			addr2 = addr2[1].split("\\?");
			A_P001VO=a_p001Service.login(loginMap);
			if(A_P001VO!= null && A_P001VO.getMem_id()!=null){
				
				if(A_P001VO.getMem_verify().equals("n")) {
					String message="이메일 미인증 회원입니다 이메일 확인후 인증해주세요.";
					mav.addObject("message", message);
					mav.setViewName("redirect:signinpage.do");
					
					return mav;
				}else if(A_P001VO.getMem_division().equals("3")) {
					String message="탈퇴 신청중인 회원입니다.";
					mav.addObject("message", message);
					mav.setViewName("redirect:signinpage.do");
					
					return mav;
				}
				HttpSession session=request.getSession();
				session=request.getSession();
				session.setAttribute("isLogOn", true);
				session.setAttribute("mem_division", A_P001VO.getMem_division());
				session.setAttribute("mem_id", A_P001VO.getMem_id());
				session.setAttribute("memberInfo",A_P001VO);

				System.out.println(addr2[0]);
				if(addr2[0].equals("/signupsuccesspage.do") || addr2[0].equals("/signinpage.do") || addr2[0].equals("/verify.do")) {
					mav.setViewName("redirect:main.do");
				}else {   
					mav.setViewName("redirect:"+addr2[0]);
					if(addr2.length==2) {
						addr2 = addr2[1].split("\\=");
						mav.addObject(addr2[0], addr2[1]);
					}
				}
			}else{
				String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
				mav.addObject("message", message);
				mav.setViewName("redirect:signinpage.do");
			}
		}catch(Exception e) {

			mav.setViewName("redirect:main.do");
			return mav;	
		}
		return mav;
	}
	
	
	

	
	
	@Override
	@RequestMapping(value="/logout.do" ,method = RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		String addr = (String)request.getParameter("referrer");
		String[] addr2 = addr.split("recom");
		addr2 = addr2[1].split("\\?");
		
		HttpSession session=request.getSession();
		session.invalidate();		
		mav.setViewName("redirect:"+addr2[0]);
		if(addr2.length==2) {
			addr2 = addr2[1].split("\\=");
			mav.addObject(addr2[0], addr2[1]);
		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/searchID.do", method = RequestMethod.POST)
	public String searchID(HttpServletRequest request) {
		String mem_email1 = request.getParameter("mem_email1");
		String mem_email2 = request.getParameter("mem_email2");
		System.out.println(mem_email1);
		System.out.println(mem_email2);
		A_P001VO A_P001VO = new A_P001VO();
		A_P001VO.setMem_email1(mem_email1);
		A_P001VO.setMem_email2(mem_email2);
		A_P001VO search = a_p001Service.searchID(A_P001VO);
		if (search != null) {
			return search.getMem_id();
		} else {
			return "x";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/searchPW.do", method = RequestMethod.POST)
	public String searchPW(HttpServletRequest request) {
		String mem_id = request.getParameter("mem_id");
		String mem_email1 = request.getParameter("mem_email1");
		String mem_email2 = request.getParameter("mem_email2");
		System.out.println(mem_id);
		System.out.println(mem_email1);
		System.out.println(mem_email2);
		A_P001VO A_P001VO = new A_P001VO();
		A_P001VO.setMem_email1(mem_id);
		A_P001VO.setMem_email1(mem_email1);
		A_P001VO.setMem_email2(mem_email2);
		A_P001VO search = a_p001Service.searchID(A_P001VO);
		if (search != null) {
			return search.getMem_pw();
		} else {
			return "x";
		}
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