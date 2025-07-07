package com.shinhan.memento.util;

import java.io.IOException;
import java.util.Map;
import java.util.Timer;
import java.util.TimerTask;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import com.shinhan.memento.model.Member;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Component
public class MentoTestWebSocketHandler extends TextWebSocketHandler {

	//유저 Id를 기준으로 웹소켓 세션을 관리
    private Map<Integer, WebSocketSession> userSessions = new ConcurrentHashMap<>();
    private Map<Integer, java.util.Timer> timerMap = new ConcurrentHashMap<>(); 
    
    // 타이머 시작 메서드
    public void startAutoSubmitTimer(int userId, long delayMillis) {
        Timer timer = new Timer();
        timer.schedule(new TimerTask() {
            @Override
            public void run() {
                try {
                    sendForceFinish(userId);
                } catch (IOException e) {
                    log.error("타이머 종료 메시지 전송 실패", e);
                }
            }
        }, delayMillis);

        timerMap.put(userId, timer);
    }

    // 타이머 취소 메서드
    public void cancelTimer(int userId) {
        Timer timer = timerMap.remove(userId);
        if (timer != null) {
            timer.cancel();
        }
    }
    
    //1. 연결 수립 시 호출
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
    	Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser != null) {
        	int userId = loginUser.getMemberId();
        	userSessions.put(userId, session);
            log.info(" - WebSocket 연결: userId=" + userId);
        }else {
        	session.close(CloseStatus.NOT_ACCEPTABLE.withReason("Unauthorized"));
        	log.info("- 로그인사용자 없음. 연결 종료");
        }
    }

    //2. 클라이언트로부터 메세지 수신 시 호출
    @Override
    public void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
    	 log.info(" - 수신 메시지: " + message.getPayload());
         // 예: "FINISH" 요청이면 클라이언트 측 제출 등
    }

    //3. 연결 종료 시 호출
    @Override
    public void afterConnectionClosed(WebSocketSession session, CloseStatus status) {
    	Member loginUser = (Member) session.getAttributes().get("loginUser");
        if (loginUser != null) {
            int userId = (loginUser.getMemberId());
            userSessions.remove(userId);
            cancelTimer(userId);
            System.out.println(" -  WebSocket 연결 종료: userId=" + loginUser.getMemberId());
        }
    }

    // 연결 URI에서 userId 파싱 (예: /ws/mentotest?userId=18)
    public void sendForceFinish(Integer userId) throws IOException {
        WebSocketSession session = userSessions.get(userId);
        if (session != null && session.isOpen()) {
            session.sendMessage(new TextMessage("time_over"));
        }
    }
}
