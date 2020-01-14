package project.C.P001.controller;

import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import project.C.P001.service.FileUploadServiceBanner;
import project.B.P002.vo.B_P002VO;
import project.C.P001.service.C_P001Service;
import project.C.P001.vo.C_P001VO;
import project.C.P001.vo.PagingVO;
import project.F.P002.vo.F_P002VO;




@Controller("eventController")
public class C_P001ControllerImpl implements C_P001Controller {
	
	@Autowired
	private C_P001Service eventService;
	@Autowired
	C_P001VO eventVO ;
	   @Value("${uploadFilePath}")
	   private String uploadFilePath;
	   @Value("${downloadFilePath}")
	   private String downloadFilePath;
	
	@Override
	@RequestMapping(value="/event.do" ,method = {RequestMethod.GET, RequestMethod.POST})
	public ModelAndView listEvent(PagingVO vo 
			, @RequestParam(value="nowPage", required=false)String nowPage
			, @RequestParam(value="cntPerPage", required=false)String cntPerPage, 
			HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "event";
		
		int total = eventService.countBoard();
		if (nowPage == null && cntPerPage == null) {
			nowPage = "1";
			cntPerPage = "10";
		} else if (nowPage == null) {
			nowPage = "1";
		} else if (cntPerPage == null) { 
			cntPerPage = "10";
		}

		
			vo = new PagingVO(total, Integer.parseInt(nowPage), Integer.parseInt(cntPerPage));
			
		
		List eventList = eventService.listEvent(vo);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("paging", vo);    
		mav.addObject("eventList", eventList);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/eventDetail.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventDetail(@RequestParam("no_number") String no_number, 
			           HttpServletRequest request, HttpServletResponse response) throws Exception{
		request.setCharacterEncoding("utf-8");
		String viewName = "eventDetail";
		Map<String, Object> dataMap = new HashMap();
		Map<String, Object> resultMap = new HashMap();
		dataMap.put("no_number", no_number);
		List<Map<String,Object>> dataList = eventService.selectBoardDetail(dataMap);
		resultMap = dataList.get(0);
		ModelAndView mav = new ModelAndView(viewName);
		mav.addObject("resultMap", resultMap);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/eventWrite.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView eventWrite(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "eventWrite";
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/write.do" ,method = { RequestMethod.GET, RequestMethod.POST})
	public ModelAndView write(@RequestParam Map<String, String> map, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = "redirect:/event.do";
		Map<String, Object> dataMap = new HashMap();
		
		String[] arr = request.getParameterValues("sell_number");
		HttpSession session = request.getSession();
		String mem_id = (String)session.getAttribute("mem_id");
		String no_division = request.getParameter("division");
		String no_title = request.getParameter("title");
		String no_contents = request.getParameter("content");
		String no_stdate = request.getParameter("stdate");
		String no_enddate = request.getParameter("enddate");
		String no_banner = request.getParameter("banner");
			
			dataMap.put("mem_id", mem_id);
			dataMap.put("no_division", no_division);
			dataMap.put("no_title", no_title);
			dataMap.put("no_contents", no_contents);
			dataMap.put("no_stdate", no_stdate);
			dataMap.put("no_enddate", no_enddate);
			dataMap.put("no_banner", no_banner);
			eventService.eventWrite(dataMap);

		if(arr!=null) {
		Map<String, Object> eventMap = new HashMap();
			for(int i=0; i<arr.length; i++) {
				eventMap = new HashMap();
				eventMap.put("item", arr[i]);
				eventService.addItem(eventMap);
			}
		}
		ModelAndView mav = new ModelAndView(viewName);
		return mav;
	}
	
	 @Autowired
	   FileUploadServiceBanner fileUploadService;

	   @RequestMapping(value = "bannerupload.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> imgUpload(@RequestParam("file") MultipartFile file, HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
		   Map<String, Object> resultMap = new HashMap<String, Object>();
		  try {
			   String url = fileUploadService.restore(file);
			   resultMap.put("path", url);
		  }catch(Exception e) {
			   System.out.println("이미지 업로드 오류");
		  }
		   return resultMap;
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

	@RequestMapping(value = "/coding.do")
    public String coding() {
        return "coding";
    }
 
    @RequestMapping(value = "/insertBoard.do", method = RequestMethod.POST)
    public String insertBoard(String editor) {
        System.err.println("저장할 내용 :  " + editor);
        return "redirect:/coding.do";
    }
 
    // 다중파일업로드
    @RequestMapping(value = "/file_uploader_html5.do",
                  method = RequestMethod.POST)
    @ResponseBody
    public String multiplePhotoUpload(HttpServletRequest request) {
       // 파일정보
        StringBuffer sb = new StringBuffer();
        try {
           // 파일명을 받는다 - 일반 원본파일명
            String oldName = request.getHeader("file-name");
            // 파일 기본경로 _ 상세경로
 
//            String filePath = "C:/gitwork/recom/recom/recom/recom/src/main/webapp/resources/image/";
            
            String saveName = sb.append(new SimpleDateFormat("yyyyMMddHHmmss")
                          .format(System.currentTimeMillis()))
                          .append(UUID.randomUUID().toString())
                          .append(oldName.substring(oldName.lastIndexOf("."))).toString();
            InputStream is = request.getInputStream();
            OutputStream os = new FileOutputStream(uploadFilePath + saveName);
            int numRead;
            byte b[] = new byte[Integer.parseInt(request.getHeader("file-size"))];
            while ((numRead = is.read(b, 0, b.length)) != -1) {
                os.write(b, 0, numRead);
            }
            os.flush();
            os.close();
            // 정보 출력
            sb = new StringBuffer();
            sb.append("&bNewLine=true")
              .append("&sFileName=").append(oldName)
              .append("&sFileURL=").append(downloadFilePath)
        .append(saveName);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return sb.toString();
    }

	   @RequestMapping(value = "/searchSale.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public ModelAndView searchSale(HttpServletRequest request, HttpServletResponse response) throws Exception  {
		   String viewName = getViewName(request);
			viewName = "searchSale";
			ModelAndView mav = new ModelAndView(viewName);
			return mav;
	   }
	
	   
	   @RequestMapping(value = "/searchSaleAction.do", method = { RequestMethod.GET, RequestMethod.POST })
	   @ResponseBody
	   public Map<String, Object> searchSalehAction(HttpServletRequest request, HttpServletResponse response) throws Exception  {
	      request.setCharacterEncoding("utf-8");
	      String p_id = (String)request.getParameter("p_id");
	      Map<String, Object> searchMap = new HashMap<String, Object>(); // 검색조건
	      Map<String, Object> resultMap = new HashMap<String, Object>(); // 조회결과

	      if(p_id=="" || p_id==null) {
	    	  return resultMap;
	      }
	      
	      searchMap.put("p_id", p_id);
	      List<Map<String, Object>> data = eventService.searchSale(searchMap);
	      resultMap.put("Data", data);
	      
	      return resultMap;
	   }

}

