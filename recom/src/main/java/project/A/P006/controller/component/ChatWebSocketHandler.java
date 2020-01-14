package project.A.P006.controller.component;

import java.sql.Date;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import javax.inject.Provider;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.fasterxml.jackson.databind.ObjectMapper;

import project.A.P001.vo.A_P001VO;
import project.A.P006.vo.A_P006FormVO;
import project.A.P006.vo.A_P006VO;
import project.A.P006.service.A_P006Service;



public class ChatWebSocketHandler extends TextWebSocketHandler {

	@Autowired
	Provider<A_P006VO> c_p002_d005Provider;
	
	@Autowired
	Provider<A_P001VO> c_p001_d001Provider;
	
	@Autowired
	Provider<A_P006FormVO> formProvider;
	
	@Autowired
	A_P006Service c_p002_d005service;
	
//	 @Autowired
//		SqlSession sqlsession;
//	 private final Logger logger = LoggerFactory.getLogger(getClass());
	
private static final Map<WebSocketSession, A_P001VO> sessionList = new HashMap<WebSocketSession, A_P001VO>();
	
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception{
		Map<String, Object> map = session.getAttributes();
		A_P001VO c_p001_d001vo= (A_P001VO) map.get("memberInfo");//?
		sessionList.put(session, c_p001_d001vo);
	}
	
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception{
		sessionList.remove(session);
	}
	
	@Override
	public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception{
		//message.getPayload(); 보낸 메시지
		//session.sendMessage(message);클라이언트로 메시지 전송
		//provider.get(); prototype으로 빈 가져오기
		A_P001VO c_p001_d001vo = sessionList.get(session);
		ObjectMapper mapper = new ObjectMapper();
		A_P006FormVO c_p002_d005FormVO = mapper.readValue(message.getPayload(), A_P006FormVO.class);
		String header=c_p002_d005FormVO.getHeader();
		
		if(header.equals("chat_list")){
			showChatList(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}else if(header.equals("send_message")) {
			sendMessage(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}else if(header.equals("search_member")) {
			searchMember(c_p002_d005FormVO,session,c_p001_d001vo,mapper);
		}
		
//		C_P002_D005DAO dao = sqlsession.getMapper(C_P002_D005DAO.class);
//
//		this.logger.info(message.getPayload());
//
//		session.sendMessage(new TextMessage(dao.count_receive_note(message.getPayload()))); 
	}
	
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		exception.printStackTrace();
	}
	
	private void showChatList(A_P006FormVO C_P002_D005FormVO,WebSocketSession session,A_P001VO c_p001_d001vo,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String mem_id= (String) body.get("mem_id");
		
		A_P006VO c_p002_d005vo = c_p002_d005Provider.get();
		c_p002_d005vo.setSender(c_p001_d001vo.getMem_id());
		c_p002_d005vo.setReceiver(mem_id);
		List<A_P006VO> msgResult = c_p002_d005service.selectMessageList(c_p002_d005vo);
		body.clear();
		body.put("result",msgResult);		
		
		String result=mapper.writeValueAsString(C_P002_D005FormVO);
		session.sendMessage(new TextMessage(result));
	}
	
	private void sendMessage(A_P006FormVO C_P002_D005FormVO,WebSocketSession session,A_P001VO c_p001_d001vo,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String receiver=(String) body.get("receiver");
		String message=(String) body.get("message");
		
		A_P006VO c_p002_d005vo = c_p002_d005Provider.get();
		c_p002_d005vo.setSender(c_p001_d001vo.getMem_id());
		c_p002_d005vo.setReceiver(receiver);
		c_p002_d005vo.setContents(message);
		c_p002_d005vo.setSend_date(new Date(Calendar.getInstance().getTimeInMillis()));
		c_p002_d005service.insertMessage(c_p002_d005vo);
		
		for(Entry<WebSocketSession, A_P001VO> entry : ChatWebSocketHandler.sessionList.entrySet()) {
			WebSocketSession recSession = entry.getKey();
			A_P001VO recVO = entry.getValue();

			if(recVO.getMem_id().equals(receiver)) {
				c_p002_d005vo.setMe_at("false");				
				body.clear();
				body.put("result", c_p002_d005vo);
				body.put("sender_info", c_p001_d001vo.getMem_id());
				String result=mapper.writeValueAsString(C_P002_D005FormVO);
				recSession.sendMessage(new TextMessage(result));
			}
		}
		
		c_p002_d005vo.setMe_at("true");
		body.clear();
		body.put("result", c_p002_d005vo);
		String result = mapper.writeValueAsString(C_P002_D005FormVO);
		session.sendMessage(new TextMessage(result));
	}
	
	private void searchMember(A_P006FormVO C_P002_D005FormVO,WebSocketSession session,A_P001VO c_p001_s001VO,ObjectMapper mapper) throws Exception {
		HashMap<String,Object> body = C_P002_D005FormVO.getBody();
		String keyword= (String) body.get("keyword");
		
		Map<String,String> searchMap = new HashMap<String, String>();
		searchMap.put("keyword", keyword);
		searchMap.put("mem_id", c_p001_s001VO.getMem_id());
		List<A_P001VO> searchResult = c_p002_d005service.selectSearchList(searchMap); //id, nickname
		
		
		body.clear();
		body.put("result",searchResult);
		String result=mapper.writeValueAsString(C_P002_D005FormVO);
		session.sendMessage(new TextMessage(result));
	}

}
